-- Ajouter des outils pour Énergie & Climat
BEGIN;

-- Image HD pour Énergie & Climat
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000'
WHERE name = 'Énergie & Climat';

WITH new_tools (id, name, description, website_url, slug, image_url, pricing, is_active, is_featured) AS (
    VALUES 
    (
        gen_random_uuid(),
        'SmartGrid AI',
        'Système intelligent de gestion des réseaux électriques utilisant l''IA pour optimiser la distribution d''énergie.',
        'https://smartgrid-ai.example.com',
        'smartgrid-ai',
        'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000',
        '{"enterprise": "999", "utility": "4999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'ClimatePredict',
        'Modélisation climatique avancée avec prévisions précises des changements climatiques locaux et globaux.',
        'https://climate-predict.example.com',
        'climate-predict',
        'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000',
        '{"research": "799", "government": "2999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'EnergyOptimizer',
        'Solution d''optimisation de la consommation énergétique pour bâtiments intelligents.',
        'https://energy-optimizer.example.com',
        'energy-optimizer',
        'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000',
        '{"basic": "199", "premium": "499"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'RenewableAI',
        'Prédiction de production d''énergie renouvelable basée sur les conditions météorologiques.',
        'https://renewable-ai.example.com',
        'renewable-ai',
        'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000',
        '{"startup": "299", "corporate": "999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'CarbonTracker',
        'Suivi et analyse de l''empreinte carbone avec recommandations de réduction.',
        'https://carbon-tracker.example.com',
        'carbon-tracker',
        'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000',
        '{"free": true, "business": "199"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'PowerPredict',
        'Prévision de la demande énergétique pour une meilleure gestion des ressources.',
        'https://power-predict.example.com',
        'power-predict',
        'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000',
        '{"small": "399", "large": "1499"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'ClimateRisk',
        'Évaluation des risques climatiques pour les entreprises et les infrastructures.',
        'https://climate-risk.example.com',
        'climate-risk',
        'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000',
        '{"basic": "599", "enterprise": "2499"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'EcoDesign AI',
        'Assistant de conception écologique pour produits et bâtiments durables.',
        'https://ecodesign-ai.example.com',
        'ecodesign-ai',
        'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000',
        '{"pro": "299", "team": "799"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'WeatherImpact',
        'Analyse de l''impact météorologique sur la consommation énergétique.',
        'https://weather-impact.example.com',
        'weather-impact',
        'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000',
        '{"basic": "149", "advanced": "449"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'EmissionControl',
        'Système de contrôle et réduction des émissions industrielles en temps réel.',
        'https://emission-control.example.com',
        'emission-control',
        'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000',
        '{"industry": "999", "enterprise": "3999"}'::jsonb,
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
WHERE c.name = 'Énergie & Climat';

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
    WHERE name = 'Énergie & Climat'
);

COMMIT;
