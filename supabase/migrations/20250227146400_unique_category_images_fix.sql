-- Mise à jour des images pour chaque catégorie avec des images uniques
UPDATE categories
SET image_url = CASE name
    -- Assistants & Chatbots
    WHEN 'Assistants & Chatbots' THEN 'https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?q=80&w=2000'
    
    -- Finance
    WHEN 'Finance' THEN 'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?q=80&w=2000'
    
    -- Art & Créativité
    WHEN 'Art & Créativité' THEN 'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?q=80&w=2000'
    
    -- Audio & Musique
    WHEN 'Audio & Musique' THEN 'https://images.unsplash.com/photo-1511379938547-c1f69419868d?q=80&w=2000'
    
    -- Vidéo & Animation
    WHEN 'Vidéo & Animation' THEN 'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000'
    
    -- Développement
    WHEN 'Développement' THEN 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?q=80&w=2000'
    
    -- Science des données
    WHEN 'Science des données' THEN 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000'
    
    -- Intelligence Artificielle Générale
    WHEN 'Intelligence Artificielle Générale' THEN 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=2000'
    
    -- Traduction & Localisation
    WHEN 'Traduction & Localisation' THEN 'https://images.unsplash.com/photo-1456518563096-0ff5ee08204e?q=80&w=2000'
    
    -- Automatisation
    WHEN 'Automatisation' THEN 'https://images.unsplash.com/photo-1518432031352-d6fc5c10da5a?q=80&w=2000'
    
    -- Autres catégories
    ELSE 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=2000'
END;

-- Maintenant, mettre à jour les images des outils avec leurs nouvelles images de catégorie
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
);
