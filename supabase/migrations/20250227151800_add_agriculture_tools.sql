-- Ajouter des outils pour Agriculture & Environnement
BEGIN;

-- Image HD pour Agriculture & Environnement
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000'
WHERE name = 'Agriculture & Environnement';

-- Outils pour Agriculture & Environnement
WITH new_tools (id, name, description, website_url, slug, image_url, pricing, is_active, is_featured) AS (
    VALUES 
    (
        gen_random_uuid(),
        'FarmAI', 
        'IA pour l''optimisation des cultures et la gestion des ressources agricoles. Utilise des algorithmes avancés pour maximiser les rendements tout en minimisant l''impact environnemental.',
        'https://farmai.example.com',
        'farm-ai',
        'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000',
        '{"free": true, "basic": "29", "premium": "99"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'CropSense',
        'Analyse prédictive pour la santé des cultures utilisant des capteurs IoT et l''intelligence artificielle pour détecter précocement les maladies.',
        'https://cropsense.example.com',
        'crop-sense',
        'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000',
        '{"free": false, "basic": "49", "premium": "149"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'EcoTrack',
        'Surveillance environnementale et analyse d''impact avec tableaux de bord en temps réel et rapports automatisés sur l''empreinte carbone.',
        'https://ecotrack.example.com',
        'eco-track',
        'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000',
        '{"free": true, "pro": "199"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'SmartIrrigation',
        'Système d''irrigation intelligent qui optimise l''utilisation de l''eau en fonction des conditions météorologiques et de l''humidité du sol.',
        'https://smartirrigation.example.com',
        'smart-irrigation',
        'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000',
        '{"basic": "39", "premium": "129"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'SoilAnalytics',
        'Analyse avancée des sols par IA pour optimiser la fertilisation et améliorer la qualité des terres agricoles.',
        'https://soilanalytics.example.com',
        'soil-analytics',
        'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000',
        '{"starter": "19", "business": "89"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'PestDetect',
        'Détection automatique des parasites par vision par ordinateur, permettant une intervention rapide et ciblée.',
        'https://pestdetect.example.com',
        'pest-detect',
        'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000',
        '{"free": true, "premium": "79"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'YieldPredict',
        'Prévision des rendements agricoles par machine learning, intégrant données historiques et conditions actuelles.',
        'https://yieldpredict.example.com',
        'yield-predict',
        'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000',
        '{"basic": "59", "enterprise": "299"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'WeatherAI',
        'Prévisions météo localisées pour l''agriculture avec alertes personnalisées et recommandations d''actions.',
        'https://weatherai.example.com',
        'weather-ai',
        'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000',
        '{"free": true, "pro": "149"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'BioMonitor',
        'Surveillance de la biodiversité par IA avec identification automatique des espèces et suivi des populations.',
        'https://biomonitor.example.com',
        'bio-monitor',
        'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000',
        '{"basic": "39", "premium": "159"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'AgriDrone',
        'Solutions de drones agricoles intelligents pour la cartographie, la pulvérisation et le suivi des cultures.',
        'https://agridrone.example.com',
        'agri-drone',
        'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000',
        '{"starter": "199", "professional": "499"}'::jsonb,
        true,
        false
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
    floor(random() * 10000 + 1000)::integer,  -- user_count entre 1000 et 11000
    floor(random() * 1000 + 100)::bigint,     -- total_reviews entre 100 et 1100
    floor(random() * 5000 + 500)::bigint,     -- monthly_users entre 500 et 5500
    floor(random() * 50000 + 5000)::bigint,   -- total_views entre 5000 et 55000
    (random() * 2 + 3)::numeric(3,2)          -- average_rating entre 3.00 et 5.00
FROM new_tools t
CROSS JOIN categories c
WHERE c.name = 'Agriculture & Environnement';

-- Copier les mêmes outils dans ai_tools avec les mêmes IDs
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
    WHERE name = 'Agriculture & Environnement'
);

COMMIT;
