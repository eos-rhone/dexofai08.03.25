-- Mise à jour finale avec des CDN très fiables
UPDATE ai_tools 
SET image_url = CASE name
    WHEN 'ChatGPT' THEN 'https://upload.wikimedia.org/wikipedia/commons/0/04/ChatGPT_logo.svg'
    WHEN 'DALL-E' THEN 'https://upload.wikimedia.org/wikipedia/commons/8/86/DALL-E_2_logo.svg'
    WHEN 'Midjourney' THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b0/Midjourney_Emblem.png'
    WHEN 'Notion AI' THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e9/Notion-logo.svg'
    WHEN 'Canva AI' THEN 'https://upload.wikimedia.org/wikipedia/commons/0/08/Canva_icon_2021.svg'
    WHEN 'GitHub Copilot' THEN 'https://upload.wikimedia.org/wikipedia/commons/6/61/Github_Copilot_logo.png'
    WHEN 'NVIDIA AI' THEN 'https://upload.wikimedia.org/wikipedia/commons/2/21/Nvidia_logo.svg'
    WHEN 'Bard' THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f0/Google_Bard_logo.svg'
    WHEN 'Grammarly' THEN 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Grammarly_logo.svg'
END
WHERE name IN ('ChatGPT', 'DALL-E', 'Midjourney', 'Notion AI', 'Canva AI', 'GitHub Copilot', 'NVIDIA AI', 'Bard', 'Grammarly');

-- Vérifier les mises à jour
SELECT name, image_url 
FROM ai_tools 
WHERE name IN ('ChatGPT', 'DALL-E', 'Midjourney', 'Notion AI', 'Canva AI', 'GitHub Copilot', 'NVIDIA AI', 'Bard', 'Grammarly')
ORDER BY name;
