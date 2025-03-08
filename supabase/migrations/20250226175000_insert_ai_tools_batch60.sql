-- Batch 60: Health, Education, and HR Tools
BEGIN;

-- Ada Health
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Ada Health',
    'ada-health',
    'Application d''évaluation de la santé alimentée par l''IA.',
    'https://ada.com/',
    (SELECT id FROM categories WHERE slug = 'health'),
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

-- Babylon Health
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Babylon Health',
    'babylon-health',
    'Service de consultation médicale en ligne utilisant l''IA.',
    'https://www.babylonhealth.com/',
    (SELECT id FROM categories WHERE slug = 'health'),
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

-- Duolingo
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Duolingo',
    'duolingo',
    'Plateforme d''apprentissage des langues utilisant l''IA pour personnaliser l''apprentissage.',
    'https://www.duolingo.com/',
    (SELECT id FROM categories WHERE slug = 'education'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Plus", "price": null}]'::jsonb,
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

-- Carnegie Learning
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Carnegie Learning',
    'carnegie-learning',
    'Plateforme d''apprentissage adaptatif pour les mathématiques.',
    'https://www.carnegielearning.com/',
    (SELECT id FROM categories WHERE slug = 'education'),
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

-- CENTURY
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'CENTURY',
    'century',
    'Plateforme d''apprentissage personnalisé utilisant l''IA.',
    'https://www.century.tech/',
    (SELECT id FROM categories WHERE slug = 'education'),
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

-- Eightfold AI
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Eightfold AI',
    'eightfold-ai',
    'Plateforme de gestion des talents basée sur l''IA.',
    'https://eightfold.ai/',
    (SELECT id FROM categories WHERE slug = 'hr'),
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

-- HiredScore
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'HiredScore',
    'hiredscore',
    'Solution de recrutement et de gestion des talents basée sur l''IA.',
    'https://www.hiredscore.com/',
    (SELECT id FROM categories WHERE slug = 'hr'),
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

-- Pymetrics
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Pymetrics',
    'pymetrics',
    'Plateforme d''évaluation des talents utilisant l''IA et les neurosciences.',
    'https://www.pymetrics.ai/',
    (SELECT id FROM categories WHERE slug = 'hr'),
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

COMMIT;
