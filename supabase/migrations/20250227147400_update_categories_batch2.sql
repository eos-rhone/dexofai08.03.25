-- Mise à jour des images par lot (2/5)
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?q=80&w=2000' WHERE name = 'Business & Marketing';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1532634993-15f421e42ec0?q=80&w=2000' WHERE name = 'Chimie & Matériaux';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?q=80&w=2000' WHERE name = 'Collaboration IA';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1503387762-592deb58ef4e?q=80&w=2000' WHERE name = 'Construction';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1511379938547-c1f69419868d?q=80&w=2000' WHERE name = 'Création musicale';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1563206767-5b18f218e8de?q=80&w=2000' WHERE name = 'Cybersécurité';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1561070791-2526d30994b5?q=80&w=2000' WHERE name = 'Design';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=2000' WHERE name = 'Développement d''Agents';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000' WHERE name = 'Données & Préparation';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1472851294608-062f824d29cc?q=80&w=2000' WHERE name = 'E-commerce';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1509062522246-3755977927d7?q=80&w=2000' WHERE name = 'Éducation';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000' WHERE name = 'Énergie';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1497435334941-8c899ee9e694?q=80&w=2000' WHERE name = 'Énergie & Climat';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1418065460487-3e41a6c84dc5?q=80&w=2000' WHERE name = 'Environnement';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1526304640581-d334cdbbf45e?q=80&w=2000' WHERE name = 'Frameworks & Bibliothèques';

-- Vérification
SELECT name, image_url 
FROM categories 
WHERE name IN (
    'Business & Marketing', 'Chimie & Matériaux', 'Collaboration IA',
    'Construction', 'Création musicale', 'Cybersécurité',
    'Design', 'Développement d''Agents', 'Données & Préparation',
    'E-commerce', 'Éducation', 'Énergie',
    'Énergie & Climat', 'Environnement', 'Frameworks & Bibliothèques'
);
