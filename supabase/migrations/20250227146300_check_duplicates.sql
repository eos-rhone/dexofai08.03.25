-- Vérifier les images par catégorie
SELECT 
    c.id,
    c.name as category_name,
    c.image_url as category_image,
    COUNT(*) as number_of_tools,
    array_agg(t.name) as tool_names
FROM categories c
LEFT JOIN ai_tools t ON t.category_id = c.id
GROUP BY c.id, c.name, c.image_url
ORDER BY c.name;

-- Vérifier les images dupliquées
SELECT 
    image_url,
    COUNT(*) as times_used,
    array_agg(name) as categories_using_this_image
FROM categories
GROUP BY image_url
HAVING COUNT(*) > 1
ORDER BY times_used DESC;
