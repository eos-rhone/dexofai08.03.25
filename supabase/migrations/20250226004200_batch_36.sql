-- Batch 36: Add AI tools (Delicate Grove, Wooden Sunset, Twilight Sea)
BEGIN;

-- Ajout des catégories manquantes
INSERT INTO categories (name, slug, description, icon) VALUES
('E-commerce', 'e-commerce', 'Solutions IA pour le commerce en ligne', 'ShoppingCart'),
('Immobilier', 'immobilier', 'Outils IA pour l''immobilier', 'Home'),
('Juridique', 'juridique', 'Applications IA pour le domaine juridique', 'FileText')
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    icon = EXCLUDED.icon;

-- Delicate Grove
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Shopify Magic',
    'shopify-magic',
    'Suite d''outils IA pour e-commerce',
    'https://shopify.com/magic',
    (SELECT id FROM categories WHERE slug = 'e-commerce'),
    '[{"plan_name": "Basic", "price": 29}, {"plan_name": "Pro", "price": 79}, {"plan_name": "Advanced", "price": 299}]'::jsonb,
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

-- Wooden Sunset
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Zillow AI',
    'zillow-ai',
    'Estimation et prédiction immobilière par IA',
    'https://zillow.com',
    (SELECT id FROM categories WHERE slug = 'immobilier'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 39.99}]'::jsonb,
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

-- Twilight Sea
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Harvey AI',
    'harvey-ai',
    'Assistant juridique alimenté par l''IA',
    'https://harvey.ai',
    (SELECT id FROM categories WHERE slug = 'juridique'),
    '[{"plan_name": "Starter", "price": 49}, {"plan_name": "Professional", "price": 99}]'::jsonb,
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
SELECT id, 'Descriptions produits', 'Génération de descriptions produits' FROM ai_tools WHERE slug = 'shopify-magic'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Marketing IA', 'Campagnes marketing automatisées' FROM ai_tools WHERE slug = 'shopify-magic'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Estimation prix', 'Estimation précise des biens' FROM ai_tools WHERE slug = 'zillow-ai'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Analyse documents', 'Analyse de documents juridiques' FROM ai_tools WHERE slug = 'harvey-ai'
ON CONFLICT DO NOTHING;

COMMIT;
