-- Corriger les noms d'icônes qui n'existent pas dans lucide-react
BEGIN;

UPDATE categories SET icon = CASE
    WHEN icon = 'ListCheck' THEN 'CheckSquare'
    ELSE icon
END;

-- Vérifier les mises à jour
SELECT name, icon
FROM categories
ORDER BY name;

COMMIT;
