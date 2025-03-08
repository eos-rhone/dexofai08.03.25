-- Vérifier les outils dans le classement
SELECT 
    t.name as tool_name,
    t.image_url as tool_image,
    c.name as category_name,
    c.image_url as category_image,
    t.ranking
FROM tools t
LEFT JOIN categories c ON t.category_id = c.id
WHERE t.ranking IS NOT NULL
ORDER BY t.ranking ASC;
