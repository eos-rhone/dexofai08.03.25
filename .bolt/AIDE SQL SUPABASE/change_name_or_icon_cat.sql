-- ======= CHANGER LE NOM D'UNE CATÉGORIE =======

-- 1. D'abord vérifier la catégorie actuelle
SELECT name, slug, icon 
FROM public.categories 
WHERE name = 'Vidéo';

-- 2. Vérifier que le nouveau nom n'existe pas déjà
SELECT name, slug, icon 
FROM public.categories 
WHERE name = 'Vidéo & Animation';

-- 3. Mettre à jour le nom (et le slug si nécessaire)
UPDATE public.categories 
SET 
    name = 'Vidéo & Animation',
    slug = 'video-animation'  -- Mettre à jour le slug aussi pour la cohérence
WHERE name = 'Vidéo'
AND NOT EXISTS (
    SELECT 1 FROM public.categories WHERE name = 'Vidéo & Animation'
);

-- 4. Vérifier que le changement a bien été effectué
SELECT name, slug, icon 
FROM public.categories 
WHERE name = 'Vidéo & Animation';

-- ======= CHANGER L'ICÔNE D'UNE CATÉGORIE =======

-- 1. Voir l'icône actuelle
SELECT name, icon 
FROM public.categories 
WHERE name = 'Vidéo & Animation';

-- 2. Mettre à jour l'icône
UPDATE public.categories 
SET icon = '/images/categories/video-animation.svg'
WHERE name = 'Vidéo & Animation';

-- 3. Vérifier le changement
SELECT name, icon 
FROM public.categories 
WHERE name = 'Vidéo & Animation';

-- ======= EXEMPLE COMPLET : CHANGER NOM ET ICÔNE EN MÊME TEMPS =======

DO $$
BEGIN
    -- 1. Vérifier que la catégorie existe
    IF EXISTS (
        SELECT 1 FROM public.categories WHERE name = 'Intelligence Artificielle'
    ) THEN
        -- 2. Vérifier que le nouveau nom n'existe pas
        IF NOT EXISTS (
            SELECT 1 FROM public.categories WHERE name = 'IA & Machine Learning'
        ) THEN
            -- 3. Faire les modifications
            UPDATE public.categories 
            SET 
                name = 'IA & Machine Learning',
                slug = 'ia-machine-learning',
                icon = '/images/categories/ai-ml.svg'
            WHERE name = 'Intelligence Artificielle';
            
            RAISE NOTICE 'Catégorie mise à jour avec succès';
        ELSE
            RAISE NOTICE 'Le nouveau nom existe déjà';
        END IF;
    ELSE
        RAISE NOTICE 'Catégorie non trouvée';
    END IF;
END $$;

-- ======= EXEMPLES D'ICÔNES COURANTES =======
/*
Icônes recommandées par type :
- Intelligence Artificielle : '/images/categories/ai.svg'
- Machine Learning : '/images/categories/ml.svg'
- Développement : '/images/categories/dev.svg'
- Données : '/images/categories/data.svg'
- Vidéo : '/images/categories/video.svg'
- Audio : '/images/categories/audio.svg'
- Business : '/images/categories/business.svg'
- Science : '/images/categories/science.svg'
- Santé : '/images/categories/health.svg'
- Éducation : '/images/categories/education.svg'
- Par défaut : '/images/categories/default.svg'
*/
