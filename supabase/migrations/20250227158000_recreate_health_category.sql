-- Recréer la catégorie santé avec la bonne icône
BEGIN;

-- Sauvegarder l'ID actuel
DO $$
DECLARE
    old_id uuid;
BEGIN
    -- Récupérer l'ancien ID
    SELECT id INTO old_id FROM categories WHERE slug = 'sante';
    
    -- Mettre à jour les outils pour qu'ils pointent temporairement vers une autre catégorie
    UPDATE ai_tools 
    SET category_id = (SELECT id FROM categories WHERE slug != 'sante' LIMIT 1)
    WHERE category_id = old_id;
    
    -- Supprimer l'ancienne catégorie
    DELETE FROM categories WHERE slug = 'sante';
    
    -- Créer la nouvelle catégorie avec le même ID
    INSERT INTO categories (id, name, slug, description, icon)
    VALUES (
        old_id,
        'Santé',
        'sante',
        'Applications d''IA pour la santé et la médecine',
        'Shield'
    );
    
    -- Remettre à jour les outils avec l'ID de la catégorie
    UPDATE ai_tools 
    SET category_id = old_id
    WHERE category_id = (SELECT id FROM categories WHERE slug != 'sante' LIMIT 1)
    AND category_id != old_id;
    
END $$;

-- Vérifier le résultat
SELECT name, slug, icon, updated_at
FROM categories 
WHERE slug = 'sante';

COMMIT;
