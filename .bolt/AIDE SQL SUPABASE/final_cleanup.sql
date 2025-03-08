BEGIN;

-- 1. Fusionner IoT & Robotique avec IoT & Domotique
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'IoT & Domotique')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name = 'IoT & Robotique'
);

-- 2. Fusionner Traduction avec Traduction & Localisation
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Traduction & Localisation')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name = 'Traduction'
);

-- 3. Fusionner Construction avec Architecture & Construction
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Architecture & Construction')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name = 'Construction'
);

-- 4. Fusionner Énergie avec Énergie & Climat
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Énergie & Climat')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name = 'Énergie'
);

-- 5. Fusionner Industrie avec Industrie 4.0
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Industrie 4.0')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name = 'Industrie'
);

-- 6. Déplacer les très petites catégories (1-2 outils) vers des catégories plus larges
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Business & Marketing')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name IN ('E-commerce', 'Immobilier')
);

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Art & Créativité')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name = 'Génération d'images'
);

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Productivité')
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name IN ('Gestion des Tâches', 'Recommandation')
);

COMMIT;
