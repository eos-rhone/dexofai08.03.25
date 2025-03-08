-- Batch 37: Add AI tools (Bronze Bonus, Misty Reef, Bright Term)
BEGIN;

-- Ajout des catégories manquantes
INSERT INTO categories (name, slug, description, icon) VALUES
('RH & Recrutement', 'rh-recrutement', 'Outils IA pour les ressources humaines', 'Users'),
('Science & Recherche', 'science-recherche', 'Applications IA pour la recherche scientifique', 'Flask'),
('IoT & Robotique', 'iot-robotique', 'Solutions IA pour l''IoT et la robotique', 'Cpu')
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    icon = EXCLUDED.icon;

-- Bronze Bonus
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'HiredScore',
    'hiredscore',
    'Plateforme de recrutement IA',
    'https://hiredscore.com',
    (SELECT id FROM categories WHERE slug = 'rh-recrutement'),
    '[{"plan_name": "Team", "price": 99}, {"plan_name": "Enterprise", "price": 299}]'::jsonb,
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

-- Misty Reef
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'DeepMind Research',
    'deepmind-research',
    'Outils IA pour la recherche scientifique',
    'https://deepmind.com/research',
    (SELECT id FROM categories WHERE slug = 'science-recherche'),
    '[{"plan_name": "Academic", "price": 0}, {"plan_name": "Enterprise", "price": 499}]'::jsonb,
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

-- Bright Term
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Edge Impulse',
    'edge-impulse',
    'Plateforme de développement IoT avec IA',
    'https://edgeimpulse.com',
    (SELECT id FROM categories WHERE slug = 'iot-robotique'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 49}, {"plan_name": "Enterprise", "price": 199}]'::jsonb,
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
SELECT id, 'Matching CV', 'Correspondance CV-poste automatique' FROM ai_tools WHERE slug = 'hiredscore'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Analyse prédictive', 'Prédiction de performance' FROM ai_tools WHERE slug = 'hiredscore'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Analyse données', 'Analyse de données scientifiques' FROM ai_tools WHERE slug = 'deepmind-research'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'ML embarqué', 'Machine Learning sur appareils IoT' FROM ai_tools WHERE slug = 'edge-impulse'
ON CONFLICT DO NOTHING;

COMMIT;
