-- Mise à jour finale des images pour chaque catégorie
UPDATE categories
SET image_url = CASE name
    -- Assistants & Chatbots (garder l'image actuelle)
    WHEN 'Assistants & Chatbots' THEN 'https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?q=80&w=2000'
    
    -- Finance (garder l'image actuelle)
    WHEN 'Finance' THEN 'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?q=80&w=2000'
    
    -- Développement (garder l'image actuelle)
    WHEN 'Développement' THEN 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?q=80&w=2000'
    
    -- Aviation (nouvelle image)
    WHEN 'Aviation' THEN 'https://images.unsplash.com/photo-1559686043-e65d4a2b57a3?q=80&w=2000'
    
    -- Médias & Divertissement (nouvelle image)
    WHEN 'Médias & Divertissement' THEN 'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000'
    
    ELSE image_url
END
WHERE name IN (
    'Assistants & Chatbots',
    'Finance',
    'Développement',
    'Aviation',
    'Médias & Divertissement'
);

-- Mettre à jour les images des outils avec leurs nouvelles images de catégorie
UPDATE ai_tools t
SET image_url = c.image_url
FROM categories c
WHERE t.category_id = c.id
AND t.name IN (
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
);

-- Vérifier les mises à jour
SELECT 
    t.name as tool_name,
    c.name as category_name,
    t.image_url
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
