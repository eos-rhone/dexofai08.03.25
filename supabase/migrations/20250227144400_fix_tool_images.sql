-- Mise à jour des images avec des URLs qui fonctionnent déjà dans la base
BEGIN;

-- D'abord, supprimons les doublons
DELETE FROM ai_tools a USING ai_tools b
WHERE a.ctid < b.ctid 
AND a.name = b.name;

-- Ensuite, mettons à jour les images
UPDATE ai_tools 
SET image_url = CASE 
    -- Images qui fonctionnent déjà (confirmé dans les données)
    WHEN name = 'ChatGPT' THEN 'https://i.imgur.com/2STG62m.png'
    WHEN name = 'Claude' THEN 'https://i.imgur.com/7tpkhDE.png'
    WHEN name = 'DALL-E' THEN 'https://i.imgur.com/5pdpw5L.png'
    WHEN name = 'Midjourney' THEN 'https://i.imgur.com/YzF5dYL.png'
    WHEN name = 'GitHub Copilot' THEN 'https://i.imgur.com/AsxXN2a.png'
    WHEN name = 'Notion AI' THEN 'https://i.imgur.com/dKrn1Md.png'
    WHEN name = 'Grammarly' THEN 'https://i.imgur.com/VYtQhQ7.png'
    WHEN name = 'Jasper' THEN 'https://i.imgur.com/JHv2IhX.png'
    WHEN name = 'ElevenLabs' THEN 'https://i.imgur.com/UqWvj5Y.png'
    WHEN name = 'Mubert' THEN 'https://i.imgur.com/L2YVD8n.png'
    WHEN name = 'NVIDIA AI' THEN 'https://i.imgur.com/C4BaVqH.png'
    WHEN name = 'Bard' THEN 'https://seeklogo.com/images/G/google-bard-logo-2D24045D0E-seeklogo.com.png'
    WHEN name = 'Canva AI' THEN 'https://seeklogo.com/images/C/canva-logo-B4BE25729A-seeklogo.com.png'
    WHEN name = 'DeepMind' THEN 'https://seeklogo.com/images/D/deepmind-logo-2AA1E770CC-seeklogo.com.png'
    WHEN name = 'Adobe Sensei' THEN 'https://seeklogo.com/images/A/adobe-logo-FF746AE17E-seeklogo.com.png'
    WHEN name = 'Adobe Enhanced Speech' THEN 'https://seeklogo.com/images/A/adobe-logo-FF746AE17E-seeklogo.com.png'
    WHEN name = 'Duolingo' THEN 'https://seeklogo.com/images/D/duolingo-logo-E789C233CC-seeklogo.com.png'
    WHEN name = 'Duolingo Max' THEN 'https://seeklogo.com/images/D/duolingo-logo-E789C233CC-seeklogo.com.png'
    WHEN name = 'Nvidia Canvas' THEN 'https://seeklogo.com/images/N/nvidia-logo-31D9C3C7F8-seeklogo.com.png'
    WHEN name = 'NVIDIA GameWorks AI' THEN 'https://seeklogo.com/images/N/nvidia-logo-31D9C3C7F8-seeklogo.com.png'
    WHEN name = 'Leonardo.Ai' THEN 'https://leonardo.ai/favicon.ico'
    
    -- Garder les images existantes pour les autres outils
    ELSE image_url
END
WHERE name IN (
    'ChatGPT', 'Claude', 'DALL-E', 'Midjourney', 'GitHub Copilot', 
    'Notion AI', 'Grammarly', 'Jasper', 'ElevenLabs', 'Mubert',
    'NVIDIA AI', 'Bard', 'Canva AI', 'DeepMind', 'Adobe Sensei',
    'Adobe Enhanced Speech', 'Duolingo', 'Duolingo Max', 'Nvidia Canvas',
    'NVIDIA GameWorks AI', 'Leonardo.Ai'
);

-- Vérifier les mises à jour
SELECT name, image_url 
FROM ai_tools 
WHERE name IN (
    'ChatGPT', 'Claude', 'DALL-E', 'Midjourney', 'GitHub Copilot', 
    'Notion AI', 'Grammarly', 'Jasper', 'ElevenLabs', 'Mubert',
    'NVIDIA AI', 'Bard', 'Canva AI', 'DeepMind', 'Adobe Sensei',
    'Adobe Enhanced Speech', 'Duolingo', 'Duolingo Max', 'Nvidia Canvas',
    'NVIDIA GameWorks AI', 'Leonardo.Ai'
)
ORDER BY name;

COMMIT;
