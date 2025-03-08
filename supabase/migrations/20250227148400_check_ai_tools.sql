-- Vérifier les outils AI dans le classement
SELECT 
    t.name as tool_name,
    t.image_url as tool_image,
    c.name as category_name,
    c.image_url as category_image,
    t.ranking
FROM ai_tools t
LEFT JOIN categories c ON t.category_id = c.id
WHERE t.ranking IS NOT NULL
ORDER BY t.ranking ASC;

-- Vérifier les outils sans image
SELECT 
    name,
    image_url,
    ranking
FROM ai_tools 
WHERE (image_url IS NULL OR image_url = '') 
    AND ranking IS NOT NULL
ORDER BY ranking ASC;
