-- Voir toutes les catégories et leurs images actuelles
SELECT 
    name as category_name,
    image_url,
    id
FROM categories 
ORDER BY name;
