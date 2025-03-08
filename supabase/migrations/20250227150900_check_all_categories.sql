-- Vérifier toutes les catégories
WITH category_stats AS (
    SELECT 
        c.name as category_name,
        COUNT(DISTINCT t.image_url) as unique_images,
        COUNT(*) as total_tools,
        bool_and(t.image_url = a.image_url) as images_synced
    FROM categories c
    JOIN tools t ON t.category_id = c.id
    JOIN ai_tools a ON a.slug = t.slug
    GROUP BY c.name
)
SELECT 
    category_name,
    total_tools as "Nombre d'outils",
    unique_images as "Images uniques",
    CASE 
        WHEN images_synced THEN 'OK'
        ELSE 'Désynchronisé'
    END as "Statut sync"
FROM category_stats
ORDER BY total_tools DESC;
