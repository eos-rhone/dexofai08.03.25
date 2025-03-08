-- Correction des images dupliquées
UPDATE categories SET image_url = CASE name
    -- Groupe Données & Analyse
    WHEN 'Données & Préparation' THEN 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000'
    WHEN 'Optimisation & Performance' THEN 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?q=80&w=2000'
    WHEN 'Visualisation & Analyse' THEN 'https://images.unsplash.com/photo-1542744094-3a31f272c490?q=80&w=2000'
    WHEN 'Analyse de données' THEN 'https://images.unsplash.com/photo-1504868584819-f8e8b4b6d7e3?q=80&w=2000'

    -- Groupe Audio
    WHEN 'Création musicale' THEN 'https://images.unsplash.com/photo-1511379938547-c1f69419868d?q=80&w=2000'
    WHEN 'Audio & Musique' THEN 'https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae?q=80&w=2000'
    WHEN 'Acoustique' THEN 'https://images.unsplash.com/photo-1520523839897-bd0b52f945a0?q=80&w=2000'

    -- Groupe Vidéo
    WHEN 'Vidéo & Animation' THEN 'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000'
    WHEN 'Vidéo' THEN 'https://images.unsplash.com/photo-1492619375914-88005aa9e8fb?q=80&w=2000'
    WHEN 'Médias & Divertissement' THEN 'https://images.unsplash.com/photo-1578022761797-b8636ac614f3?q=80&w=2000'

    -- Groupe Voix
    WHEN 'Voix & Parole' THEN 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618?q=80&w=2000'
    WHEN 'Audio & Voix' THEN 'https://images.unsplash.com/photo-1590602847861-f357a9332bbc?q=80&w=2000'

    -- Groupe Construction
    WHEN 'Architecture & Construction' THEN 'https://images.unsplash.com/photo-1503387762-592deb58ef4e?q=80&w=2000'
    WHEN 'Construction' THEN 'https://images.unsplash.com/photo-1541888946425-d81bb19240f5?q=80&w=2000'

    -- Groupe Productivité
    WHEN 'Gestion des Tâches' THEN 'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?q=80&w=2000'
    WHEN 'Productivité' THEN 'https://images.unsplash.com/photo-1499750310107-5fef28a66643?q=80&w=2000'

    -- Groupe Traduction
    WHEN 'Traduction & Localisation' THEN 'https://images.unsplash.com/photo-1456518563096-0ff5ee08204e?q=80&w=2000'
    WHEN 'Traduction' THEN 'https://images.unsplash.com/photo-1506869640319-fe1a24fd76dc?q=80&w=2000'

    -- Groupe Sciences
    WHEN 'Nanotechnologie' THEN 'https://images.unsplash.com/photo-1507413245164-6160d8298b31?q=80&w=2000'
    WHEN 'Psychologie' THEN 'https://images.unsplash.com/photo-1576091160550-2173dba999ef?q=80&w=2000'

    -- Groupe Automatisation
    WHEN 'Agents & Automatisation' THEN 'https://images.unsplash.com/photo-1518432031352-d6fc5c10da5a?q=80&w=2000'
    WHEN 'Automatisation' THEN 'https://images.unsplash.com/photo-1531746790731-6bf607ccff6f?q=80&w=2000'

    -- Groupe Robotique
    WHEN 'IoT & Robotique' THEN 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?q=80&w=2000'
    WHEN 'Robotique' THEN 'https://images.unsplash.com/photo-1561557944-6e7860d1a7eb?q=80&w=2000'
END
WHERE name IN (
    'Données & Préparation', 'Optimisation & Performance', 'Visualisation & Analyse', 'Analyse de données',
    'Création musicale', 'Audio & Musique', 'Acoustique',
    'Vidéo & Animation', 'Vidéo', 'Médias & Divertissement',
    'Voix & Parole', 'Audio & Voix',
    'Architecture & Construction', 'Construction',
    'Gestion des Tâches', 'Productivité',
    'Traduction & Localisation', 'Traduction',
    'Nanotechnologie', 'Psychologie',
    'Agents & Automatisation', 'Automatisation',
    'IoT & Robotique', 'Robotique'
);

-- Vérification des duplicatas après correction
SELECT image_url, COUNT(*) as usage_count, STRING_AGG(name, ', ') as categories
FROM categories
GROUP BY image_url
HAVING COUNT(*) > 1
ORDER BY usage_count DESC;
