-- 1. Vérifier le nombre réel d'outils par catégorie
SELECT 
    c.name as categorie,
    c.slug,
    COUNT(t.id) as nombre_reel_outils
FROM public.categories c
LEFT JOIN public.ai_tools t ON t.category_id = c.id
GROUP BY c.id, c.name, c.slug
ORDER BY c.name;

-- 2. Vérifier s'il y a des outils sans catégorie
SELECT COUNT(*) as outils_sans_categorie
FROM public.ai_tools
WHERE category_id IS NULL;

-- 3. Vérifier les détails des outils pour une catégorie spécifique
-- Remplacez 'NomCategorie' par le nom de la catégorie que vous voulez vérifier
SELECT 
    t.name as nom_outil,
    t.slug as slug_outil,
    c.name as categorie
FROM public.ai_tools t
JOIN public.categories c ON t.category_id = c.id
WHERE c.name = 'NomCategorie';
