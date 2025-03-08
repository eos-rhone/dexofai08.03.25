-- Exemple 1: Ajouter une image à un outil qui n'en a pas
-- Remplacez 'nom-de-loutil' par le slug de votre outil
UPDATE public.ai_tools
SET image_url = 'https://votre-bucket.supabase.co/storage/ai-tools/nom-de-loutil.jpg'
WHERE slug = 'nom-de-loutil'
AND image_url IS NULL;

-- Exemple 2: Remplacer l'image existante d'un outil
-- Remplacez 'nom-de-loutil' par le slug de votre outil
UPDATE public.ai_tools
SET 
    image_url = 'https://votre-bucket.supabase.co/storage/ai-tools/nouvelle-image.jpg',
    updated_at = CURRENT_TIMESTAMP
WHERE slug = 'nom-de-loutil';

-- Exemple 3: Supprimer l'image d'un outil (utiliser l'image par défaut)
-- Remplacez 'nom-de-loutil' par le slug de votre outil
UPDATE public.ai_tools
SET 
    image_url = '/images/placeholder.png',
    updated_at = CURRENT_TIMESTAMP
WHERE slug = 'nom-de-loutil';

-- Exemple 4: Mettre à jour plusieurs outils en même temps
UPDATE public.ai_tools
SET image_url = CASE
    WHEN slug = 'outil-1' THEN 'https://votre-bucket.supabase.co/storage/ai-tools/image1.jpg'
    WHEN slug = 'outil-2' THEN 'https://votre-bucket.supabase.co/storage/ai-tools/image2.jpg'
    WHEN slug = 'outil-3' THEN 'https://votre-bucket.supabase.co/storage/ai-tools/image3.jpg'
END,
updated_at = CURRENT_TIMESTAMP
WHERE slug IN ('outil-1', 'outil-2', 'outil-3');

-- Exemple 5: Vérifier les outils sans image
SELECT name, slug, image_url
FROM public.ai_tools
WHERE image_url IS NULL OR image_url = '/images/placeholder.png'
ORDER BY name;

-- Exemple 6: Vérifier les images utilisées par les outils
SELECT DISTINCT image_url, COUNT(*) as nombre_utilisations
FROM public.ai_tools
WHERE image_url IS NOT NULL
GROUP BY image_url
ORDER BY nombre_utilisations DESC;

-- ATTENTION : Pour utiliser ces requêtes
-- 1. Remplacez 'nom-de-loutil' par le vrai slug de l'outil que vous voulez modifier
-- 2. Remplacez 'votre-bucket.supabase.co' par l'URL de votre bucket Supabase
-- 3. Assurez-vous que les images existent dans votre bucket avant de mettre à jour les URLs
-- 4. Faites toujours une sauvegarde avant de modifier plusieurs outils en même temps
