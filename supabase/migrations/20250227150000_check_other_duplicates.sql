-- Vérifier les autres doublons potentiels
WITH tool_names AS (
    SELECT name, COUNT(*) as count
    FROM tools
    WHERE LOWER(name) SIMILAR TO '%(chatgpt|claude|jasper|meta)%'
    GROUP BY name
    HAVING COUNT(*) > 1
)
SELECT t.*, c.name as category_name
FROM tools t
JOIN tool_names tn ON t.name = tn.name
LEFT JOIN categories c ON c.id = t.category_id
ORDER BY t.name, t.slug;
