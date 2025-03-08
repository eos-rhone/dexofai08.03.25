-- Mise à jour des images par lot (1/5)
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1638688699365-f1b2c1a006b7?q=80&w=2000' WHERE name = '3D & Animation';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1511379938547-c1f69419868d?q=80&w=2000' WHERE name = 'Acoustique';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1518432031352-d6fc5c10da5a?q=80&w=2000' WHERE name = 'Agents & Automatisation';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1472145246862-b24cf25c4a36?q=80&w=2000' WHERE name = 'Agriculture & Environnement';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1542838132-92c53300491e?q=80&w=2000' WHERE name = 'Agroalimentaire';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000' WHERE name = 'Analyse de données';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1599930113854-d6d7fd521f10?q=80&w=2000' WHERE name = 'Archéologie';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1503387762-592deb58ef4e?q=80&w=2000' WHERE name = 'Architecture & Construction';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?q=80&w=2000' WHERE name = 'Art & Créativité';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?q=80&w=2000' WHERE name = 'Astronomie & Espace';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618?q=80&w=2000' WHERE name = 'Audio & Voix';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000' WHERE name = 'Automobile';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?q=80&w=2000' WHERE name = 'Automobile & Transport';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?q=80&w=2000' WHERE name = 'Biotechnologie';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1644143379190-08d1149c2b2e?q=80&w=2000' WHERE name = 'Blockchain & Web3';

-- Vérification
SELECT name, image_url 
FROM categories 
WHERE name IN (
    '3D & Animation', 'Acoustique', 'Agents & Automatisation', 
    'Agriculture & Environnement', 'Agroalimentaire', 'Analyse de données',
    'Archéologie', 'Architecture & Construction', 'Art & Créativité',
    'Astronomie & Espace', 'Audio & Voix', 'Automobile',
    'Automobile & Transport', 'Biotechnologie', 'Blockchain & Web3'
);
