-- 1. Créer une liste des outils à ne pas toucher (qui semblent différents)
CREATE TEMP TABLE IF NOT EXISTS special_cases AS
SELECT DISTINCT name 
FROM public.ai_tools
WHERE name IN ('EnergyOptimizer', 'SmartIrrigation');

-- 2. Supprimer les doublons en gardant l'entrée la plus ancienne
WITH RankedTools AS (
    SELECT 
        id,
        name,
        slug,
        created_at,
        ROW_NUMBER() OVER (PARTITION BY name ORDER BY created_at) as rn
    FROM public.ai_tools
    WHERE name NOT IN (SELECT name FROM special_cases)  -- Exclure les cas spéciaux
)
DELETE FROM public.ai_tools
WHERE id IN (
    SELECT id 
    FROM RankedTools 
    WHERE rn > 1
)
RETURNING name, slug;  -- Afficher ce qui a été supprimé

-- 3. Vérifier les doublons restants
WITH duplicates AS (
    SELECT name, COUNT(*) as count
    FROM public.ai_tools
    GROUP BY name
    HAVING COUNT(*) > 1
)
SELECT t.name, t.slug, t.created_at, d.count as nombre_de_copies
FROM public.ai_tools t
JOIN duplicates d ON t.name = d.name
ORDER BY t.name, t.created_at;

-- 4. Afficher le nombre total d'outils
SELECT COUNT(*) as total_tools
FROM public.ai_tools;
