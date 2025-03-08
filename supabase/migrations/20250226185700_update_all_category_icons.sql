-- Mettre à jour toutes les icônes des catégories
BEGIN;

UPDATE categories SET icon = CASE name
    -- Catégories existantes
    WHEN 'Frameworks & Bibliothèques' THEN 'Library'
    WHEN 'Médias & Divertissement' THEN 'Film'
    WHEN 'Agroalimentaire' THEN 'Coffee'
    WHEN 'Audio & Voix' THEN 'Speaker'
    WHEN 'Aviation' THEN 'Plane'
    WHEN 'Construction' THEN 'Tool'
    WHEN 'Design' THEN 'Pen'
    WHEN 'E-commerce' THEN 'ShoppingCart'
    WHEN 'Finance' THEN 'DollarSign'
    WHEN 'Gestion des Tâches' THEN 'ListCheck'
    WHEN 'IoT & Robotique' THEN 'Cpu'
    WHEN 'Juridique' THEN 'FileText'
    WHEN 'Logistique' THEN 'Box'
    WHEN 'Météo' THEN 'Cloud'
    WHEN 'Mode & Style' THEN 'Scissors'
    WHEN 'Recommandation' THEN 'Star'
    WHEN 'Simulation' THEN 'Settings'
    WHEN 'Voix & Parole' THEN 'Speaker'
    
    -- Nouvelles catégories
    WHEN '3D & Animation' THEN 'Cube'
    WHEN 'Acoustique' THEN 'Music'
    WHEN 'Agents & Automatisation' THEN 'Bot'
    WHEN 'Agriculture' THEN 'Leaf'
    WHEN 'Agriculture & Environnement' THEN 'Leaf'
    WHEN 'Analyse de données' THEN 'BarChart'
    WHEN 'Archéologie' THEN 'Shovel'
    WHEN 'Architecture & Construction' THEN 'Building2'
    WHEN 'Art & Créativité' THEN 'Palette'
    WHEN 'Assistants & Chatbots' THEN 'MessageCircle'
    WHEN 'Astronomie & Espace' THEN 'Rocket'
    WHEN 'Audio & Musique' THEN 'Music'
    WHEN 'Automatisation' THEN 'Cog'
    WHEN 'Automobile' THEN 'Car'
    WHEN 'Automobile & Transport' THEN 'Car'
    WHEN 'Biotechnologie' THEN 'Flask'
    WHEN 'Blockchain & Web3' THEN 'Link'
    WHEN 'Business & Marketing' THEN 'Briefcase'
    WHEN 'Chimie & Matériaux' THEN 'Flask'
    WHEN 'Collaboration IA' THEN 'Users'
    WHEN 'Création musicale' THEN 'Music'
    WHEN 'Cybersécurité' THEN 'Shield'
    WHEN 'Développement' THEN 'Code'
    WHEN 'Développement d''Agents' THEN 'Bot'
    WHEN 'Données & Préparation' THEN 'Database'
    WHEN 'Éducation' THEN 'GraduationCap'
    WHEN 'Énergie' THEN 'Zap'
    WHEN 'Énergie & Climat' THEN 'Sun'
    WHEN 'Environnement' THEN 'Leaf'
    WHEN 'Gaming' THEN 'Gamepad2'
    WHEN 'Génération de Code' THEN 'Code2'
    WHEN 'Génération d''images' THEN 'Image'
    WHEN 'Géologie' THEN 'Mountain'
    WHEN 'Immobilier' THEN 'Home'
    WHEN 'Impression 3D' THEN 'Printer'
    WHEN 'Industrie' THEN 'Factory'
    WHEN 'Industrie 4.0' THEN 'Factory'
    WHEN 'Intelligence Artificielle Générale' THEN 'Brain'
    WHEN 'IoT & Domotique' THEN 'Cpu'
    WHEN 'Jeux vidéo' THEN 'Gamepad'
    WHEN 'Métavers & Mondes virtuels' THEN 'Globe'
    WHEN 'MLOps & Déploiement' THEN 'Server'
    WHEN 'Mode & Design' THEN 'Scissors'
    WHEN 'Musées & Patrimoine' THEN 'Landmark'
    WHEN 'Nanotechnologie' THEN 'Microscope'
    WHEN 'Océanographie' THEN 'Waves'
    WHEN 'Optimisation & Performance' THEN 'LineChart'
    WHEN 'Outils de Données' THEN 'Tool'
    WHEN 'Photographie' THEN 'Camera'
    WHEN 'Productivité' THEN 'Clock'
    WHEN 'Psychologie' THEN 'Brain'
    WHEN 'Réalité augmentée & virtuelle' THEN 'Glasses'
    WHEN 'Réalité Mixte' THEN 'Glasses'
    WHEN 'Recherche' THEN 'Search'
    WHEN 'Recherche scientifique' THEN 'FlaskConical'
    WHEN 'Rédaction & Contenu' THEN 'PenTool'
    WHEN 'Ressources humaines' THEN 'Users'
    WHEN 'RH & Recrutement' THEN 'Users'
    WHEN 'Robotique' THEN 'Bot'
    WHEN 'Santé' THEN 'Heart'
    WHEN 'Science des données' THEN 'Database'
    WHEN 'Science & Recherche' THEN 'FlaskConical'
    WHEN 'Sport & Fitness' THEN 'Dumbbell'
    WHEN 'Télécommunications' THEN 'Phone'
    WHEN 'Traduction' THEN 'Languages'
    WHEN 'Traduction & Localisation' THEN 'Languages'
    WHEN 'Traitement du Langage Naturel' THEN 'MessageSquare'
    WHEN 'Transport' THEN 'Truck'
    WHEN 'Vidéo' THEN 'Video'
    WHEN 'Vidéo & Animation' THEN 'Video'
    WHEN 'Vision par Ordinateur' THEN 'Eye'
    WHEN 'Visualisation & Analyse' THEN 'PieChart'
    ELSE 'Circle' -- Icône par défaut
END;

-- Vérifier les mises à jour
SELECT name, icon
FROM categories
WHERE icon = 'Circle'
ORDER BY name;

COMMIT;
