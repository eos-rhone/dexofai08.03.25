-- Renommer les versions IoT pour avoir une nomenclature cohérente
UPDATE public.ai_tools
SET 
    name = CASE 
        WHEN slug = 'energy-optimizer-iot' THEN 'EnergyOptimizer IoT'
        WHEN slug = 'smart-irrigation-iot' THEN 'SmartIrrigation IoT'
        ELSE name
    END,
    updated_at = CURRENT_TIMESTAMP
WHERE slug IN ('energy-optimizer-iot', 'smart-irrigation-iot');

-- Vérifier tous les outils liés
SELECT name, slug, updated_at
FROM public.ai_tools
WHERE name LIKE 'Energy%' 
   OR name LIKE 'Smart%'
   OR name LIKE '%IoT%'
ORDER BY name;
