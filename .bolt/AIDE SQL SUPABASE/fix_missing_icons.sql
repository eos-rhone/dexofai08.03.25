-- Vérifier les catégories sans icône
SELECT id, name, slug, icon
FROM categories
WHERE icon IS NULL OR icon = '';

-- Mettre à jour les icônes manquantes avec des valeurs par défaut
UPDATE categories
SET icon = CASE 
  WHEN name ILIKE '%acoustique%' THEN '/icons/categories/acoustic.svg'
  WHEN name ILIKE '%audio%' THEN '/icons/categories/audio.svg'
  WHEN name ILIKE '%vidéo%' THEN '/icons/categories/video.svg'
  WHEN name ILIKE '%image%' THEN '/icons/categories/image.svg'
  WHEN name ILIKE '%texte%' THEN '/icons/categories/text.svg'
  WHEN name ILIKE '%code%' THEN '/icons/categories/code.svg'
  WHEN name ILIKE '%données%' THEN '/icons/categories/data.svg'
  WHEN name ILIKE '%3d%' THEN '/icons/categories/3d.svg'
  WHEN name ILIKE '%musique%' THEN '/icons/categories/music.svg'
  WHEN name ILIKE '%productivité%' THEN '/icons/categories/productivity.svg'
  WHEN name ILIKE '%marketing%' THEN '/icons/categories/marketing.svg'
  WHEN name ILIKE '%business%' THEN '/icons/categories/business.svg'
  WHEN name ILIKE '%éducation%' THEN '/icons/categories/education.svg'
  WHEN name ILIKE '%santé%' THEN '/icons/categories/health.svg'
  WHEN name ILIKE '%finance%' THEN '/icons/categories/finance.svg'
  WHEN name ILIKE '%jeux%' THEN '/icons/categories/games.svg'
  WHEN name ILIKE '%social%' THEN '/icons/categories/social.svg'
  WHEN name ILIKE '%recherche%' THEN '/icons/categories/search.svg'
  ELSE '/icons/categories/default.svg'
END
WHERE icon IS NULL OR icon = '';

-- Vérifier les mises à jour
SELECT id, name, slug, icon
FROM categories
ORDER BY name;
