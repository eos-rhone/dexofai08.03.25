-- Trouver tous les outils sans image dans la table tools
SELECT 
    t.name,
    t.slug,
    t.image_url as tools_image,
    a.image_url as ai_tools_image,
    c.name as category_name
FROM tools t
LEFT JOIN ai_tools a ON t.slug = a.slug
LEFT JOIN categories c ON c.id = t.category_id
WHERE t.image_url IS NULL 
   OR t.image_url = ''
   OR t.image_url != a.image_url
ORDER BY t.name;
