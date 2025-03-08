-- Batch 71: Archaeology Tools
BEGIN;

-- ArchAI
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'ArchAI',
    'archai',
    'Système d''IA pour la détection et l''analyse de sites archéologiques.',
    'https://www.arch-ai.org/',
    (SELECT id FROM categories WHERE slug = 'archaeology'),
    '[{"plan_name": "Research", "price": null}]'::jsonb,
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

-- Archaeological Predictor
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Archaeological Predictor',
    'archaeological-predictor',
    'Outil de prédiction des sites archéologiques basé sur l''apprentissage automatique.',
    'https://archaeologicalpredictor.com/',
    (SELECT id FROM categories WHERE slug = 'archaeology'),
    '[{"plan_name": "Research", "price": null}]'::jsonb,
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

-- Digital Archaeology Tool
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Digital Archaeology Tool',
    'digital-archaeology-tool',
    'Suite d''outils numériques pour l''analyse archéologique avec IA.',
    'https://digitalarchaeology.org.uk/',
    (SELECT id FROM categories WHERE slug = 'archaeology'),
    '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
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

-- Heritage AI
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Heritage AI',
    'heritage-ai',
    'Plateforme d''IA pour la préservation et l''analyse du patrimoine culturel.',
    'https://heritage-ai.org/',
    (SELECT id FROM categories WHERE slug = 'archaeology'),
    '[{"plan_name": "Research", "price": null}]'::jsonb,
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

-- Artefacts Analyzer
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Artefacts Analyzer',
    'artefacts-analyzer',
    'Outil d''analyse d''artefacts archéologiques utilisant l''IA.',
    'https://artefactsanalyzer.com/',
    (SELECT id FROM categories WHERE slug = 'archaeology'),
    '[{"plan_name": "Pro", "price": null}]'::jsonb,
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

-- ArchaeoGPT
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'ArchaeoGPT',
    'archaeogpt',
    'Assistant IA spécialisé dans l''analyse de données archéologiques.',
    'https://archaeogpt.org/',
    (SELECT id FROM categories WHERE slug = 'archaeology'),
    '[{"plan_name": "Research", "price": null}]'::jsonb,
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

-- Archaeological Vision
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Archaeological Vision',
    'archaeological-vision',
    'Système de vision par ordinateur pour l''analyse de sites archéologiques.',
    'https://archaeologicalvision.com/',
    (SELECT id FROM categories WHERE slug = 'archaeology'),
    '[{"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Pottery Analyzer
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Pottery Analyzer',
    'pottery-analyzer',
    'Outil d''analyse de poteries anciennes utilisant l''apprentissage profond.',
    'https://potteryanalyzer.org/',
    (SELECT id FROM categories WHERE slug = 'archaeology'),
    '[{"plan_name": "Research", "price": null}]'::jsonb,
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
