-- Batch 57: Specialized AI Tools (Translation, Data Analysis, Programming, Research)
BEGIN;

-- DeepL
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'DeepL',
    'deepl',
    'Service de traduction automatique utilisant des réseaux de neurones profonds.',
    'https://www.deepl.com/',
    (SELECT id FROM categories WHERE slug = 'translation'),
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

-- Tabnine
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Tabnine',
    'tabnine',
    'Assistant de codage IA qui prédit et suggère votre prochain code en temps réel.',
    'https://www.tabnine.com/',
    (SELECT id FROM categories WHERE slug = 'code'),
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

-- Amazon CodeWhisperer
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Amazon CodeWhisperer',
    'amazon-codewhisperer',
    'Assistant de codage IA qui génère des suggestions de code en temps réel.',
    'https://aws.amazon.com/codewhisperer/',
    (SELECT id FROM categories WHERE slug = 'code'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Codeium
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Codeium',
    'codeium',
    'Assistant de codage IA moderne et gratuit.',
    'https://codeium.com/',
    (SELECT id FROM categories WHERE slug = 'code'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Enterprise", "price": null}]'::jsonb,
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

-- Replit
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Replit',
    'replit',
    'IDE en ligne avec des capacités d''IA pour le développement collaboratif.',
    'https://replit.com/',
    (SELECT id FROM categories WHERE slug = 'code'),
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

-- Wolfram Alpha
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Wolfram Alpha',
    'wolfram-alpha',
    'Moteur de connaissance computationnelle qui répond directement aux questions.',
    'https://www.wolframalpha.com/',
    (SELECT id FROM categories WHERE slug = 'research'),
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

-- Elicit
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Elicit',
    'elicit',
    'Assistant de recherche IA qui aide à trouver et comprendre les articles scientifiques.',
    'https://elicit.org/',
    (SELECT id FROM categories WHERE slug = 'research'),
    '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
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

-- Consensus
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Consensus',
    'consensus',
    'Moteur de recherche IA pour la recherche académique.',
    'https://consensus.app/',
    (SELECT id FROM categories WHERE slug = 'research'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Scispace
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Scispace',
    'scispace',
    'Plateforme de découverte de recherche alimentée par l''IA.',
    'https://scispace.com/',
    (SELECT id FROM categories WHERE slug = 'research'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Paperpal
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Paperpal',
    'paperpal',
    'Assistant d''écriture académique alimenté par l''IA.',
    'https://paperpal.com/',
    (SELECT id FROM categories WHERE slug = 'research'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Premium", "price": null}]'::jsonb,
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

-- Mendeley
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Mendeley',
    'mendeley',
    'Gestionnaire de références et réseau social académique avec fonctionnalités d''IA.',
    'https://www.mendeley.com/',
    (SELECT id FROM categories WHERE slug = 'research'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Premium", "price": null}]'::jsonb,
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
