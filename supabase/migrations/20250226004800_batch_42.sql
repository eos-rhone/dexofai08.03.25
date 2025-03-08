-- Batch 42: Add AI tools (Ivory Rice, Silent Lagoon, Orange Bird)
BEGIN;

-- Ajout des catégories manquantes
INSERT INTO categories (name, slug, description, icon) VALUES
('Agroalimentaire', 'agroalimentaire', 'IA pour l''industrie alimentaire', 'Coffee'),
('Environnement', 'environnement', 'Solutions IA pour l''environnement', 'Leaf'),
('Aviation', 'aviation', 'IA pour l''aviation', 'Plane')
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    icon = EXCLUDED.icon;

-- Ivory Rice
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'FoodGenius',
    'foodgenius',
    'IA pour l''optimisation alimentaire',
    'https://foodgenius.ai',
    (SELECT id FROM categories WHERE slug = 'agroalimentaire'),
    '[{"plan_name": "Basic", "price": 99}, {"plan_name": "Pro", "price": 299}, {"plan_name": "Enterprise", "price": 799}]'::jsonb,
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

-- Silent Lagoon
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'ClimateAI',
    'climate-ai',
    'Analyse climatique par IA',
    'https://climate.ai',
    (SELECT id FROM categories WHERE slug = 'environnement'),
    '[{"plan_name": "Research", "price": 0}, {"plan_name": "Business", "price": 499}, {"plan_name": "Enterprise", "price": 999}]'::jsonb,
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

-- Orange Bird
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'AirNav AI',
    'airnav-ai',
    'IA pour le contrôle aérien',
    'https://airnav.ai',
    (SELECT id FROM categories WHERE slug = 'aviation'),
    '[{"plan_name": "Pro", "price": 599}, {"plan_name": "Enterprise", "price": 1499}]'::jsonb,
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
SELECT id, 'Analyse qualité', 'Contrôle qualité alimentaire' FROM ai_tools WHERE slug = 'foodgenius'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Optimisation recettes', 'Amélioration des recettes' FROM ai_tools WHERE slug = 'foodgenius'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Prévisions climat', 'Modélisation climatique' FROM ai_tools WHERE slug = 'climate-ai'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Gestion trafic', 'Optimisation du trafic aérien' FROM ai_tools WHERE slug = 'airnav-ai'
ON CONFLICT DO NOTHING;

COMMIT;
