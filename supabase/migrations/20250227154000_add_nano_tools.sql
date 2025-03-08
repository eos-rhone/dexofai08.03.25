-- Ajouter des outils pour Nanotechnologie
BEGIN;

-- Image HD pour Nanotechnologie
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1614935151651-0bea6508db6b?q=80&w=2000'
WHERE name = 'Nanotechnologie';

WITH new_tools (id, name, description, website_url, slug, image_url, pricing, is_active, is_featured) AS (
    VALUES 
    (
        gen_random_uuid(),
        'NanoSim Pro',
        'Simulation moléculaire avancée pour la conception de nanostructures.',
        'nano-sim-pro.example.com',
        'nano-sim-pro',
        'https://images.unsplash.com/photo-1614935151651-0bea6508db6b?q=80&w=2000',
        '{"academic": "499", "enterprise": "1999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'AtomicForge',
        'Plateforme de conception atomique pour nanomatériaux.',
        'atomic-forge.example.com',
        'atomic-forge',
        'https://images.unsplash.com/photo-1614935151651-0bea6508db6b?q=80&w=2000',
        '{"basic": "299", "pro": "999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'NanoVision',
        'Visualisation 3D en temps réel de nanostructures.',
        'nano-vision.example.com',
        'nano-vision',
        'https://images.unsplash.com/photo-1614935151651-0bea6508db6b?q=80&w=2000',
        '{"researcher": "399", "lab": "1299"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'QuantumDot',
        'Conception et simulation de points quantiques.',
        'quantum-dot.example.com',
        'quantum-dot',
        'https://images.unsplash.com/photo-1614935151651-0bea6508db6b?q=80&w=2000',
        '{"standard": "599", "premium": "1499"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'NanoCAD',
        'CAO spécialisée pour la nanotechnologie.',
        'nano-cad.example.com',
        'nano-cad',
        'https://images.unsplash.com/photo-1614935151651-0bea6508db6b?q=80&w=2000',
        '{"edu": "199", "commercial": "899"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'MolecularFlow',
        'Simulation de flux moléculaires dans les nanostructures.',
        'molecular-flow.example.com',
        'molecular-flow',
        'https://images.unsplash.com/photo-1614935151651-0bea6508db6b?q=80&w=2000',
        '{"academic": "299", "industry": "999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'NanoAnalyzer',
        'Analyse de données pour caractérisation de nanomatériaux.',
        'nano-analyzer.example.com',
        'nano-analyzer',
        'https://images.unsplash.com/photo-1614935151651-0bea6508db6b?q=80&w=2000',
        '{"basic": "199", "advanced": "699"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'BioNanoDesign',
        'Conception de nanostructures pour applications biomédicales.',
        'bio-nano-design.example.com',
        'bio-nano-design',
        'https://images.unsplash.com/photo-1614935151651-0bea6508db6b?q=80&w=2000',
        '{"researcher": "399", "medical": "1299"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'NanoFab AI',
        'IA pour l''optimisation des processus de nanofabrication.',
        'nano-fab-ai.example.com',
        'nano-fab-ai',
        'https://images.unsplash.com/photo-1614935151651-0bea6508db6b?q=80&w=2000',
        '{"startup": "799", "enterprise": "2499"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'SurfaceMap Pro',
        'Cartographie de surface nanométrique avec analyse topographique.',
        'surface-map-pro.example.com',
        'surface-map-pro',
        'https://images.unsplash.com/photo-1614935151651-0bea6508db6b?q=80&w=2000',
        '{"basic": "299", "pro": "999"}'::jsonb,
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
WHERE c.name = 'Nanotechnologie';

-- Copier dans ai_tools
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
