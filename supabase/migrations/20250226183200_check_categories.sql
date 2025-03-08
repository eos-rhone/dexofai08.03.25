-- Vérifier les slugs des catégories
SELECT name, slug
FROM categories
WHERE name IN (
    'Frameworks & Bibliothèques',
    'Impression 3D',
    'Jeux vidéo',
    'Médias & Divertissement'
) OR slug IN (
    'frameworks-bibliotheques',
    'impression-3d',
    'jeux-video',
    'medias-divertissement'
);
