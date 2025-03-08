-- Batch 26 v3: Restore AI Tools with individual inserts using slugs
BEGIN;

-- Insert or update categories
INSERT INTO categories (name, slug, description, icon) VALUES
('Assistants & Chatbots', 'assistants-chatbots', 'Agents conversationnels et assistants virtuels intelligents', 'MessageSquare'),
('Génération d''Images', 'generation-images', 'Créez des images uniques à partir de descriptions textuelles', 'Image'),
('Création musicale', 'creation-musicale', 'Composez et générez de la musique avec l''IA', 'Music'),
('Analyse de données', 'analyse-donnees', 'Outils d''analyse et de visualisation de données', 'BarChart'),
('Productivité', 'productivite', 'Outils pour améliorer votre efficacité quotidienne', 'Zap'),
('Design', 'design', 'Outils de design et de création graphique', 'Layout'),
('Développement', 'developpement', 'Assistants de programmation et outils de développement', 'Code'),
('Recherche', 'recherche', 'Assistants de recherche et d''analyse scientifique', 'Search')
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    icon = EXCLUDED.icon;

-- ChatGPT
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'ChatGPT',
    'chatgpt',
    'Assistant conversationnel avancé basé sur GPT-4',
    'https://chat.openai.com',
    (SELECT id FROM categories WHERE slug = 'assistants-chatbots'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Plus", "price": 20}]'::jsonb,
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
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Credits", "price": 15}]'::jsonb,
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
    'Modèle open-source de génération d''images',
    'https://stability.ai',
    (SELECT id FROM categories WHERE slug = 'generation-images'),
    '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
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

-- Mubert
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Mubert',
    'mubert',
    'Génération de musique par IA',
    'https://mubert.com',
    (SELECT id FROM categories WHERE slug = 'creation-musicale'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 15}]'::jsonb,
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
