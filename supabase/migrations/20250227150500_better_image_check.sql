-- Meilleure vérification des images
SELECT 
    t.name,
    t.slug,
    t.image_url,
    CASE 
        WHEN t.image_url IS NULL THEN 'Pas d''image'
        WHEN t.image_url = '' THEN 'Image vide'
        WHEN t.image_url NOT LIKE 'https://%' THEN 'URL invalide'
        WHEN t.image_url NOT LIKE '%unsplash.com%' 
         AND t.image_url NOT LIKE '%aitoolsclub.com%'
         AND t.image_url NOT LIKE '%.png%'
         AND t.image_url NOT LIKE '%.jpg%'
         AND t.image_url NOT LIKE '%.jpeg%'
         AND t.image_url NOT LIKE '%.gif%'
         AND t.image_url NOT LIKE '%.webp%' THEN 'Source inconnue'
        ELSE 'OK'
    END as status
FROM tools t
WHERE t.image_url IS NULL 
   OR t.image_url = ''
   OR t.image_url NOT LIKE 'https://%'
   OR (
       t.image_url NOT LIKE '%unsplash.com%'
       AND t.image_url NOT LIKE '%aitoolsclub.com%'
       AND t.image_url NOT LIKE '%.png%'
       AND t.image_url NOT LIKE '%.jpg%'
       AND t.image_url NOT LIKE '%.jpeg%'
       AND t.image_url NOT LIKE '%.gif%'
       AND t.image_url NOT LIKE '%.webp%'
   )
ORDER BY status, t.name;

-- Compter par source d'image
SELECT 
    CASE 
        WHEN image_url LIKE '%unsplash.com%' THEN 'Unsplash'
        WHEN image_url LIKE '%aitoolsclub.com%' THEN 'AI Tools Club'
        WHEN image_url LIKE '%.png%' OR image_url LIKE '%.jpg%' OR image_url LIKE '%.jpeg%' OR image_url LIKE '%.gif%' OR image_url LIKE '%.webp%' THEN 'Autre source valide'
        ELSE 'Source inconnue'
    END as source,
    COUNT(*) as nombre
FROM tools
GROUP BY 1
ORDER BY 2 DESC;
