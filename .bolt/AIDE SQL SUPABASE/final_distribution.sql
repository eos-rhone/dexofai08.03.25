-- Vérifier la distribution finale
SELECT 
    c.name as category_name,
    COUNT(t.id) as tool_count,
    ROUND(COUNT(t.id)::numeric * 100 / (SELECT COUNT(*) FROM public.ai_tools), 2) as percentage
FROM public.categories c
LEFT JOIN public.ai_tools t ON t.category_id = c.id
GROUP BY c.name
HAVING COUNT(t.id) > 0  -- Ne montrer que les catégories qui ont des outils
ORDER BY tool_count DESC;
