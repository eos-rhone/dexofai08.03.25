-- D'abord, vérifions la structure
SELECT * FROM categories LIMIT 5;

-- Mise à jour des images par catégorie
UPDATE ai_tools 
SET image_url = CASE 
    -- Chatbots & Assistants
    WHEN category_id = (SELECT id FROM categories WHERE name ILIKE '%chat%' OR name ILIKE '%assistant%')
    OR name LIKE '%GPT%' OR name LIKE '%Chat%' OR name LIKE '%Claude%' OR name LIKE '%Bard%'
    THEN 'https://images.unsplash.com/photo-1531855392835-182e3b6dab7a'
    
    -- Image Generation
    WHEN category_id = (SELECT id FROM categories WHERE name ILIKE '%image%' OR name ILIKE '%generation%')
    OR name LIKE '%DALL%' OR name LIKE '%Midjourney%' OR name LIKE '%Stable%' OR name LIKE '%Leonardo%'
    THEN 'https://images.unsplash.com/photo-1561070791-2526d30994b5'
    
    -- Code & Development
    WHEN category_id = (SELECT id FROM categories WHERE name ILIKE '%development%' OR name ILIKE '%code%')
    OR name LIKE '%Copilot%' OR name LIKE '%Code%' OR name LIKE '%IDE%' OR name LIKE '%Programming%'
    THEN 'https://images.unsplash.com/photo-1542831371-29b0f74f9713'
    
    -- Writing & Content
    WHEN category_id = (SELECT id FROM categories WHERE name ILIKE '%writing%' OR name ILIKE '%content%')
    OR name LIKE '%Write%' OR name LIKE '%Grammar%' OR name LIKE '%Content%' OR name LIKE '%Text%'
    THEN 'https://images.unsplash.com/photo-1455390582262-044cdead277a'
    
    -- Productivity & Office
    WHEN category_id = (SELECT id FROM categories WHERE name ILIKE '%productivity%' OR name ILIKE '%office%')
    OR name LIKE '%Notion%' OR name LIKE '%Office%' OR name LIKE '%Work%'
    THEN 'https://images.unsplash.com/photo-1460925895917-afdab827c52f'
    
    -- Design & Creative
    WHEN category_id = (SELECT id FROM categories WHERE name ILIKE '%design%' OR name ILIKE '%creative%')
    OR name LIKE '%Canva%' OR name LIKE '%Design%' OR name LIKE '%Creative%' OR name LIKE '%Art%'
    THEN 'https://images.unsplash.com/photo-1561070791-2526d30994b5'
    
    -- Audio & Music
    WHEN category_id = (SELECT id FROM categories WHERE name ILIKE '%audio%' OR name ILIKE '%music%')
    OR name LIKE '%Music%' OR name LIKE '%Sound%' OR name LIKE '%Voice%' OR name LIKE '%Speech%'
    THEN 'https://images.unsplash.com/photo-1483058712412-4245e9b90334'
    
    -- Research & Science
    WHEN category_id = (SELECT id FROM categories WHERE name ILIKE '%research%' OR name ILIKE '%science%')
    OR name LIKE '%Research%' OR name LIKE '%Science%' OR name LIKE '%Lab%'
    THEN 'https://images.unsplash.com/photo-1532094349884-543bc11b234d'
    
    -- Gaming & 3D
    WHEN category_id = (SELECT id FROM categories WHERE name ILIKE '%gaming%' OR name ILIKE '%3d%')
    OR name LIKE '%Game%' OR name LIKE '%3D%' OR name LIKE '%Virtual%'
    THEN 'https://images.unsplash.com/photo-1536240478700-b869070f9279'
    
    -- Business & Analytics
    WHEN category_id = (SELECT id FROM categories WHERE name ILIKE '%business%' OR name ILIKE '%analytics%')
    OR name LIKE '%Business%' OR name LIKE '%Analytics%' OR name LIKE '%Finance%'
    THEN 'https://images.unsplash.com/photo-1460925895917-afdab827c52f'
    
    -- Education & Learning
    WHEN category_id = (SELECT id FROM categories WHERE name ILIKE '%education%' OR name ILIKE '%learning%')
    OR name LIKE '%Learn%' OR name LIKE '%Edu%' OR name LIKE '%Study%'
    THEN 'https://images.unsplash.com/photo-1509062522246-3755977927d7'
    
    -- Par défaut pour les autres
    ELSE 'https://images.unsplash.com/photo-1677442136019-21780ecad995'
END;

-- Vérifier les mises à jour
SELECT ai_tools.name, categories.name as category_name, ai_tools.image_url 
FROM ai_tools 
LEFT JOIN categories ON ai_tools.category_id = categories.id 
ORDER BY categories.name, ai_tools.name;
