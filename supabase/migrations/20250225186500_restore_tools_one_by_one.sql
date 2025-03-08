-- Restauration des outils un par un
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
    UPDATE public.ai_tools
    SET description = 'Assistant conversationnel avancé basé sur GPT-4',
        website_url = 'https://chat.openai.com',
        category_id = chatbots_id,
        pricing = '[{"plan_name": "Free", "price": 0}, {"plan_name": "Plus", "price": 20}]'::jsonb,
        is_featured = true,
        is_active = true,
        updated_at = CURRENT_TIMESTAMP
    WHERE slug = 'chatgpt';

    -- Midjourney
    UPDATE public.ai_tools
    SET description = 'Génération d''images par IA de haute qualité',
        website_url = 'https://www.midjourney.com',
        category_id = images_id,
        pricing = '[{"plan_name": "Basic", "price": 10}, {"plan_name": "Standard", "price": 30}]'::jsonb,
        is_featured = true,
        is_active = true,
        updated_at = CURRENT_TIMESTAMP
    WHERE slug = 'midjourney';

    -- DALL-E
    UPDATE public.ai_tools
    SET description = 'Création d''images à partir de descriptions textuelles par OpenAI',
        website_url = 'https://labs.openai.com',
        category_id = images_id,
        pricing = '[{"plan_name": "Free", "price": 0}, {"plan_name": "Credits", "price": 15}]'::jsonb,
        is_featured = true,
        is_active = true,
        updated_at = CURRENT_TIMESTAMP
    WHERE slug = 'dall-e';

    -- Claude
    UPDATE public.ai_tools
    SET description = 'Assistant IA par Anthropic avec capacités avancées',
        website_url = 'https://claude.ai',
        category_id = chatbots_id,
        pricing = '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]'::jsonb,
        is_featured = true,
        is_active = true,
        updated_at = CURRENT_TIMESTAMP
    WHERE slug = 'claude';

    -- Stable Diffusion
    UPDATE public.ai_tools
    SET description = 'Modèle open-source de génération d''images',
        website_url = 'https://stability.ai',
        category_id = images_id,
        pricing = '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        is_featured = true,
        is_active = true,
        updated_at = CURRENT_TIMESTAMP
    WHERE slug = 'stable-diffusion';

    -- Mubert
    UPDATE public.ai_tools
    SET description = 'Génération de musique par IA',
        website_url = 'https://mubert.com',
        category_id = music_id,
        pricing = '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 15}]'::jsonb,
        is_featured = true,
        is_active = true,
        updated_at = CURRENT_TIMESTAMP
    WHERE slug = 'mubert';

    -- Character.ai
    UPDATE public.ai_tools
    SET description = 'Chatbots personnalisés avec différentes personnalités',
        website_url = 'https://character.ai',
        category_id = chatbots_id,
        pricing = '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 10}]'::jsonb,
        is_featured = false,
        is_active = true,
        updated_at = CURRENT_TIMESTAMP
    WHERE slug = 'character-ai';

END $$;
