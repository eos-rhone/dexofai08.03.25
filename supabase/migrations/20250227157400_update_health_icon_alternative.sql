-- Mise à jour de l'icône de la catégorie santé
BEGIN;

-- Mettre à jour l'icône de la catégorie
UPDATE categories 
SET icon = 'Plus'  -- Simple symbole plus qui représente les soins médicaux
WHERE slug = 'sante';

COMMIT;
