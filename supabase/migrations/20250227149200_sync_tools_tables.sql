-- Synchroniser les images et catégories entre ai_tools et tools
UPDATE tools t
SET 
    image_url = a.image_url,
    category_id = a.category_id
FROM ai_tools a
WHERE t.name = a.name
AND (t.image_url != a.image_url OR t.category_id != a.category_id OR t.image_url IS NULL OR t.category_id IS NULL);

-- Vérifier la synchronisation
SELECT 
    t.name,
    t.image_url as tools_image,
    a.image_url as ai_tools_image,
    t.category_id as tools_category,
    a.category_id as ai_tools_category
FROM tools t
JOIN ai_tools a ON t.name = a.name
WHERE t.image_url != a.image_url 
   OR t.category_id != a.category_id 
   OR t.image_url IS NULL 
   OR t.category_id IS NULL;
