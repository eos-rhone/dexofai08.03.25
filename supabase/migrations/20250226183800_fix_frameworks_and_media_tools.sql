-- Corriger les outils pour Frameworks & Bibliothèques et Médias & Divertissement avec les bons slugs
BEGIN;

DO $$ 
DECLARE
    frameworks_category_id uuid;
    media_category_id uuid;
BEGIN
    -- Récupérer les IDs avec les bons slugs
    SELECT id INTO frameworks_category_id FROM categories WHERE slug = 'frameworks-&-bibliothèques';
    SELECT id INTO media_category_id FROM categories WHERE slug = 'médias-&-divertissement';

    -- Frameworks & Bibliothèques
    
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

    -- Médias & Divertissement (compléter les outils manquants)

    -- RunwayML
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'runwayml') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'RunwayML',
            'runwayml',
            'Plateforme créative d''IA pour les médias.',
            'https://runwayml.com/',
            media_category_id,
            '[{"plan_name": "Starter", "price": 0}, {"plan_name": "Pro", "price": 35}]'::jsonb,
            true,
            true
        );
    END IF;

    -- Descript
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'descript') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Descript',
            'descript',
            'Éditeur audio/vidéo basé sur l''IA.',
            'https://www.descript.com/',
            media_category_id,
            '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 12}]'::jsonb,
            true,
            true
        );
    END IF;

    -- Synthesia
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'synthesia') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Synthesia',
            'synthesia',
            'Création de vidéos avec présentateurs IA.',
            'https://www.synthesia.io/',
            media_category_id,
            '[{"plan_name": "Personal", "price": 30}, {"plan_name": "Business", "price": 250}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Artbreeder
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'artbreeder') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Artbreeder',
            'artbreeder',
            'Création et fusion d''images par IA.',
            'https://www.artbreeder.com/',
            media_category_id,
            '[{"plan_name": "Free", "price": 0}, {"plan_name": "Premium", "price": 8.99}]'::jsonb,
            true,
            false
        );
    END IF;

    -- DeepArt
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'deepart') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'DeepArt',
            'deepart',
            'Transfert de style artistique par IA.',
            'https://deepart.io/',
            media_category_id,
            '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Pro", "price": 19.99}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Mubert
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'mubert') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Mubert',
            'mubert',
            'Génération de musique par IA.',
            'https://mubert.com/',
            media_category_id,
            '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 24.99}]'::jsonb,
            true,
            false
        );
    END IF;

    -- DALL·E
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'dall-e') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'DALL·E',
            'dall-e',
            'Génération d''images à partir de descriptions textuelles.',
            'https://openai.com/dall-e-2',
            media_category_id,
            '[{"plan_name": "Credits", "price": null}]'::jsonb,
            true,
            true
        );
    END IF;

    -- Midjourney
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'midjourney') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Midjourney',
            'midjourney',
            'Création d''images artistiques par IA.',
            'https://www.midjourney.com/',
            media_category_id,
            '[{"plan_name": "Basic", "price": 10}, {"plan_name": "Standard", "price": 30}]'::jsonb,
            true,
            true
        );
    END IF;

END $$;

COMMIT;
