-- Mise à jour de l'icône de la catégorie santé
BEGIN;

-- Mettre à jour l'icône de la catégorie avec une icône qui existe dans iconMap
UPDATE categories 
SET icon = 'Shield'  -- Une icône qui existe dans le composant React
WHERE slug = 'sante';

COMMIT;
