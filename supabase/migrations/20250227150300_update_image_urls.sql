-- Mettre à jour avec des URLs d'images plus fiables
BEGIN;

-- Mettre à jour les deux tables en même temps
UPDATE tools
SET image_url = CASE slug
    WHEN 'chatgpt' THEN 'https://images.unsplash.com/photo-1675557009875-436f7a7fbcb3?q=80&w=2000'
    WHEN 'meta-ai' THEN 'https://images.unsplash.com/photo-1675557014937-b415f773d22d?q=80&w=2000'
    END,
    updated_at = CURRENT_TIMESTAMP
WHERE slug IN ('chatgpt', 'meta-ai');

UPDATE ai_tools
SET image_url = CASE slug
    WHEN 'chatgpt' THEN 'https://images.unsplash.com/photo-1675557009875-436f7a7fbcb3?q=80&w=2000'
    WHEN 'meta-ai' THEN 'https://images.unsplash.com/photo-1675557014937-b415f773d22d?q=80&w=2000'
    END,
    updated_at = CURRENT_TIMESTAMP
WHERE slug IN ('chatgpt', 'meta-ai');

-- Vérifier les mises à jour
SELECT 
    t.name,
    t.slug,
    t.image_url as tools_image,
    a.image_url as ai_tools_image
FROM tools t
JOIN ai_tools a ON t.slug = a.slug
WHERE t.slug IN ('chatgpt', 'meta-ai');

COMMIT;
