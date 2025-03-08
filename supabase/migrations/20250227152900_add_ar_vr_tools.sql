-- Ajouter des outils pour Réalité augmentée & virtuelle
BEGIN;

-- Image HD pour Réalité augmentée & virtuelle
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1592478411213-6153e4ebc07d?q=80&w=2000'
WHERE name = 'Réalité augmentée & virtuelle';

WITH new_tools (id, name, description, website_url, slug, image_url, pricing, is_active, is_featured) AS (
    VALUES 
    (
        gen_random_uuid(),
        'ARStudio',
        'Studio de développement AR complet avec reconnaissance d''objets et tracking spatial.',
        'https://ar-studio.example.com',
        'ar-studio',
        'https://images.unsplash.com/photo-1592478411213-6153e4ebc07d?q=80&w=2000',
        '{"indie": "299", "enterprise": "999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'VRBuilder',
        'Plateforme de création d''environnements VR avec outils de modélisation 3D.',
        'https://vr-builder.example.com',
        'vr-builder',
        'https://images.unsplash.com/photo-1592478411213-6153e4ebc07d?q=80&w=2000',
        '{"basic": "199", "pro": "799"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'HoloDesign',
        'Outil de conception holographique pour applications AR/VR.',
        'https://holo-design.example.com',
        'holo-design',
        'https://images.unsplash.com/photo-1592478411213-6153e4ebc07d?q=80&w=2000',
        '{"starter": "399", "studio": "1499"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'VirtualSpace',
        'Création d''espaces virtuels collaboratifs pour réunions et formations.',
        'https://virtual-space.example.com',
        'virtual-space',
        'https://images.unsplash.com/photo-1592478411213-6153e4ebc07d?q=80&w=2000',
        '{"team": "499", "enterprise": "1999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'ARCommerce',
        'Solution AR pour e-commerce avec essayage virtuel et visualisation produit.',
        'https://ar-commerce.example.com',
        'ar-commerce',
        'https://images.unsplash.com/photo-1592478411213-6153e4ebc07d?q=80&w=2000',
        '{"startup": "299", "business": "899"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'ImmersiveLearn',
        'Plateforme d''apprentissage immersif en VR avec analytics.',
        'https://immersive-learn.example.com',
        'immersive-learn',
        'https://images.unsplash.com/photo-1592478411213-6153e4ebc07d?q=80&w=2000',
        '{"edu": "199", "corporate": "799"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'ARNavigation',
        'Navigation AR avancée avec intégration de données en temps réel.',
        'https://ar-navigation.example.com',
        'ar-navigation',
        'https://images.unsplash.com/photo-1592478411213-6153e4ebc07d?q=80&w=2000',
        '{"basic": "99", "premium": "399"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'VRPrototype',
        'Outil de prototypage rapide pour applications VR.',
        'https://vr-prototype.example.com',
        'vr-prototype',
        'https://images.unsplash.com/photo-1592478411213-6153e4ebc07d?q=80&w=2000',
        '{"indie": "249", "studio": "899"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'MixedRealityKit',
        'Kit de développement pour applications de réalité mixte.',
        'https://mixed-reality-kit.example.com',
        'mixed-reality-kit',
        'https://images.unsplash.com/photo-1592478411213-6153e4ebc07d?q=80&w=2000',
        '{"free": true, "pro": "599"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'ARAnalytics',
        'Analyse de données et métriques pour applications AR/VR.',
        'https://ar-analytics.example.com',
        'ar-analytics',
        'https://images.unsplash.com/photo-1592478411213-6153e4ebc07d?q=80&w=2000',
        '{"startup": "199", "enterprise": "899"}'::jsonb,
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
WHERE c.name = 'Réalité augmentée & virtuelle'
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
    WHERE name = 'Réalité augmentée & virtuelle'
)
AND NOT EXISTS (
    SELECT 1 FROM ai_tools 
    WHERE ai_tools.slug = t2.slug 
    AND ai_tools.category_id = t2.category_id
);

COMMIT;
