-- Batch 28 Part 2: Add more AI tools
BEGIN;

-- Leonardo.ai
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Leonardo.ai',
    'leonardo-ai',
    'Plateforme de création d''images IA pour les professionnels',
    'https://leonardo.ai',
    (SELECT id FROM categories WHERE slug = 'generation-images'),
    '[{"plan_name": "Basic", "price": 10}, {"plan_name": "Pro", "price": 35}]'::jsonb,
    true,
    false
)
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

-- Playground AI
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Playground AI',
    'playground-ai',
    'Plateforme de génération d''images avec interface intuitive',
    'https://playground.ai',
    (SELECT id FROM categories WHERE slug = 'generation-images'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 15}]'::jsonb,
    true,
    false
)
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

-- AIVA
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'AIVA',
    'aiva',
    'Composition musicale assistée par IA',
    'https://www.aiva.ai',
    (SELECT id FROM categories WHERE slug = 'creation-musicale'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 15}]'::jsonb,
    true,
    false
)
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

-- Amper
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Amper',
    'amper',
    'Création musicale professionnelle par IA',
    'https://www.ampermusic.com',
    (SELECT id FROM categories WHERE slug = 'creation-musicale'),
    '[{"plan_name": "Basic", "price": 20}, {"plan_name": "Pro", "price": 40}]'::jsonb,
    true,
    false
)
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

-- Add tool features
INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'GPT-4', 'Modèle de langage le plus avancé' FROM ai_tools WHERE slug = 'chatgpt'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Plugins', 'Extensions pour fonctionnalités additionnelles' FROM ai_tools WHERE slug = 'chatgpt'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Haute résolution', 'Images jusqu''à 1024x1024 pixels' FROM ai_tools WHERE slug = 'midjourney'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Styles artistiques', 'Large variété de styles disponibles' FROM ai_tools WHERE slug = 'midjourney'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Génération temps réel', 'Création musicale instantanée' FROM ai_tools WHERE slug = 'mubert'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Export haute qualité', 'Formats audio professionnels' FROM ai_tools WHERE slug = 'mubert'
ON CONFLICT DO NOTHING;

-- Update tool stats
UPDATE ai_tools
SET 
    monthly_users = FLOOR(RANDOM() * 1000000),
    total_views = FLOOR(RANDOM() * 2000000),
    total_reviews = FLOOR(RANDOM() * 15000),
    average_rating = 4 + (RANDOM() * 1)
WHERE monthly_users IS NULL;

COMMIT;
