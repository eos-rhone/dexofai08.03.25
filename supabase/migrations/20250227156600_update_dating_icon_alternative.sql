-- Mise à jour de l'icône de la catégorie rencontres
BEGIN;

-- Mettre à jour l'icône de la catégorie avec une alternative
UPDATE categories 
SET icon = 'HeartHandshake'  -- Une belle alternative qui représente l'amour et les relations
WHERE slug = 'rencontres-relations';

COMMIT;
