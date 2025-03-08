-- Mise à jour de l'icône pour la catégorie aviation
UPDATE categories
SET icon = 'plane'
WHERE name ILIKE '%aviation%';
