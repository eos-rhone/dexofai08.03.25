-- Vérifier les slugs exacts des catégories
SELECT name, slug, id
FROM categories
WHERE name ILIKE '%framework%'
   OR name ILIKE '%impression%'
   OR name ILIKE '%jeux%'
   OR name ILIKE '%média%'
   OR name ILIKE '%divertissement%';
