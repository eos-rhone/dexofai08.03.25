-- Initialisation et mise à jour des métriques pour tous les outils

BEGIN;

-- Mise à jour de la structure metrics pour tous les outils
UPDATE public.ai_tools
SET metrics = COALESCE(metrics, '{}'::jsonb) || jsonb_build_object(
    'monthly_users', COALESCE((metrics->>'monthly_users')::integer, 0),
    'total_views', COALESCE((metrics->>'total_views')::integer, 0),
    'average_rating', COALESCE((metrics->>'average_rating')::numeric, 0.0),
    'review_count', COALESCE((metrics->>'review_count')::integer, 0)
)
WHERE metrics IS NULL OR 
      metrics->>'monthly_users' IS NULL OR 
      metrics->>'total_views' IS NULL OR 
      metrics->>'average_rating' IS NULL OR 
      metrics->>'review_count' IS NULL;

-- Calcul du score de popularité basé sur les métriques (selon la formule spécifiée)
UPDATE public.ai_tools
SET metrics = metrics || jsonb_build_object(
    'popularity_score',
    (
        -- 50% basé sur les utilisateurs mensuels
        COALESCE((metrics->>'monthly_users')::float, 0) * 0.5 +
        -- 30% basé sur les vues totales
        COALESCE((metrics->>'total_views')::float, 0) * 0.3 +
        -- 20% basé sur les notes et avis
        (COALESCE((metrics->>'average_rating')::float, 0) * 
         COALESCE((metrics->>'review_count')::float, 0)) * 0.2
    )::float
);

-- Création d'un index sur le score de popularité pour optimiser les requêtes de tri
CREATE INDEX IF NOT EXISTS idx_ai_tools_popularity_score ON public.ai_tools ((metrics->>'popularity_score'));

-- Vue pour les statistiques de la page d'accueil
CREATE OR REPLACE VIEW public.homepage_stats AS
SELECT 
    (SELECT COUNT(*) FROM public.ai_tools WHERE is_active = true) as total_tools,
    (SELECT COUNT(*) FROM public.categories) as total_categories,
    (SELECT COALESCE(SUM(CAST(metrics->>'monthly_users' AS INTEGER)), 0) 
     FROM public.ai_tools 
     WHERE is_active = true) as total_monthly_users,
    (SELECT COALESCE(ROUND(AVG(CAST(metrics->>'average_rating' AS NUMERIC)), 1), 0.0)
     FROM public.ai_tools 
     WHERE is_active = true 
     AND metrics->>'average_rating' IS NOT NULL) as average_rating;

-- Fonction pour obtenir les statistiques de la page d'accueil
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

-- Ajout des politiques de sécurité RLS pour la vue et la fonction
ALTER VIEW public.homepage_stats OWNER TO postgres;
GRANT SELECT ON public.homepage_stats TO anon, authenticated;
GRANT EXECUTE ON FUNCTION public.get_homepage_stats() TO anon, authenticated;

COMMIT;
