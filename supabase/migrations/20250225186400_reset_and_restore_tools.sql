-- Reset et restauration des outils
BEGIN;

-- Suppression des outils existants avec ces slugs
DELETE FROM public.ai_tools 
WHERE slug IN (
    'chatgpt',
    'midjourney',
    'dall-e',
    'claude',
    'stable-diffusion',
    'mubert',
    'bard',
    'pi',
    'character-ai',
    'leonardo-ai',
    'playground-ai',
    'soundraw',
    'aiva'
);

-- Insertion des outils avec les données mises à jour
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
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

COMMIT;
