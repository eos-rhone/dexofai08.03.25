-- Ajouter une colonne image_url à la table categories
BEGIN;

ALTER TABLE categories
ADD COLUMN IF NOT EXISTS image_url TEXT;

-- Mettre à jour les images par catégorie
UPDATE categories SET image_url = CASE
    WHEN name ILIKE '%IA Générative%' THEN 'https://images.unsplash.com/photo-1677442136019-21780ecad995'
    WHEN name ILIKE '%Audio%' THEN 'https://images.unsplash.com/photo-1511379938547-c1f69419868d'
    WHEN name ILIKE '%Vidéo%' THEN 'https://images.unsplash.com/photo-1536240478700-b869070f9279'
    WHEN name ILIKE '%Image%' THEN 'https://images.unsplash.com/photo-1513542789411-b6a5d4f31634'
    WHEN name ILIKE '%Texte%' THEN 'https://images.unsplash.com/photo-1455390582262-044cdead277a'
    WHEN name ILIKE '%Code%' THEN 'https://images.unsplash.com/photo-1542831371-29b0f74f9713'
    WHEN name ILIKE '%3D%' THEN 'https://images.unsplash.com/photo-1638688699365-f1b2c1a006b7'
    WHEN name ILIKE '%Productivité%' THEN 'https://images.unsplash.com/photo-1483058712412-4245e9b90334'
    WHEN name ILIKE '%Business%' THEN 'https://images.unsplash.com/photo-1460925895917-afdab827c52f'
    WHEN name ILIKE '%Education%' THEN 'https://images.unsplash.com/photo-1509062522246-3755977927d7'
    WHEN name ILIKE '%Santé%' THEN 'https://images.unsplash.com/photo-1576091160550-2173dba999ef'
    WHEN name ILIKE '%Science%' THEN 'https://images.unsplash.com/photo-1532094349884-543bc11b234d'
    WHEN name ILIKE '%Jeux%' THEN 'https://images.unsplash.com/photo-1552820728-8b83bb6b773f'
    WHEN name ILIKE '%Mode%' THEN 'https://images.unsplash.com/photo-1445205170230-053b83016050'
    WHEN name ILIKE '%Design%' THEN 'https://images.unsplash.com/photo-1561070791-2526d30994b5'
    WHEN name ILIKE '%Marketing%' THEN 'https://images.unsplash.com/photo-1460925895917-afdab827c52f'
    WHEN name ILIKE '%Musique%' THEN 'https://images.unsplash.com/photo-1511379938547-c1f69419868d'
    ELSE 'https://images.unsplash.com/photo-1677442136019-21780ecad995'
END;

-- Mettre à jour les outils pour utiliser l'image de leur catégorie si pas d'image spécifique
UPDATE ai_tools t
SET image_url = c.image_url
FROM categories c
WHERE t.category_id = c.id
AND (t.image_url IS NULL OR t.image_url = '');

COMMIT;
