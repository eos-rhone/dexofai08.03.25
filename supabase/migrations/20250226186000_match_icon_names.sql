-- Mettre à jour les icônes pour correspondre aux noms dans iconMap
BEGIN;

UPDATE categories SET icon = CASE name
    -- Icônes déjà définies dans iconMap
    WHEN 'Audio & Voix' THEN 'Headphones'
    WHEN 'Analyse de données' THEN 'LineChart'
    WHEN 'Recherche scientifique' THEN 'Microscope'
    WHEN 'Astronomie & Espace' THEN 'Rocket'
    WHEN 'Chimie & Matériaux' THEN 'FlaskConical'
    WHEN 'IoT & Robotique' THEN 'CircuitBoard'
    WHEN 'Business & Marketing' THEN 'Briefcase'
    WHEN 'Agriculture & Environnement' THEN 'Leaf'
    WHEN 'Géologie' THEN 'Mountain'
    WHEN '3D & Animation' THEN 'Cube'
    WHEN 'Industrie' THEN 'Factory'
    WHEN 'Transport' THEN 'Truck'
    WHEN 'Médias & Divertissement' THEN 'Film'
    WHEN 'Architecture & Construction' THEN 'Building2'
    WHEN 'Océanographie' THEN 'Waves'
    WHEN 'Recherche' THEN 'Search'
    WHEN 'Design' THEN 'Pencil'
    WHEN 'Sport & Fitness' THEN 'Dumbbell'
    WHEN 'Intelligence Artificielle Générale' THEN 'Brain'
    WHEN 'Traitement du Langage Naturel' THEN 'MessageSquare'
    WHEN 'Automobile' THEN 'Car'
    WHEN 'Biotechnologie' THEN 'Flask'
    WHEN 'Audio & Musique' THEN 'Music'
    WHEN 'Cybersécurité' THEN 'Shield'
    WHEN 'Design' THEN 'Layout'
    WHEN 'Développement' THEN 'Code'
    WHEN 'Éducation' THEN 'GraduationCap'
    WHEN 'Génération d''images' THEN 'Image'
    WHEN 'Immobilier' THEN 'Home'
    WHEN 'Gaming' THEN 'Gamepad'
    WHEN 'Métavers & Mondes virtuels' THEN 'Globe'
    WHEN 'Mode & Style' THEN 'Shirt'
    WHEN 'Photographie' THEN 'Camera'
    WHEN 'Énergie' THEN 'Zap'
    WHEN 'Réalité augmentée & virtuelle' THEN 'Glasses'
    WHEN 'Télécommunications' THEN 'Radio'
    WHEN 'Traduction' THEN 'Languages'
    WHEN 'Vidéo' THEN 'Video'
    WHEN 'Voix & Parole' THEN 'Mic2'
    WHEN 'Science des données' THEN 'Database'
    WHEN 'Santé' THEN 'Heart'
    WHEN 'Robotique' THEN 'Bot'
    WHEN 'Ressources humaines' THEN 'Users'
    WHEN 'Art & Créativité' THEN 'Palette'
    ELSE 'Folder' -- Icône par défaut
END;

-- Vérifier les mises à jour
SELECT name, icon
FROM categories
ORDER BY name;

COMMIT;
