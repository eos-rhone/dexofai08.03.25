-- 1. Nombre total d'outils
SELECT COUNT(*) as total_tools
FROM public.ai_tools;

-- 2. Nombre d'outils actifs
SELECT COUNT(*) as active_tools
FROM public.ai_tools
WHERE is_active = true;

-- 3. Nombre d'outils par statut
SELECT 
    is_active,
    COUNT(*) as count
FROM public.ai_tools
GROUP BY is_active;

-- 4. Trouver les outils inactifs
SELECT 
    name,
    slug,
    is_active,
    category_id,
    created_at,
    updated_at
FROM public.ai_tools
WHERE is_active = false
ORDER BY name;

-- 5. Outils sans catégorie
SELECT 
    name,
    slug,
    is_active,
    category_id,
    created_at,
    updated_at
FROM public.ai_tools
WHERE category_id IS NULL
ORDER BY name;

-- 6. Nombre d'outils par catégorie
SELECT 
    c.name as category_name,
    COUNT(t.id) as tool_count
FROM public.categories c
LEFT JOIN public.ai_tools t ON c.id = t.category_id AND t.is_active = true
GROUP BY c.id, c.name
ORDER BY tool_count DESC;

-- 7. Analyse détaillée des problèmes potentiels
SELECT
    COUNT(*) as total,
    COUNT(*) FILTER (WHERE is_active = true) as active,
    COUNT(*) FILTER (WHERE is_active = false) as inactive,
    COUNT(*) FILTER (WHERE category_id IS NULL) as no_category,
    COUNT(*) FILTER (WHERE slug IS NULL) as no_slug,
    COUNT(*) FILTER (WHERE name IS NULL) as no_name
FROM public.ai_tools;
