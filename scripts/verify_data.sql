-- Vérifier le nombre total d'outils
SELECT COUNT(*) as total_tools FROM public.ai_tools;

-- Vérifier le nombre total de catégories
SELECT COUNT(*) as total_categories FROM public.categories;

-- Vérifier quelques outils au hasard
SELECT id, name, category_id
FROM public.ai_tools
LIMIT 5;

-- Vérifier toutes les catégories
SELECT id, name, slug
FROM public.categories;
