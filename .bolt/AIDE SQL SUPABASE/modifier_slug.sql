-- ======= MODIFICATION DE SLUG =======

-- 1. VÉRIFIER SI UN SLUG EXISTE DÉJÀ
SELECT name, slug 
FROM public.ai_tools 
WHERE slug = 'nouveau-slug';

SELECT name, slug 
FROM public.categories 
WHERE slug = 'nouveau-slug';

-- ======= MODIFIER LE SLUG D'UN OUTIL =======

-- 1. Exemple : Modifier le slug de l'outil "GridAI"
-- D'abord vérifier l'outil actuel
SELECT name, slug FROM public.ai_tools WHERE name = 'GridAI';

-- Vérifier si le nouveau slug est disponible
SELECT name, slug FROM public.ai_tools WHERE slug = 'grid-intelligence';

-- Si disponible, faire la modification
UPDATE public.ai_tools 
SET slug = 'grid-intelligence'
WHERE name = 'GridAI'
AND NOT EXISTS (
    SELECT 1 FROM public.ai_tools WHERE slug = 'grid-intelligence'
);

-- ======= MODIFIER LE SLUG D'UNE CATÉGORIE =======

-- 1. Exemple : Modifier le slug de la catégorie "Énergie & Climat"
-- D'abord vérifier la catégorie actuelle
SELECT name, slug FROM public.categories WHERE name = 'Énergie & Climat';

-- Vérifier si le nouveau slug est disponible
SELECT name, slug FROM public.categories WHERE slug = 'energie-climat';

-- Si disponible, faire la modification
UPDATE public.categories 
SET slug = 'energie-climat'
WHERE name = 'Énergie & Climat'
AND NOT EXISTS (
    SELECT 1 FROM public.categories WHERE slug = 'energie-climat'
);

-- ======= BONNES PRATIQUES POUR LES SLUGS =======

/*
1. Les slugs doivent être :
   - En minuscules
   - Sans accents
   - Sans espaces (utiliser des tirets)
   - Sans caractères spéciaux
   - Uniques dans leur table

2. Exemple de transformation de nom en slug :
   "Machine Learning & IA" -> "machine-learning-ia"
   "3D & Animation" -> "3d-animation"
   "L'intelligence artificielle" -> "intelligence-artificielle"

3. Toujours vérifier avant de modifier :
   - Que l'ancien slug existe
   - Que le nouveau slug n'existe pas
   - Utiliser AND NOT EXISTS pour éviter les doublons
*/

-- ======= EXEMPLE COMPLET =======

-- Pour modifier un slug en toute sécurité :
DO $$
BEGIN
    -- 1. Vérifier que l'ancien existe
    IF EXISTS (SELECT 1 FROM public.ai_tools WHERE name = 'MonOutil') THEN
        -- 2. Vérifier que le nouveau n'existe pas
        IF NOT EXISTS (SELECT 1 FROM public.ai_tools WHERE slug = 'nouveau-slug') THEN
            -- 3. Faire la modification
            UPDATE public.ai_tools 
            SET slug = 'nouveau-slug'
            WHERE name = 'MonOutil';
            
            RAISE NOTICE 'Slug modifié avec succès';
        ELSE
            RAISE NOTICE 'Le nouveau slug existe déjà';
        END IF;
    ELSE
        RAISE NOTICE 'Outil non trouvé';
    END IF;
END $$;
