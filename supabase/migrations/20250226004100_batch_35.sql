-- Batch 35: Add AI tools (Fancy Cherry, Pale Frost, Winter Beacon)
BEGIN;

-- Ajout des catégories manquantes
INSERT INTO categories (name, slug, description, icon) VALUES
('Traduction', 'traduction', 'Outils de traduction et localisation', 'Globe'),
('Finance', 'finance', 'Outils financiers et analytiques', 'DollarSign'),
('Santé', 'sante', 'Applications IA pour la santé', 'Heart')
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    icon = EXCLUDED.icon;

-- Fancy Cherry
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'DeepL Write',
    'deepl-write',
    'Assistant d''écriture et traduction IA',
    'https://deepl.com/write',
    (SELECT id FROM categories WHERE slug = 'traduction'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 25}]'::jsonb,
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

-- Pale Frost
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'TradingView AI',
    'tradingview-ai',
    'Analyse technique et prédictions boursières',
    'https://tradingview.com',
    (SELECT id FROM categories WHERE slug = 'finance'),
    '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Pro", "price": 14.95}, {"plan_name": "Premium", "price": 29.95}]'::jsonb,
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

-- Winter Beacon
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Ada Health',
    'ada-health',
    'Assistant santé personnel par IA',
    'https://ada.com',
    (SELECT id FROM categories WHERE slug = 'sante'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 9.99}]'::jsonb,
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
SELECT id, 'Correction style', 'Amélioration du style d''écriture' FROM ai_tools WHERE slug = 'deepl-write'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Multi-langues', 'Support de nombreuses langues' FROM ai_tools WHERE slug = 'deepl-write'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Analyse prédictive', 'Prédictions basées sur l''IA' FROM ai_tools WHERE slug = 'tradingview-ai'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Diagnostic IA', 'Évaluation des symptômes par IA' FROM ai_tools WHERE slug = 'ada-health'
ON CONFLICT DO NOTHING;

COMMIT;
