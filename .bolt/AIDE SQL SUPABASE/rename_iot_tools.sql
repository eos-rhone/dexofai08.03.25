-- Renommer les outils pour mieux les différencier
UPDATE public.ai_tools
SET 
    name = CASE 
        WHEN slug = 'energy-optimizer' THEN 'EnergyOptimizer Classic'
        WHEN slug = 'smart-irrigation' THEN 'SmartIrrigation Classic'
        ELSE name
    END,
    updated_at = CURRENT_TIMESTAMP
WHERE name IN ('EnergyOptimizer', 'SmartIrrigation')
AND slug NOT LIKE '%-iot';

-- Vérifier les changements
SELECT name, slug, updated_at
FROM public.ai_tools
WHERE name LIKE '%Classic%' OR name LIKE '%IoT%'
ORDER BY name;
