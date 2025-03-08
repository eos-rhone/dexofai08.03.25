-- Vérification finale
-- 1. Chercher les images par défaut
SELECT name, image_url
FROM categories 
WHERE image_url = 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=2000';

-- 2. Vérifier que toutes les catégories ont une image
SELECT name, image_url
FROM categories 
WHERE image_url IS NULL OR image_url = '';

-- 3. Compter le nombre total de catégories
SELECT COUNT(*) as total_categories
FROM categories;
