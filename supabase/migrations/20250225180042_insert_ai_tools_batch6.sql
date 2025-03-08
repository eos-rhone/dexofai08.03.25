-- Batch 6 : Outils BabyAGI et autres

DO $$
DECLARE
    gestion_taches_id uuid;
BEGIN
    -- Récupérer l'ID de la catégorie
    SELECT id INTO gestion_taches_id FROM public.categories WHERE name = 'Gestion des Tâches';

    -- BabyAGI
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'BabyAGI',
        'babyagi',
        'Framework simple pour la gestion des tâches utilisant l''IA. Crée et priorise automatiquement des tâches basées sur un objectif prédéfini.',
        'https://github.com/yoheinakajima/babyagi',
        gestion_taches_id,
        '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) DO NOTHING;

    -- BabyBeeAGI
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'BabyBeeAGI',
        'babybeeagi',
        'Version améliorée de BabyAGI avec une gestion des tâches plus complexe, permettant une analyse et une synthèse plus complètes des informations.',
        'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyBeeAGI.py',
        gestion_taches_id,
        '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) DO NOTHING;

    -- BabyCatAGI
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'BabyCatAGI',
        'babycatagi',
        'Modification de BabyBeeAGI avec seulement 300 lignes de code. Inclut un agent de création de tâches unique.',
        'https://replit.com/@YoheiNakajima/BabyCatAGI',
        gestion_taches_id,
        '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) DO NOTHING;

    -- BabyDeerAGI
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'BabyDeerAGI',
        'babydeeragi',
        'Version de BabyAGI avec environ 350 lignes de code, offrant des tâches parallèles et utilisant GPT-3.5-turbo.',
        'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyDeerAGI.py',
        gestion_taches_id,
        '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) DO NOTHING;

    -- BabyElfAGI
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'BabyElfAGI',
        'babyelfagi',
        'Évolution de BabyDeerAGI avec environ 895 lignes de code. Inclut une classe de compétences personnalisables.',
        'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyElfAGI/main.py',
        gestion_taches_id,
        '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) DO NOTHING;
END $$;
