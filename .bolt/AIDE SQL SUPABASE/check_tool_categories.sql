-- Vérifier le nombre d'outils par catégorie
WITH tool_counts AS (
    SELECT 
        c.id as category_id,
        c.name as category_name,
        c.slug as category_slug,
        COUNT(t.id) as tool_count
    FROM public.categories c
    LEFT JOIN public.ai_tools t ON t.category_id = c.id
    GROUP BY c.id, c.name, c.slug
)
SELECT 
    tc.category_name as nom_categorie,
    tc.category_slug as slug,
    tc.tool_count as nombre_outils
FROM tool_counts tc
ORDER BY tc.category_name;

-- Voir les détails des outils dans une catégorie spécifique
-- Remplacer 'nom-de-la-categorie' par le slug de la catégorie que vous voulez vérifier
SELECT 
    t.name as nom_outil,
    t.slug as slug_outil,
    c.name as categorie
FROM public.ai_tools t
JOIN public.categories c ON t.category_id = c.id
WHERE c.slug = 'nom-de-la-categorie';

-- Vérifier les outils sans catégorie
SELECT COUNT(*) as uncategorized_count
FROM public.ai_tools
WHERE category_id IS NULL;
