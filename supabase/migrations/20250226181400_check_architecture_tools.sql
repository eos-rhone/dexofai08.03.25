-- Vérifier les outils d'architecture et construction
SELECT 
    t.name as tool_name,
    t.slug as tool_slug,
    c.name as category_name,
    c.slug as category_slug,
    t.pricing
FROM ai_tools t
LEFT JOIN categories c ON t.category_id = c.id
WHERE c.slug = 'architecture-&-construction'
ORDER BY t.name;
