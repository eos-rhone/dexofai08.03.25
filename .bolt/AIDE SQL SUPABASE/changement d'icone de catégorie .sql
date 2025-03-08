-- Remettre l'icône cœur pour la catégorie rencontres
BEGIN;

-- Mettre à jour l'icône de la catégorie
UPDATE categories 
SET icon = 'Heart'  -- On remet le cœur qui fonctionnait
WHERE slug = 'rencontres-relations';

COMMIT;
