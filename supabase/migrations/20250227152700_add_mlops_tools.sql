-- Ajouter des outils pour MLOps & Déploiement
BEGIN;

-- Image HD pour MLOps & Déploiement
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000'
WHERE name = 'MLOps & Déploiement';

WITH new_tools (id, name, description, website_url, slug, image_url, pricing, is_active, is_featured) AS (
    VALUES 
    (
        gen_random_uuid(),
        'ModelFlow',
        'Plateforme complète de gestion du cycle de vie des modèles ML, de l''expérimentation au déploiement.',
        'https://modelflow.example.com',
        'modelflow',
        'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000',
        '{"startup": "499", "enterprise": "2499"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'MLMonitor',
        'Surveillance en temps réel des performances des modèles ML en production.',
        'https://mlmonitor.example.com',
        'ml-monitor',
        'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000',
        '{"basic": "199", "pro": "799"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'AutoDeploy',
        'Déploiement automatisé de modèles ML avec tests A/B intégrés.',
        'https://autodeploy.example.com',
        'auto-deploy',
        'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000',
        '{"team": "899", "enterprise": "2999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'MLPipeline',
        'Construction et gestion de pipelines ML automatisés.',
        'https://mlpipeline.example.com',
        'ml-pipeline',
        'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000',
        '{"basic": "299", "premium": "999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'FeatureStore',
        'Stockage et gestion centralisée des features pour ML.',
        'https://featurestore.example.com',
        'feature-store',
        'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000',
        '{"startup": "399", "scale": "1499"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'ModelRegistry',
        'Registre de modèles ML avec versioning et traçabilité.',
        'https://modelregistry.example.com',
        'model-registry',
        'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000',
        '{"free": true, "enterprise": "999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'MLOpsMetrics',
        'Tableau de bord complet des métriques MLOps et DevOps.',
        'https://mlopsmetrics.example.com',
        'mlops-metrics',
        'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000',
        '{"basic": "199", "pro": "699"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'ModelServing',
        'Plateforme de serving de modèles ML haute performance.',
        'https://modelserving.example.com',
        'model-serving',
        'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000',
        '{"standard": "599", "enterprise": "1999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'DataVersioning',
        'Système de versioning pour données d''entraînement ML.',
        'https://dataversioning.example.com',
        'data-versioning',
        'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000',
        '{"team": "299", "business": "899"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'MLSecOps',
        'Sécurité et gouvernance pour le déploiement ML.',
        'https://mlsecops.example.com',
        'ml-secops',
        'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000',
        '{"pro": "799", "enterprise": "2499"}'::jsonb,
        true,
        true
    )
)
INSERT INTO tools (
    id, name, description, website_url, slug, image_url, 
    category_id, pricing, is_active, is_featured,
    created_at, updated_at,
    user_count, total_reviews, monthly_users, total_views, average_rating
)
SELECT 
    t.id,
    t.name, 
    t.description, 
    t.website_url,
    t.slug,
    t.image_url,
    c.id as category_id,
    t.pricing,
    t.is_active,
    t.is_featured,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    floor(random() * 10000 + 1000)::integer,
    floor(random() * 1000 + 100)::bigint,
    floor(random() * 5000 + 500)::bigint,
    floor(random() * 50000 + 5000)::bigint,
    (random() * 2 + 3)::numeric(3,2)
FROM new_tools t
CROSS JOIN categories c
WHERE c.name = 'MLOps & Déploiement'
AND NOT EXISTS (
    SELECT 1 FROM tools 
    WHERE tools.slug = t.slug 
    AND tools.category_id = c.id
);

-- Copier dans ai_tools uniquement les nouveaux outils
INSERT INTO ai_tools (
    id, name, description, website_url, slug, image_url, 
    category_id, pricing, is_active, is_featured,
    created_at, updated_at,
    user_count, total_reviews, monthly_users, total_views, average_rating
)
SELECT 
    t2.id, t2.name, t2.description, t2.website_url, t2.slug, t2.image_url,
    t2.category_id, t2.pricing, t2.is_active, t2.is_featured,
    t2.created_at, t2.updated_at,
    t2.user_count, t2.total_reviews, t2.monthly_users, t2.total_views, t2.average_rating
FROM tools t2
WHERE t2.category_id IN (
    SELECT id FROM categories 
    WHERE name = 'MLOps & Déploiement'
)
AND NOT EXISTS (
    SELECT 1 FROM ai_tools 
    WHERE ai_tools.slug = t2.slug 
    AND ai_tools.category_id = t2.category_id
);

COMMIT;
