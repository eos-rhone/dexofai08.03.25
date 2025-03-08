-- Ajouter des outils pour Océanographie
BEGIN;

-- Image HD pour Océanographie
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1488188840666-e2308741a62f?q=80&w=2000'
WHERE name = 'Océanographie';

WITH new_tools (id, name, description, website_url, slug, image_url, pricing, is_active, is_featured) AS (
    VALUES 
    (
        gen_random_uuid(),
        'OceanFlow',
        'Modélisation des courants océaniques avec prévision en temps réel.',
        'https://ocean-flow.example.com',
        'ocean-flow',
        'https://images.unsplash.com/photo-1488188840666-e2308741a62f?q=80&w=2000',
        '{"research": "599", "enterprise": "1999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'MarineLife',
        'Analyse et suivi des écosystèmes marins par IA.',
        'https://marine-life.example.com',
        'marine-life',
        'https://images.unsplash.com/photo-1488188840666-e2308741a62f?q=80&w=2000',
        '{"basic": "299", "pro": "899"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'WavePredict',
        'Prévision des vagues et conditions maritimes par apprentissage profond.',
        'https://wave-predict.example.com',
        'wave-predict',
        'https://images.unsplash.com/photo-1488188840666-e2308741a62f?q=80&w=2000',
        '{"standard": "399", "premium": "999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'OceanTemp',
        'Surveillance des températures océaniques et analyse des anomalies.',
        'https://ocean-temp.example.com',
        'ocean-temp',
        'https://images.unsplash.com/photo-1488188840666-e2308741a62f?q=80&w=2000',
        '{"basic": "199", "research": "699"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'SeabedMap',
        'Cartographie des fonds marins avec analyse topographique.',
        'https://seabed-map.example.com',
        'seabed-map',
        'https://images.unsplash.com/photo-1488188840666-e2308741a62f?q=80&w=2000',
        '{"explorer": "499", "professional": "1499"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'MarineSonar',
        'Analyse acoustique sous-marine avec détection d''objets.',
        'https://marine-sonar.example.com',
        'marine-sonar',
        'https://images.unsplash.com/photo-1488188840666-e2308741a62f?q=80&w=2000',
        '{"basic": "799", "enterprise": "2499"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'OceanChem',
        'Analyse chimique des eaux océaniques et prévision de la qualité.',
        'https://ocean-chem.example.com',
        'ocean-chem',
        'https://images.unsplash.com/photo-1488188840666-e2308741a62f?q=80&w=2000',
        '{"research": "399", "industry": "1299"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'CoralWatch',
        'Surveillance des récifs coralliens avec analyse d''images satellites.',
        'https://coral-watch.example.com',
        'coral-watch',
        'https://images.unsplash.com/photo-1488188840666-e2308741a62f?q=80&w=2000',
        '{"conservation": "299", "research": "899"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'TideAnalytics',
        'Analyse et prédiction des marées avec facteurs environnementaux.',
        'https://tide-analytics.example.com',
        'tide-analytics',
        'https://images.unsplash.com/photo-1488188840666-e2308741a62f?q=80&w=2000',
        '{"basic": "199", "pro": "599"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'OceanViz',
        'Visualisation 3D des données océanographiques en temps réel.',
        'https://ocean-viz.example.com',
        'ocean-viz',
        'https://images.unsplash.com/photo-1488188840666-e2308741a62f?q=80&w=2000',
        '{"standard": "399", "enterprise": "1199"}'::jsonb,
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
WHERE c.name = 'Océanographie'
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
    WHERE name = 'Océanographie'
)
AND NOT EXISTS (
    SELECT 1 FROM ai_tools 
    WHERE ai_tools.slug = t2.slug 
    AND ai_tools.category_id = t2.category_id
);

COMMIT;
