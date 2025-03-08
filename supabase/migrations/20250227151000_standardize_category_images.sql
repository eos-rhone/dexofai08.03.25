-- Standardiser les images par catégorie
BEGIN;

-- Définir une image par défaut pour chaque catégorie principale
WITH category_images AS (
    SELECT 
        name as category_name,
        CASE name
            WHEN 'Recherche' THEN 'https://images.unsplash.com/photo-1518432031352-d6fc5c10da5a?q=80&w=2000'
            WHEN 'Développement' THEN 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?q=80&w=2000'
            WHEN 'Médias & Divertissement' THEN 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?q=80&w=2000'
            WHEN 'Productivité' THEN 'https://images.unsplash.com/photo-1456324504439-367cee3b3c32?q=80&w=2000'
            -- Garder les images actuelles pour Assistants & Chatbots car on vient de les configurer
            ELSE (
                SELECT DISTINCT first_value(t.image_url) OVER (PARTITION BY c2.id ORDER BY t.updated_at DESC)
                FROM tools t
                JOIN categories c2 ON c2.id = t.category_id
                WHERE c2.name = c.name
                LIMIT 1
            )
        END as default_image
    FROM categories c
)
UPDATE tools t
SET image_url = ci.default_image,
    updated_at = CURRENT_TIMESTAMP
FROM categories c
JOIN category_images ci ON c.name = ci.category_name
WHERE t.category_id = c.id
AND c.name NOT IN ('Assistants & Chatbots'); -- Ne pas toucher aux chatbots

-- Faire la même chose pour ai_tools
WITH category_images AS (
    SELECT 
        name as category_name,
        CASE name
            WHEN 'Recherche' THEN 'https://images.unsplash.com/photo-1518432031352-d6fc5c10da5a?q=80&w=2000'
            WHEN 'Développement' THEN 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?q=80&w=2000'
            WHEN 'Médias & Divertissement' THEN 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?q=80&w=2000'
            WHEN 'Productivité' THEN 'https://images.unsplash.com/photo-1456324504439-367cee3b3c32?q=80&w=2000'
            ELSE (
                SELECT DISTINCT first_value(t.image_url) OVER (PARTITION BY c2.id ORDER BY t.updated_at DESC)
                FROM tools t
                JOIN categories c2 ON c2.id = t.category_id
                WHERE c2.name = c.name
                LIMIT 1
            )
        END as default_image
    FROM categories c
)
UPDATE ai_tools t
SET image_url = ci.default_image,
    updated_at = CURRENT_TIMESTAMP
FROM categories c
JOIN category_images ci ON c.name = ci.category_name
WHERE t.category_id = c.id
AND c.name NOT IN ('Assistants & Chatbots'); -- Ne pas toucher aux chatbots

-- Vérifier le résultat
SELECT 
    c.name as category_name,
    COUNT(DISTINCT t.image_url) as unique_images,
    COUNT(*) as total_tools
FROM categories c
JOIN tools t ON t.category_id = c.id
GROUP BY c.name
HAVING COUNT(DISTINCT t.image_url) > 1
ORDER BY unique_images DESC;

COMMIT;
