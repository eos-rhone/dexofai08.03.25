-- Ajouter des outils pour Mode & Style
BEGIN;

-- Image HD pour Mode & Style
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1445205170230-053b83016050?q=80&w=2000'
WHERE name = 'Mode & Style';

WITH new_tools (id, name, description, website_url, slug, image_url, pricing, is_active, is_featured) AS (
    VALUES 
    (
        gen_random_uuid(),
        'StyleAI',
        'Assistant personnel de style utilisant l''IA pour des recommandations vestimentaires personnalisées.',
        'https://style-ai.example.com',
        'style-ai',
        'https://images.unsplash.com/photo-1445205170230-053b83016050?q=80&w=2000',
        '{"free": true, "premium": "99"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'FashionDesigner',
        'Outil de conception de mode assistée par IA avec génération de motifs et de styles.',
        'https://fashion-designer.example.com',
        'fashion-designer',
        'https://images.unsplash.com/photo-1445205170230-053b83016050?q=80&w=2000',
        '{"basic": "199", "pro": "499"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'TrendPredict',
        'Prédiction des tendances de mode utilisant l''analyse des données et le machine learning.',
        'https://trend-predict.example.com',
        'trend-predict',
        'https://images.unsplash.com/photo-1445205170230-053b83016050?q=80&w=2000',
        '{"business": "999", "enterprise": "2499"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'VirtualFitting',
        'Essayage virtuel avec technologie 3D et IA pour une expérience réaliste.',
        'https://virtual-fitting.example.com',
        'virtual-fitting',
        'https://images.unsplash.com/photo-1445205170230-053b83016050?q=80&w=2000',
        '{"starter": "149", "business": "599"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'ColorMatch',
        'Assistant d''association de couleurs intelligent pour des tenues harmonieuses.',
        'https://color-match.example.com',
        'color-match',
        'https://images.unsplash.com/photo-1445205170230-053b83016050?q=80&w=2000',
        '{"free": true, "pro": "79"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'WardrobeOptimizer',
        'Optimisation de garde-robe avec suggestions de combinaisons et achats intelligents.',
        'https://wardrobe-optimizer.example.com',
        'wardrobe-optimizer',
        'https://images.unsplash.com/photo-1445205170230-053b83016050?q=80&w=2000',
        '{"basic": "49", "premium": "149"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'SustainableFashion',
        'Recommandations de mode durable avec analyse d''impact environnemental.',
        'https://sustainable-fashion.example.com',
        'sustainable-fashion',
        'https://images.unsplash.com/photo-1445205170230-053b83016050?q=80&w=2000',
        '{"free": true, "premium": "89"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'AccessoryMatch',
        'Assistant de sélection d''accessoires basé sur l''IA et le style personnel.',
        'https://accessory-match.example.com',
        'accessory-match',
        'https://images.unsplash.com/photo-1445205170230-053b83016050?q=80&w=2000',
        '{"basic": "39", "pro": "129"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'StyleInspire',
        'Générateur d''inspiration de style utilisant le deep learning sur les tendances actuelles.',
        'https://style-inspire.example.com',
        'style-inspire',
        'https://images.unsplash.com/photo-1445205170230-053b83016050?q=80&w=2000',
        '{"personal": "59", "influencer": "199"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'FashionAR',
        'Essayage en réalité augmentée avec recommandations personnalisées.',
        'https://fashion-ar.example.com',
        'fashion-ar',
        'https://images.unsplash.com/photo-1445205170230-053b83016050?q=80&w=2000',
        '{"basic": "99", "premium": "299"}'::jsonb,
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
WHERE c.name = 'Mode & Style';

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
    WHERE name = 'Mode & Style'
);

COMMIT;
