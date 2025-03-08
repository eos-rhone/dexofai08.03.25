-- Ajouter des outils pour Géologie
BEGIN;

-- Image HD pour Géologie
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1557672172-298e090bd0f1?q=80&w=2000'
WHERE name = 'Géologie';

WITH new_tools (id, name, description, website_url, slug, image_url, pricing, is_active, is_featured) AS (
    VALUES 
    (
        gen_random_uuid(),
        'SeismicAI',
        'Analyse avancée des données sismiques pour la prédiction et la cartographie des risques géologiques.',
        'https://seismic-ai.example.com',
        'seismic-ai',
        'https://images.unsplash.com/photo-1557672172-298e090bd0f1?q=80&w=2000',
        '{"pro": "799", "enterprise": "2999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'MineralMap',
        'Cartographie minérale par intelligence artificielle avec analyse de composition.',
        'https://mineral-map.example.com',
        'mineral-map',
        'https://images.unsplash.com/photo-1557672172-298e090bd0f1?q=80&w=2000',
        '{"basic": "399", "premium": "999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'GeoScan',
        'Scanner géologique 3D avec analyse automatisée des structures souterraines.',
        'https://geo-scan.example.com',
        'geo-scan',
        'https://images.unsplash.com/photo-1557672172-298e090bd0f1?q=80&w=2000',
        '{"research": "599", "commercial": "1499"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'StratumAI',
        'Analyse stratigraphique automatisée avec modélisation des couches géologiques.',
        'https://stratum-ai.example.com',
        'stratum-ai',
        'https://images.unsplash.com/photo-1557672172-298e090bd0f1?q=80&w=2000',
        '{"edu": "299", "pro": "899"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'RockIdentify',
        'Identification automatique des roches et minéraux par vision par ordinateur.',
        'https://rock-identify.example.com',
        'rock-identify',
        'https://images.unsplash.com/photo-1557672172-298e090bd0f1?q=80&w=2000',
        '{"free": true, "premium": "199"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'TerrainAnalytics',
        'Analyse du terrain et prédiction des risques géologiques par machine learning.',
        'https://terrain-analytics.example.com',
        'terrain-analytics',
        'https://images.unsplash.com/photo-1557672172-298e090bd0f1?q=80&w=2000',
        '{"basic": "499", "enterprise": "1999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'GeoExplorer',
        'Assistant d''exploration géologique avec recommandations de sites basées sur l''IA.',
        'https://geo-explorer.example.com',
        'geo-explorer',
        'https://images.unsplash.com/photo-1557672172-298e090bd0f1?q=80&w=2000',
        '{"starter": "299", "professional": "899"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'CoreAnalysis',
        'Analyse automatisée des carottes de forage avec rapports détaillés.',
        'https://core-analysis.example.com',
        'core-analysis',
        'https://images.unsplash.com/photo-1557672172-298e090bd0f1?q=80&w=2000',
        '{"lab": "699", "industry": "1899"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'FaultDetect',
        'Détection et analyse des failles géologiques par deep learning.',
        'https://fault-detect.example.com',
        'fault-detect',
        'https://images.unsplash.com/photo-1557672172-298e090bd0f1?q=80&w=2000',
        '{"standard": "599", "premium": "1499"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'GeoModel3D',
        'Modélisation 3D avancée des structures géologiques avec simulation.',
        'https://geomodel3d.example.com',
        'geomodel3d',
        'https://images.unsplash.com/photo-1557672172-298e090bd0f1?q=80&w=2000',
        '{"pro": "899", "enterprise": "2499"}'::jsonb,
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
WHERE c.name = 'Géologie';

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
    WHERE name = 'Géologie'
);

COMMIT;
