-- Vérifier qu'il n'y a plus d'images par défaut
SELECT name, image_url
FROM categories 
WHERE image_url = 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=2000';

-- Vérifier les images qui sont utilisées par plusieurs catégories
SELECT image_url, COUNT(*) as usage_count, STRING_AGG(name, ', ') as categories
FROM categories
GROUP BY image_url
HAVING COUNT(*) > 1
ORDER BY usage_count DESC;
