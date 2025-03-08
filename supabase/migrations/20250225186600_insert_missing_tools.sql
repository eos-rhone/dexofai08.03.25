-- Insertion des outils manquants
DO $$
DECLARE
    chatbots_id uuid;
    images_id uuid;
    music_id uuid;
BEGIN
    -- Get category IDs
    SELECT id INTO chatbots_id FROM categories WHERE name = 'Assistants & Chatbots';
    SELECT id INTO images_id FROM categories WHERE name = 'Génération d''Images';
    SELECT id INTO music_id FROM categories WHERE name = 'Création musicale';

    -- ChatGPT
    IF NOT EXISTS (SELECT 1 FROM public.ai_tools WHERE slug = 'chatgpt') THEN
        INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES ('ChatGPT', 'chatgpt', 'Assistant conversationnel avancé basé sur GPT-4', 'https://chat.openai.com', chatbots_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Plus", "price": 20}]'::jsonb, true, true);
    END IF;

    -- Midjourney
    IF NOT EXISTS (SELECT 1 FROM public.ai_tools WHERE slug = 'midjourney') THEN
        INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES ('Midjourney', 'midjourney', 'Génération d''images par IA de haute qualité', 'https://www.midjourney.com', images_id, '[{"plan_name": "Basic", "price": 10}, {"plan_name": "Standard", "price": 30}]'::jsonb, true, true);
    END IF;

    -- DALL-E
    IF NOT EXISTS (SELECT 1 FROM public.ai_tools WHERE slug = 'dall-e') THEN
        INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES ('DALL-E', 'dall-e', 'Création d''images à partir de descriptions textuelles par OpenAI', 'https://labs.openai.com', images_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Credits", "price": 15}]'::jsonb, true, true);
    END IF;

    -- Claude
    IF NOT EXISTS (SELECT 1 FROM public.ai_tools WHERE slug = 'claude') THEN
        INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES ('Claude', 'claude', 'Assistant IA par Anthropic avec capacités avancées', 'https://claude.ai', chatbots_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]'::jsonb, true, true);
    END IF;

    -- Stable Diffusion
    IF NOT EXISTS (SELECT 1 FROM public.ai_tools WHERE slug = 'stable-diffusion') THEN
        INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES ('Stable Diffusion', 'stable-diffusion', 'Modèle open-source de génération d''images', 'https://stability.ai', images_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true);
    END IF;

    -- Mubert
    IF NOT EXISTS (SELECT 1 FROM public.ai_tools WHERE slug = 'mubert') THEN
        INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES ('Mubert', 'mubert', 'Génération de musique par IA', 'https://mubert.com', music_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 15}]'::jsonb, true, true);
    END IF;

    -- Character.ai
    IF NOT EXISTS (SELECT 1 FROM public.ai_tools WHERE slug = 'character-ai') THEN
        INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES ('Character.ai', 'character-ai', 'Chatbots personnalisés avec différentes personnalités', 'https://character.ai', chatbots_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 10}]'::jsonb, true, false);
    END IF;

END $$;
