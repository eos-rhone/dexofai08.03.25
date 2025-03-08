-- Mise à jour de l'icône de la catégorie rencontres
BEGIN;

-- Mettre à jour l'icône de la catégorie avec une fleur
UPDATE categories 
SET icon = 'Flower'  -- Icône de fleur de Lucide React
WHERE slug = 'rencontres-relations';

COMMIT;
