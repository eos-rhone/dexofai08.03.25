-- Migration pour déboguer et insérer les données
BEGIN;

-- 1. Vérifier la structure de la table categories
SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_name = 'categories';

-- 2. Vérifier la structure de la table ai_tools
SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_name = 'ai_tools';

-- 3. Supprimer les catégories en double si elles existent
DELETE FROM categories
WHERE id NOT IN (
    SELECT MIN(id)
    FROM categories
    GROUP BY slug
);

-- 4. Insérer ou mettre à jour la catégorie Frameworks
INSERT INTO categories (name, slug)
VALUES ('Frameworks & Bibliothèques', 'frameworks-&-bibliothèques')
ON CONFLICT (slug) DO UPDATE 
SET name = EXCLUDED.name
RETURNING id, name, slug;

-- 5. Insérer quelques outils de test
DO $$
DECLARE
    frameworks_id uuid;
    media_id uuid;
BEGIN
    -- Récupérer les IDs des catégories
    SELECT id INTO frameworks_id FROM categories WHERE slug = 'frameworks-&-bibliothèques';
    SELECT id INTO media_id FROM categories WHERE slug = 'médias-&-divertissement';

    -- Afficher les IDs pour débogage
    RAISE NOTICE 'Frameworks ID: %', frameworks_id;
    RAISE NOTICE 'Media ID: %', media_id;

    -- Insérer un outil de test pour chaque catégorie
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('TensorFlow', 'tensorflow', 'Test framework', 'https://tensorflow.org', frameworks_id, '[{"plan_name": "Free", "price": 0}]'::jsonb, true, true),
    ('TestMedia', 'testmedia', 'Test media tool', 'https://test.com', media_id, '[{"plan_name": "Free", "price": 0}]'::jsonb, true, true)
    ON CONFLICT (slug) DO NOTHING;

END $$;

-- 6. Vérifier les résultats
SELECT c.name as category_name, c.slug as category_slug, 
       COUNT(t.id) as tool_count,
       array_agg(t.name) as tool_names
FROM categories c
LEFT JOIN ai_tools t ON c.id = t.category_id
WHERE c.slug IN ('frameworks-&-bibliothèques', 'médias-&-divertissement')
GROUP BY c.name, c.slug;

COMMIT;
