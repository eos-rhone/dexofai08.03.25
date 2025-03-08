-- Vérifier l'état actuel de l'icône
BEGIN;

-- Afficher les informations de la catégorie santé
SELECT name, slug, icon, updated_at
FROM categories 
WHERE slug = 'sante';

COMMIT;
