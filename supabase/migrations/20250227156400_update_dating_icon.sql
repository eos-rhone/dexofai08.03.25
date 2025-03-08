-- Mise à jour de l'icône de la catégorie rencontres
BEGIN;

-- Mettre à jour l'icône de la catégorie avec une icône Lucide
UPDATE categories 
SET icon = 'Heart'  -- Icône Lucide React en forme de cœur
WHERE slug = 'rencontres-relations';

COMMIT;
