-- Vérifier les catégories des outils restants
SELECT 
    t.name as tool_name,
    t.slug as tool_slug,
    c.name as category_name,
    c.slug as category_slug
FROM public.ai_tools t
JOIN public.categories c ON t.category_id = c.id
WHERE t.name IN ('EnergyOptimizer', 'SmartIrrigation')
ORDER BY t.name, t.slug;
