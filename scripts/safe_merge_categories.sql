BEGIN;

-- Vérifier le nombre total d'outils avant
SELECT COUNT(*) as total_tools_before FROM public.ai_tools;

-- 1. Fusionner Audio & Voix
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Audio & Voix')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name IN ('Audio & Musique', 'Voix & Parole', 'Création musicale')
);

-- 2. Fusionner Vidéo & Animation
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Vidéo & Animation')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name = 'Vidéo'
);

-- 3. Fusionner Science & Recherche
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Science & Recherche')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name IN ('Recherche', 'Recherche scientifique')
);

-- 4. Fusionner Automobile & Transport
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Automobile & Transport')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name IN ('Automobile', 'Transport', 'Aviation', 'Logistique')
);

-- 5. Fusionner Agriculture & Environnement
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Agriculture & Environnement')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name IN ('Agriculture', 'Environnement', 'Agroalimentaire', 'Météo')
);

-- 6. Fusionner les catégories de données
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Outils de Données')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name IN ('Données & Préparation', 'Science des données', 'Analyse de données')
);

-- 7. Fusionner Gaming et Jeux vidéo
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Jeux vidéo')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name = 'Gaming'
);

-- 8. Fusionner les catégories de Mode
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Mode & Design')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name = 'Mode & Style'
);

-- 9. Fusionner RH & Recrutement
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'RH & Recrutement')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name = 'Ressources humaines'
);

-- Vérifier le nombre total d'outils après
SELECT COUNT(*) as total_tools_after FROM public.ai_tools;

COMMIT;
