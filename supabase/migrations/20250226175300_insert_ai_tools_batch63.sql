-- Batch 63: Security, Testing, Legal, and Project Management Tools
BEGIN;

-- Darktrace
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Darktrace',
    'darktrace',
    'Plateforme de cybersécurité autonome utilisant l''IA.',
    'https://www.darktrace.com/',
    (SELECT id FROM categories WHERE slug = 'security'),
    '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
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

-- CrowdStrike
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'CrowdStrike',
    'crowdstrike',
    'Protection des endpoints basée sur l''IA.',
    'https://www.crowdstrike.com/',
    (SELECT id FROM categories WHERE slug = 'security'),
    '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
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

-- Testim
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Testim',
    'testim',
    'Tests automatisés alimentés par l''IA.',
    'https://www.testim.io/',
    (SELECT id FROM categories WHERE slug = 'testing'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Mabl
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Mabl',
    'mabl',
    'Tests d''interface utilisateur intelligents.',
    'https://www.mabl.com/',
    (SELECT id FROM categories WHERE slug = 'testing'),
    '[{"plan_name": "Payant", "price": null}]'::jsonb,
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

-- Harvey AI
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Harvey AI',
    'harvey-ai',
    'Assistant juridique alimenté par l''IA.',
    'https://harvey.ai/',
    (SELECT id FROM categories WHERE slug = 'legal'),
    '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
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

-- Spellbook
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Spellbook',
    'spellbook',
    'Rédaction et analyse de contrats avec l''IA.',
    'https://www.spellbook.legal/',
    (SELECT id FROM categories WHERE slug = 'legal'),
    '[{"plan_name": "Payant", "price": null}]'::jsonb,
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

-- ClickUp AI
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'ClickUp AI',
    'clickup-ai',
    'Assistant de gestion de projet alimenté par l''IA.',
    'https://clickup.com/ai',
    (SELECT id FROM categories WHERE slug = 'project'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Motion
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Motion',
    'motion',
    'Planification automatique et intelligente des tâches.',
    'https://www.usemotion.com/',
    (SELECT id FROM categories WHERE slug = 'project'),
    '[{"plan_name": "Payant", "price": null}]'::jsonb,
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

COMMIT;
