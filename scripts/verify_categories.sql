-- Vérifier l'existence exacte des catégories
SELECT id, name, slug 
FROM public.categories 
WHERE LOWER(name) = LOWER('agriculture')
   OR LOWER(name) = LOWER('energie')
   OR LOWER(name) = LOWER('video');
