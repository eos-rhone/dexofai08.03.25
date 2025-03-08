-- Mise à jour des images par catégorie
UPDATE ai_tools 
SET image_url = CASE 
    -- Chatbots & Assistants
    WHEN category = 'Chatbot' OR name LIKE '%GPT%' OR name LIKE '%Chat%' OR name LIKE '%Claude%' OR name LIKE '%Bard%'
    THEN 'https://images.unsplash.com/photo-1531855392835-182e3b6dab7a'
    
    -- Image Generation
    WHEN category = 'Image Generation' OR name LIKE '%DALL%' OR name LIKE '%Midjourney%' OR name LIKE '%Stable%' OR name LIKE '%Leonardo%'
    THEN 'https://images.unsplash.com/photo-1561070791-2526d30994b5'
    
    -- Code & Development
    WHEN category = 'Development' OR name LIKE '%Copilot%' OR name LIKE '%Code%' OR name LIKE '%IDE%' OR name LIKE '%Programming%'
    THEN 'https://images.unsplash.com/photo-1542831371-29b0f74f9713'
    
    -- Writing & Content
    WHEN category = 'Writing' OR name LIKE '%Write%' OR name LIKE '%Grammar%' OR name LIKE '%Content%' OR name LIKE '%Text%'
    THEN 'https://images.unsplash.com/photo-1455390582262-044cdead277a'
    
    -- Productivity & Office
    WHEN category = 'Productivity' OR name LIKE '%Notion%' OR name LIKE '%Office%' OR name LIKE '%Work%'
    THEN 'https://images.unsplash.com/photo-1460925895917-afdab827c52f'
    
    -- Design & Creative
    WHEN category = 'Design' OR name LIKE '%Canva%' OR name LIKE '%Design%' OR name LIKE '%Creative%' OR name LIKE '%Art%'
    THEN 'https://images.unsplash.com/photo-1561070791-2526d30994b5'
    
    -- Audio & Music
    WHEN category = 'Audio' OR name LIKE '%Music%' OR name LIKE '%Sound%' OR name LIKE '%Voice%' OR name LIKE '%Speech%'
    THEN 'https://images.unsplash.com/photo-1483058712412-4245e9b90334'
    
    -- Research & Science
    WHEN category = 'Research' OR name LIKE '%Research%' OR name LIKE '%Science%' OR name LIKE '%Lab%'
    THEN 'https://images.unsplash.com/photo-1532094349884-543bc11b234d'
    
    -- Gaming & 3D
    WHEN category = 'Gaming' OR name LIKE '%Game%' OR name LIKE '%3D%' OR name LIKE '%Virtual%'
    THEN 'https://images.unsplash.com/photo-1536240478700-b869070f9279'
    
    -- Business & Analytics
    WHEN category = 'Business' OR name LIKE '%Business%' OR name LIKE '%Analytics%' OR name LIKE '%Finance%'
    THEN 'https://images.unsplash.com/photo-1460925895917-afdab827c52f'
    
    -- Education & Learning
    WHEN category = 'Education' OR name LIKE '%Learn%' OR name LIKE '%Edu%' OR name LIKE '%Study%'
    THEN 'https://images.unsplash.com/photo-1509062522246-3755977927d7'
    
    -- Par défaut pour les autres
    ELSE 'https://images.unsplash.com/photo-1677442136019-21780ecad995'
END;

-- Vérifier les mises à jour
SELECT DISTINCT category, image_url 
FROM ai_tools 
GROUP BY category, image_url 
ORDER BY category;
