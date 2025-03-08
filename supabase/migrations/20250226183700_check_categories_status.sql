-- Vérifier le statut des catégories et leurs outils
SELECT 
    c.name as category_name,
    c.slug as category_slug,
    COUNT(t.id) as tool_count,
    array_agg(t.name) as tool_names
FROM categories c
LEFT JOIN ai_tools t ON c.id = t.category_id
WHERE c.slug IN ('frameworks-&-bibliothèques', 'médias-&-divertissement')
GROUP BY c.name, c.slug;
