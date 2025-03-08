-- Vérifier la structure des tables
SELECT c.id, c.name, c.image_url, t.name as tool_name, t.image_url as tool_image_url
FROM categories c
LEFT JOIN ai_tools t ON t.category_id = c.id
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
    'Wonder Dynamics'
)
LIMIT 5;
