-- Batch 30: Add more AI tools (Black Shrine)
BEGIN;

-- Éducation
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Duolingo Max',
    'duolingo-max',
    'Apprentissage des langues avec IA',
    'https://duolingo.com',
    (SELECT id FROM categories WHERE slug = 'education'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Super", "price": 7}, {"plan_name": "Max", "price": 30}]'::jsonb,
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

-- Coursera AI
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Coursera AI',
    'coursera-ai',
    'Assistant d''apprentissage personnalisé',
    'https://coursera.org',
    (SELECT id FROM categories WHERE slug = 'education'),
    '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Plus", "price": 59}]'::jsonb,
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

-- Vidéo & Animation
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Runway',
    'runway',
    'Édition vidéo et effets spéciaux par IA',
    'https://runway.ml',
    (SELECT id FROM categories WHERE slug = 'video-animation'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Standard", "price": 15}, {"plan_name": "Pro", "price": 35}]'::jsonb,
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

-- Synthesia
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Synthesia',
    'synthesia',
    'Création de vidéos avec présentateurs virtuels',
    'https://synthesia.io',
    (SELECT id FROM categories WHERE slug = 'video-animation'),
    '[{"plan_name": "Personal", "price": 29}, {"plan_name": "Pro", "price": 99}]'::jsonb,
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

-- Rédaction & Contenu
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Jasper',
    'jasper',
    'Rédaction de contenu marketing par IA',
    'https://jasper.ai',
    (SELECT id FROM categories WHERE slug = 'redaction-contenu'),
    '[{"plan_name": "Creator", "price": 39}, {"plan_name": "Teams", "price": 99}]'::jsonb,
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

-- Copy.ai
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Copy.ai',
    'copy-ai',
    'Génération de textes marketing',
    'https://copy.ai',
    (SELECT id FROM categories WHERE slug = 'redaction-contenu'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 36}]'::jsonb,
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
SELECT id, 'Conversations IA', 'Pratique des langues avec IA' FROM ai_tools WHERE slug = 'duolingo-max'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Correction intelligente', 'Feedback personnalisé en temps réel' FROM ai_tools WHERE slug = 'duolingo-max'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Effets spéciaux IA', 'Génération d''effets visuels' FROM ai_tools WHERE slug = 'runway'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Édition simplifiée', 'Interface intuitive pour l''édition' FROM ai_tools WHERE slug = 'runway'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Rédaction longue', 'Création d''articles complets' FROM ai_tools WHERE slug = 'jasper'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Templates marketing', 'Modèles pour différents contenus' FROM ai_tools WHERE slug = 'jasper'
ON CONFLICT DO NOTHING;

COMMIT;
