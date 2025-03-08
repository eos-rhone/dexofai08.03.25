-- Vérification finale des statistiques
SELECT 
    COUNT(*) as total_tools,
    COUNT(*) FILTER (WHERE is_active = true) as active_tools,
    COUNT(DISTINCT category_id) as categories_used,
    COUNT(*) FILTER (WHERE slug IS NULL) as missing_slugs,
    COUNT(*) FILTER (WHERE category_id IS NULL) as missing_categories
FROM public.ai_tools;

-- Vérifier les doublons
WITH duplicates AS (
    SELECT name, COUNT(*) as count
    FROM public.ai_tools
    GROUP BY name
    HAVING COUNT(*) > 1
)
SELECT COUNT(*) as nombre_doublons 
FROM duplicates;

-- Liste des outils par catégorie
SELECT 
    c.name as category_name,
    COUNT(t.id) as tool_count
FROM public.categories c
LEFT JOIN public.ai_tools t ON c.id = t.category_id
GROUP BY c.name
ORDER BY tool_count DESC;
