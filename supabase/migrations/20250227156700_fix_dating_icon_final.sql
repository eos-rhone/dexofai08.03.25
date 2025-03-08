-- Mise à jour de l'icône de la catégorie rencontres
BEGIN;

-- Mettre à jour l'icône de la catégorie avec une icône qui existe dans lucide-react
UPDATE categories 
SET icon = 'Heart2'  -- Icône Lucide React en forme de cœur stylisé
WHERE slug = 'rencontres-relations';

COMMIT;
