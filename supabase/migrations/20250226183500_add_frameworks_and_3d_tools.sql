-- Ajouter des outils pour Frameworks & Bibliothèques et Impression 3D
BEGIN;

DO $$ 
DECLARE
    frameworks_category_id uuid := '1715f3fe-c800-425e-b5d3-ee8af4477a39';
    impression3d_category_id uuid := 'c040716f-51fb-47e4-af7f-40eaf2f63769';
BEGIN
    -- Outils pour Frameworks & Bibliothèques
    
    -- TensorFlow
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'tensorflow') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'TensorFlow',
            'tensorflow',
            'Framework open-source de machine learning développé par Google.',
            'https://www.tensorflow.org/',
            frameworks_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            true
        );
    END IF;

    -- PyTorch
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'pytorch') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'PyTorch',
            'pytorch',
            'Framework de deep learning flexible développé par Facebook.',
            'https://pytorch.org/',
            frameworks_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            true
        );
    END IF;

    -- Keras
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'keras') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Keras',
            'keras',
            'Interface haut niveau pour les réseaux de neurones.',
            'https://keras.io/',
            frameworks_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Scikit-learn
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'scikit-learn') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Scikit-learn',
            'scikit-learn',
            'Bibliothèque Python pour le machine learning classique.',
            'https://scikit-learn.org/',
            frameworks_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            true
        );
    END IF;

    -- JAX
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'jax') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'JAX',
            'jax',
            'Bibliothèque pour la différentiation automatique et le calcul XLA.',
            'https://github.com/google/jax',
            frameworks_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            false
        );
    END IF;

    -- FastAI
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'fastai') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'FastAI',
            'fastai',
            'Bibliothèque de deep learning de haut niveau.',
            'https://www.fast.ai/',
            frameworks_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Hugging Face
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'hugging-face') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Hugging Face',
            'hugging-face',
            'Bibliothèque et plateforme pour les modèles de langage.',
            'https://huggingface.co/',
            frameworks_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 99}]'::jsonb,
            true,
            true
        );
    END IF;

    -- XGBoost
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'xgboost') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'XGBoost',
            'xgboost',
            'Bibliothèque optimisée pour le gradient boosting.',
            'https://xgboost.readthedocs.io/',
            frameworks_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            false
        );
    END IF;

    -- LightGBM
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'lightgbm') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'LightGBM',
            'lightgbm',
            'Framework de gradient boosting par Microsoft.',
            'https://lightgbm.readthedocs.io/',
            frameworks_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            false
        );
    END IF;

    -- CatBoost
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'catboost') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'CatBoost',
            'catboost',
            'Bibliothèque de gradient boosting par Yandex.',
            'https://catboost.ai/',
            frameworks_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Outils pour Impression 3D

    -- Ultimaker Cura
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'ultimaker-cura') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Ultimaker Cura',
            'ultimaker-cura',
            'Logiciel de slicing avec IA pour optimisation de l''impression 3D.',
            'https://ultimaker.com/software/ultimaker-cura',
            impression3d_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            true
        );
    END IF;

    -- PrusaSlicer
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'prusaslicer') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'PrusaSlicer',
            'prusaslicer',
            'Logiciel de préparation d''impression 3D avec assistance IA.',
            'https://www.prusa3d.com/prusaslicer/',
            impression3d_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            true
        );
    END IF;

    -- 3DPrinterOS
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = '3dprinteros') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            '3DPrinterOS',
            '3dprinteros',
            'Plateforme cloud de gestion d''impression 3D avec IA.',
            'https://www.3dprinteros.com/',
            impression3d_category_id,
            '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Pro", "price": 29.99}]'::jsonb,
            true,
            false
        );
    END IF;

    -- AstroPrint
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'astroprint') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'AstroPrint',
            'astroprint',
            'Plateforme intelligente de gestion d''impression 3D.',
            'https://www.astroprint.com/',
            impression3d_category_id,
            '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Pro", "price": 19.99}]'::jsonb,
            true,
            false
        );
    END IF;

    -- OctoPrint
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'octoprint') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'OctoPrint',
            'octoprint',
            'Interface web pour impression 3D avec monitoring intelligent.',
            'https://octoprint.org/',
            impression3d_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            true
        );
    END IF;

    -- Simplify3D
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'simplify3d') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Simplify3D',
            'simplify3d',
            'Logiciel professionnel d''impression 3D avec analyse IA.',
            'https://www.simplify3d.com/',
            impression3d_category_id,
            '[{"plan_name": "Professional", "price": 149}]'::jsonb,
            true,
            false
        );
    END IF;

    -- IceSL
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'icesl') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'IceSL',
            'icesl',
            'Modeleur et slicer avec optimisation par IA.',
            'https://icesl.loria.fr/',
            impression3d_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            false
        );
    END IF;

    -- MatterControl
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'mattercontrol') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'MatterControl',
            'mattercontrol',
            'Suite logicielle d''impression 3D avec fonctionnalités IA.',
            'https://www.matterhackers.com/store/l/mattercontrol/sk/MKZGTDW6',
            impression3d_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Slic3r
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'slic3r') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Slic3r',
            'slic3r',
            'Slicer open-source avec optimisation intelligente.',
            'https://slic3r.org/',
            impression3d_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Repetier
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'repetier') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Repetier',
            'repetier',
            'Suite complète pour impression 3D avec fonctions intelligentes.',
            'https://www.repetier.com/',
            impression3d_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 98}]'::jsonb,
            true,
            false
        );
    END IF;

END $$;

COMMIT;
