-- Mise à jour des images par lot (4/5)
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1622542796254-5b9c46a259b8?q=80&w=2000' WHERE name = 'Métavers & Mondes virtuels';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1526978292543-958c04e6f8d4?q=80&w=2000' WHERE name = 'Météo';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1607743386760-88ac62b89b8a?q=80&w=2000' WHERE name = 'MLOps & Déploiement';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1445205170230-053b83016050?q=80&w=2000' WHERE name = 'Mode & Design';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?q=80&w=2000' WHERE name = 'Mode & Style';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1518998053901-5348d3961a04?q=80&w=2000' WHERE name = 'Musées & Patrimoine';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1507413245164-6160d8298b31?q=80&w=2000' WHERE name = 'Nanotechnologie';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1498637841888-108c6b723fcb?q=80&w=2000' WHERE name = 'Océanographie';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000' WHERE name = 'Optimisation & Performance';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1504868584819-f8e8b4b6d7e3?q=80&w=2000' WHERE name = 'Outils de Données';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1452587925148-ce544e77e70d?q=80&w=2000' WHERE name = 'Photographie';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?q=80&w=2000' WHERE name = 'Productivité';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1507413245164-6160d8298b31?q=80&w=2000' WHERE name = 'Psychologie';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1617802690992-15d93263d3a9?q=80&w=2000' WHERE name = 'Réalité augmentée & virtuelle';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1626387346567-68d0c05f7ab9?q=80&w=2000' WHERE name = 'Réalité Mixte';

-- Vérification
SELECT name, image_url 
FROM categories 
WHERE name IN (
    'Métavers & Mondes virtuels', 'Météo', 'MLOps & Déploiement',
    'Mode & Design', 'Mode & Style', 'Musées & Patrimoine',
    'Nanotechnologie', 'Océanographie', 'Optimisation & Performance',
    'Outils de Données', 'Photographie', 'Productivité',
    'Psychologie', 'Réalité augmentée & virtuelle', 'Réalité Mixte'
);
