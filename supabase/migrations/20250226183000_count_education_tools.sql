-- Compter et lister tous les outils de la catégorie Éducation
SELECT 
    COUNT(*) as nombre_outils,
    array_agg(t.name) as noms_outils
FROM ai_tools t
JOIN categories c ON t.category_id = c.id
WHERE c.slug = 'education';

-- Lister les détails de tous les outils d'éducation
SELECT 
    t.name,
    t.slug,
    t.description,
    t.website_url,
    t.pricing,
    t.is_active,
    t.is_featured
FROM ai_tools t
JOIN categories c ON t.category_id = c.id
WHERE c.slug = 'education'
ORDER BY t.name;
