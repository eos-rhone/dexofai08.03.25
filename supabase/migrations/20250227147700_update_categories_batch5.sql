-- Mise à jour des images par lot (5/5 - Final)
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1507668077129-56e32842fceb?q=80&w=2000' WHERE name = 'Recherche';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1582719471384-894fbb16e074?q=80&w=2000' WHERE name = 'Recherche scientifique';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1571867424488-4565932edb41?q=80&w=2000' WHERE name = 'Recommandation';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1455390582262-044cdead277a?q=80&w=2000' WHERE name = 'Rédaction & Contenu';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1521791136064-7986c2920216?q=80&w=2000' WHERE name = 'Ressources humaines';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?q=80&w=2000' WHERE name = 'RH & Recrutement';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?q=80&w=2000' WHERE name = 'Robotique';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1631217868264-e5b90bb7e133?q=80&w=2000' WHERE name = 'Santé';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1509228468518-180dd4864904?q=80&w=2000' WHERE name = 'Science des données';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1532094349884-543bc11b234d?q=80&w=2000' WHERE name = 'Science & Recherche';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1516110833967-0b5716ca1387?q=80&w=2000' WHERE name = 'Simulation';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1517963879433-6ad2b056d712?q=80&w=2000' WHERE name = 'Sport & Fitness';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1516387938699-a93567ec168e?q=80&w=2000' WHERE name = 'Télécommunications';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1456518563096-0ff5ee08204e?q=80&w=2000' WHERE name = 'Traduction';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1456518563096-0ff5ee08204e?q=80&w=2000' WHERE name = 'Traduction & Localisation';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1546410531-bb4caa6b424d?q=80&w=2000' WHERE name = 'Traitement du Langage Naturel';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1494412574643-ff11b0a5c1c3?q=80&w=2000' WHERE name = 'Transport';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000' WHERE name = 'Vidéo';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000' WHERE name = 'Vidéo & Animation';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1617791160505-6f00504e3519?q=80&w=2000' WHERE name = 'Vision par Ordinateur';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000' WHERE name = 'Visualisation & Analyse';
UPDATE categories SET image_url = 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618?q=80&w=2000' WHERE name = 'Voix & Parole';

-- Vérification finale
SELECT name, image_url 
FROM categories 
WHERE name IN (
    'Recherche', 'Recherche scientifique', 'Recommandation',
    'Rédaction & Contenu', 'Ressources humaines', 'RH & Recrutement',
    'Robotique', 'Santé', 'Science des données',
    'Science & Recherche', 'Simulation', 'Sport & Fitness',
    'Télécommunications', 'Traduction', 'Traduction & Localisation',
    'Traitement du Langage Naturel', 'Transport', 'Vidéo',
    'Vidéo & Animation', 'Vision par Ordinateur', 'Visualisation & Analyse',
    'Voix & Parole'
);
