-- Vérifier et corriger la catégorie Assistants & Chatbots
BEGIN;

-- 1. D'abord, voir tous les outils dans cette catégorie
WITH chatbot_tools AS (
    SELECT t.*, c.name as category_name
    FROM tools t
    JOIN categories c ON c.id = t.category_id
    WHERE c.name = 'Assistants & Chatbots'
)
SELECT name, slug, image_url
FROM chatbot_tools
ORDER BY name;

-- 2. Mettre à jour les images pour toute la catégorie avec des images cohérentes
UPDATE tools 
SET image_url = CASE name
    WHEN 'ChatGPT' THEN 'https://images.unsplash.com/photo-1675557009875-436f7a7fbcb3?q=80&w=2000'
    WHEN 'Claude' THEN 'https://images.unsplash.com/photo-1675557014929-ddd27347e4dc?q=80&w=2000'
    WHEN 'Jasper' THEN 'https://images.unsplash.com/photo-1676299081847-5c62cf6fe817?q=80&w=2000'
    WHEN 'Meta AI' THEN 'https://images.unsplash.com/photo-1675557014937-b415f773d22d?q=80&w=2000'
    WHEN 'privateGPT' THEN 'https://images.unsplash.com/photo-1675557014937-b415f773d22d?q=80&w=2000'
    ELSE 'https://images.unsplash.com/photo-1675557009875-436f7a7fbcb3?q=80&w=2000' -- image par défaut pour les autres chatbots
    END,
    updated_at = CURRENT_TIMESTAMP
WHERE category_id = (
    SELECT id FROM categories WHERE name = 'Assistants & Chatbots'
);

-- 3. Faire la même chose dans ai_tools pour garder la cohérence
UPDATE ai_tools 
SET image_url = CASE name
    WHEN 'ChatGPT' THEN 'https://images.unsplash.com/photo-1675557009875-436f7a7fbcb3?q=80&w=2000'
    WHEN 'Claude' THEN 'https://images.unsplash.com/photo-1675557014929-ddd27347e4dc?q=80&w=2000'
    WHEN 'Jasper' THEN 'https://images.unsplash.com/photo-1676299081847-5c62cf6fe817?q=80&w=2000'
    WHEN 'Meta AI' THEN 'https://images.unsplash.com/photo-1675557014937-b415f773d22d?q=80&w=2000'
    WHEN 'privateGPT' THEN 'https://images.unsplash.com/photo-1675557014937-b415f773d22d?q=80&w=2000'
    ELSE 'https://images.unsplash.com/photo-1675557009875-436f7a7fbcb3?q=80&w=2000' -- image par défaut pour les autres chatbots
    END,
    updated_at = CURRENT_TIMESTAMP
WHERE category_id = (
    SELECT id FROM categories WHERE name = 'Assistants & Chatbots'
);

-- 4. Vérifier le résultat
SELECT 
    t.name,
    t.image_url as tools_image,
    a.image_url as ai_tools_image,
    CASE WHEN t.image_url = a.image_url THEN 'OK' ELSE 'Différent!' END as status
FROM tools t
JOIN ai_tools a ON t.slug = a.slug
JOIN categories c ON c.id = t.category_id
WHERE c.name = 'Assistants & Chatbots'
ORDER BY t.name;

COMMIT;
