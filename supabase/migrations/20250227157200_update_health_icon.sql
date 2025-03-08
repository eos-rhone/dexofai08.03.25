-- Mise à jour de l'icône de la catégorie santé
BEGIN;

-- Mettre à jour l'icône de la catégorie
UPDATE categories 
SET icon = 'Stethoscope'  -- Icône médicale de Lucide React
WHERE slug = 'sante';

COMMIT;
