-- Ajouter des outils pour IoT & Domotique
BEGIN;

-- Image HD pour IoT & Domotique
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?q=80&w=2000'
WHERE name = 'IoT & Domotique';

WITH new_tools (id, name, description, website_url, slug, image_url, pricing, is_active, is_featured) AS (
    VALUES 
    (
        gen_random_uuid(),
        'SmartHome AI',
        'Assistant domotique intelligent avec apprentissage des habitudes et optimisation énergétique.',
        'https://smarthome-ai.example.com',
        'smarthome-ai',
        'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?q=80&w=2000',
        '{"basic": "99", "premium": "299"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'IoT Analytics',
        'Plateforme d''analyse de données IoT en temps réel avec tableaux de bord personnalisables.',
        'https://iot-analytics.example.com',
        'iot-analytics',
        'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?q=80&w=2000',
        '{"startup": "199", "enterprise": "999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'DeviceManager',
        'Gestion centralisée des appareils IoT avec mises à jour automatiques.',
        'https://device-manager.example.com',
        'device-manager',
        'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?q=80&w=2000',
        '{"free": true, "business": "499"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'SecurityGuard',
        'Système de sécurité intelligent pour maison connectée avec détection d''anomalies.',
        'https://security-guard.example.com',
        'security-guard',
        'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?q=80&w=2000',
        '{"home": "149", "pro": "599"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'EnergyOptimizer',
        'Optimisation de la consommation énergétique par IA pour maisons intelligentes.',
        'https://energy-optimizer.example.com',
        'energy-optimizer-iot',
        'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?q=80&w=2000',
        '{"basic": "79", "premium": "249"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'AutomationFlow',
        'Création de scénarios domotiques avancés avec apprentissage automatique.',
        'https://automation-flow.example.com',
        'automation-flow',
        'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?q=80&w=2000',
        '{"free": true, "pro": "199"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'SensorNet',
        'Réseau de capteurs intelligents avec analyse prédictive.',
        'https://sensor-net.example.com',
        'sensor-net',
        'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?q=80&w=2000',
        '{"starter": "299", "business": "899"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'VoiceControl',
        'Contrôle vocal avancé pour maison connectée avec NLP.',
        'https://voice-control.example.com',
        'voice-control',
        'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?q=80&w=2000',
        '{"personal": "99", "family": "249"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'SmartIrrigation',
        'Système d''irrigation intelligent avec adaptation météorologique.',
        'https://smart-irrigation.example.com',
        'smart-irrigation-iot',
        'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?q=80&w=2000',
        '{"basic": "149", "pro": "449"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'ClimateSense',
        'Contrôle climatique intelligent avec apprentissage des préférences.',
        'https://climate-sense.example.com',
        'climate-sense',
        'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?q=80&w=2000',
        '{"home": "199", "business": "699"}'::jsonb,
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
WHERE c.name = 'IoT & Domotique'
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
    WHERE name = 'IoT & Domotique'
)
AND NOT EXISTS (
    SELECT 1 FROM ai_tools 
    WHERE ai_tools.slug = t2.slug 
    AND ai_tools.category_id = t2.category_id
);

COMMIT;
