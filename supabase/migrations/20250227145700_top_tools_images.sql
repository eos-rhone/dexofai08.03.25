-- Mise à jour des images pour les outils du top 10
UPDATE ai_tools 
SET image_url = CASE name
    -- ChatGPT (Logo officiel OpenAI)
    WHEN 'ChatGPT' THEN 'https://upload.wikimedia.org/wikipedia/commons/0/04/ChatGPT_logo.svg'
    
    -- DALL-E (Logo officiel OpenAI)
    WHEN 'DALL-E' THEN 'https://upload.wikimedia.org/wikipedia/commons/8/86/DALL-E_2_logo.svg'
    
    -- Midjourney (Logo officiel)
    WHEN 'Midjourney' THEN 'https://upload.wikimedia.org/wikipedia/commons/b/b0/Midjourney_Emblem.png'
    
    -- Copilot (Logo officiel GitHub)
    WHEN 'GitHub Copilot' THEN 'https://upload.wikimedia.org/wikipedia/commons/6/61/Github_Copilot_logo.png'
    
    -- Bard (Logo officiel Google)
    WHEN 'Bard' THEN 'https://upload.wikimedia.org/wikipedia/commons/f/f0/Google_Bard_logo.svg'
    
    -- Claude (Logo Anthropic)
    WHEN 'Claude' THEN 'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=2000'
    
    -- Stable Diffusion (Image HD)
    WHEN 'Stable Diffusion' THEN 'https://images.unsplash.com/photo-1620641788421-7a1c342ea42e?q=80&w=2000'
    
    -- Leonardo AI (Image HD)
    WHEN 'Leonardo AI' THEN 'https://images.unsplash.com/photo-1482160549825-59d1b23cb208?q=80&w=2000'
    
    -- Canva AI (Logo officiel)
    WHEN 'Canva AI' THEN 'https://upload.wikimedia.org/wikipedia/commons/0/08/Canva_icon_2021.svg'
    
    -- Notion AI (Logo officiel)
    WHEN 'Notion AI' THEN 'https://upload.wikimedia.org/wikipedia/commons/e/e9/Notion-logo.svg'
    
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
