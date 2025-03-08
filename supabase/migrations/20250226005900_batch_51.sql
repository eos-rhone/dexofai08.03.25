-- Batch 51: Restore AI tools (Divers)
BEGIN;

-- Deepset Cloud
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Deepset Cloud',
    'deepset-cloud',
    'Plateforme NLP pour construire des applications de recherche sémantique',
    'https://www.deepset.ai/deepset-cloud',
    (SELECT id FROM categories WHERE slug = 'outils-donnees'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 99}]'::jsonb,
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

-- Devin
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Devin',
    'devin',
    'Premier ingénieur logiciel IA autonome au monde',
    'https://www.cognition-labs.com/devin',
    (SELECT id FROM categories WHERE slug = 'agents-automatisation'),
    '[{"plan_name": "Contact Sales", "price": 0}]'::jsonb,
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

-- DocsGPT
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'DocsGPT',
    'docsgpt',
    'Solution open-source pour interroger la documentation technique',
    'https://docsgpt.ai/',
    (SELECT id FROM categories WHERE slug = 'outils-donnees'),
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

-- FlowiseAI
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'FlowiseAI',
    'flowiseai',
    'Interface drag & drop pour construire des flux LangChain',
    'https://flowiseai.com/',
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
SELECT id, 'Recherche sémantique', 'NLP et recherche sémantique' FROM ai_tools WHERE slug = 'deepset-cloud'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Développement autonome', 'Ingénieur logiciel IA' FROM ai_tools WHERE slug = 'devin'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Documentation IA', 'Interrogation de docs techniques' FROM ai_tools WHERE slug = 'docsgpt'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Interface visuelle', 'Construction de flux LangChain' FROM ai_tools WHERE slug = 'flowiseai'
ON CONFLICT DO NOTHING;

COMMIT;
