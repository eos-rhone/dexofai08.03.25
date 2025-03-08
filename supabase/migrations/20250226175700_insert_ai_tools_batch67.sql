-- Batch 67: Video Generation and Editing Tools
BEGIN;

-- Synthesia
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Synthesia',
    'synthesia',
    'Créez des vidéos professionnelles avec des avatars IA qui parlent.',
    'https://www.synthesia.io/',
    (SELECT id FROM categories WHERE slug = 'video'),
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

-- Descript
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Descript',
    'descript',
    'Éditeur vidéo et audio tout-en-un avec des fonctionnalités IA avancées.',
    'https://www.descript.com/',
    (SELECT id FROM categories WHERE slug = 'video'),
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

-- InVideo
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'InVideo',
    'invideo',
    'Plateforme de création vidéo en ligne avec assistance IA.',
    'https://invideo.io/',
    (SELECT id FROM categories WHERE slug = 'video'),
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

-- Pictory
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Pictory',
    'pictory',
    'Automatise la création de vidéos courtes à partir de longs contenus.',
    'https://pictory.ai/',
    (SELECT id FROM categories WHERE slug = 'video'),
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

-- Hour One
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Hour One',
    'hour-one',
    'Créez des vidéos avec des présentateurs virtuels à partir de texte.',
    'https://hourone.ai/',
    (SELECT id FROM categories WHERE slug = 'video'),
    '[{"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Kapwing
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Kapwing',
    'kapwing',
    'Éditeur vidéo en ligne avec des fonctionnalités d''IA pour le montage.',
    'https://www.kapwing.com/',
    (SELECT id FROM categories WHERE slug = 'video'),
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

-- Runway
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Runway',
    'runway',
    'Suite créative avec des outils d''édition vidéo basés sur l''IA.',
    'https://runway.ml/',
    (SELECT id FROM categories WHERE slug = 'video'),
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

-- Elai
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Elai',
    'elai',
    'Plateforme de création de vidéos avec des avatars IA personnalisables.',
    'https://elai.io/',
    (SELECT id FROM categories WHERE slug = 'video'),
    '[{"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Steve AI
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Steve AI',
    'steve-ai',
    'Créateur de vidéos automatisé qui transforme du texte en vidéos animées.',
    'https://www.steve.ai/',
    (SELECT id FROM categories WHERE slug = 'video'),
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

-- Pictory
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Pictory',
    'pictory',
    'Outil de création de vidéos qui extrait automatiquement les meilleurs moments.',
    'https://pictory.ai/',
    (SELECT id FROM categories WHERE slug = 'video'),
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

-- Opus Clip
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Opus Clip',
    'opus-clip',
    'Outil qui crée automatiquement des clips viraux à partir de longues vidéos.',
    'https://opus.pro/',
    (SELECT id FROM categories WHERE slug = 'video'),
    '[{"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Veed
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Veed',
    'veed',
    'Plateforme d''édition vidéo en ligne avec des fonctionnalités d''IA.',
    'https://www.veed.io/',
    (SELECT id FROM categories WHERE slug = 'video'),
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

-- Colossyan
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Colossyan',
    'colossyan',
    'Créateur de vidéos d''apprentissage avec des présentateurs IA réalistes.',
    'https://www.colossyan.com/',
    (SELECT id FROM categories WHERE slug = 'video'),
    '[{"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Designs AI
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Designs AI',
    'designs-ai',
    'Suite d''outils créatifs incluant un créateur de vidéos IA.',
    'https://designs.ai/',
    (SELECT id FROM categories WHERE slug = 'video'),
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

COMMIT;
