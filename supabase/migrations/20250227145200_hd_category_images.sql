-- Mise à jour avec des images HD pour les 10 premières catégories
UPDATE ai_tools 
SET image_url = CASE category_id
    -- 3D & Animation
    WHEN 'db440759-dda1-44d9-9519-6cef2519578d' 
    THEN 'https://images.unsplash.com/photo-1620428268482-cf1851a36764?q=80&w=2000'
    
    -- Acoustique
    WHEN '94bc9f43-9d0e-4b2a-8f7e-07bf0abf3882' 
    THEN 'https://images.unsplash.com/photo-1511379938547-c1f69419868d?q=80&w=2000'
    
    -- Agents & Automatisation
    WHEN '4a4b9c8e-1251-47b1-a482-5aab928d83c2' 
    THEN 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?q=80&w=2000'
    
    -- Agriculture
    WHEN 'de00d22b-e03a-482d-9651-b790b0864e8f' 
    THEN 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000'
    
    -- Agriculture & Environnement
    WHEN 'ad8fab95-7b1d-4de1-943d-753d7c80c870' 
    THEN 'https://images.unsplash.com/photo-1472214103451-9374bd1c798e?q=80&w=2000'
    
    -- Agroalimentaire
    WHEN 'eacf2933-d747-4633-9844-f7ba64d5d9fb' 
    THEN 'https://images.unsplash.com/photo-1576867757603-05b134ebc379?q=80&w=2000'
    
    -- Analyse de données
    WHEN '66df8c12-3367-461e-b5fa-d6d7f011e187' 
    THEN 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000'
    
    -- Archéologie
    WHEN 'b10fac54-ae44-4148-aea5-9bf0ca0e2582' 
    THEN 'https://images.unsplash.com/photo-1599930113854-d6d7fd521f10?q=80&w=2000'
    
    -- Architecture & Construction
    WHEN '52515112-99b5-4616-a1dd-4ca600f68248' 
    THEN 'https://images.unsplash.com/photo-1487958449943-2429e8be8625?q=80&w=2000'
    
    -- Art & Créativité
    WHEN 'f6a08051-1292-48d4-83ee-c93b7d3d33d3' 
    THEN 'https://images.unsplash.com/photo-1460661419201-fd4cecdf8a8b?q=80&w=2000'
    
    ELSE image_url
END
WHERE category_id IN (
    'db440759-dda1-44d9-9519-6cef2519578d',
    '94bc9f43-9d0e-4b2a-8f7e-07bf0abf3882',
    '4a4b9c8e-1251-47b1-a482-5aab928d83c2',
    'de00d22b-e03a-482d-9651-b790b0864e8f',
    'ad8fab95-7b1d-4de1-943d-753d7c80c870',
    'eacf2933-d747-4633-9844-f7ba64d5d9fb',
    '66df8c12-3367-461e-b5fa-d6d7f011e187',
    'b10fac54-ae44-4148-aea5-9bf0ca0e2582',
    '52515112-99b5-4616-a1dd-4ca600f68248',
    'f6a08051-1292-48d4-83ee-c93b7d3d33d3'
);

-- Vérifier les mises à jour
SELECT c.name as category_name, a.image_url
FROM ai_tools a
JOIN categories c ON a.category_id = c.id
WHERE category_id IN (
    'db440759-dda1-44d9-9519-6cef2519578d',
    '94bc9f43-9d0e-4b2a-8f7e-07bf0abf3882',
    '4a4b9c8e-1251-47b1-a482-5aab928d83c2',
    'de00d22b-e03a-482d-9651-b790b0864e8f',
    'ad8fab95-7b1d-4de1-943d-753d7c80c870',
    'eacf2933-d747-4633-9844-f7ba64d5d9fb',
    '66df8c12-3367-461e-b5fa-d6d7f011e187',
    'b10fac54-ae44-4148-aea5-9bf0ca0e2582',
    '52515112-99b5-4616-a1dd-4ca600f68248',
    'f6a08051-1292-48d4-83ee-c93b7d3d33d3'
)
GROUP BY c.name, a.image_url;
