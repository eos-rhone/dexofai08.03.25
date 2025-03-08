-- 1. Trouver tous les outils en double (même nom)
WITH duplicates AS (
    SELECT name, COUNT(*) as count
    FROM public.ai_tools
    GROUP BY name
    HAVING COUNT(*) > 1
)
SELECT t.*, d.count
FROM public.ai_tools t
JOIN duplicates d ON t.name = d.name
ORDER BY t.name, t.created_at;

-- 2. Garder la première entrée et supprimer les doublons
WITH RankedTools AS (
    SELECT 
        id,
        name,
        ROW_NUMBER() OVER (PARTITION BY name ORDER BY created_at) as rn
    FROM public.ai_tools
)
DELETE FROM public.ai_tools
WHERE id IN (
    SELECT id 
    FROM RankedTools 
    WHERE rn > 1
);

-- 3. Vérifier qu'il n'y a plus de doublons
SELECT name, COUNT(*)
FROM public.ai_tools
GROUP BY name
HAVING COUNT(*) > 1;

-- 4. Afficher le nombre total d'outils après nettoyage
SELECT COUNT(*) as total_tools
FROM public.ai_tools;
