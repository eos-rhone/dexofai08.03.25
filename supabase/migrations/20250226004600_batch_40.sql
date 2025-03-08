-- Batch 40: Add AI tools (Smooth Delta, Steep Band, Precious Term)
BEGIN;

-- Ajout des catégories manquantes
INSERT INTO categories (name, slug, description, icon) VALUES
('Transport', 'transport', 'IA pour les transports', 'Truck'),
('Énergie', 'energie', 'Solutions IA pour l''énergie', 'Zap'),
('Cybersécurité', 'cybersecurite', 'IA pour la sécurité informatique', 'Shield')
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    icon = EXCLUDED.icon;

-- Smooth Delta
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Waymo AI',
    'waymo-ai',
    'IA pour véhicules autonomes',
    'https://waymo.com',
    (SELECT id FROM categories WHERE slug = 'transport'),
    '[{"plan_name": "Enterprise", "price": 999}]'::jsonb,
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

-- Steep Band
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'GridAI',
    'gridai',
    'Optimisation des réseaux électriques par IA',
    'https://gridai.energy',
    (SELECT id FROM categories WHERE slug = 'energie'),
    '[{"plan_name": "Basic", "price": 199}, {"plan_name": "Enterprise", "price": 999}]'::jsonb,
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

-- Precious Term
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Darktrace',
    'darktrace',
    'Cybersécurité autonome par IA',
    'https://darktrace.com',
    (SELECT id FROM categories WHERE slug = 'cybersecurite'),
    '[{"plan_name": "Enterprise", "price": 499}, {"plan_name": "Custom", "price": 999}]'::jsonb,
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
SELECT id, 'Navigation autonome', 'Conduite 100% autonome' FROM ai_tools WHERE slug = 'waymo-ai'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Sécurité avancée', 'Systèmes de sécurité IA' FROM ai_tools WHERE slug = 'waymo-ai'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Optimisation réseau', 'Gestion intelligente du réseau' FROM ai_tools WHERE slug = 'gridai'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Détection menaces', 'Détection en temps réel' FROM ai_tools WHERE slug = 'darktrace'
ON CONFLICT DO NOTHING;

COMMIT;
