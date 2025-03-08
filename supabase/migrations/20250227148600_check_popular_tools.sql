-- Vérifier les outils les plus populaires et leurs images
SELECT 
    t.name as tool_name,
    t.image_url as tool_image,
    c.name as category_name,
    c.image_url as category_image,
    t.monthly_users,
    t.total_views
FROM ai_tools t
LEFT JOIN categories c ON t.category_id = c.id
WHERE t.monthly_users > 0 OR t.total_views > 0
ORDER BY t.monthly_users DESC, t.total_views DESC
LIMIT 50;

-- Vérifier les outils populaires sans image
SELECT 
    name,
    image_url,
    monthly_users,
    total_views
FROM ai_tools 
WHERE (image_url IS NULL OR image_url = '') 
    AND (monthly_users > 0 OR total_views > 0)
ORDER BY monthly_users DESC, total_views DESC;
