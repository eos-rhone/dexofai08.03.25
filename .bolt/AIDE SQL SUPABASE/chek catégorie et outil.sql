-- Liste détaillée des catégories avec leur nombre d'outils
WITH CategoryCounts AS (
    SELECT 
        category_id,
        COUNT(*) as tool_count
    FROM public.ai_tools
    GROUP BY category_id
)
SELECT 
    c.name as nom_categorie,
    c.slug as slug_categorie,
    COALESCE(cc.tool_count, 0) as nombre_outils,
    c.icon as icone
FROM public.categories c
LEFT JOIN CategoryCounts cc ON c.id = cc.category_id
ORDER BY 
    COALESCE(cc.tool_count, 0) DESC,  -- Trier par nombre d'outils
    c.name ASC;                        -- Puis par ordre alphabétique
