-- Afficher toutes les catégories avec leur nombre d'outils
SELECT 
    c.name as nom_categorie,
    c.slug as slug_categorie,
    COUNT(t.id) as nombre_outils
FROM public.categories c
LEFT JOIN public.ai_tools t ON t.category_id = c.id
GROUP BY c.name, c.slug
ORDER BY 
    COUNT(t.id) DESC,  -- Trier d'abord par nombre d'outils
    c.name ASC;        -- Puis par ordre alphabétique

-- Afficher le nombre total de catégories
SELECT COUNT(*) as nombre_total_categories 
FROM public.categories;
