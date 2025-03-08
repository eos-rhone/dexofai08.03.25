-- Exporter toutes les informations de référence

-- 1. Informations sur les catégories
SELECT 
    name as category_name,
    slug as category_slug,
    id as category_id,
    (SELECT COUNT(*) FROM ai_tools WHERE category_id = categories.id) as tool_count
FROM categories
ORDER BY name;

-- 2. Informations sur les outils par catégorie
SELECT 
    c.name as category_name,
    c.slug as category_slug,
    c.id as category_id,
    t.name as tool_name,
    t.slug as tool_slug,
    t.id as tool_id
FROM categories c
LEFT JOIN ai_tools t ON t.category_id = c.id
ORDER BY c.name, t.name;
