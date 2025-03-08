-- Ajouter des outils pour les 5 prochaines catégories
BEGIN;

-- 1. Astronomie & Espace
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000'
WHERE name = 'Astronomie & Espace';

WITH new_tools (id, name, description, website_url, slug, image_url, pricing, is_active, is_featured) AS (
    VALUES 
    (
        gen_random_uuid(),
        'StarMap AI', 
        'Cartographie stellaire avancée utilisant l''intelligence artificielle pour identifier et classifier les objets célestes avec une précision inégalée.',
        'https://starmap-ai.example.com',
        'starmap-ai',
        'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000',
        '{"free": true, "pro": "49", "enterprise": "199"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'ExoPlanet Finder',
        'Système de détection d''exoplanètes utilisant le deep learning pour analyser les données des télescopes spatiaux.',
        'https://exoplanet-finder.example.com',
        'exoplanet-finder',
        'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000',
        '{"basic": "99", "premium": "299"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'GalaxyNet',
        'Réseau neuronal spécialisé dans la classification et l''analyse des galaxies à partir d''images astronomiques.',
        'https://galaxynet.example.com',
        'galaxynet',
        'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000',
        '{"research": "499", "institutional": "999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'CosmicFlow',
        'Simulation de dynamique cosmique en temps réel avec visualisation 3D interactive.',
        'https://cosmicflow.example.com',
        'cosmicflow',
        'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000',
        '{"edu": "79", "pro": "249"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'AstroML',
        'Suite d''outils de machine learning optimisés pour l''analyse de données astronomiques.',
        'https://astroml.example.com',
        'astroml',
        'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000',
        '{"free": true, "team": "199"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'StellarSpec',
        'Analyse spectrale stellaire automatisée avec identification des compositions chimiques.',
        'https://stellarspec.example.com',
        'stellarspec',
        'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000',
        '{"basic": "149", "advanced": "399"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'SpaceDebris Tracker',
        'Système de suivi des débris spatiaux en orbite terrestre utilisant l''IA pour prédire les trajectoires.',
        'https://spacedebris.example.com',
        'spacedebris-tracker',
        'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000',
        '{"gov": "999", "commercial": "1499"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'PulsarAI',
        'Détection et analyse automatisée des pulsars dans les données radio astronomiques.',
        'https://pulsarai.example.com',
        'pulsar-ai',
        'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000',
        '{"academic": "299", "research": "799"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'TelescopeAI',
        'Contrôle automatisé de télescopes avec optimisation des observations par intelligence artificielle.',
        'https://telescopeai.example.com',
        'telescope-ai',
        'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000',
        '{"amateur": "199", "observatory": "999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'SolarFlare Predict',
        'Prédiction des éruptions solaires et des événements de météorologie spatiale par deep learning.',
        'https://solarflare.example.com',
        'solarflare-predict',
        'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000',
        '{"standard": "299", "premium": "799"}'::jsonb,
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
WHERE c.name = 'Astronomie & Espace';

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
    WHERE name = 'Astronomie & Espace'
);

-- 2. Automobile & Transport
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000'
WHERE name = 'Automobile & Transport';

WITH new_tools (id, name, description, website_url, slug, image_url, pricing, is_active, is_featured) AS (
    VALUES 
    (
        gen_random_uuid(),
        'AutoPilot Pro',
        'Système de conduite autonome avancé intégrant l''apprentissage profond pour une navigation sûre et efficace.',
        'https://autopilot-pro.example.com',
        'autopilot-pro',
        'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000',
        '{"basic": "499", "premium": "999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'FleetOptimize',
        'Solution d''optimisation de flotte utilisant l''IA pour réduire les coûts et améliorer l''efficacité.',
        'https://fleetoptimize.example.com',
        'fleet-optimize',
        'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000',
        '{"starter": "199", "enterprise": "799"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'TrafficPredict',
        'Prédiction du trafic en temps réel avec suggestions d''itinéraires optimisés.',
        'https://trafficpredict.example.com',
        'traffic-predict',
        'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000',
        '{"free": true, "premium": "99"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'CarDiagnostics AI',
        'Diagnostic automobile intelligent utilisant l''analyse sonore et les données des capteurs.',
        'https://cardiagnostics.example.com',
        'car-diagnostics-ai',
        'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000',
        '{"basic": "29", "pro": "99"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'ParkingAI',
        'Solution de stationnement intelligent avec détection des places et guidage automatisé.',
        'https://parkingai.example.com',
        'parking-ai',
        'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000',
        '{"city": "999", "enterprise": "2999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'SafetyNet',
        'Système de sécurité prédictif pour la prévention des accidents.',
        'https://safetynet.example.com',
        'safety-net',
        'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000',
        '{"personal": "199", "fleet": "599"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'EcoRoute',
        'Optimisation écologique des trajets pour réduire l''empreinte carbone.',
        'https://ecoroute.example.com',
        'eco-route',
        'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000',
        '{"free": true, "business": "149"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'MaintPredict',
        'Maintenance prédictive automobile basée sur l''analyse des données en temps réel.',
        'https://maintpredict.example.com',
        'maint-predict',
        'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000',
        '{"garage": "299", "dealer": "999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'ChargeMap AI',
        'Localisation intelligente des bornes de recharge avec prédiction de disponibilité.',
        'https://chargemap.example.com',
        'charge-map-ai',
        'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000',
        '{"free": true, "premium": "79"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'DriveAssist Pro',
        'Assistant de conduite intelligent avec reconnaissance vocale et réalité augmentée.',
        'https://driveassist.example.com',
        'drive-assist-pro',
        'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000',
        '{"basic": "149", "premium": "299"}'::jsonb,
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
    floor(random() * 10000 + 1000)::integer,
    floor(random() * 1000 + 100)::bigint,
    floor(random() * 5000 + 500)::bigint,
    floor(random() * 50000 + 5000)::bigint,
    (random() * 2 + 3)::numeric(3,2)
FROM new_tools t
CROSS JOIN categories c
WHERE c.name = 'Automobile & Transport';

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
    WHERE name = 'Automobile & Transport'
);

COMMIT;
