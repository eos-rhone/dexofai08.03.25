-- Mettre à jour les images pour des outils spécifiques
UPDATE tools
SET image_url = (
    CASE slug
        WHEN 'chatgpt' THEN 'https://www.aitoolsclub.com/content/images/2024/01/Screenshot-2024-01-27-at-6.41.49-PM.png'
        WHEN 'claude' THEN 'https://www.aitoolsclub.com/content/images/2024/01/Screenshot-2024-01-27-at-6.42.07-PM.png'
        WHEN 'jasper' THEN 'https://www.aitoolsclub.com/content/images/2024/01/Screenshot-2024-01-27-at-6.42.19-PM.png'
        WHEN 'meta-ai' THEN 'https://www.aitoolsclub.com/content/images/size/w256/2024/01/meta.png'
        WHEN 'private-gpt' THEN 'https://www.aitoolsclub.com/content/images/size/w256/2024/01/private-gpt.png'
    END
)
WHERE slug IN ('chatgpt', 'claude', 'jasper', 'meta-ai', 'private-gpt')
AND (image_url IS NULL OR image_url = '');

-- Vérifier les mises à jour
SELECT name, slug, image_url
FROM tools
WHERE slug IN ('chatgpt', 'claude', 'jasper', 'meta-ai', 'private-gpt');
