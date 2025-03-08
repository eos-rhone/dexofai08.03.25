-- Mise à jour des images pour toutes les catégories (Partie 1)
UPDATE categories
SET image_url = CASE name
    -- Garder les images déjà uniques
    WHEN 'Assistants & Chatbots' THEN 'https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?q=80&w=2000'
    WHEN 'Finance' THEN 'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?q=80&w=2000'
    WHEN 'Aviation' THEN 'https://images.unsplash.com/photo-1559686043-e65d4a2b57a3?q=80&w=2000'
    WHEN 'Développement' THEN 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?q=80&w=2000'
    WHEN 'Médias & Divertissement' THEN 'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000'
    
    -- Nouvelles images uniques
    WHEN '3D & Animation' THEN 'https://images.unsplash.com/photo-1638688699365-f1b2c1a006b7?q=80&w=2000'
    WHEN 'Acoustique' THEN 'https://images.unsplash.com/photo-1511379938547-c1f69419868d?q=80&w=2000'
    WHEN 'Agents & Automatisation' THEN 'https://images.unsplash.com/photo-1518432031352-d6fc5c10da5a?q=80&w=2000'
    WHEN 'Agriculture' THEN 'https://images.unsplash.com/photo-1523741543316-beb7fc7023d8?q=80&w=2000'
    WHEN 'Agriculture & Environnement' THEN 'https://images.unsplash.com/photo-1472145246862-b24cf25c4a36?q=80&w=2000'
    WHEN 'Agroalimentaire' THEN 'https://images.unsplash.com/photo-1542838132-92c53300491e?q=80&w=2000'
    WHEN 'Analyse de données' THEN 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000'
    WHEN 'Archéologie' THEN 'https://images.unsplash.com/photo-1599930113854-d6d7fd521f10?q=80&w=2000'
    WHEN 'Architecture & Construction' THEN 'https://images.unsplash.com/photo-1503387762-592deb58ef4e?q=80&w=2000'
    WHEN 'Art & Créativité' THEN 'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?q=80&w=2000'
    WHEN 'Astronomie & Espace' THEN 'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?q=80&w=2000'
    WHEN 'Audio & Musique' THEN 'https://images.unsplash.com/photo-1511379938547-c1f69419868d?q=80&w=2000'
    WHEN 'Audio & Voix' THEN 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618?q=80&w=2000'
    WHEN 'Automatisation' THEN 'https://images.unsplash.com/photo-1518432031352-d6fc5c10da5a?q=80&w=2000'
    WHEN 'Automobile' THEN 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000'
    WHEN 'Automobile & Transport' THEN 'https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?q=80&w=2000'
    WHEN 'Biotechnologie' THEN 'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?q=80&w=2000'
    WHEN 'Blockchain & Web3' THEN 'https://images.unsplash.com/photo-1644143379190-08d1149c2b2e?q=80&w=2000'
    WHEN 'Business & Marketing' THEN 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?q=80&w=2000'
    WHEN 'Chimie & Matériaux' THEN 'https://images.unsplash.com/photo-1532634993-15f421e42ec0?q=80&w=2000'
    ELSE image_url
END
WHERE name IN (
    'Assistants & Chatbots', 'Finance', 'Aviation', 'Développement', 'Médias & Divertissement',
    '3D & Animation', 'Acoustique', 'Agents & Automatisation', 'Agriculture', 'Agriculture & Environnement',
    'Agroalimentaire', 'Analyse de données', 'Archéologie', 'Architecture & Construction',
    'Art & Créativité', 'Astronomie & Espace', 'Audio & Musique', 'Audio & Voix', 'Automatisation',
    'Automobile', 'Automobile & Transport', 'Biotechnologie', 'Blockchain & Web3',
    'Business & Marketing', 'Chimie & Matériaux'
);
