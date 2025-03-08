-- Batch 38: Add AI tools (Winter Grove, Still Lantern, Twilight Villa)
BEGIN;

-- Ajout des catégories manquantes
INSERT INTO categories (name, slug, description, icon) VALUES
('Gaming', 'gaming', 'IA pour les jeux vidéo', 'Gamepad'),
('Mode & Style', 'mode-style', 'IA pour la mode et le style', 'Scissors'),
('Sport & Fitness', 'sport-fitness', 'Applications IA pour le sport', 'Activity')
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    icon = EXCLUDED.icon;

-- Winter Grove
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Unity AI',
    'unity-ai',
    'Suite d''outils IA pour Unity',
    'https://unity.com/products/ai',
    (SELECT id FROM categories WHERE slug = 'gaming'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Plus", "price": 40}, {"plan_name": "Pro", "price": 150}]'::jsonb,
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

-- Still Lantern
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'StyleDNA',
    'styledna',
    'Assistant mode personnel par IA',
    'https://styledna.ai',
    (SELECT id FROM categories WHERE slug = 'mode-style'),
    '[{"plan_name": "Basic", "price": 9.99}, {"plan_name": "Premium", "price": 19.99}]'::jsonb,
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

-- Twilight Villa
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'FitAI',
    'fitai',
    'Coach sportif personnel IA',
    'https://fitai.com',
    (SELECT id FROM categories WHERE slug = 'sport-fitness'),
    '[{"plan_name": "Basic", "price": 14.99}, {"plan_name": "Pro", "price": 29.99}]'::jsonb,
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
SELECT id, 'NPCs intelligents', 'Création de NPCs avec IA' FROM ai_tools WHERE slug = 'unity-ai'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Game testing', 'Tests automatisés par IA' FROM ai_tools WHERE slug = 'unity-ai'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Recommandations mode', 'Suggestions de style personnalisées' FROM ai_tools WHERE slug = 'styledna'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Analyse posture', 'Correction de posture en temps réel' FROM ai_tools WHERE slug = 'fitai'
ON CONFLICT DO NOTHING;

COMMIT;
