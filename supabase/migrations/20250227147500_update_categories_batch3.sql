-- Mise à jour des images par lot (3/5)
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1538481199705-c710c4e965fc?q=80&w=2000' WHERE name = 'Gaming';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?q=80&w=2000' WHERE name = 'Génération de Code';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?q=80&w=2000' WHERE name = 'Génération d''images';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1619468129361-605ebea04b44?q=80&w=2000' WHERE name = 'Géologie';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?q=80&w=2000' WHERE name = 'Gestion des Tâches';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1560518883-ce09059eeffa?q=80&w=2000' WHERE name = 'Immobilier';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1581094794329-c8112c4e5190?q=80&w=2000' WHERE name = 'Impression 3D';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1516937941344-00b4e0337589?q=80&w=2000' WHERE name = 'Industrie';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1563770660941-20978e870e26?q=80&w=2000' WHERE name = 'Industrie 4.0';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=2000' WHERE name = 'Intelligence Artificielle Générale';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?q=80&w=2000' WHERE name = 'IoT & Domotique';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?q=80&w=2000' WHERE name = 'IoT & Robotique';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1542751371-adc38448a05e?q=80&w=2000' WHERE name = 'Jeux vidéo';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1589829545856-d10d557cf95f?q=80&w=2000' WHERE name = 'Juridique';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?q=80&w=2000' WHERE name = 'Logistique';

-- Vérification
SELECT name, image_url 
FROM categories 
WHERE name IN (
    'Gaming', 'Génération de Code', 'Génération d''images',
    'Géologie', 'Gestion des Tâches', 'Immobilier',
    'Impression 3D', 'Industrie', 'Industrie 4.0',
    'Intelligence Artificielle Générale', 'IoT & Domotique', 'IoT & Robotique',
    'Jeux vidéo', 'Juridique', 'Logistique'
);
