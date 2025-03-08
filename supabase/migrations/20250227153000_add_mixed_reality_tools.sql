-- Ajouter des outils pour Réalité Mixte
BEGIN;

-- Image HD pour Réalité Mixte
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1622979135225-d2ba269cf1ac?q=80&w=2000'
WHERE name = 'Réalité Mixte';

WITH new_tools (id, name, description, website_url, slug, image_url, pricing, is_active, is_featured) AS (
    VALUES 
    (
        gen_random_uuid(),
        'MixedLab',
        'Environnement de développement complet pour applications de réalité mixte avec outils de simulation avancés.',
        'https://mixed-lab.example.com',
        'mixed-lab',
        'https://images.unsplash.com/photo-1622979135225-d2ba269cf1ac?q=80&w=2000',
        '{"pro": "499", "enterprise": "1499"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'HoloInteract',
        'Plateforme d''interaction holographique pour expériences immersives en réalité mixte.',
        'https://holo-interact.example.com',
        'holo-interact',
        'https://images.unsplash.com/photo-1622979135225-d2ba269cf1ac?q=80&w=2000',
        '{"basic": "299", "premium": "899"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'MixedWorkspace',
        'Espace de travail collaboratif en réalité mixte pour équipes distantes.',
        'https://mixed-workspace.example.com',
        'mixed-workspace',
        'https://images.unsplash.com/photo-1622979135225-d2ba269cf1ac?q=80&w=2000',
        '{"team": "699", "enterprise": "2499"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'RealityBlend',
        'Moteur de fusion réel-virtuel avec reconnaissance d''environnement en temps réel.',
        'https://reality-blend.example.com',
        'reality-blend',
        'https://images.unsplash.com/photo-1622979135225-d2ba269cf1ac?q=80&w=2000',
        '{"startup": "399", "business": "1299"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'MixedTraining',
        'Plateforme de formation professionnelle en réalité mixte avec scenarios personnalisables.',
        'https://mixed-training.example.com',
        'mixed-training',
        'https://images.unsplash.com/photo-1622979135225-d2ba269cf1ac?q=80&w=2000',
        '{"edu": "299", "corporate": "999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'HoloMedical',
        'Solutions de réalité mixte pour la visualisation médicale et la chirurgie assistée.',
        'https://holo-medical.example.com',
        'holo-medical',
        'https://images.unsplash.com/photo-1622979135225-d2ba269cf1ac?q=80&w=2000',
        '{"clinic": "799", "hospital": "2999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'MixedDesign',
        'Outils de conception industrielle en réalité mixte avec collaboration en temps réel.',
        'https://mixed-design.example.com',
        'mixed-design',
        'https://images.unsplash.com/photo-1622979135225-d2ba269cf1ac?q=80&w=2000',
        '{"designer": "399", "studio": "1199"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'RealityCapture',
        'Système de capture et reconstruction 3D pour environnements mixtes.',
        'https://reality-capture.example.com',
        'reality-capture',
        'https://images.unsplash.com/photo-1622979135225-d2ba269cf1ac?q=80&w=2000',
        '{"basic": "499", "pro": "1499"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'MixedRetail',
        'Solutions de commerce en réalité mixte avec essayage virtuel et personnalisation.',
        'https://mixed-retail.example.com',
        'mixed-retail',
        'https://images.unsplash.com/photo-1622979135225-d2ba269cf1ac?q=80&w=2000',
        '{"shop": "299", "enterprise": "999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'HoloPresence',
        'Système de téléprésence holographique pour réunions et événements.',
        'https://holo-presence.example.com',
        'holo-presence',
        'https://images.unsplash.com/photo-1622979135225-d2ba269cf1ac?q=80&w=2000',
        '{"personal": "599", "business": "1999"}'::jsonb,
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
WHERE c.name = 'Réalité Mixte'
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
    WHERE name = 'Réalité Mixte'
)
AND NOT EXISTS (
    SELECT 1 FROM ai_tools 
    WHERE ai_tools.slug = t2.slug 
    AND ai_tools.category_id = t2.category_id
);

COMMIT;
