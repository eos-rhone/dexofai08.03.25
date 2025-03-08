-- Vérifier l'intégrité des données
BEGIN;

-- Compter le nombre total d'outils
SELECT COUNT(*) as total_tools FROM ai_tools;

-- Compter le nombre d'outils par catégorie
SELECT 
    c.name as category_name,
    COUNT(t.id) as tool_count
FROM categories c
LEFT JOIN ai_tools t ON c.id = t.category_id
GROUP BY c.name
ORDER BY c.name;

-- Vérifier les outils sans catégorie
SELECT COUNT(*) as orphaned_tools
FROM ai_tools
WHERE category_id IS NULL;

COMMIT;
