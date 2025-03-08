-- Vérifier la catégorie de Claude spécifiquement
SELECT 
    t.name as tool_name,
    c.name as category_name,
    c.id as category_id,
    t.image_url,
    c.image_url as category_image
FROM ai_tools t
JOIN categories c ON t.category_id = c.id
WHERE t.name = 'Claude';
