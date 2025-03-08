-- Mise à jour directe des images
BEGIN;

UPDATE ai_tools 
SET image_url = CASE name
    -- Chatbots & Assistants
    WHEN 'ChatGPT' THEN 'https://i.imgur.com/2STG62m.png'  -- Logo ChatGPT
    WHEN 'Claude' THEN 'https://i.imgur.com/7tpkhDE.png'   -- Logo Anthropic Claude
    WHEN 'Google Bard' THEN 'https://i.imgur.com/3UwUXAp.png'  -- Logo Google Bard
    WHEN 'Bing Chat' THEN 'https://i.imgur.com/dD45Lk9.png'  -- Logo Bing Chat
    
    -- Image Generation
    WHEN 'DALL-E' THEN 'https://i.imgur.com/5pdpw5L.png'  -- Logo DALL-E
    WHEN 'Midjourney' THEN 'https://i.imgur.com/YzF5dYL.png'  -- Logo Midjourney
    WHEN 'Stable Diffusion' THEN 'https://i.imgur.com/QkfZqQn.png'  -- Logo Stable Diffusion
    WHEN 'Leonardo.ai' THEN 'https://i.imgur.com/w2RtGDE.png'  -- Logo Leonardo.ai
    
    -- Code & Development
    WHEN 'GitHub Copilot' THEN 'https://i.imgur.com/AsxXN2a.png'  -- Logo GitHub Copilot
    WHEN 'Amazon CodeWhisperer' THEN 'https://i.imgur.com/pQCT2CG.png'  -- Logo AWS CodeWhisperer
    
    -- Writing & Content
    WHEN 'Jasper' THEN 'https://i.imgur.com/JHv2IhX.png'  -- Logo Jasper
    WHEN 'Grammarly' THEN 'https://i.imgur.com/VYtQhQ7.png'  -- Logo Grammarly
    
    -- Productivity
    WHEN 'Notion AI' THEN 'https://i.imgur.com/dKrn1Md.png'  -- Logo Notion
    WHEN 'Microsoft 365 Copilot' THEN 'https://i.imgur.com/AsxXN2a.png'  -- Logo Microsoft Copilot
    
    -- Design & Creative
    WHEN 'NVIDIA Canvas' THEN 'https://i.imgur.com/C4BaVqH.png'  -- Logo NVIDIA
    WHEN 'NVIDIA AI' THEN 'https://i.imgur.com/C4BaVqH.png'  -- Logo NVIDIA
    WHEN 'NVIDIA GameWorks AI' THEN 'https://i.imgur.com/C4BaVqH.png'  -- Logo NVIDIA
    WHEN 'Canva' THEN 'https://i.imgur.com/Km2CtQG.png'  -- Logo Canva
    
    -- Education
    WHEN 'Duolingo AI' THEN 'https://i.imgur.com/tqeB7RB.png'  -- Logo Duolingo
    
    -- Music & Audio
    WHEN 'Mubert' THEN 'https://i.imgur.com/L2YVD8n.png'  -- Logo Mubert
    WHEN 'Soundraw' THEN 'https://i.imgur.com/NQjS4PS.png'  -- Logo Soundraw
    WHEN 'ElevenLabs' THEN 'https://i.imgur.com/UqWvj5Y.png'  -- Logo ElevenLabs
    
    ELSE image_url
END;

-- Vérifier les mises à jour
SELECT name, image_url 
FROM ai_tools 
ORDER BY name;

COMMIT;
