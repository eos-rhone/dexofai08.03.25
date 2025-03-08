-- Copier les images des catégories pour les outils qui n'ont pas d'image
UPDATE ai_tools t
SET image_url = (
    SELECT c.image_url 
    FROM categories c 
    WHERE c.id = t.category_id
)
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
AND t.image_url IS NULL;

-- Vérifier les mises à jour
SELECT t.name, t.image_url, c.name as category_name, c.image_url as category_image_url
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
    'Wonder Dynamics'
);
