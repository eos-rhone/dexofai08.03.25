-- Insérer les outils avec l'ID exact de la catégorie
BEGIN;

DO $$ 
DECLARE
    frameworks_id uuid := '1715f3fe-c800-425e-b5d3-ee8af4477a39';  -- ID exact de la catégorie
BEGIN
    -- TensorFlow
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'TensorFlow',
        'tensorflow',
        'Framework open-source de machine learning développé par Google.',
        'https://www.tensorflow.org/',
        frameworks_id,
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        true
    )
    ON CONFLICT (slug) DO NOTHING;

    -- PyTorch
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'PyTorch',
        'pytorch',
        'Framework de deep learning flexible développé par Facebook.',
        'https://pytorch.org/',
        frameworks_id,
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        true
    )
    ON CONFLICT (slug) DO NOTHING;

    -- Scikit-learn
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Scikit-learn',
        'scikit-learn',
        'Bibliothèque Python pour le machine learning classique.',
        'https://scikit-learn.org/',
        frameworks_id,
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        true
    )
    ON CONFLICT (slug) DO NOTHING;

    -- Keras
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Keras',
        'keras',
        'Interface haut niveau pour les réseaux de neurones.',
        'https://keras.io/',
        frameworks_id,
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) DO NOTHING;

    -- Hugging Face
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Hugging Face',
        'hugging-face',
        'Bibliothèque et plateforme pour les modèles de langage.',
        'https://huggingface.co/',
        frameworks_id,
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 99}]'::jsonb,
        true,
        true
    )
    ON CONFLICT (slug) DO NOTHING;

    -- FastAI
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'FastAI',
        'fastai',
        'Bibliothèque de deep learning de haut niveau.',
        'https://www.fast.ai/',
        frameworks_id,
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) DO NOTHING;

    -- JAX
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'JAX',
        'jax',
        'Bibliothèque pour la différentiation automatique et le calcul XLA.',
        'https://github.com/google/jax',
        frameworks_id,
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) DO NOTHING;

    -- XGBoost
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'XGBoost',
        'xgboost',
        'Bibliothèque optimisée pour le gradient boosting.',
        'https://xgboost.readthedocs.io/',
        frameworks_id,
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) DO NOTHING;

    -- LightGBM
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'LightGBM',
        'lightgbm',
        'Framework de gradient boosting par Microsoft.',
        'https://lightgbm.readthedocs.io/',
        frameworks_id,
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) DO NOTHING;

    -- CatBoost
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'CatBoost',
        'catboost',
        'Bibliothèque de gradient boosting par Yandex.',
        'https://catboost.ai/',
        frameworks_id,
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) DO NOTHING;

END $$;

-- Vérifier les résultats
SELECT 
    c.name as category_name,
    COUNT(t.id) as tool_count,
    array_agg(t.name) as tool_names
FROM categories c
LEFT JOIN ai_tools t ON c.id = t.category_id
WHERE c.id = '1715f3fe-c800-425e-b5d3-ee8af4477a39'
GROUP BY c.name;

COMMIT;
