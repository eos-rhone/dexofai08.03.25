-- Vérifier et corriger les outils
BEGIN;

-- 1. Vérifier si les outils existent déjà
SELECT name, slug, category_id
FROM ai_tools
WHERE slug = 'tensorflow';

-- 2. Si l'outil existe, mettre à jour sa catégorie
UPDATE ai_tools
SET category_id = '1715f3fe-c800-425e-b5d3-ee8af4477a39'
WHERE slug = 'tensorflow'
RETURNING name, slug, category_id;

-- 3. Si l'outil n'existe pas, l'insérer
INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
SELECT 
    'TensorFlow',
    'tensorflow',
    'Framework open-source de machine learning développé par Google.',
    'https://www.tensorflow.org/',
    '1715f3fe-c800-425e-b5d3-ee8af4477a39',
    '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
    true,
    true
WHERE NOT EXISTS (
    SELECT 1 FROM ai_tools WHERE slug = 'tensorflow'
)
RETURNING name, slug, category_id;

-- 4. Vérifier le résultat final
SELECT 
    c.name as category_name,
    COUNT(t.id) as tool_count,
    array_agg(t.name) as tool_names
FROM categories c
LEFT JOIN ai_tools t ON c.id = t.category_id
WHERE c.id = '1715f3fe-c800-425e-b5d3-ee8af4477a39'
GROUP BY c.name;

COMMIT;
