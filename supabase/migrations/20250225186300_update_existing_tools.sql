-- Mise à jour des outils existants
UPDATE public.ai_tools
SET 
    description = d.description,
    website_url = d.website_url,
    category_id = c.id,
    pricing = d.pricing::jsonb,
    is_featured = d.is_featured,
    updated_at = CURRENT_TIMESTAMP
FROM (
    VALUES 
    ('ChatGPT', 'chatgpt', 'Assistant conversationnel avancé basé sur GPT-4', 'https://chat.openai.com', 'Assistants & Chatbots', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Plus", "price": 20}]', true),
    ('Midjourney', 'midjourney', 'Génération d''images par IA de haute qualité', 'https://www.midjourney.com', 'Génération d''Images', '[{"plan_name": "Basic", "price": 10}, {"plan_name": "Standard", "price": 30}]', true),
    ('DALL-E', 'dall-e', 'Création d''images à partir de descriptions textuelles par OpenAI', 'https://labs.openai.com', 'Génération d''Images', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Credits", "price": 15}]', true),
    ('Claude', 'claude', 'Assistant IA par Anthropic avec capacités avancées', 'https://claude.ai', 'Assistants & Chatbots', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]', true),
    ('Stable Diffusion', 'stable-diffusion', 'Modèle open-source de génération d''images', 'https://stability.ai', 'Génération d''Images', '[{"plan_name": "Open Source", "price": 0}]', true),
    ('Mubert', 'mubert', 'Génération de musique par IA', 'https://mubert.com', 'Création musicale', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 15}]', true)
) AS d(name, slug, description, website_url, category_name, pricing, is_featured)
JOIN public.categories c ON c.name = d.category_name
WHERE ai_tools.slug = d.slug;
