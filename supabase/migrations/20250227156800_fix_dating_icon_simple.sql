-- Mise à jour de l'icône de la catégorie rencontres
BEGIN;

-- Mettre à jour l'icône de la catégorie avec une icône simple qui existe dans lucide-react
UPDATE categories 
SET icon = 'Heart'  -- Icône simple de cœur de Lucide React
WHERE slug = 'rencontres-relations';

COMMIT;
