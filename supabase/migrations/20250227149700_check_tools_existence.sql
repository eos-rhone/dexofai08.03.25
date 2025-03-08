-- Vérifier si ces outils existent dans la table tools
SELECT t.*, c.name as category_name
FROM tools t
LEFT JOIN categories c ON c.id = t.category_id
WHERE t.name ILIKE ANY (ARRAY[
    '%chatgpt%',
    '%claude%',
    '%jasper%',
    '%meta%',
    '%private%gpt%'
])
ORDER BY t.name;

-- Vérifier le nombre total d'outils dans chaque table
SELECT 
    (SELECT COUNT(*) FROM tools) as tools_count,
    (SELECT COUNT(*) FROM ai_tools) as ai_tools_count;
