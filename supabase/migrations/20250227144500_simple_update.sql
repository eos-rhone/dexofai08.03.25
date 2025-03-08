-- Mise à jour simple avec des CDN fiables
UPDATE ai_tools 
SET image_url = CASE name
    WHEN 'ChatGPT' THEN 'https://cdn-icons-png.flaticon.com/512/12542/12542868.png'
    WHEN 'DALL-E' THEN 'https://cdn-icons-png.flaticon.com/512/8363/8363090.png'
    WHEN 'Midjourney' THEN 'https://cdn-icons-png.flaticon.com/512/9095/9095124.png'
    WHEN 'Notion AI' THEN 'https://cdn-icons-png.flaticon.com/512/5968/5968769.png'
    WHEN 'Canva AI' THEN 'https://cdn-icons-png.flaticon.com/512/5968/5968705.png'
    WHEN 'GitHub Copilot' THEN 'https://cdn-icons-png.flaticon.com/512/11518/11518876.png'
    WHEN 'NVIDIA AI' THEN 'https://cdn-icons-png.flaticon.com/512/882/882730.png'
    WHEN 'Bard' THEN 'https://cdn-icons-png.flaticon.com/512/2991/2991148.png'
    WHEN 'Grammarly' THEN 'https://cdn-icons-png.flaticon.com/512/5968/5968729.png'
END
WHERE name IN ('ChatGPT', 'DALL-E', 'Midjourney', 'Notion AI', 'Canva AI', 'GitHub Copilot', 'NVIDIA AI', 'Bard', 'Grammarly');

-- Vérifier les mises à jour
SELECT name, image_url 
FROM ai_tools 
WHERE name IN ('ChatGPT', 'DALL-E', 'Midjourney', 'Notion AI', 'Canva AI', 'GitHub Copilot', 'NVIDIA AI', 'Bard', 'Grammarly')
ORDER BY name;
