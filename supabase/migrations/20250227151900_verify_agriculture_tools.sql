-- Vérifier les outils ajoutés
SELECT 
    t.name,
    t.slug,
    t.website_url,
    t.is_active,
    t.is_featured,
    t.user_count,
    t.average_rating,
    c.name as category_name
FROM tools t
JOIN categories c ON c.id = t.category_id
WHERE c.name = 'Agriculture & Environnement'
ORDER BY t.name;

-- Vérifier la synchronisation avec ai_tools
SELECT 
    t.name,
    t.slug,
    'tools' as source,
    t.id as tools_id,
    a.id as ai_tools_id,
    CASE WHEN t.id = a.id THEN 'OK' ELSE 'Different!' END as id_check,
    CASE WHEN t.image_url = a.image_url THEN 'OK' ELSE 'Different!' END as image_check
FROM tools t
JOIN ai_tools a ON t.slug = a.slug
JOIN categories c ON c.id = t.category_id
WHERE c.name = 'Agriculture & Environnement'
ORDER BY t.name;
