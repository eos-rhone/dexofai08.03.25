-- Vérifier les outils d'art et créativité
SELECT 
    t.name as tool_name,
    t.slug as tool_slug,
    c.name as category_name,
    c.slug as category_slug,
    t.pricing
FROM ai_tools t
LEFT JOIN categories c ON t.category_id = c.id
WHERE c.slug = 'art-&-créativité'
ORDER BY t.name;
