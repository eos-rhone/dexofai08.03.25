-- Forcer la mise à jour de l'icône de la catégorie santé
BEGIN;

-- Mettre à jour l'icône et le timestamp
UPDATE categories 
SET 
    icon = 'Activity',
    updated_at = CURRENT_TIMESTAMP
WHERE slug = 'sante';

-- Vérifier la mise à jour
SELECT name, icon, updated_at 
FROM categories 
WHERE slug = 'sante';

COMMIT;
