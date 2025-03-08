-- Exemple de suppression d'une catégorie
-- Remplacez les valeurs entre < > par vos propres valeurs

-- 1. IMPORTANT : D'abord vérifier si des outils utilisent cette catégorie
SELECT COUNT(*) as nombre_outils 
FROM public.ai_tools 
WHERE category_id = (
    SELECT id FROM public.categories 
    WHERE name = '<nom_categorie>'    -- ex: 'Intelligence Artificielle'
);

-- 2. Option 1 : Déplacer les outils vers une autre catégorie avant de supprimer
UPDATE public.ai_tools 
SET category_id = (
    SELECT id FROM public.categories 
    WHERE name = '<nouvelle_categorie>'    -- ex: 'Autre'
)
WHERE category_id = (
    SELECT id FROM public.categories 
    WHERE name = '<nom_categorie>'         -- ex: 'Intelligence Artificielle'
);

-- 3. Supprimer la catégorie
DELETE FROM public.categories 
WHERE name = '<nom_categorie>';            -- ex: 'Intelligence Artificielle'

-- Exemple concret :
/*
-- 1. Vérifier le nombre d'outils
SELECT COUNT(*) as nombre_outils 
FROM public.ai_tools 
WHERE category_id = (
    SELECT id FROM public.categories 
    WHERE name = 'Intelligence Artificielle'
);

-- 2. Déplacer les outils vers 'Autre'
UPDATE public.ai_tools 
SET category_id = (
    SELECT id FROM public.categories 
    WHERE name = 'Autre'
)
WHERE category_id = (
    SELECT id FROM public.categories 
    WHERE name = 'Intelligence Artificielle'
);

-- 3. Supprimer la catégorie
DELETE FROM public.categories 
WHERE name = 'Intelligence Artificielle';
*/

-- Exemple pour supprimer PLUSIEURS CATÉGORIES en même temps
-- ======================================================

-- 1. D'abord vérifier les outils dans ces catégories
SELECT c.name as categorie, COUNT(t.id) as nombre_outils
FROM public.categories c
LEFT JOIN public.ai_tools t ON t.category_id = c.id
WHERE c.name IN ('Voix & Parole', 'Audio & Musique', 'Création musicale')
GROUP BY c.name;

-- 2. Déplacer tous les outils de ces catégories vers 'Audio & Voix'
UPDATE public.ai_tools 
SET category_id = (
    SELECT id FROM public.categories 
    WHERE name = 'Audio & Voix'
)
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name IN ('Voix & Parole', 'Audio & Musique', 'Création musicale')
);

-- 3. Supprimer les catégories
DELETE FROM public.categories 
WHERE name IN ('Voix & Parole', 'Audio & Musique', 'Création musicale');

ne pas oublier de mettre une majuscule au début du nom de la catégorie


-- 4. Vérifier que tout s'est bien passé
SELECT c.name as categorie, COUNT(t.id) as nombre_outils
FROM public.categories c
LEFT JOIN public.ai_tools t ON t.category_id = c.id
WHERE c.name = 'Audio & Voix'
GROUP BY c.name;
