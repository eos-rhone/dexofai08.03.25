/*
  # Initial Data Population

  1. Data Insertion
    - Categories for AI tools
    - Initial set of AI tools
    - Sample features and pricing
    
  2. Content
    - Popular AI tools across categories
    - Featured tools
    - Realistic pricing and features
*/

BEGIN;

-- Create a temporary table for our new data
CREATE TEMP TABLE temp_ai_tools (
    name text,
    slug text,
    description text,
    website_url text,
    category_id uuid,
    pricing jsonb,
    is_active boolean,
    is_featured boolean
);

-- Disable triggers temporarily
ALTER TABLE public.ai_tools DISABLE TRIGGER ALL;

-- Delete all existing tools with CASCADE
DELETE FROM public.ai_tools CASCADE;

-- Insert Categories if they don't exist
INSERT INTO categories (name, slug, description, icon) VALUES
('Assistants & Chatbots', 'assistants-chatbots', 'Agents conversationnels et assistants virtuels intelligents', 'MessageSquare'),
('Génération d''Images', 'generation-images', 'Créez des images uniques à partir de descriptions textuelles', 'Image'),
('Création musicale', 'creation-musicale', 'Composez et générez de la musique avec l''IA', 'Music'),
('Analyse de données', 'analyse-donnees', 'Outils d''analyse et de visualisation de données', 'BarChart'),
('Productivité', 'productivite', 'Outils pour améliorer votre efficacité quotidienne', 'Zap'),
('Design', 'design', 'Outils de design et de création graphique', 'Layout'),
('Développement', 'developpement', 'Assistants de programmation et outils de développement', 'Code'),
('Recherche', 'recherche', 'Assistants de recherche et d''analyse scientifique', 'Search')
ON CONFLICT (slug) DO NOTHING;

-- Insert data into temp table
INSERT INTO temp_ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
SELECT 
    d.name,
    d.slug,
    d.description,
    d.website_url,
    c.id,
    d.pricing::jsonb,
    true,
    d.is_featured
FROM (
    VALUES 
    ('ChatGPT', 'chatgpt', 'Assistant conversationnel avancé basé sur GPT-4', 'https://chat.openai.com', 'Assistants & Chatbots', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Plus", "price": 20}]', true),
    ('Claude', 'claude', 'Assistant IA par Anthropic avec capacités avancées', 'https://claude.ai', 'Assistants & Chatbots', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]', true),
    ('Bard', 'bard', 'Assistant IA de Google avec intégration des services Google', 'https://bard.google.com', 'Assistants & Chatbots', '[{"plan_name": "Free", "price": 0}]', true),
    ('Pi', 'pi', 'Assistant conversationnel empathique par Inflection AI', 'https://pi.ai', 'Assistants & Chatbots', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 15}]', false),
    ('Character.ai', 'character-ai', 'Chatbots personnalisés avec différentes personnalités', 'https://character.ai', 'Assistants & Chatbots', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 10}]', false),
    
    ('Midjourney', 'midjourney', 'Génération d''images par IA de haute qualité', 'https://www.midjourney.com', 'Génération d''Images', '[{"plan_name": "Basic", "price": 10}, {"plan_name": "Standard", "price": 30}]', true),
    ('DALL-E', 'dall-e', 'Création d''images à partir de descriptions textuelles par OpenAI', 'https://labs.openai.com', 'Génération d''Images', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Credits", "price": 15}]', true),
    ('Stable Diffusion', 'stable-diffusion', 'Modèle open-source de génération d''images', 'https://stability.ai', 'Génération d''Images', '[{"plan_name": "Open Source", "price": 0}]', true),
    ('Leonardo.ai', 'leonardo-ai', 'Plateforme de création d''images IA pour les professionnels', 'https://leonardo.ai', 'Génération d''Images', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]', false),
    ('Playground AI', 'playground-ai', 'Plateforme de génération d''images avec interface intuitive', 'https://playground.ai', 'Génération d''Images', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 15}]', false),
    
    ('Mubert', 'mubert', 'Génération de musique par IA', 'https://mubert.com', 'Création musicale', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 15}]', true),
    ('Soundraw', 'soundraw', 'Création de musique royalty-free par IA', 'https://soundraw.io', 'Création musicale', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]', false),
    ('AIVA', 'aiva', 'Composition musicale assistée par IA', 'https://www.aiva.ai', 'Création musicale', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 15}]', false)
) AS d(name, slug, description, website_url, category_name, pricing, is_featured)
JOIN public.categories c ON c.name = d.category_name;

-- Delete existing tools that are in our temp table
DELETE FROM public.ai_tools 
WHERE slug IN (SELECT slug FROM temp_ai_tools);

-- Insert new data from temp table
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
SELECT name, slug, description, website_url, category_id, pricing, is_active, is_featured
FROM temp_ai_tools;

-- Re-enable triggers
ALTER TABLE public.ai_tools ENABLE TRIGGER ALL;

-- Drop temp table
DROP TABLE temp_ai_tools;

COMMIT;
