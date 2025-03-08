-- Batch 39: Add AI tools (Weathered Pine, Crystal Wave, Rustic Wood)
BEGIN;

-- Ajout des catégories manquantes
INSERT INTO categories (name, slug, description, icon) VALUES
('Agriculture', 'agriculture', 'IA pour l''agriculture', 'Leaf'),
('Météo', 'meteo', 'Prévisions météo par IA', 'Cloud'),
('Construction', 'construction', 'IA pour la construction', 'Tool')
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    icon = EXCLUDED.icon;

-- Weathered Pine
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'FarmGPT',
    'farmgpt',
    'Assistant agricole intelligent',
    'https://farmgpt.ai',
    (SELECT id FROM categories WHERE slug = 'agriculture'),
    '[{"plan_name": "Basic", "price": 29}, {"plan_name": "Pro", "price": 99}]'::jsonb,
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

-- Crystal Wave
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Tomorrow.io',
    'tomorrow-io',
    'Prévisions météo de précision par IA',
    'https://tomorrow.io',
    (SELECT id FROM categories WHERE slug = 'meteo'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Starter", "price": 99}, {"plan_name": "Pro", "price": 199}]'::jsonb,
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

-- Rustic Wood
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'BuildAI',
    'buildai',
    'IA pour la gestion de chantier',
    'https://buildai.construction',
    (SELECT id FROM categories WHERE slug = 'construction'),
    '[{"plan_name": "Starter", "price": 49}, {"plan_name": "Business", "price": 149}, {"plan_name": "Enterprise", "price": 499}]'::jsonb,
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
SELECT id, 'Analyse sols', 'Analyse de la qualité des sols' FROM ai_tools WHERE slug = 'farmgpt'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Prévisions récoltes', 'Prédictions de rendement' FROM ai_tools WHERE slug = 'farmgpt'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Prévisions précises', 'Prévisions hyperlocales' FROM ai_tools WHERE slug = 'tomorrow-io'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Suivi chantier', 'Surveillance automatisée' FROM ai_tools WHERE slug = 'buildai'
ON CONFLICT DO NOTHING;

COMMIT;
