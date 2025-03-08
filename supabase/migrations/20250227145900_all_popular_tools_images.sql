-- Mise à jour des images pour tous les outils IA populaires
UPDATE ai_tools 
SET image_url = CASE name
    -- Top 10 et outils très populaires
    WHEN 'ChatGPT' THEN 'https://upload.wikimedia.org/wikipedia/commons/0/04/ChatGPT_logo.svg'
    WHEN 'DALL-E' THEN 'https://images.unsplash.com/photo-1686191128892-3c8f0795d07d?q=80&w=2000'
    WHEN 'Midjourney' THEN 'https://images.unsplash.com/photo-1681412332891-203bb88eb39b?q=80&w=2000'
    WHEN 'GitHub Copilot' THEN 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?q=80&w=2000'
    WHEN 'Bard' THEN 'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=2000'
    WHEN 'Claude' THEN 'https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?q=80&w=2000'
    WHEN 'Stable Diffusion' THEN 'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?q=80&w=2000'
    WHEN 'Leonardo AI' THEN 'https://images.unsplash.com/photo-1501786223405-6d024d7c3b8d?q=80&w=2000'
    WHEN 'Canva AI' THEN 'https://images.unsplash.com/photo-1626785774573-4b799315345d?q=80&w=2000'
    WHEN 'Notion AI' THEN 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?q=80&w=2000'
    
    -- Autres outils populaires
    WHEN 'Grammarly' THEN 'https://images.unsplash.com/photo-1455390582262-044cdead277a?q=80&w=2000'
    WHEN 'Jasper' THEN 'https://images.unsplash.com/photo-1516321497487-e288fb19713f?q=80&w=2000'
    WHEN 'Copy.ai' THEN 'https://images.unsplash.com/photo-1493723843671-1d655e66ac1c?q=80&w=2000'
    WHEN 'Bing Chat' THEN 'https://images.unsplash.com/photo-1577563908411-5077b6dc7624?q=80&w=2000'
    WHEN 'Anthropic Claude' THEN 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=2000'
    WHEN 'DeepL' THEN 'https://images.unsplash.com/photo-1509228627152-72ae9ae6848d?q=80&w=2000'
    WHEN 'Replika' THEN 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?q=80&w=2000'
    WHEN 'RunwayML' THEN 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?q=80&w=2000'
    WHEN 'Hugging Face' THEN 'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=2000'
    WHEN 'OpenAI API' THEN 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=2000'
    WHEN 'Amazon CodeWhisperer' THEN 'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?q=80&w=2000'
    WHEN 'Tabnine' THEN 'https://images.unsplash.com/photo-1542903660-eedba2cda473?q=80&w=2000'
    WHEN 'Codeium' THEN 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?q=80&w=2000'
    WHEN 'Adobe Firefly' THEN 'https://images.unsplash.com/photo-1561070791-2526d30994b5?q=80&w=2000'
    WHEN 'Synthesia' THEN 'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000'
    WHEN 'Descript' THEN 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618?q=80&w=2000'
    WHEN 'Elevenlabs' THEN 'https://images.unsplash.com/photo-1511379938547-c1f69419868d?q=80&w=2000'
    WHEN 'Murf AI' THEN 'https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae?q=80&w=2000'
    ELSE image_url
END
WHERE name IN (
    'ChatGPT', 'DALL-E', 'Midjourney', 'GitHub Copilot', 'Bard', 'Claude', 
    'Stable Diffusion', 'Leonardo AI', 'Canva AI', 'Notion AI',
    'Grammarly', 'Jasper', 'Copy.ai', 'Bing Chat', 'Anthropic Claude',
    'DeepL', 'Replika', 'RunwayML', 'Hugging Face', 'OpenAI API',
    'Amazon CodeWhisperer', 'Tabnine', 'Codeium', 'Adobe Firefly',
    'Synthesia', 'Descript', 'Elevenlabs', 'Murf AI'
);

-- Vérifier les mises à jour
SELECT name, image_url 
FROM ai_tools 
WHERE name IN (
    'ChatGPT', 'DALL-E', 'Midjourney', 'GitHub Copilot', 'Bard', 'Claude', 
    'Stable Diffusion', 'Leonardo AI', 'Canva AI', 'Notion AI',
    'Grammarly', 'Jasper', 'Copy.ai', 'Bing Chat', 'Anthropic Claude',
    'DeepL', 'Replika', 'RunwayML', 'Hugging Face', 'OpenAI API',
    'Amazon CodeWhisperer', 'Tabnine', 'Codeium', 'Adobe Firefly',
    'Synthesia', 'Descript', 'Elevenlabs', 'Murf AI'
);
