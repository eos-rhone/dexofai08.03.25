-- Vérifier tous les outils qui ont la même image que Bard
SELECT 
    t.name as tool_name,
    c.name as category_name,
    t.image_url
FROM ai_tools t
JOIN categories c ON t.category_id = c.id
WHERE t.image_url = 'https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?q=80&w=2000'
ORDER BY t.name;
