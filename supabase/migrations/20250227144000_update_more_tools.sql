-- Mise à jour des images pour plus d'outils IA
BEGIN;

UPDATE ai_tools 
SET image_url = CASE 
    -- Chatbots & Assistants
    WHEN name ILIKE '%chatgpt%' THEN 'https://seeklogo.com/images/C/chatgpt-logo-02AFA704B5-seeklogo.com.png'
    WHEN name ILIKE '%claude%' THEN 'https://seeklogo.com/images/A/anthropic-logo-3F2CC6B5A7-seeklogo.com.png'
    WHEN name ILIKE '%bard%' THEN 'https://seeklogo.com/images/G/google-bard-logo-2D24045D0E-seeklogo.com.png'
    WHEN name ILIKE '%bing%chat%' THEN 'https://seeklogo.com/images/B/bing-chat-logo-E7B6A86E50-seeklogo.com.png'
    
    -- Image Generation
    WHEN name ILIKE '%dall-e%' THEN 'https://seeklogo.com/images/D/dall-e-logo-1DD62217FD-seeklogo.com.png'
    WHEN name ILIKE '%midjourney%' THEN 'https://seeklogo.com/images/M/midjourney-logo-41EA81BF60-seeklogo.com.png'
    WHEN name ILIKE '%stable diffusion%' THEN 'https://seeklogo.com/images/S/stable-diffusion-logo-C9A3F27A2B-seeklogo.com.png'
    WHEN name ILIKE '%leonardo%' THEN 'https://leonardo.ai/favicon.ico'
    
    -- Code & Development
    WHEN name ILIKE '%copilot%' THEN 'https://seeklogo.com/images/G/github-copilot-logo-42D68AF63F-seeklogo.com.png'
    WHEN name ILIKE '%codewhisperer%' THEN 'https://seeklogo.com/images/A/aws-codewhisperer-logo-8166AE875F-seeklogo.com.png'
    
    -- Writing & Content
    WHEN name ILIKE '%jasper%' THEN 'https://seeklogo.com/images/J/jasper-ai-logo-2E4AEE2F6D-seeklogo.com.png'
    WHEN name ILIKE '%grammarly%' THEN 'https://seeklogo.com/images/G/grammarly-logo-24122EAB24-seeklogo.com.png'
    
    -- Productivity & Office
    WHEN name ILIKE '%notion%' THEN 'https://seeklogo.com/images/N/notion-app-logo-009B1538E8-seeklogo.com.png'
    WHEN name ILIKE '%microsoft 365%' THEN 'https://seeklogo.com/images/M/microsoft-365-logo-446A5AE9D1-seeklogo.com.png'
    WHEN name ILIKE '%office%copilot%' THEN 'https://seeklogo.com/images/M/microsoft-copilot-logo-43F4F35A3E-seeklogo.com.png'
    
    -- Design & Creative
    WHEN name ILIKE '%nvidia%' THEN 'https://seeklogo.com/images/N/nvidia-logo-31D9C3C7F8-seeklogo.com.png'
    WHEN name ILIKE '%canva%' THEN 'https://seeklogo.com/images/C/canva-logo-B4BE25729A-seeklogo.com.png'
    WHEN name ILIKE '%adobe%' THEN 'https://seeklogo.com/images/A/adobe-logo-FF746AE17E-seeklogo.com.png'
    
    -- Education
    WHEN name ILIKE '%duolingo%' THEN 'https://seeklogo.com/images/D/duolingo-logo-E789C233CC-seeklogo.com.png'
    
    -- Music & Audio
    WHEN name ILIKE '%mubert%' THEN 'https://mubert.com/static/media/mubert-logo.2507b1c1.svg'
    WHEN name ILIKE '%soundraw%' THEN 'https://soundraw.io/favicon.ico'
    WHEN name ILIKE '%elevenlabs%' THEN 'https://seeklogo.com/images/E/eleven-labs-logo-5834C3F538-seeklogo.com.png'
    
    -- Research & Science
    WHEN name ILIKE '%wolfram%' THEN 'https://seeklogo.com/images/W/wolfram-logo-A8EF1D9B95-seeklogo.com.png'
    WHEN name ILIKE '%deepmind%' THEN 'https://seeklogo.com/images/D/deepmind-logo-2AA1E770CC-seeklogo.com.png'
    
    -- Business & Analytics
    WHEN name ILIKE '%salesforce%' THEN 'https://seeklogo.com/images/S/salesforce-logo-F6B237ABDC-seeklogo.com.png'
    WHEN name ILIKE '%tableau%' THEN 'https://seeklogo.com/images/T/tableau-software-logo-F1CE2CA54E-seeklogo.com.png'
    
    ELSE image_url
END
WHERE name IS NOT NULL;

-- Vérifier les mises à jour
SELECT name, image_url 
FROM ai_tools 
ORDER BY name;

COMMIT;
