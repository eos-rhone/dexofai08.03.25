/*
  # Mise à jour des icônes de catégories

  1. Changements
    - Mise à jour des icônes pour les catégories existantes
    - Ajout d'icônes spécifiques pour les nouvelles catégories
*/

-- Mettre à jour les icônes des catégories
UPDATE categories
SET icon = CASE slug
  -- Catégories principales
  WHEN 'assistants-chatbots' THEN 'MessageSquare'
  WHEN 'generation-images' THEN 'Image'
  WHEN 'creation-musicale' THEN 'Music'
  WHEN 'analyse-donnees' THEN 'BarChart'
  WHEN 'voix-parole' THEN 'Mic2'
  WHEN 'business-marketing' THEN 'TrendingUp'
  WHEN 'education' THEN 'GraduationCap'
  WHEN 'video-animation' THEN 'Video'
  WHEN 'redaction-contenu' THEN 'FileText'
  -- Nouvelles catégories
  WHEN 'robotique' THEN 'Bot'
  WHEN 'cybersecurite' THEN 'Shield'
  WHEN 'sante' THEN 'Heart'
  WHEN 'finance' THEN 'LineChart'
  WHEN 'iot-domotique' THEN 'Home'
  WHEN 'jeux-video' THEN 'Gamepad'
  WHEN 'recherche-scientifique' THEN 'Flask'
  WHEN 'juridique' THEN 'Scale'
  WHEN 'nlp' THEN 'MessageSquare'
  WHEN 'ar-vr' THEN 'Glasses'
  WHEN 'traduction-localisation' THEN 'Languages'
  WHEN 'automobile-transport' THEN 'Car'
  WHEN 'agriculture-environnement' THEN 'Leaf'
  WHEN 'mode-design' THEN 'Shirt'
  WHEN 'architecture-construction' THEN 'Building2'
  WHEN 'ressources-humaines' THEN 'Users'
  ELSE icon
END
WHERE true;
