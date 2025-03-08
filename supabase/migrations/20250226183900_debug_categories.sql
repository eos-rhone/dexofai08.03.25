-- Vérifier les catégories et leurs slugs
SELECT id, name, slug 
FROM categories 
WHERE name ILIKE '%framework%' 
   OR name ILIKE '%média%'
   OR name ILIKE '%divertissement%';

-- Vérifier si des outils existent pour ces catégories
SELECT 
    c.name as category_name,
    c.slug as category_slug,
    t.name as tool_name,
    t.slug as tool_slug,
    t.category_id
FROM categories c
LEFT JOIN ai_tools t ON c.id = t.category_id
WHERE c.name ILIKE '%framework%' 
   OR c.name ILIKE '%média%'
   OR c.name ILIKE '%divertissement%'
ORDER BY c.name, t.name;
