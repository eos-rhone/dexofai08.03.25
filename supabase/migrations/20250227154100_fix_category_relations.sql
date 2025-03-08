-- Correction des relations entre tables
BEGIN;

-- Supprimer les entrées avec category_id NULL
DELETE FROM ai_tools WHERE category_id IS NULL;
DELETE FROM tools WHERE category_id IS NULL;

-- S'assurer que tous les outils ont une catégorie valide
DELETE FROM ai_tools
WHERE category_id NOT IN (SELECT id FROM categories);

DELETE FROM tools
WHERE category_id NOT IN (SELECT id FROM categories);

-- Créer un index pour améliorer les performances des jointures
CREATE INDEX IF NOT EXISTS idx_ai_tools_category_id ON ai_tools(category_id);
CREATE INDEX IF NOT EXISTS idx_tools_category_id ON tools(category_id);

-- Mettre à jour la structure de la table ai_tools
ALTER TABLE ai_tools
ALTER COLUMN category_id SET NOT NULL;

-- Mettre à jour la structure de la table tools
ALTER TABLE tools
ALTER COLUMN category_id SET NOT NULL;

-- Réinsérer les outils avec une catégorie par défaut si nécessaire
DO $$
DECLARE
    default_category_id uuid;
BEGIN
    -- Obtenir ou créer une catégorie par défaut
    SELECT id INTO default_category_id FROM categories WHERE name = 'Autre' LIMIT 1;
    
    IF default_category_id IS NULL THEN
        INSERT INTO categories (id, name, slug, description, icon)
        VALUES (
            gen_random_uuid(),
            'Autre',
            'autre',
            'Autres outils IA',
            'Folder'
        )
        RETURNING id INTO default_category_id;
    END IF;

    -- Mettre à jour les outils sans catégorie
    UPDATE ai_tools
    SET category_id = default_category_id
    WHERE category_id IS NULL;

    UPDATE tools
    SET category_id = default_category_id
    WHERE category_id IS NULL;
END $$;

COMMIT;
