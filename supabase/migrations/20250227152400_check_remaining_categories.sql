-- Vérifier les catégories avec peu ou pas d'outils
WITH category_counts AS (
    SELECT 
        c.name as category_name,
        COUNT(t.id) as tool_count
    FROM categories c
    LEFT JOIN tools t ON t.category_id = c.id
    GROUP BY c.name
)
SELECT 
    category_name,
    tool_count
FROM category_counts
WHERE tool_count < 2
ORDER BY tool_count, category_name;
