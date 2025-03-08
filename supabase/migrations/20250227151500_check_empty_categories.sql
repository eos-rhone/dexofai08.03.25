-- Trouver les catégories avec 0 ou 1 outil
WITH category_counts AS (
    SELECT 
        c.id,
        c.name as category_name,
        COUNT(t.id) as tool_count,
        MAX(t.image_url) as category_image
    FROM categories c
    LEFT JOIN tools t ON t.category_id = c.id
    GROUP BY c.id, c.name
    HAVING COUNT(t.id) <= 1
    ORDER BY COUNT(t.id), c.name
)
SELECT 
    category_name,
    tool_count,
    CASE 
        WHEN tool_count = 0 THEN 'Vide'
        WHEN tool_count = 1 THEN 'Un seul outil'
    END as status,
    category_image
FROM category_counts;
