-- Vérifier les doublons restants (devrait être uniquement EnergyOptimizer et SmartIrrigation)
WITH duplicates AS (
    SELECT name, COUNT(*) as count
    FROM public.ai_tools
    GROUP BY name
    HAVING COUNT(*) > 1
)
SELECT 
    t.name, 
    t.slug, 
    t.category_id,
    t.created_at, 
    d.count as nombre_de_copies
FROM public.ai_tools t
JOIN duplicates d ON t.name = d.name
ORDER BY t.name, t.created_at;
