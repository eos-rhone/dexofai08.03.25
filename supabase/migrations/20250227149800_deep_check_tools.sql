-- Vérification approfondie des outils et de leurs images
WITH tool_variations AS (
    SELECT unnest(ARRAY[
        'chatgpt',
        'chat-gpt',
        'chat gpt',
        'claude',
        'claude-ai',
        'claude ai',
        'jasper',
        'jasper-ai',
        'jasper ai',
        'meta-ai',
        'meta ai',
        'meta',
        'private-gpt',
        'privategpt',
        'private gpt'
    ]) as search_term
)
SELECT DISTINCT
    t.id,
    t.name,
    t.slug,
    t.image_url,
    t.category_id,
    c.name as category_name
FROM tools t
LEFT JOIN categories c ON c.id = t.category_id
WHERE LOWER(t.name) LIKE ANY (SELECT '%' || LOWER(search_term) || '%' FROM tool_variations)
   OR LOWER(t.slug) LIKE ANY (SELECT '%' || REPLACE(LOWER(search_term), ' ', '-') || '%' FROM tool_variations)
ORDER BY t.name;

-- Vérifier si ces outils ont des images différentes dans ai_tools
SELECT 
    t.name as tool_name,
    t.slug as tool_slug,
    t.image_url as tool_image,
    a.image_url as ai_tool_image
FROM tools t
JOIN ai_tools a ON LOWER(t.name) = LOWER(a.name)
WHERE LOWER(t.name) LIKE ANY (ARRAY[
    '%chatgpt%',
    '%claude%',
    '%jasper%',
    '%meta%',
    '%private%gpt%'
])
AND t.image_url != a.image_url;
