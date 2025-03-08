-- Mise à jour des images pour les outils du top 10 (avec images Unsplash)
UPDATE ai_tools 
SET image_url = CASE name
    -- On garde l'image qui fonctionne pour ChatGPT
    WHEN 'ChatGPT' THEN 'https://upload.wikimedia.org/wikipedia/commons/0/04/ChatGPT_logo.svg'
    
    -- DALL-E (Image de génération d'art IA)
    WHEN 'DALL-E' THEN 'https://images.unsplash.com/photo-1686191128892-3c8f0795d07d?q=80&w=2000'
    
    -- Midjourney (Image créative générée)
    WHEN 'Midjourney' THEN 'https://images.unsplash.com/photo-1681412332891-203bb88eb39b?q=80&w=2000'
    
    -- Copilot (Image de code)
    WHEN 'GitHub Copilot' THEN 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?q=80&w=2000'
    
    -- Bard (Image d'IA conversationnelle)
    WHEN 'Bard' THEN 'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=2000'
    
    -- Claude (Image d'assistant IA)
    WHEN 'Claude' THEN 'https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?q=80&w=2000'
    
    -- Stable Diffusion (Image artistique)
    WHEN 'Stable Diffusion' THEN 'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?q=80&w=2000'
    
    -- Leonardo AI (Image d'art digital)
    WHEN 'Leonardo AI' THEN 'https://images.unsplash.com/photo-1501786223405-6d024d7c3b8d?q=80&w=2000'
    
    -- Canva AI (Image de design)
    WHEN 'Canva AI' THEN 'https://images.unsplash.com/photo-1626785774573-4b799315345d?q=80&w=2000'
    
    -- Notion AI (Image de productivité)
    WHEN 'Notion AI' THEN 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?q=80&w=2000'
    
    ELSE image_url
END
WHERE name IN (
    'ChatGPT',
    'DALL-E',
    'Midjourney',
    'GitHub Copilot',
    'Bard',
    'Claude',
    'Stable Diffusion',
    'Leonardo AI',
    'Canva AI',
    'Notion AI'
);

-- Vérifier les mises à jour
SELECT name, image_url 
FROM ai_tools 
WHERE name IN (
    'ChatGPT',
    'DALL-E',
    'Midjourney',
    'GitHub Copilot',
    'Bard',
    'Claude',
    'Stable Diffusion',
    'Leonardo AI',
    'Canva AI',
    'Notion AI'
);
