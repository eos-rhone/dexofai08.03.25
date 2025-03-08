-- Drop the existing function first
DROP FUNCTION IF EXISTS public.get_homepage_stats();

-- Create the homepage stats function
CREATE OR REPLACE FUNCTION public.get_homepage_stats()
RETURNS TABLE (
    total_tools bigint,
    total_categories bigint,
    total_monthly_users bigint,
    average_rating numeric
) 
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        (SELECT COUNT(*) FROM public.ai_tools WHERE is_active = true) as total_tools,
        (SELECT COUNT(*) FROM public.categories) as total_categories,
        -- Pour l'instant, on retourne un nombre fixe d'utilisateurs mensuels
        1000 as total_monthly_users,
        -- Pour l'instant, on retourne une note moyenne fixe
        4.5 as average_rating;
END;
$$;

-- Grant access to the function
GRANT EXECUTE ON FUNCTION public.get_homepage_stats() TO anon, authenticated;
