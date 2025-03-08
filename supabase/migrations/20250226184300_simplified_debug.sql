-- Migration simplifiée pour déboguer et insérer les données
BEGIN;

-- 1. Vérifier la structure des tables
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name IN ('categories', 'ai_tools');

-- 2. Insérer la catégorie Frameworks si elle n'existe pas
INSERT INTO categories (name, slug)
VALUES ('Frameworks & Bibliothèques', 'frameworks-&-bibliothèques')
ON CONFLICT (slug) DO NOTHING
RETURNING id, name, slug;

-- 3. Insérer un outil de test
DO $$
DECLARE
    frameworks_id uuid;
BEGIN
    -- Récupérer l'ID de la catégorie
    SELECT id INTO frameworks_id FROM categories WHERE slug = 'frameworks-&-bibliothèques';
    
    -- Afficher l'ID pour débogage
    RAISE NOTICE 'Frameworks ID: %', frameworks_id;

    -- Si on a bien l'ID, insérer un outil de test
    IF frameworks_id IS NOT NULL THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'TensorFlow',
            'tensorflow',
            'Framework open-source de machine learning développé par Google.',
            'https://tensorflow.org',
            frameworks_id,
            '[{"plan_name": "Free", "price": 0}]'::jsonb,
            true,
            true
        )
        ON CONFLICT (slug) DO NOTHING;
    END IF;
END $$;

-- 4. Vérifier les résultats
SELECT 
    c.id as category_id,
    c.name as category_name, 
    c.slug as category_slug,
    t.id as tool_id,
    t.name as tool_name,
    t.category_id as tool_category_id
FROM categories c
LEFT JOIN ai_tools t ON c.id = t.category_id
WHERE c.slug = 'frameworks-&-bibliothèques';

COMMIT;
