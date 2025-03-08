-- Vérifier l'état des images pour tous les outils mentionnés
SELECT 
    t.name as tool_name,
    c.name as category_name,
    t.image_url,
    c.image_url as category_image
FROM ai_tools t
JOIN categories c ON t.category_id = c.id
WHERE t.name IN (
    'DALL-E',
    'Midjourney',
    'Tickeron',
    'Trade Ideas',
    'Adobe Sensei',
    'Artbreeder',
    'Tableau',
    'TradingView',
    'Mubert',
    'AirNav AI',
    'Wolfram Alpha',
    'Alpaca',
    'NVIDIA AI',
    'Market Cipher',
    'Kavout',
    'Soundraw',
    'Sentimentrade',
    'DeepArt',
    'Wonder Dynamics',
    'Bard',
    'GitHub Copilot'
)
ORDER BY c.name, t.name;
