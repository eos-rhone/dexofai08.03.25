-- Vérifier les différents formats d'URL Unsplash
WITH sample_urls AS (
    SELECT DISTINCT image_url
    FROM tools
    WHERE image_url LIKE '%unsplash.com%'
    LIMIT 5
),
working_urls AS (
    SELECT DISTINCT image_url
    FROM tools t
    WHERE EXISTS (
        SELECT 1 
        FROM tools t2 
        WHERE t2.image_url = t.image_url 
        AND t2.name IN ('ChatGPT', 'Claude', 'Jasper', 'Meta AI', 'privateGPT')
    )
)
SELECT 
    'Exemples d''URLs actuelles' as type,
    string_agg(image_url, E'\n') as urls
FROM sample_urls
UNION ALL
SELECT 
    'URLs qui fonctionnent' as type,
    string_agg(image_url, E'\n') as urls
FROM working_urls;

-- Vérifier si les URLs ont des paramètres différents
SELECT 
    split_part(image_url, '?', 1) as base_url,
    COUNT(*) as nombre,
    string_agg(DISTINCT split_part(image_url, '?', 2), E'\n') as parametres
FROM tools
WHERE image_url LIKE '%unsplash.com%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
