-- Vérifier les données pour des outils spécifiques
WITH combined_data AS (
    SELECT 
        'ai_tools' as table_name,
        a.name,
        a.slug,
        a.image_url,
        a.category_id,
        c.name as category_name
    FROM ai_tools a
    LEFT JOIN categories c ON c.id = a.category_id
    WHERE a.slug IN (
        'chatgpt',
        'claude',
        'jasper',
        'meta-ai',
        'private-gpt'
    )
    UNION ALL
    SELECT 
        'tools' as table_name,
        t.name,
        t.slug,
        t.image_url,
        t.category_id,
        c.name as category_name
    FROM tools t
    LEFT JOIN categories c ON c.id = t.category_id
    WHERE t.slug IN (
        'chatgpt',
        'claude',
        'jasper',
        'meta-ai',
        'private-gpt'
    )
)
SELECT *
FROM combined_data
ORDER BY table_name, name;
