-- Vérifier les catégories de Claude et Bard
SELECT 
    t.name as tool_name,
    c.name as category_name,
    c.id as category_id,
    t.image_url,
    c.image_url as category_image
FROM ai_tools t
JOIN categories c ON t.category_id = c.id
WHERE t.name IN ('Claude', 'Bard', 'ChatGPT')
ORDER BY t.name;
