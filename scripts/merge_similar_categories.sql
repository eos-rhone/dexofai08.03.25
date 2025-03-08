BEGIN;

-- 1. Fusion des catégories Audio
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Audio & Voix')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name IN ('Audio & Musique', 'Voix & Parole')
);

-- 2. Fusion des catégories Vidéo
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Vidéo & Animation')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name = 'Vidéo'
);

-- 3. Fusion des catégories Recherche
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Science & Recherche')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name IN ('Recherche', 'Recherche scientifique')
);

-- 4. Fusion des catégories Transport
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Automobile & Transport')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name IN ('Automobile', 'Transport', 'Aviation')
);

-- 5. Fusion des catégories Agriculture
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Agriculture & Environnement')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name IN ('Agriculture', 'Environnement', 'Agroalimentaire')
);

-- 6. Supprimer les catégories vides
DELETE FROM public.categories 
WHERE id IN (
    SELECT c.id
    FROM public.categories c
    LEFT JOIN public.ai_tools t ON t.category_id = c.id
    WHERE t.id IS NULL
    OR c.name IN (
        'Audio & Musique', 
        'Voix & Parole',
        'Vidéo',
        'Recherche',
        'Recherche scientifique',
        'Automobile',
        'Transport',
        'Aviation',
        'Agriculture',
        'Environnement',
        'Agroalimentaire'
    )
);

COMMIT;
