-- Vérifier la structure complète de la table
BEGIN;

-- 1. Structure de la table
SELECT column_name, data_type, column_default, is_nullable
FROM information_schema.columns
WHERE table_name = 'ai_tools';

-- 2. Contraintes de la table
SELECT conname, contype, pg_get_constraintdef(c.oid)
FROM pg_constraint c
JOIN pg_namespace n ON n.oid = c.connamespace
WHERE conrelid = 'ai_tools'::regclass;

-- 3. Tenter une insertion simple avec RETURNING pour voir l'erreur complète
INSERT INTO ai_tools (
    name,
    slug,
    description,
    website_url,
    category_id,
    pricing,
    is_active,
    is_featured
)
VALUES (
    'Test Tool',
    'test-tool',
    'Test description',
    'https://test.com',
    '1715f3fe-c800-425e-b5d3-ee8af4477a39',
    '[{"plan_name": "Free", "price": 0}]'::jsonb,
    true,
    false
)
RETURNING *;

-- 4. Vérifier si la catégorie existe vraiment
SELECT id, name, slug
FROM categories
WHERE id = '1715f3fe-c800-425e-b5d3-ee8af4477a39';

COMMIT;
