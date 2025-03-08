-- Forcer les images pour les outils problématiques
BEGIN;

-- 1. D'abord, vérifions l'état actuel
SELECT name, slug, image_url 
FROM tools 
WHERE slug IN ('chatgpt', 'meta-ai')
OR name IN ('ChatGPT', 'Meta AI');

-- 2. Forcer les images pour ces outils
UPDATE tools
SET image_url = CASE slug
    WHEN 'chatgpt' THEN 'https://www.aitoolsclub.com/content/images/2024/01/Screenshot-2024-01-27-at-6.41.49-PM.png'
    WHEN 'meta-ai' THEN 'https://www.aitoolsclub.com/content/images/size/w256/2024/01/meta.png'
    END,
    updated_at = CURRENT_TIMESTAMP
WHERE slug IN ('chatgpt', 'meta-ai');

-- 3. Supprimer les doublons potentiels
DELETE FROM tools 
WHERE name IN ('ChatGPT', 'Meta AI')
AND slug NOT IN ('chatgpt', 'meta-ai');

-- 4. Vérifier le résultat final
SELECT name, slug, image_url 
FROM tools 
WHERE slug IN ('chatgpt', 'meta-ai')
OR name IN ('ChatGPT', 'Meta AI');

COMMIT;
