-- Batch 34: Add AI tools (Hidden Tooth, Spring Waterfall, Purple Harbor)
BEGIN;

-- Ajout des catégories manquantes
INSERT INTO categories (name, slug, description, icon) VALUES
('3D & Animation', '3d-animation', 'Outils de création 3D et animation', 'Cube'),
('Audio & Musique', 'audio-musique', 'Outils de traitement audio et création musicale', 'Music'),
('Automatisation', 'automatisation', 'Outils d''automatisation des tâches', 'Zap')
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    icon = EXCLUDED.icon;

-- Hidden Tooth
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Blender AI',
    'blender-ai',
    'Suite d''outils IA pour Blender',
    'https://blender.org',
    (SELECT id FROM categories WHERE slug = '3d-animation'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 29.99}]'::jsonb,
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

-- Spring Waterfall
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Descript',
    'descript',
    'Édition audio et vidéo par IA',
    'https://descript.com',
    (SELECT id FROM categories WHERE slug = 'audio-musique'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Creator", "price": 15}, {"plan_name": "Pro", "price": 30}]'::jsonb,
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

-- Purple Harbor
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Zapier AI',
    'zapier-ai',
    'Automatisation des tâches avec IA',
    'https://zapier.com',
    (SELECT id FROM categories WHERE slug = 'automatisation'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Starter", "price": 19.99}, {"plan_name": "Pro", "price": 49}]'::jsonb,
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
SELECT id, 'Modélisation IA', 'Création de modèles 3D assistée' FROM ai_tools WHERE slug = 'blender-ai'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Texturing automatique', 'Génération de textures par IA' FROM ai_tools WHERE slug = 'blender-ai'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Transcription IA', 'Conversion audio en texte' FROM ai_tools WHERE slug = 'descript'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Montage intelligent', 'Édition automatique basée sur le contenu' FROM ai_tools WHERE slug = 'descript'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Automatisation IA', 'Création de workflows intelligents' FROM ai_tools WHERE slug = 'zapier-ai'
ON CONFLICT DO NOTHING;

COMMIT;
