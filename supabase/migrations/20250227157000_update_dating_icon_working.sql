-- Mise à jour de l'icône de la catégorie rencontres
BEGIN;

-- Mettre à jour l'icône de la catégorie avec une icône qui fonctionne
UPDATE categories 
SET icon = 'Star'  -- Une étoile pour représenter quelque chose de spécial
WHERE slug = 'rencontres-relations';

COMMIT;
