-- Batch 27: Add new categories and tools
BEGIN;

-- Add new categories
INSERT INTO categories (name, slug, description, icon) VALUES
('Éducation', 'education', 'Outils d''apprentissage et de formation par IA', 'GraduationCap'),
('Vidéo & Animation', 'video-animation', 'Création et édition de vidéos avec l''IA', 'Video'),
('Rédaction & Contenu', 'redaction-contenu', 'Génération et optimisation de contenu', 'FileText'),
('Voix & Parole', 'voix-parole', 'Synthèse et reconnaissance vocale', 'Mic'),
('Business & Marketing', 'business-marketing', 'Solutions IA pour le marketing et le business', 'TrendingUp')
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    icon = EXCLUDED.icon;

-- Bard
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Bard',
    'bard',
    'Assistant IA de Google avec intégration des services Google',
    'https://bard.google.com',
    (SELECT id FROM categories WHERE slug = 'assistants-chatbots'),
    '[{"plan_name": "Free", "price": 0}]'::jsonb,
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

-- Copilot
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Copilot',
    'copilot',
    'Assistant IA de Microsoft pour la productivité',
    'https://copilot.microsoft.com',
    (SELECT id FROM categories WHERE slug = 'assistants-chatbots'),
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

-- Duolingo Max
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Duolingo Max',
    'duolingo-max',
    'Apprentissage des langues avec IA',
    'https://duolingo.com',
    (SELECT id FROM categories WHERE slug = 'education'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Max", "price": 30}]'::jsonb,
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

-- Runway
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Runway',
    'runway',
    'Édition vidéo et effets spéciaux par IA',
    'https://runway.ml',
    (SELECT id FROM categories WHERE slug = 'video-animation'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 35}]'::jsonb,
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

-- Jasper
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Jasper',
    'jasper',
    'Rédaction de contenu marketing par IA',
    'https://jasper.ai',
    (SELECT id FROM categories WHERE slug = 'redaction-contenu'),
    '[{"plan_name": "Starter", "price": 40}, {"plan_name": "Pro", "price": 99}]'::jsonb,
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

-- ElevenLabs
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'ElevenLabs',
    'elevenlabs',
    'Synthèse vocale ultra-réaliste',
    'https://elevenlabs.io',
    (SELECT id FROM categories WHERE slug = 'voix-parole'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 22}]'::jsonb,
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

-- Markopolo
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Markopolo',
    'markopolo',
    'Création de campagnes publicitaires par IA',
    'https://markopolo.ai',
    (SELECT id FROM categories WHERE slug = 'business-marketing'),
    '[{"plan_name": "Starter", "price": 49}, {"plan_name": "Pro", "price": 99}]'::jsonb,
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

COMMIT;
