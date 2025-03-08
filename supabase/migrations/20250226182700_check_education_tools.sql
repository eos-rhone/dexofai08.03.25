-- Vérifier les outils de la catégorie Éducation
SELECT 
    t.name as nom_outil,
    t.slug,
    c.name as categorie,
    c.slug as categorie_slug
FROM ai_tools t
LEFT JOIN categories c ON t.category_id = c.id
WHERE t.slug IN (
    'century-tech',
    'carnegie-learning',
    'third-space-learning',
    'querium',
    'content-technologies',
    'knewton',
    'cognii',
    'gradescope',
    'thinkster-math',
    'duolingo'
)
ORDER BY t.name;

-- Vérifier la catégorie Éducation
SELECT id, name, slug 
FROM categories 
WHERE slug = 'éducation' OR name ILIKE '%educ%';
