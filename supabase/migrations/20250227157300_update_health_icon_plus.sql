-- Mise à jour de l'icône de la catégorie santé
BEGIN;

-- Mettre à jour l'icône de la catégorie
UPDATE categories 
SET icon = 'PlusSquare'  -- Le symbole + médical dans un carré
WHERE slug = 'sante';

COMMIT;
