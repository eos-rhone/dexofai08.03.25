-- ======= CHANGER L'IMAGE DES OUTILS D'UNE CATÉGORIE =======

-- 1. D'abord vérifier les images actuelles des outils de la catégorie
SELECT 
    t.name as nom_outil,
    t.image_url,
    c.name as categorie
FROM public.ai_tools t
JOIN public.categories c ON t.category_id = c.id
WHERE c.name = 'Intelligence Artificielle';

-- 2. Mettre à jour l'image pour tous les outils de la catégorie
-- qui n'ont pas d'image ou qui ont l'image par défaut
UPDATE public.ai_tools
SET image_url = '/images/categories/ai-tools-default.png'
WHERE category_id = (
    SELECT id FROM public.categories 
    WHERE name = 'Intelligence Artificielle'
)
AND (
    image_url IS NULL 
    OR image_url = '/images/placeholder.png'
);

-- 3. Exemple pour mettre à jour l'image de tous les outils d'une catégorie
UPDATE public.ai_tools
SET image_url = '/images/categories/video-tools.png'
WHERE category_id = (
    SELECT id FROM public.categories 
    WHERE name = 'Vidéo & Animation'
);

-- 4. Vérifier que les changements ont été appliqués
SELECT 
    t.name as nom_outil,
    t.image_url,
    c.name as categorie
FROM public.ai_tools t
JOIN public.categories c ON t.category_id = c.id
WHERE c.name = 'Vidéo & Animation';

-- ======= EXEMPLES D'IMAGES PAR CATÉGORIE =======
/*
Suggestions d'images par catégorie :

- Intelligence Artificielle : '/images/categories/ai-tools.png'
- Vidéo & Animation : '/images/categories/video-tools.png'
- Audio & Musique : '/images/categories/audio-tools.png'
- Développement : '/images/categories/dev-tools.png'
- Business : '/images/categories/business-tools.png'
- Éducation : '/images/categories/education-tools.png'
- Design : '/images/categories/design-tools.png'

Par défaut : '/images/placeholder.png'
*/

-- ======= EXEMPLE COMPLET AVEC VÉRIFICATION =======

DO $$
BEGIN
    -- 1. Vérifier si la catégorie existe
    IF EXISTS (
        SELECT 1 FROM public.categories 
        WHERE name = 'Design & Créativité'
    ) THEN
        -- 2. Compter combien d'outils seront affectés
        RAISE NOTICE 'Nombre d''outils à mettre à jour: %', (
            SELECT COUNT(*) 
            FROM public.ai_tools 
            WHERE category_id = (
                SELECT id FROM public.categories 
                WHERE name = 'Design & Créativité'
            )
        );
        
        -- 3. Faire la mise à jour
        UPDATE public.ai_tools
        SET image_url = '/images/categories/design-tools.png'
        WHERE category_id = (
            SELECT id FROM public.categories 
            WHERE name = 'Design & Créativité'
        );
        
        RAISE NOTICE 'Images mises à jour avec succès';
    ELSE
        RAISE NOTICE 'Catégorie non trouvée';
    END IF;
END $$;
