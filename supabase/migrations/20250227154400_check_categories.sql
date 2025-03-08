-- Vérifier le nombre d'outils par catégorie
SELECT 
    c.name as category_name,
    c.slug as category_slug,
    COUNT(t.id) as tool_count
FROM categories c
LEFT JOIN ai_tools t ON t.category_id = c.id
GROUP BY c.id, c.name, c.slug
ORDER BY tool_count ASC;
