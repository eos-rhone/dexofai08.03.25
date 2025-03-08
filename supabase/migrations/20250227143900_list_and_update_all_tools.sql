-- Lister et mettre à jour tous les outils IA
BEGIN;

-- D'abord, voyons tous les outils
SELECT name, image_url 
FROM ai_tools 
ORDER BY name;

-- Mise à jour pour tous les outils principaux
UPDATE ai_tools 
SET image_url = CASE name
    -- Chatbots & Assistants
    WHEN 'ChatGPT' THEN 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/ChatGPT_logo.svg/1200px-ChatGPT_logo.svg.png'
    WHEN 'Claude' THEN 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Anthropic_logo.svg/1200px-Anthropic_logo.svg.png'
    WHEN 'Google Bard' THEN 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Google_Bard_logo.svg/1200px-Google_Bard_logo.svg.png'
    WHEN 'Bing Chat' THEN 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Bing_Fluent_Logo.svg/1200px-Bing_Fluent_Logo.svg.png'
    
    -- Image Generation
    WHEN 'DALL-E' THEN 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/OpenAI_logo.svg/1200px-OpenAI_logo.svg.png'
    WHEN 'Midjourney' THEN 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Midjourney_Logo.png/1200px-Midjourney_Logo.png'
    WHEN 'Stable Diffusion' THEN 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Stable_Diffusion_logo.png/1200px-Stable_Diffusion_logo.png'
    WHEN 'Leonardo.ai' THEN 'https://leonardo.ai/favicon.ico'
    
    -- Code & Development
    WHEN 'GitHub Copilot' THEN 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/GitHub_Copilot_logo.svg/1200px-GitHub_Copilot_logo.svg.png'
    WHEN 'Amazon CodeWhisperer' THEN 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Amazon_Web_Services_Logo.svg/1200px-Amazon_Web_Services_Logo.svg.png'
    
    -- Writing & Content
    WHEN 'Jasper' THEN 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Jasper_AI_logo.png/1200px-Jasper_AI_logo.png'
    WHEN 'Grammarly' THEN 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Grammarly_logo.svg/1200px-Grammarly_logo.svg.png'
    
    -- Productivity
    WHEN 'Notion AI' THEN 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Notion_app_logo.png/1200px-Notion_app_logo.png'
    
    -- Design
    WHEN 'NVIDIA Canvas' THEN 'https://upload.wikimedia.org/wikipedia/sco/thumb/2/21/Nvidia_logo.svg/1200px-Nvidia_logo.svg.png'
    WHEN 'NVIDIA AI' THEN 'https://upload.wikimedia.org/wikipedia/sco/thumb/2/21/Nvidia_logo.svg/1200px-Nvidia_logo.svg.png'
    WHEN 'NVIDIA GameWorks AI' THEN 'https://upload.wikimedia.org/wikipedia/sco/thumb/2/21/Nvidia_logo.svg/1200px-Nvidia_logo.svg.png'
    
    -- Education
    WHEN 'Duolingo AI' THEN 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Duolingo_logo.svg/1200px-Duolingo_logo.svg.png'
    
    -- Music
    WHEN 'Mubert' THEN 'https://mubert.com/static/media/mubert-logo.2507b1c1.svg'
    WHEN 'Soundraw' THEN 'https://soundraw.io/favicon.ico'
    
    -- Garder l'image existante si pas de correspondance
    ELSE image_url
END;

-- Vérifier les mises à jour
SELECT name, image_url 
FROM ai_tools 
ORDER BY name;

COMMIT;
