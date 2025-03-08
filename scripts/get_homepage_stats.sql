-- Requêtes pour obtenir les statistiques de la page d'accueil

-- Nombre total d'outils IA
SELECT COUNT(*) as total_tools 
FROM public.ai_tools 
WHERE is_active = true;

-- Nombre de catégories
SELECT COUNT(*) as total_categories 
FROM public.categories;

-- Nombre total d'utilisateurs par mois (en supposant une colonne monthly_users dans ai_tools)
SELECT COALESCE(SUM(CAST(metrics->>'monthly_users' AS INTEGER)), 0) as total_monthly_users
FROM public.ai_tools
WHERE is_active = true;

-- Note moyenne (en supposant une colonne ratings dans ai_tools)
SELECT ROUND(AVG(CAST(metrics->>'average_rating' AS NUMERIC)), 1) as average_rating
FROM public.ai_tools
WHERE is_active = true 
AND metrics->>'average_rating' IS NOT NULL;

-- Version combinée pour tout obtenir en une seule requête
SELECT 
    (SELECT COUNT(*) FROM public.ai_tools WHERE is_active = true) as total_tools,
    (SELECT COUNT(*) FROM public.categories) as total_categories,
    COALESCE((SELECT SUM(CAST(metrics->>'monthly_users' AS INTEGER)) 
     FROM public.ai_tools 
     WHERE is_active = true), 0) as total_monthly_users,
    COALESCE((SELECT ROUND(AVG(CAST(metrics->>'average_rating' AS NUMERIC)), 1) 
     FROM public.ai_tools 
     WHERE is_active = true 
     AND metrics->>'average_rating' IS NOT NULL), 0.0) as average_rating;

-- Créer une vue pour les statistiques
CREATE OR REPLACE VIEW public.homepage_stats AS
SELECT 
    (SELECT COUNT(*) FROM public.ai_tools WHERE is_active = true) as total_tools,
    (SELECT COUNT(*) FROM public.categories) as total_categories,
    COALESCE((SELECT SUM(CAST(metrics->>'monthly_users' AS INTEGER)) 
     FROM public.ai_tools 
     WHERE is_active = true), 0) as total_monthly_users,
    COALESCE((SELECT ROUND(AVG(CAST(metrics->>'average_rating' AS NUMERIC)), 1) 
     FROM public.ai_tools 
     WHERE is_active = true 
     AND metrics->>'average_rating' IS NOT NULL), 0.0) as average_rating;

-- Créer une fonction pour obtenir les statistiques
CREATE OR REPLACE FUNCTION public.get_homepage_stats()
RETURNS TABLE (
    total_tools bigint,
    total_categories bigint,
    total_monthly_users bigint,
    average_rating numeric
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM public.homepage_stats;
END;
$$ LANGUAGE plpgsql;

-- Donner les permissions nécessaires
ALTER VIEW public.homepage_stats OWNER TO postgres;
GRANT SELECT ON public.homepage_stats TO anon, authenticated;
GRANT EXECUTE ON FUNCTION public.get_homepage_stats() TO anon, authenticated;
