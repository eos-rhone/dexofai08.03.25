-- Batch 30 Part 2: Add more AI tools (Black Shrine)
BEGIN;

-- Voix & Parole
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'ElevenLabs',
    'elevenlabs',
    'Synthèse vocale ultra-réaliste',
    'https://elevenlabs.io',
    (SELECT id FROM categories WHERE slug = 'voix-parole'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Starter", "price": 5}, {"plan_name": "Creator", "price": 22}, {"plan_name": "Pro", "price": 99}]'::jsonb,
    true,
    true
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

-- Murf
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Murf',
    'murf',
    'Studio de voix-off IA',
    'https://murf.ai',
    (SELECT id FROM categories WHERE slug = 'voix-parole'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Basic", "price": 29}, {"plan_name": "Pro", "price": 39}]'::jsonb,
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

-- Business & Marketing
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Markopolo',
    'markopolo',
    'Création de campagnes publicitaires par IA',
    'https://markopolo.ai',
    (SELECT id FROM categories WHERE slug = 'business-marketing'),
    '[{"plan_name": "Starter", "price": 49}, {"plan_name": "Growth", "price": 99}, {"plan_name": "Enterprise", "price": 199}]'::jsonb,
    true,
    true
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

-- Frase
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Frase',
    'frase',
    'Optimisation SEO et création de contenu',
    'https://frase.io',
    (SELECT id FROM categories WHERE slug = 'business-marketing'),
    '[{"plan_name": "Basic", "price": 19.99}, {"plan_name": "Team", "price": 44.99}, {"plan_name": "Enterprise", "price": 199.99}]'::jsonb,
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
SELECT id, 'Voix multilingues', 'Support de nombreuses langues' FROM ai_tools WHERE slug = 'elevenlabs'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Clonage vocal', 'Création de voix personnalisées' FROM ai_tools WHERE slug = 'elevenlabs'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Automatisation marketing', 'Création automatique de campagnes' FROM ai_tools WHERE slug = 'markopolo'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Analytics avancés', 'Suivi des performances marketing' FROM ai_tools WHERE slug = 'markopolo'
ON CONFLICT DO NOTHING;

COMMIT;
