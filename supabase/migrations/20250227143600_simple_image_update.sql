-- Mise à jour simple des images des outils
BEGIN;

-- Mettre à jour les images des outils
UPDATE ai_tools 
SET image_url = CASE 
    -- Chatbots & Assistants
    WHEN name ILIKE '%chatgpt%' 
    THEN 'https://static.vecteezy.com/system/resources/previews/021/608/790/original/chatgpt-logo-chat-gpt-icon-on-black-background-free-vector.jpg'
    
    WHEN name ILIKE '%claude%' 
    THEN 'https://static.vecteezy.com/system/resources/thumbnails/027/388/677/small/anthropic-claude-ai-logo-free-vector.jpg'
    
    WHEN name ILIKE '%bard%' 
    THEN 'https://static.vecteezy.com/system/resources/previews/024/109/794/non_2x/google-bard-logo-artificial-intelligence-chatbot-free-vector.jpg'
    
    -- Image Generation
    WHEN name ILIKE '%dall-e%' 
    THEN 'https://static.vecteezy.com/system/resources/previews/021/059/827/non_2x/chatgpt-logo-chat-gpt-icon-on-white-background-free-vector.jpg'
    
    WHEN name ILIKE '%midjourney%' 
    THEN 'https://cdn.worldvectorlogo.com/logos/midjourney-1.svg'
    
    WHEN name ILIKE '%stable diffusion%' 
    THEN 'https://static.vecteezy.com/system/resources/previews/024/811/536/non_2x/stability-ai-logo-free-vector.jpg'
    
    WHEN name ILIKE '%leonardo%' 
    THEN 'https://framerusercontent.com/images/nXLdc1l95LRr0YIGqnJmKPIzgnw.png'
    
    -- Design & Creative
    WHEN name ILIKE '%canva%' 
    THEN 'https://static.vecteezy.com/system/resources/previews/022/100/816/non_2x/canva-logo-canva-app-icon-free-vector.jpg'
    
    WHEN name ILIKE '%nvidia canvas%' 
    THEN 'https://static.vecteezy.com/system/resources/previews/022/101/069/non_2x/nvidia-logo-nvidia-icon-free-vector.jpg'
    
    -- Code & Development
    WHEN name ILIKE '%copilot%' 
    THEN 'https://static.vecteezy.com/system/resources/previews/022/100/873/non_2x/github-logo-git-hub-icon-with-text-on-white-background-free-vector.jpg'
    
    WHEN name ILIKE '%codewhisperer%' 
    THEN 'https://static.vecteezy.com/system/resources/previews/013/948/549/non_2x/aws-amazon-web-services-logo-editorial-free-vector.jpg'
    
    -- Writing & Content
    WHEN name ILIKE '%jasper%' 
    THEN 'https://static.vecteezy.com/system/resources/previews/024/811/536/non_2x/stability-ai-logo-free-vector.jpg'
    
    WHEN name ILIKE '%grammarly%' 
    THEN 'https://static.vecteezy.com/system/resources/previews/024/090/570/non_2x/grammarly-logo-grammarly-icon-free-vector.jpg'
    
    -- Productivity
    WHEN name ILIKE '%notion%' 
    THEN 'https://static.vecteezy.com/system/resources/previews/024/090/580/non_2x/notion-logo-notion-icon-free-vector.jpg'
    
    -- Education
    WHEN name ILIKE '%duolingo%' 
    THEN 'https://static.vecteezy.com/system/resources/previews/024/090/561/non_2x/duolingo-logo-duolingo-icon-free-vector.jpg'
    
    -- Si aucune correspondance, utiliser l'image de la catégorie
    ELSE COALESCE(
        (SELECT c.image_url FROM categories c WHERE c.id = ai_tools.category_id),
        'https://images.unsplash.com/photo-1677442136019-21780ecad995'
    )
END
WHERE image_url IS NULL OR image_url = '';

COMMIT;
