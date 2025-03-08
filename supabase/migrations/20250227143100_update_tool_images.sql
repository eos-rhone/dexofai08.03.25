-- Update tool images with official logos and category-based images
BEGIN;

-- Update specific tools with their official logos or representative images
UPDATE ai_tools SET image_url = CASE
    -- Chatbots & Assistants
    WHEN name ILIKE '%ChatGPT%' THEN 'https://images.unsplash.com/photo-1684163029671-7d342ffc913e'
    WHEN name ILIKE '%Claude%' THEN 'https://images.unsplash.com/photo-1702763220286-eb6f1dd6e4c7'
    WHEN name ILIKE '%Bard%' THEN 'https://images.unsplash.com/photo-1676277791608-ac5b4c2544cc'
    WHEN name ILIKE '%Bing Chat%' THEN 'https://images.unsplash.com/photo-1675512651616-c40b32c3f56c'
    
    -- Image Generation
    WHEN name ILIKE '%DALL-E%' THEN 'https://images.unsplash.com/photo-1686191128892-3e67c5f30820'
    WHEN name ILIKE '%Midjourney%' THEN 'https://images.unsplash.com/photo-1681412332891-203bb4590c40'
    WHEN name ILIKE '%Stable Diffusion%' THEN 'https://images.unsplash.com/photo-1682148788594-bf4b93fb3813'
    
    -- Design & Creative Tools
    WHEN name ILIKE '%Canva%' THEN 'https://images.unsplash.com/photo-1611162617474-5b21e879e113'
    WHEN name ILIKE '%Nvidia Canvas%' THEN 'https://images.unsplash.com/photo-1461344577544-4e5dc9487184'
    
    -- Code & Development
    WHEN name ILIKE '%Copilot%' THEN 'https://images.unsplash.com/photo-1687186735445-df877226fae9'
    WHEN name ILIKE '%CodeWhisperer%' THEN 'https://images.unsplash.com/photo-1666875753105-c63a6f3bdc86'
    
    -- Writing & Content
    WHEN name ILIKE '%Jasper%' THEN 'https://images.unsplash.com/photo-1455390582262-044cdead277a'
    WHEN name ILIKE '%Grammarly%' THEN 'https://images.unsplash.com/photo-1455390582262-044cdead277a'
    
    -- Music & Audio
    WHEN name ILIKE '%Mubert%' THEN 'https://images.unsplash.com/photo-1511379938547-c1f69419868d'
    WHEN name ILIKE '%Soundraw%' THEN 'https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae'
    
    -- Productivity
    WHEN name ILIKE '%Notion%' THEN 'https://images.unsplash.com/photo-1526280760714-f9e8b26f318f'
    
    -- Education
    WHEN name ILIKE '%Duolingo%' THEN 'https://images.unsplash.com/photo-1546410531-bb4caa6b424d'
    
    -- Default images based on category
    ELSE (
        SELECT c.image_url 
        FROM categories c 
        WHERE c.id = ai_tools.category_id
    )
END
WHERE image_url IS NULL OR image_url = '';

-- Ensure all tools have an image by setting a default if still NULL
UPDATE ai_tools 
SET image_url = 'https://images.unsplash.com/photo-1677442136019-21780ecad995'
WHERE image_url IS NULL OR image_url = '';

COMMIT;
