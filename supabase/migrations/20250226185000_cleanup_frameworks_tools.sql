-- Nettoyer les outils de la catégorie Frameworks & Bibliothèques
BEGIN;

-- 1. Supprimer l'outil de test
DELETE FROM ai_tools 
WHERE name = 'Test Tool' 
AND category_id = '1715f3fe-c800-425e-b5d3-ee8af4477a39';

-- 2. Vérifier le résultat final
SELECT 
    c.name as category_name,
    COUNT(t.id) as tool_count,
    array_agg(t.name ORDER BY t.name) as tool_names
FROM categories c
LEFT JOIN ai_tools t ON c.id = t.category_id
WHERE c.id = '1715f3fe-c800-425e-b5d3-ee8af4477a39'
GROUP BY c.name;

COMMIT;
