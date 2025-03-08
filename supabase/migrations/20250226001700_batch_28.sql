-- Batch 28: Add complete AI tools data
BEGIN;

-- ChatGPT
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'ChatGPT',
    'chatgpt',
    'Assistant conversationnel avancé basé sur GPT-4',
    'https://chat.openai.com',
    (SELECT id FROM categories WHERE slug = 'assistants-chatbots'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Plus", "price": 20}]'::jsonb,
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

-- Claude
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Claude',
    'claude',
    'Assistant IA par Anthropic avec capacités avancées',
    'https://claude.ai',
    (SELECT id FROM categories WHERE slug = 'assistants-chatbots'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 20}]'::jsonb,
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

-- Midjourney
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Midjourney',
    'midjourney',
    'Génération d''images par IA de haute qualité',
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
    'Création d''images à partir de descriptions textuelles par OpenAI',
    'https://labs.openai.com',
    (SELECT id FROM categories WHERE slug = 'generation-images'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Credits", "price": 15}]'::jsonb,
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

-- Obviously AI
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Obviously AI',
    'obviously-ai',
    'Analyse prédictive sans code',
    'https://obviously.ai',
    (SELECT id FROM categories WHERE slug = 'analyse-donnees'),
    '[{"plan_name": "Starter", "price": 49}, {"plan_name": "Pro", "price": 199}]'::jsonb,
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

-- MindsDB
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'MindsDB',
    'mindsdb',
    'Prédictions IA dans votre base de données',
    'https://mindsdb.com',
    (SELECT id FROM categories WHERE slug = 'analyse-donnees'),
    '[{"plan_name": "Community", "price": 0}, {"plan_name": "Pro", "price": 99}]'::jsonb,
    true,
    false
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

-- DataRobot
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'DataRobot',
    'datarobot',
    'Plateforme d''IA automatisée pour l''analyse',
    'https://datarobot.com',
    (SELECT id FROM categories WHERE slug = 'analyse-donnees'),
    '[{"plan_name": "Enterprise", "price": 499}]'::jsonb,
    true,
    false
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

-- Character.ai
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Character.ai',
    'character-ai',
    'Chatbots personnalisés avec différentes personnalités',
    'https://character.ai',
    (SELECT id FROM categories WHERE slug = 'assistants-chatbots'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 10}]'::jsonb,
    true,
    false
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

-- Mubert
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Mubert',
    'mubert',
    'Génération de musique par IA',
    'https://mubert.com',
    (SELECT id FROM categories WHERE slug = 'creation-musicale'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 20}]'::jsonb,
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

-- Soundraw
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Soundraw',
    'soundraw',
    'Création de musique royalty-free par IA',
    'https://soundraw.io',
    (SELECT id FROM categories WHERE slug = 'creation-musicale'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 20}]'::jsonb,
    true,
    false
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
