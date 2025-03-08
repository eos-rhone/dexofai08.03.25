-- Mise à jour de l'icône de la catégorie rencontres
BEGIN;

-- Mettre à jour l'icône de la catégorie avec l'icône Rose de Lucide
UPDATE categories 
SET icon = 'Rose'  -- Icône Lucide React en forme de rose
WHERE slug = 'rencontres-relations';

COMMIT;
