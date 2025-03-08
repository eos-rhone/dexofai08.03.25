-- Créer une vue qui compte le nombre réel d'outils par catégorie
CREATE OR REPLACE VIEW category_tool_counts AS
SELECT 
    c.id as category_id,
    c.name as category_name,
    COUNT(t.id) as tool_count
FROM public.categories c
LEFT JOIN public.ai_tools t ON t.category_id = c.id
GROUP BY c.id, c.name;

-- Vérifier les nombres actuels
SELECT 
    c.name as categorie,
    c.slug,
    COUNT(t.id) as nombre_reel_outils
FROM public.categories c
LEFT JOIN public.ai_tools t ON t.category_id = c.id
GROUP BY c.id, c.name, c.slug
ORDER BY c.name;
