-- Voir la répartition des outils par catégorie
SELECT 
    c.name as category_name,
    COUNT(t.id) as tool_count,
    ROUND(COUNT(t.id)::numeric * 100 / (SELECT COUNT(*) FROM public.ai_tools), 2) as percentage
FROM public.categories c
LEFT JOIN public.ai_tools t ON t.category_id = c.id
GROUP BY c.name
ORDER BY tool_count DESC;
