-- Test avec une seule catégorie
UPDATE categories
SET image_url = 'https://images.unsplash.com/photo-1523741543316-beb7fc7023d8?q=80&w=2000'
WHERE name = 'Agriculture';

-- Vérifier la mise à jour
SELECT name, image_url 
FROM categories 
WHERE name = 'Agriculture';
