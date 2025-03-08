-- Vérifier les outils de la catégorie Médias & Divertissement
SELECT 
    c.name as category_name,
    COUNT(t.id) as tool_count,
    array_agg(t.name ORDER BY t.name) as tool_names
FROM categories c
LEFT JOIN ai_tools t ON c.id = t.category_id
WHERE c.id = 'f5bd99ea-826a-47f7-b9fe-fff09aa3391a'
GROUP BY c.name;
