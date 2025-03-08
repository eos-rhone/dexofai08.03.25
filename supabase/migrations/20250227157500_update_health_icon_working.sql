-- Mise à jour de l'icône de la catégorie santé
BEGIN;

-- Mettre à jour l'icône de la catégorie avec une icône qui fonctionne
UPDATE categories 
SET icon = 'FlaskConical'  -- Une icône médicale/scientifique qui fonctionne déjà dans le système
WHERE slug = 'sante';

COMMIT;
