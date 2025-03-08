-- Ajouter des outils pour Industrie 4.0
BEGIN;

-- Image HD pour Industrie 4.0
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1581091226825-c6a89e7e4801?q=80&w=2000'
WHERE name = 'Industrie 4.0';

WITH new_tools (id, name, description, website_url, slug, image_url, pricing, is_active, is_featured) AS (
    VALUES 
    (
        gen_random_uuid(),
        'SmartFactory AI',
        'Plateforme complète d''automatisation et d''optimisation des processus industriels par IA.',
        'https://smartfactory-ai.example.com',
        'smartfactory-ai',
        'https://images.unsplash.com/photo-1581091226825-c6a89e7e4801?q=80&w=2000',
        '{"starter": "999", "enterprise": "4999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'PredictiveMaint',
        'Maintenance prédictive avancée utilisant l''IoT et le machine learning.',
        'https://predictive-maint.example.com',
        'predictive-maint',
        'https://images.unsplash.com/photo-1581091226825-c6a89e7e4801?q=80&w=2000',
        '{"basic": "499", "premium": "1499"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'SupplyChainAI',
        'Optimisation de la chaîne d''approvisionnement par intelligence artificielle.',
        'https://supplychain-ai.example.com',
        'supplychain-ai',
        'https://images.unsplash.com/photo-1581091226825-c6a89e7e4801?q=80&w=2000',
        '{"small": "799", "enterprise": "2999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'QualityControl',
        'Contrôle qualité automatisé par vision par ordinateur et deep learning.',
        'https://quality-control.example.com',
        'quality-control',
        'https://images.unsplash.com/photo-1581091226825-c6a89e7e4801?q=80&w=2000',
        '{"basic": "399", "pro": "999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'DigitalTwin',
        'Création et gestion de jumeaux numériques pour l''industrie.',
        'https://digital-twin.example.com',
        'digital-twin',
        'https://images.unsplash.com/photo-1581091226825-c6a89e7e4801?q=80&w=2000',
        '{"standard": "1499", "enterprise": "4999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'ProcessOptimize',
        'Optimisation des processus industriels par apprentissage automatique.',
        'https://process-optimize.example.com',
        'process-optimize',
        'https://images.unsplash.com/photo-1581091226825-c6a89e7e4801?q=80&w=2000',
        '{"startup": "699", "corporate": "2499"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'RoboticControl',
        'Contrôle intelligent de robots industriels avec apprentissage par renforcement.',
        'https://robotic-control.example.com',
        'robotic-control',
        'https://images.unsplash.com/photo-1581091226825-c6a89e7e4801?q=80&w=2000',
        '{"basic": "999", "advanced": "2999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'InventoryAI',
        'Gestion intelligente des stocks avec prévision de la demande.',
        'https://inventory-ai.example.com',
        'inventory-ai',
        'https://images.unsplash.com/photo-1581091226825-c6a89e7e4801?q=80&w=2000',
        '{"small": "299", "enterprise": "1499"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'EnergyManage',
        'Gestion énergétique intelligente pour l''industrie 4.0.',
        'https://energy-manage.example.com',
        'energy-manage',
        'https://images.unsplash.com/photo-1581091226825-c6a89e7e4801?q=80&w=2000',
        '{"basic": "599", "premium": "1999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'SafetyAI',
        'Système de sécurité industrielle basé sur l''IA avec détection des risques en temps réel.',
        'https://safety-ai.example.com',
        'safety-ai',
        'https://images.unsplash.com/photo-1581091226825-c6a89e7e4801?q=80&w=2000',
        '{"standard": "899", "enterprise": "2999"}'::jsonb,
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
WHERE c.name = 'Industrie 4.0';

-- Copier dans ai_tools
INSERT INTO ai_tools (
    id, name, description, website_url, slug, image_url, 
    category_id, pricing, is_active, is_featured,
    created_at, updated_at,
    user_count, total_reviews, monthly_users, total_views, average_rating
)
SELECT 
    id, name, description, website_url, slug, image_url,
    category_id, pricing, is_active, is_featured,
    created_at, updated_at,
    user_count, total_reviews, monthly_users, total_views, average_rating
FROM tools
WHERE category_id IN (
    SELECT id FROM categories 
    WHERE name = 'Industrie 4.0'
);

COMMIT;
