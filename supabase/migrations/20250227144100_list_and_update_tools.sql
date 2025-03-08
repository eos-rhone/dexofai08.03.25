-- D'abord, listons tous les outils pour voir leurs noms exacts
SELECT name, image_url 
FROM ai_tools 
ORDER BY name;

-- Maintenant, mettons à jour avec les noms exacts
BEGIN;

UPDATE ai_tools 
SET image_url = CASE name
    -- Les outils qui ont déjà fonctionné
    WHEN 'ChatGPT' THEN 'https://seeklogo.com/images/C/chatgpt-logo-02AFA704B5-seeklogo.com.png'
    WHEN 'Notion AI' THEN 'https://seeklogo.com/images/N/notion-app-logo-009B1538E8-seeklogo.com.png'
    WHEN 'Canva' THEN 'https://seeklogo.com/images/C/canva-logo-B4BE25729A-seeklogo.com.png'
    
    -- Autres outils (ajoutez les noms exacts ici)
    WHEN 'Claude' THEN 'https://seeklogo.com/images/A/anthropic-logo-3F2CC6B5A7-seeklogo.com.png'
    WHEN 'DALL-E' THEN 'https://seeklogo.com/images/D/dall-e-logo-1DD62217FD-seeklogo.com.png'
    WHEN 'Midjourney' THEN 'https://seeklogo.com/images/M/midjourney-logo-41EA81BF60-seeklogo.com.png'
    WHEN 'Stable Diffusion' THEN 'https://seeklogo.com/images/S/stable-diffusion-logo-C9A3F27A2B-seeklogo.com.png'
    WHEN 'GitHub Copilot' THEN 'https://seeklogo.com/images/G/github-copilot-logo-42D68AF63F-seeklogo.com.png'
    WHEN 'Jasper' THEN 'https://seeklogo.com/images/J/jasper-ai-logo-2E4AEE2F6D-seeklogo.com.png'
    WHEN 'Grammarly' THEN 'https://seeklogo.com/images/G/grammarly-logo-24122EAB24-seeklogo.com.png'
    WHEN 'Google Bard' THEN 'https://seeklogo.com/images/G/google-bard-logo-2D24045D0E-seeklogo.com.png'
    WHEN 'Bing Chat' THEN 'https://seeklogo.com/images/B/bing-chat-logo-E7B6A86E50-seeklogo.com.png'
    WHEN 'NVIDIA Canvas' THEN 'https://seeklogo.com/images/N/nvidia-logo-31D9C3C7F8-seeklogo.com.png'
    WHEN 'NVIDIA AI' THEN 'https://seeklogo.com/images/N/nvidia-logo-31D9C3C7F8-seeklogo.com.png'
    WHEN 'NVIDIA GameWorks AI' THEN 'https://seeklogo.com/images/N/nvidia-logo-31D9C3C7F8-seeklogo.com.png'
    WHEN 'Duolingo AI' THEN 'https://seeklogo.com/images/D/duolingo-logo-E789C233CC-seeklogo.com.png'
    WHEN 'Mubert' THEN 'https://mubert.com/static/media/mubert-logo.2507b1c1.svg'
    WHEN 'Soundraw' THEN 'https://soundraw.io/favicon.ico'
    WHEN 'ElevenLabs' THEN 'https://seeklogo.com/images/E/eleven-labs-logo-5834C3F538-seeklogo.com.png'
    WHEN 'Wolfram Alpha' THEN 'https://seeklogo.com/images/W/wolfram-logo-A8EF1D9B95-seeklogo.com.png'
    WHEN 'DeepMind' THEN 'https://seeklogo.com/images/D/deepmind-logo-2AA1E770CC-seeklogo.com.png'
    WHEN 'Microsoft 365 Copilot' THEN 'https://seeklogo.com/images/M/microsoft-copilot-logo-43F4F35A3E-seeklogo.com.png'
    WHEN 'Adobe Firefly' THEN 'https://seeklogo.com/images/A/adobe-logo-FF746AE17E-seeklogo.com.png'
    
    ELSE image_url
END;

-- Vérifions les résultats
SELECT name, image_url 
FROM ai_tools 
ORDER BY name;

COMMIT;
