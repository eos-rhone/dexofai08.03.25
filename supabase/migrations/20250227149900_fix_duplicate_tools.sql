-- Correction des doublons et des images
BEGIN;

-- 1. Supprimer le doublon avec le mauvais format de slug
DELETE FROM tools 
WHERE slug = 'privategpt';

-- 2. S'assurer que private-gpt a la bonne image
UPDATE tools
SET image_url = 'https://images.unsplash.com/photo-1675557014937-b415f773d22d?q=80&w=2000'
WHERE slug = 'private-gpt';

-- 3. Vérifier qu'il n'y a plus de doublons
SELECT name, COUNT(*) 
FROM tools 
WHERE LOWER(name) LIKE '%private%gpt%' 
GROUP BY name 
HAVING COUNT(*) > 1;

COMMIT;
