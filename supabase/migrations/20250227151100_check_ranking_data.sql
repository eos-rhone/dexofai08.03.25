-- Vérifier les données comme elles sont chargées dans la page de classement
WITH ranking_tools AS (
    SELECT 
        t.name,
        t.slug,
        t.image_url,
        c.name as category_name,
        t.created_at,
        t.updated_at
    FROM tools t
    JOIN categories c ON c.id = t.category_id
    WHERE c.name = 'Assistants & Chatbots'
    AND t.name IN ('ChatGPT', 'Claude', 'Jasper', 'Meta AI', 'privateGPT')
)
SELECT 
    name,
    slug,
    image_url,
    category_name,
    CASE 
        WHEN image_url IS NULL THEN 'Pas d''image'
        WHEN image_url = '' THEN 'Image vide'
        WHEN image_url NOT LIKE 'https://%' THEN 'URL invalide'
        ELSE 'OK'
    END as status,
    created_at,
    updated_at
FROM ranking_tools
ORDER BY name;

-- Vérifier s'il y a des différences entre tools et ai_tools
SELECT 
    t.name,
    t.slug,
    t.image_url as tools_image,
    a.image_url as ai_tools_image,
    CASE WHEN t.image_url = a.image_url THEN 'OK' ELSE 'Différent!' END as status
FROM tools t
JOIN ai_tools a ON t.slug = a.slug
WHERE t.name IN ('ChatGPT', 'Claude', 'Jasper', 'Meta AI', 'privateGPT');
