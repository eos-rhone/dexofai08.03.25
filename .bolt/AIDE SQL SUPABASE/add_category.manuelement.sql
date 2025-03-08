-- Exemple d'ajout d'une nouvelle catégorie
-- Remplacez les valeurs entre < > par vos propres valeurs

INSERT INTO public.categories (
    name,           -- Nom de la catégorie
    slug,           -- URL-friendly version du nom (en minuscules, avec des tirets)
    description,    -- Description de la catégorie
    icon           -- Icône de la catégorie (chemin vers l'image)
) VALUES (
    '<nom_categorie>',          -- ex: 'Intelligence Artificielle'
    '<slug_categorie>',         -- ex: 'intelligence-artificielle'
    '<description_categorie>',  -- ex: 'Outils basés sur l'IA générale'
    '<chemin_icone>'           -- ex: '/images/categories/ai.svg'
);

-- Exemple concret :
/*
INSERT INTO public.categories (
    name,
    slug,
    description,
    icon
) VALUES (
    'Intelligence Artificielle',
    'intelligence-artificielle',
    'Outils et applications basés sur l''intelligence artificielle générale',
    '/images/categories/ai.svg'
);
*/

-- ======= AJOUTER UNE NOUVELLE CATÉGORIE AVEC ICÔNE =======

-- 1. Vérifier d'abord si le nom ou le slug existe déjà
SELECT name, slug, icon 
FROM public.categories 
WHERE name = 'Intelligence Artificielle' 
   OR slug = 'intelligence-artificielle';

-- 2. Si n'existe pas, ajouter la nouvelle catégorie avec son icône
INSERT INTO public.categories (
    name,
    slug,
    description,
    icon
) VALUES (
    'Intelligence Artificielle',
    'intelligence-artificielle',
    'Outils et applications basés sur l''intelligence artificielle générale',
    '/images/categories/ai.svg'        -- Chemin vers l'icône
);

-- ======= MODIFIER L'ICÔNE D'UNE CATÉGORIE EXISTANTE =======

-- 1. Voir l'icône actuelle
SELECT name, icon 
FROM public.categories 
WHERE name = 'Intelligence Artificielle';

-- 2. Mettre à jour l'icône
UPDATE public.categories 
SET icon = '/images/categories/new-ai-icon.svg'
WHERE name = 'Intelligence Artificielle';

-- ======= EXEMPLES D'ICÔNES PAR TYPE DE CATÉGORIE =======

/*
Exemples de chemins d'icônes selon la catégorie :

- IA & Automatisation : '/images/categories/ai.svg'
- Développement : '/images/categories/dev.svg'
- Art & Créativité : '/images/categories/art.svg'
- Audio & Voix : '/images/categories/audio.svg'
- Vidéo : '/images/categories/video.svg'
- Science : '/images/categories/science.svg'
- Business : '/images/categories/business.svg'
- Éducation : '/images/categories/education.svg'
- Santé : '/images/categories/health.svg'

Si pas d'icône spécifique : '/images/categories/default.svg'
*/

-- ======= EXEMPLE COMPLET AVEC VÉRIFICATION =======

DO $$
BEGIN
    -- 1. Vérifier si la catégorie existe déjà
    IF NOT EXISTS (
        SELECT 1 FROM public.categories 
        WHERE name = 'Robotique' OR slug = 'robotique'
    ) THEN
        -- 2. Ajouter la nouvelle catégorie avec son icône
        INSERT INTO public.categories (
            name,
            slug,
            description,
            icon
        ) VALUES (
            'Robotique',
            'robotique',
            'Outils et applications pour la robotique et l''automatisation',
            '/images/categories/robotics.svg'
        );
        
        RAISE NOTICE 'Catégorie ajoutée avec succès';
    ELSE
        RAISE NOTICE 'La catégorie existe déjà';
    END IF;
END $$;
