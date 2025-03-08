-- Mise à jour de l'icône de la catégorie santé
BEGIN;

-- Mettre à jour l'icône de la catégorie avec une icône vérifiée
UPDATE categories 
SET icon = 'Activity'  -- Une icône qui représente l'activité médicale/santé
WHERE slug = 'sante';

COMMIT;
