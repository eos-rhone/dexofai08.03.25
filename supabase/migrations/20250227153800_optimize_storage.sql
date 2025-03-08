-- Optimisation de l'espace de stockage
BEGIN;

-- Supprimer les doublons dans ai_tools
DELETE FROM ai_tools a
USING ai_tools b
WHERE a.id > b.id 
AND a.slug = b.slug 
AND a.category_id = b.category_id;

-- Supprimer les doublons dans tools
DELETE FROM tools a
USING tools b
WHERE a.id > b.id 
AND a.slug = b.slug 
AND a.category_id = b.category_id;

-- Supprimer les outils inactifs
DELETE FROM tools WHERE is_active = false;
DELETE FROM ai_tools WHERE is_active = false;

-- Tronquer les descriptions trop longues
UPDATE tools
SET description = substring(description, 1, 500)
WHERE length(description) > 500;

UPDATE ai_tools
SET description = substring(description, 1, 500)
WHERE length(description) > 500;

-- Optimiser les URLs des images
UPDATE tools
SET image_url = replace(image_url, '?q=80&w=2000', '?q=60&w=1200')
WHERE image_url LIKE '%unsplash%';

UPDATE ai_tools
SET image_url = replace(image_url, '?q=80&w=2000', '?q=60&w=1200')
WHERE image_url LIKE '%unsplash%';

-- Optimiser les URLs des sites web en supprimant le https:// superflu
UPDATE tools
SET website_url = replace(website_url, 'https://', '')
WHERE website_url LIKE 'https://%';

UPDATE ai_tools
SET website_url = replace(website_url, 'https://', '')
WHERE website_url LIKE 'https://%';

-- Ajouter un suffixe de catégorie aux slugs pour éviter les doublons
UPDATE tools t
SET slug = t.slug || '-' || LOWER(REGEXP_REPLACE(c.name, '[^a-zA-Z0-9]+', '-', 'g'))
FROM categories c
WHERE t.category_id = c.id
AND EXISTS (
    SELECT 1 
    FROM tools t2 
    WHERE t2.slug = t.slug 
    AND t2.id != t.id
);

UPDATE ai_tools t
SET slug = t.slug || '-' || LOWER(REGEXP_REPLACE(c.name, '[^a-zA-Z0-9]+', '-', 'g'))
FROM categories c
WHERE t.category_id = c.id
AND EXISTS (
    SELECT 1 
    FROM ai_tools t2 
    WHERE t2.slug = t.slug 
    AND t2.id != t.id
);

COMMIT;
