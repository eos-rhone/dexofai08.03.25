-- Mise à jour des icônes pour les catégories spécifiques
-- IMPORTANT : Ces noms d'icônes doivent être en minuscules car le composant Categories.tsx les convertit en minuscules

UPDATE categories
SET icon = 'acoustic'  -- Utilise l'icône Acoustic personnalisée
WHERE name ILIKE '%acoustique%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'plane'  -- Utilise l'icône Plane de Lucide
WHERE name ILIKE '%aviation%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'box'  -- Utilise l'icône Box de Lucide
WHERE name ILIKE '%3d%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'music'  -- Utilise l'icône Music de Lucide
WHERE name ILIKE '%audio%' OR name ILIKE '%musique%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'video'  -- Utilise l'icône Video de Lucide
WHERE name ILIKE '%vidéo%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'image'  -- Utilise l'icône Image de Lucide
WHERE name ILIKE '%image%' OR name ILIKE '%photo%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'filetext'  -- Utilise l'icône FileText de Lucide
WHERE name ILIKE '%texte%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'code'  -- Utilise l'icône Code de Lucide
WHERE (name ILIKE '%code%' OR name ILIKE '%programmation%') AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'database'  -- Utilise l'icône Database de Lucide
WHERE (name ILIKE '%données%' OR name ILIKE '%data%') AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'briefcase'  -- Utilise l'icône Briefcase de Lucide
WHERE (name ILIKE '%business%' OR name ILIKE '%entreprise%') AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'graduationcap'  -- Utilise l'icône GraduationCap de Lucide
WHERE (name ILIKE '%éducation%' OR name ILIKE '%formation%') AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'heart'  -- Utilise l'icône Heart de Lucide
WHERE (name ILIKE '%santé%' OR name ILIKE '%médical%') AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'dollarsign'  -- Utilise l'icône DollarSign de Lucide
WHERE (name ILIKE '%finance%' OR name ILIKE '%argent%') AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'gamepad'  -- Utilise l'icône Gamepad de Lucide
WHERE (name ILIKE '%jeux%' OR name ILIKE '%gaming%') AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'users'  -- Utilise l'icône Users de Lucide
WHERE (name ILIKE '%social%' OR name ILIKE '%communauté%') AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'search'  -- Utilise l'icône Search de Lucide
WHERE name ILIKE '%recherche%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'aibrain'  -- Utilise l'icône AiBrain personnalisée par défaut
WHERE icon IS NULL OR icon = '';

-- Afficher toutes les catégories avec leurs icônes actuelles
SELECT name, icon
FROM categories
ORDER BY name;

-- Liste des icônes disponibles (toutes en minuscules)
/*
Icônes disponibles dans le composant Categories.tsx :

1. Icônes personnalisées :
- aibrain (icône personnalisée)
- acoustic (icône personnalisée)

2. Icônes Lucide (toutes en minuscules) :
- headphones
- linechart
- microscope
- rocket
- flaskconical
- circuitboard
- briefcase
- leaf
- mountain
- cube (box)
- factory
- truck
- film
- building
- building2
- waves
- search
- pencil
- dumbbell
- folder
- brain
- messagesquare
- car
- music
- shield
- layout
- code
- graduationcap
- image
- home
- gamepad
- scale
- globe
- shirt
- camera
- zap
- glasses
- radio
- languages
- video
- mic2
- database
- heart
- bot
- users
- palette
- coffee
- shoppingcart
- dollarsign
- cpu
- filetext
- box
- cloud
- scissors
- settings
- speaker
- clock
- pentool
- phone
- eye
- piechart
- messagecircle
- link
- cog
- printer
- server
- landmark
- plane
- star
- checksquare
- listtodo
*/

-- Afficher les catégories qui n'ont toujours pas d'icône
SELECT name, icon
FROM categories
WHERE icon IS NULL OR icon = ''
ORDER BY name;
