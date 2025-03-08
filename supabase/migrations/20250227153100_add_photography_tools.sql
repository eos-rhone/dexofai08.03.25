-- Ajouter des outils pour Photographie
BEGIN;

-- Image HD pour Photographie
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?q=80&w=2000'
WHERE name = 'Photographie';

WITH new_tools (id, name, description, website_url, slug, image_url, pricing, is_active, is_featured) AS (
    VALUES 
    (
        gen_random_uuid(),
        'PhotoEnhance AI',
        'Amélioration automatique de photos avec apprentissage profond et préservation des détails.',
        'https://photo-enhance-ai.example.com',
        'photo-enhance-ai',
        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?q=80&w=2000',
        '{"basic": "99", "pro": "299"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'PortraitPro',
        'Retouche de portraits intelligente avec reconnaissance faciale avancée.',
        'https://portrait-pro.example.com',
        'portrait-pro',
        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?q=80&w=2000',
        '{"personal": "149", "studio": "499"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'LightingMaster',
        'Correction automatique d''éclairage et d''exposition avec IA.',
        'https://lighting-master.example.com',
        'lighting-master',
        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?q=80&w=2000',
        '{"free": true, "premium": "199"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'CompositionAI',
        'Assistant de composition photographique en temps réel.',
        'https://composition-ai.example.com',
        'composition-ai',
        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?q=80&w=2000',
        '{"basic": "79", "pro": "249"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'PhotoRestore',
        'Restauration de photos anciennes et endommagées par IA.',
        'https://photo-restore.example.com',
        'photo-restore',
        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?q=80&w=2000',
        '{"personal": "129", "business": "399"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'ColorGrade AI',
        'Étalonnage colorimétrique automatique avec styles personnalisables.',
        'https://color-grade-ai.example.com',
        'color-grade-ai',
        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?q=80&w=2000',
        '{"starter": "149", "pro": "399"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'BatchProcess',
        'Traitement par lots intelligent avec détection de contenu.',
        'https://batch-process.example.com',
        'batch-process',
        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?q=80&w=2000',
        '{"basic": "199", "agency": "599"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'StyleTransfer',
        'Application de styles photographiques avec apprentissage par transfert.',
        'https://style-transfer.example.com',
        'style-transfer',
        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?q=80&w=2000',
        '{"personal": "89", "pro": "299"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'PhotoOrganize',
        'Organisation automatique de bibliothèque photo avec reconnaissance de scènes.',
        'https://photo-organize.example.com',
        'photo-organize',
        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?q=80&w=2000',
        '{"free": true, "premium": "149"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'HDRMaster',
        'Fusion HDR automatique avec alignement intelligent des images.',
        'https://hdr-master.example.com',
        'hdr-master',
        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?q=80&w=2000',
        '{"basic": "129", "pro": "349"}'::jsonb,
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
WHERE c.name = 'Photographie'
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
    WHERE name = 'Photographie'
)
AND NOT EXISTS (
    SELECT 1 FROM ai_tools 
    WHERE ai_tools.slug = t2.slug 
    AND ai_tools.category_id = t2.category_id
);

COMMIT;
