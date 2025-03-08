-- Batch 41: Add AI tools (Heavy Spark, Long Mouse, Muddy Plain)
BEGIN;

-- Ajout des catégories manquantes
INSERT INTO categories (name, slug, description, icon) VALUES
('Industrie', 'industrie', 'IA pour l''industrie 4.0', 'Factory'),
('Automobile', 'automobile', 'Solutions IA automobile', 'Car'),
('Logistique', 'logistique', 'IA pour la logistique', 'Box')
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    icon = EXCLUDED.icon;

-- Heavy Spark
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Siemens MindSphere',
    'siemens-mindsphere',
    'Plateforme IoT industrielle avec IA',
    'https://siemens.mindsphere.io',
    (SELECT id FROM categories WHERE slug = 'industrie'),
    '[{"plan_name": "Start", "price": 199}, {"plan_name": "Advanced", "price": 499}, {"plan_name": "Enterprise", "price": 999}]'::jsonb,
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

-- Long Mouse
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Tesla Autopilot',
    'tesla-autopilot',
    'Système de conduite assistée par IA',
    'https://tesla.com/autopilot',
    (SELECT id FROM categories WHERE slug = 'automobile'),
    '[{"plan_name": "Basic", "price": 199}, {"plan_name": "Enhanced", "price": 399}]'::jsonb,
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

-- Muddy Plain
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Convoy AI',
    'convoy-ai',
    'Optimisation logistique par IA',
    'https://convoy.com',
    (SELECT id FROM categories WHERE slug = 'logistique'),
    '[{"plan_name": "Starter", "price": 299}, {"plan_name": "Business", "price": 599}, {"plan_name": "Enterprise", "price": 1199}]'::jsonb,
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

-- Add features
INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Maintenance prédictive', 'Prévision des pannes' FROM ai_tools WHERE slug = 'siemens-mindsphere'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Optimisation production', 'Optimisation en temps réel' FROM ai_tools WHERE slug = 'siemens-mindsphere'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Conduite assistée', 'Assistance à la conduite' FROM ai_tools WHERE slug = 'tesla-autopilot'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Optimisation routes', 'Optimisation des itinéraires' FROM ai_tools WHERE slug = 'convoy-ai'
ON CONFLICT DO NOTHING;

COMMIT;
