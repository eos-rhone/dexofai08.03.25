-- Synchroniser les images dans ai_tools
BEGIN;

-- 1. Vérifier l'état actuel dans ai_tools
SELECT name, slug, image_url 
FROM ai_tools 
WHERE slug IN ('chatgpt', 'meta-ai');

-- 2. Mettre à jour les images dans ai_tools pour qu'elles correspondent
UPDATE ai_tools
SET image_url = CASE slug
    WHEN 'chatgpt' THEN 'https://www.aitoolsclub.com/content/images/2024/01/Screenshot-2024-01-27-at-6.41.49-PM.png'
    WHEN 'meta-ai' THEN 'https://www.aitoolsclub.com/content/images/size/w256/2024/01/meta.png'
    END,
    updated_at = CURRENT_TIMESTAMP
WHERE slug IN ('chatgpt', 'meta-ai');

-- 3. Vérifier que les deux tables sont synchronisées
SELECT 
    t.name,
    t.slug,
    t.image_url as tools_image,
    a.image_url as ai_tools_image,
    CASE WHEN t.image_url = a.image_url THEN 'OK' ELSE 'Different!' END as status
FROM tools t
JOIN ai_tools a ON t.slug = a.slug
WHERE t.slug IN ('chatgpt', 'meta-ai');

COMMIT;
