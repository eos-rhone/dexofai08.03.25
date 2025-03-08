-- Batch 29: Add more AI tools (Pink Breeze)
BEGIN;

-- Productivité
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Notion AI',
    'notion-ai',
    'Assistant d''écriture et d''organisation intégré à Notion',
    'https://notion.so',
    (SELECT id FROM categories WHERE slug = 'productivite'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Plus", "price": 10}, {"plan_name": "Business", "price": 20}]'::jsonb,
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

-- Mem.ai
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Mem.ai',
    'mem-ai',
    'Prise de notes augmentée par l''IA',
    'https://mem.ai',
    (SELECT id FROM categories WHERE slug = 'productivite'),
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

-- Design
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Figma AI',
    'figma-ai',
    'Fonctionnalités IA dans Figma',
    'https://figma.com',
    (SELECT id FROM categories WHERE slug = 'design'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 15}, {"plan_name": "Organization", "price": 45}]'::jsonb,
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

-- Vizcom
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Vizcom',
    'vizcom',
    'Transformation de croquis en rendus 3D',
    'https://vizcom.ai',
    (SELECT id FROM categories WHERE slug = 'design'),
    '[{"plan_name": "Basic", "price": 25}, {"plan_name": "Pro", "price": 45}]'::jsonb,
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

-- Développement
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'GitHub Copilot',
    'github-copilot',
    'Assistant de programmation IA',
    'https://github.com/features/copilot',
    (SELECT id FROM categories WHERE slug = 'developpement'),
    '[{"plan_name": "Individual", "price": 10}, {"plan_name": "Business", "price": 19}]'::jsonb,
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

-- Tabnine
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Tabnine',
    'tabnine',
    'Autocomplétion de code par IA',
    'https://tabnine.com',
    (SELECT id FROM categories WHERE slug = 'developpement'),
    '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Pro", "price": 12}, {"plan_name": "Enterprise", "price": 25}]'::jsonb,
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
SELECT id, 'Assistant d''écriture', 'Aide à la rédaction et correction' FROM ai_tools WHERE slug = 'notion-ai'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Organisation intelligente', 'Suggestions d''organisation automatiques' FROM ai_tools WHERE slug = 'notion-ai'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Autocomplétion', 'Suggestions de code en temps réel' FROM ai_tools WHERE slug = 'github-copilot'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Multi-langages', 'Support de nombreux langages de programmation' FROM ai_tools WHERE slug = 'github-copilot'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Plugins IA', 'Suite d''outils IA intégrés' FROM ai_tools WHERE slug = 'figma-ai'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Design System', 'Génération automatique de systèmes de design' FROM ai_tools WHERE slug = 'figma-ai'
ON CONFLICT DO NOTHING;

COMMIT;
