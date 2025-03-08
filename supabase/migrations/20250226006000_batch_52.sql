-- Batch 52: Restore AI tools (Divers - Suite)
BEGIN;

-- GPT Pilot
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'GPT Pilot',
    'gpt-pilot',
    'Développeur IA qui écrit des applications évolutives',
    'https://github.com/Pythagora-io/gpt-pilot',
    (SELECT id FROM categories WHERE slug = 'generation-code'),
    '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
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

-- GPT Teacher
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'GPT Teacher',
    'gpt-teacher',
    'Assistant d''enseignement personnalisé alimenté par l''IA',
    'https://github.com/CognitiveCanvas/GPTTeacher',
    (SELECT id FROM categories WHERE slug = 'agents-automatisation'),
    '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
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

-- GPTStore
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'GPTStore',
    'gptstore',
    'Marketplace pour les agents GPT personnalisés',
    'https://gptstore.ai/',
    (SELECT id FROM categories WHERE slug = 'agents-automatisation'),
    '[{"plan_name": "Free", "price": 0}]'::jsonb,
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

-- IX
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'IX',
    'ix',
    'Framework moderne pour créer des agents IA autonomes',
    'https://github.com/kreneskyp/ix',
    (SELECT id FROM categories WHERE slug = 'agents-automatisation'),
    '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
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

-- Add features
INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Développement complet', 'Génération d''applications' FROM ai_tools WHERE slug = 'gpt-pilot'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Enseignement IA', 'Assistant pédagogique' FROM ai_tools WHERE slug = 'gpt-teacher'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Marketplace GPT', 'Partage d''agents GPT' FROM ai_tools WHERE slug = 'gptstore'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Framework agents', 'Création d''agents IA' FROM ai_tools WHERE slug = 'ix'
ON CONFLICT DO NOTHING;

COMMIT;
