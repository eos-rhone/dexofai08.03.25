-- Vérifier les noms exacts des catégories similaires
SELECT name 
FROM public.categories 
WHERE LOWER(name) LIKE '%energie%'
   OR LOWER(name) LIKE '%video%'
   OR LOWER(name) LIKE '%agri%';

-- Afficher aussi les slugs pour être sûr
SELECT name, slug
FROM public.categories 
WHERE LOWER(name) LIKE '%energie%'
   OR LOWER(name) LIKE '%video%'
   OR LOWER(name) LIKE '%agri%';
