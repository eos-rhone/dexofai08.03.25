/*
  # Ajout de contraintes et triggers pour la catégorisation automatique

  1. Nouvelles contraintes
    - Rend category_id obligatoire pour les outils
    - Ajoute une contrainte de clé étrangère avec vérification
  
  2. Triggers
    - Vérifie la cohérence des catégories lors de l'insertion/mise à jour
    - Met à jour automatiquement les statistiques
  
  3. Fonctions
    - Validation de la catégorie
    - Mise à jour des compteurs
*/

-- Rendre category_id NOT NULL
ALTER TABLE ai_tools 
  ALTER COLUMN category_id SET NOT NULL;

-- Fonction de validation de la catégorie
CREATE OR REPLACE FUNCTION validate_tool_category()
RETURNS TRIGGER AS $$
BEGIN
  -- Vérifier que la catégorie existe
  IF NOT EXISTS (SELECT 1 FROM categories WHERE id = NEW.category_id) THEN
    RAISE EXCEPTION 'La catégorie avec l''ID % n''existe pas', NEW.category_id;
  END IF;

  -- Mettre à jour les timestamps
  NEW.updated_at = CURRENT_TIMESTAMP;
  
  -- Pour les nouvelles insertions, initialiser created_at
  IF TG_OP = 'INSERT' THEN
    NEW.created_at = CURRENT_TIMESTAMP;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger pour la validation de la catégorie
DROP TRIGGER IF EXISTS validate_tool_category_trigger ON ai_tools;
CREATE TRIGGER validate_tool_category_trigger
  BEFORE INSERT OR UPDATE ON ai_tools
  FOR EACH ROW
  EXECUTE FUNCTION validate_tool_category();

-- Fonction pour mettre à jour les statistiques de la catégorie
CREATE OR REPLACE FUNCTION update_category_stats()
RETURNS TRIGGER AS $$
BEGIN
  -- Mettre à jour les compteurs pour la nouvelle catégorie
  IF TG_OP = 'INSERT' THEN
    -- Logique pour l'insertion
    UPDATE categories
    SET tool_count = tool_count + 1
    WHERE id = NEW.category_id;
  
  -- Mettre à jour les compteurs pour les changements de catégorie
  ELSIF TG_OP = 'UPDATE' AND OLD.category_id != NEW.category_id THEN
    -- Décrémenter l'ancienne catégorie
    UPDATE categories
    SET tool_count = tool_count - 1
    WHERE id = OLD.category_id;
    
    -- Incrémenter la nouvelle catégorie
    UPDATE categories
    SET tool_count = tool_count + 1
    WHERE id = NEW.category_id;
  
  -- Mettre à jour les compteurs lors de la suppression
  ELSIF TG_OP = 'DELETE' THEN
    UPDATE categories
    SET tool_count = tool_count - 1
    WHERE id = OLD.category_id;
  END IF;
  
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Trigger pour la mise à jour des statistiques
DROP TRIGGER IF EXISTS update_category_stats_trigger ON ai_tools;
CREATE TRIGGER update_category_stats_trigger
  AFTER INSERT OR UPDATE OR DELETE ON ai_tools
  FOR EACH ROW
  EXECUTE FUNCTION update_category_stats();

-- Ajouter une colonne tool_count à la table categories si elle n'existe pas
DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'categories' AND column_name = 'tool_count'
  ) THEN
    ALTER TABLE categories ADD COLUMN tool_count integer DEFAULT 0;
    
    -- Initialiser les compteurs pour les catégories existantes
    UPDATE categories c
    SET tool_count = (
      SELECT COUNT(*)
      FROM ai_tools
      WHERE category_id = c.id
    );
  END IF;
END $$;

-- Mettre à jour les statistiques existantes
UPDATE categories c
SET tool_count = (
  SELECT COUNT(*)
  FROM ai_tools
  WHERE category_id = c.id
);

-- Ajouter un index pour améliorer les performances
CREATE INDEX IF NOT EXISTS idx_ai_tools_category_id ON ai_tools(category_id);

-- Supprimer l'ancienne politique si elle existe
DROP POLICY IF EXISTS "Public read access for categories" ON categories;

-- Créer la nouvelle politique
CREATE POLICY "categories_read_policy"
ON categories
FOR SELECT
USING (true);
