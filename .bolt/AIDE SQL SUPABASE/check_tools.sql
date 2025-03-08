-- Afficher tous les outils avec leur catégorie
SELECT 
    t.name as nom_outil,
    t.slug as slug_outil,
    c.name as nom_categorie,
    t.metrics->>'monthly_users' as utilisateurs_mensuels,
    t.metrics->>'total_views' as vues_totales,
    t.metrics->>'rating' as note
FROM public.ai_tools t
LEFT JOIN public.categories c ON t.category_id = c.id
ORDER BY 
    c.name ASC,      -- Trier par catégorie
    t.name ASC;      -- Puis par nom d'outil

-- Afficher le nombre total d'outils
SELECT COUNT(*) as nombre_total_outils 
FROM public.ai_tools;
