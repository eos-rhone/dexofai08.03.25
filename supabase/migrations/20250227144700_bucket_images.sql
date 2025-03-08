-- Mise à jour avec les images du bucket Supabase
UPDATE ai_tools 
SET image_url = CASE name
    WHEN 'ChatGPT' THEN 'https://epfmxwovbljqvrrwgmrz.supabase.co/storage/v1/object/public/imageoutil/chatgpt.png'
    WHEN 'DALL-E' THEN 'https://epfmxwovbljqvrrwgmrz.supabase.co/storage/v1/object/public/imageoutil/dalle.png'
    WHEN 'Midjourney' THEN 'https://epfmxwovbljqvrrwgmrz.supabase.co/storage/v1/object/public/imageoutil/midjourney.png'
    WHEN 'Notion AI' THEN 'https://epfmxwovbljqvrrwgmrz.supabase.co/storage/v1/object/public/imageoutil/notion.png'
    WHEN 'Canva AI' THEN 'https://epfmxwovbljqvrrwgmrz.supabase.co/storage/v1/object/public/imageoutil/canva.png'
    WHEN 'GitHub Copilot' THEN 'https://epfmxwovbljqvrrwgmrz.supabase.co/storage/v1/object/public/imageoutil/github-copilot.png'
    WHEN 'NVIDIA AI' THEN 'https://epfmxwovbljqvrrwgmrz.supabase.co/storage/v1/object/public/imageoutil/nvidia.png'
    WHEN 'Bard' THEN 'https://epfmxwovbljqvrrwgmrz.supabase.co/storage/v1/object/public/imageoutil/bard.png'
    WHEN 'Grammarly' THEN 'https://epfmxwovbljqvrrwgmrz.supabase.co/storage/v1/object/public/imageoutil/grammarly.png'
END
WHERE name IN ('ChatGPT', 'DALL-E', 'Midjourney', 'Notion AI', 'Canva AI', 'GitHub Copilot', 'NVIDIA AI', 'Bard', 'Grammarly');

-- Vérifier les mises à jour
SELECT name, image_url 
FROM ai_tools 
WHERE name IN ('ChatGPT', 'DALL-E', 'Midjourney', 'Notion AI', 'Canva AI', 'GitHub Copilot', 'NVIDIA AI', 'Bard', 'Grammarly')
ORDER BY name;
