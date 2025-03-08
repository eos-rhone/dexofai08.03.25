-- Batch 45: Restore AI tools (Génération d'Images et Médias)
BEGIN;

-- Midjourney
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Midjourney',
    'midjourney',
    'Outil de génération d''images IA créant des visuels artistiques de haute qualité',
    'https://www.midjourney.com',
    (SELECT id FROM categories WHERE slug = 'generation-images'),
    '[{"plan_name": "Basic", "price": 10}, {"plan_name": "Standard", "price": 30}]'::jsonb,
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

-- DALL-E
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'DALL-E',
    'dall-e',
    'Système de génération d''images par OpenAI capable de créer des images réalistes',
    'https://openai.com/dall-e-2',
    (SELECT id FROM categories WHERE slug = 'generation-images'),
    '[{"plan_name": "Pay-per-use", "price": 0}]'::jsonb,
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

-- Stable Diffusion
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Stable Diffusion',
    'stable-diffusion',
    'Modèle open source de génération d''images à partir de texte',
    'https://stability.ai',
    (SELECT id FROM categories WHERE slug = 'generation-images'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]'::jsonb,
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
    'Plateforme de création vidéo IA avec avatars parlants',
    'https://www.synthesia.io',
    (SELECT id FROM categories WHERE slug = 'video'),
    '[{"plan_name": "Personal", "price": 29}, {"plan_name": "Business", "price": 99}]'::jsonb,
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
SELECT id, 'Images artistiques', 'Création d''images artistiques' FROM ai_tools WHERE slug = 'midjourney'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Images réalistes', 'Génération d''images réalistes' FROM ai_tools WHERE slug = 'dall-e'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Open source', 'Modèle personnalisable' FROM ai_tools WHERE slug = 'stable-diffusion'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Avatars IA', 'Création de présentateurs virtuels' FROM ai_tools WHERE slug = 'synthesia'
ON CONFLICT DO NOTHING;

COMMIT;
