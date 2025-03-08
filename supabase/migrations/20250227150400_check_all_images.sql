-- Vérifier tous les outils qui pourraient avoir des problèmes d'images
SELECT 
    t.name,
    t.slug,
    t.image_url,
    CASE 
        WHEN t.image_url IS NULL THEN 'Pas d''image'
        WHEN t.image_url = '' THEN 'Image vide'
        WHEN t.image_url NOT LIKE 'https://%' THEN 'URL invalide'
        WHEN t.image_url NOT LIKE '%.png' 
         AND t.image_url NOT LIKE '%.jpg'
         AND t.image_url NOT LIKE '%.jpeg'
         AND t.image_url NOT LIKE '%.gif'
         AND t.image_url NOT LIKE '%.webp' THEN 'Extension non image'
        ELSE 'OK'
    END as status
FROM tools t
WHERE t.image_url IS NULL 
   OR t.image_url = ''
   OR t.image_url NOT LIKE 'https://%'
   OR (
       t.image_url NOT LIKE '%.png' 
       AND t.image_url NOT LIKE '%.jpg'
       AND t.image_url NOT LIKE '%.jpeg'
       AND t.image_url NOT LIKE '%.gif'
       AND t.image_url NOT LIKE '%.webp'
   )
ORDER BY t.name;

-- Compter les problèmes par type
SELECT 
    CASE 
        WHEN image_url IS NULL THEN 'Pas d''image'
        WHEN image_url = '' THEN 'Image vide'
        WHEN image_url NOT LIKE 'https://%' THEN 'URL invalide'
        WHEN image_url NOT LIKE '%.png' 
         AND image_url NOT LIKE '%.jpg'
         AND image_url NOT LIKE '%.jpeg'
         AND image_url NOT LIKE '%.gif'
         AND image_url NOT LIKE '%.webp' THEN 'Extension non image'
        ELSE 'OK'
    END as probleme,
    COUNT(*) as nombre
FROM tools
GROUP BY 1
ORDER BY 2 DESC;
