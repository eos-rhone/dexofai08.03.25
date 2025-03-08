-- Ajouter des outils pour Nanotechnologie
BEGIN;

-- Image HD pour Nanotechnologie
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?q=80&w=2000'
WHERE name = 'Nanotechnologie';

WITH new_tools (id, name, description, website_url, slug, image_url, pricing, is_active, is_featured) AS (
    VALUES 
    (
        gen_random_uuid(),
        'NanoSim',
        'Simulateur de nanostructures avec modélisation moléculaire avancée.',
        'https://nano-sim.example.com',
        'nano-sim',
        'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?q=80&w=2000',
        '{"academic": "499", "enterprise": "1999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'MaterialDesign',
        'Conception de nanomatériaux assistée par IA avec prédiction de propriétés.',
        'https://material-design.example.com',
        'material-design-nano',
        'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?q=80&w=2000',
        '{"research": "799", "industry": "2499"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'NanoFab',
        'Plateforme de fabrication de nanostructures avec contrôle de précision.',
        'https://nano-fab.example.com',
        'nano-fab',
        'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?q=80&w=2000',
        '{"lab": "999", "enterprise": "3999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'BioNano',
        'Outils de nanotechnologie pour applications biomédicales.',
        'https://bio-nano.example.com',
        'bio-nano',
        'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?q=80&w=2000',
        '{"research": "699", "medical": "2499"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'NanoAnalytics',
        'Analyse de données pour caractérisation de nanostructures.',
        'https://nano-analytics.example.com',
        'nano-analytics',
        'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?q=80&w=2000',
        '{"basic": "399", "pro": "1299"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'QuantumNano',
        'Simulation quantique pour nanotechnologies.',
        'https://quantum-nano.example.com',
        'quantum-nano',
        'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?q=80&w=2000',
        '{"academic": "899", "enterprise": "2999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'NanoViz',
        'Visualisation 3D de nanostructures avec réalité augmentée.',
        'https://nano-viz.example.com',
        'nano-viz',
        'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?q=80&w=2000',
        '{"edu": "299", "pro": "999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'SurfaceMap',
        'Cartographie de surface nanométrique avec analyse topographique.',
        'https://surface-map.example.com',
        'surface-map-nano',
        'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?q=80&w=2000',
        '{"research": "599", "industry": "1999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'NanoProcess',
        'Optimisation de processus de fabrication nanométrique.',
        'https://nano-process.example.com',
        'nano-process',
        'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?q=80&w=2000',
        '{"startup": "799", "enterprise": "2499"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'MolecularForge',
        'Conception et simulation de machines moléculaires.',
        'https://molecular-forge.example.com',
        'molecular-forge',
        'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?q=80&w=2000',
        '{"academic": "699", "commercial": "2299"}'::jsonb,
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
WHERE c.name = 'Nanotechnologie'
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
    WHERE name = 'Nanotechnologie'
)
AND NOT EXISTS (
    SELECT 1 FROM ai_tools 
    WHERE ai_tools.slug = t2.slug 
    AND ai_tools.category_id = t2.category_id
);

COMMIT;
