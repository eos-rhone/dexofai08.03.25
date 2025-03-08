-- Mise à jour des icônes pour les catégories spécifiques
UPDATE categories
SET icon = 'plane'
WHERE name ILIKE '%aviation%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'music'
WHERE name ILIKE '%acoustique%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'cube'
WHERE name ILIKE '%3d%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'headphones'
WHERE name ILIKE '%audio%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'video'
WHERE name ILIKE '%vidéo%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'image'
WHERE name ILIKE '%image%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'filetext'
WHERE name ILIKE '%texte%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'code'
WHERE name ILIKE '%code%' OR name ILIKE '%programmation%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'database'
WHERE name ILIKE '%données%' OR name ILIKE '%data%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'music'
WHERE name ILIKE '%musique%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'zap'
WHERE name ILIKE '%productivité%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'trendingup'
WHERE name ILIKE '%marketing%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'briefcase'
WHERE name ILIKE '%business%' OR name ILIKE '%entreprise%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'graduationcap'
WHERE name ILIKE '%éducation%' OR name ILIKE '%formation%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'heart'
WHERE name ILIKE '%santé%' OR name ILIKE '%médical%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'dollarsign'
WHERE name ILIKE '%finance%' OR name ILIKE '%argent%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'gamepad'
WHERE name ILIKE '%jeux%' OR name ILIKE '%gaming%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'users'
WHERE name ILIKE '%social%' OR name ILIKE '%communauté%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'search'
WHERE name ILIKE '%recherche%' AND (icon IS NULL OR icon = '');

UPDATE categories
SET icon = 'folder'
WHERE icon IS NULL OR icon = '';

-- Afficher toutes les catégories avec leurs icônes actuelles
SELECT name, icon
FROM categories
ORDER BY name;

-- Liste des icônes disponibles dans le système
SELECT DISTINCT icon
FROM categories
WHERE icon IS NOT NULL AND icon != ''
ORDER BY icon;

CELA FONCTIONNNE 
ajoute une icone de palette a la catégorie art 
UPDATE categories
SET icon = 'palette'
WHERE name ILIKE '%art%créativité%'
   OR name ILIKE '%art & créativité%'
   OR name = 'Art & Créativité';