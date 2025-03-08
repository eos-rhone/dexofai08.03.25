-- Vérifier les outils non catégorisés
SELECT COUNT(*) as uncategorized_count
FROM public.ai_tools
WHERE category_id IS NULL;

-- Afficher les détails des outils non catégorisés
SELECT id, name, description, website_url
FROM public.ai_tools
WHERE category_id IS NULL
ORDER BY name;
