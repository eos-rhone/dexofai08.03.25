-- S'assurer que la catégorie Frameworks & Bibliothèques existe
BEGIN;

DO $$ 
DECLARE
    frameworks_category_id uuid;
BEGIN
    -- Vérifier si la catégorie existe déjà
    SELECT id INTO frameworks_category_id 
    FROM categories 
    WHERE slug = 'frameworks-&-bibliothèques';

    -- Si elle n'existe pas, la créer
    IF frameworks_category_id IS NULL THEN
        INSERT INTO categories (name, slug)
        VALUES ('Frameworks & Bibliothèques', 'frameworks-&-bibliothèques')
        RETURNING id INTO frameworks_category_id;
    END IF;

    -- Maintenant ajouter les outils
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

END $$;

COMMIT;
