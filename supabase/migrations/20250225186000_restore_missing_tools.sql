-- Restore missing tools
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
    ('ChatGPT', 'chatgpt', 'Assistant conversationnel avancé basé sur GPT-4. Un modèle de langage puissant capable de comprendre et générer du texte naturel.', 'https://chat.openai.com/', 'Agents & Automatisation', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Plus", "price": 20}]', true),
    
    ('Midjourney', 'midjourney', 'Service de génération d''images IA. Crée des images artistiques de haute qualité à partir de descriptions textuelles.', 'https://www.midjourney.com/', 'Génération d''Images', '[{"plan_name": "Basic", "price": 10}, {"plan_name": "Standard", "price": 30}]', true),
    
    ('DALL-E', 'dall-e', 'Générateur d''images par OpenAI. Crée des images réalistes et artistiques à partir de descriptions textuelles.', 'https://labs.openai.com/', 'Génération d''Images', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Credits", "price": 15}]', true),
    
    ('Claude', 'claude', 'Assistant IA par Anthropic. Un modèle de langage avancé avec des capacités de raisonnement et d''analyse.', 'https://claude.ai/', 'Agents & Automatisation', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]', true),
    
    ('Adalo', 'adalo', 'Plateforme no-code pour créer des applications mobiles et web. Intègre des fonctionnalités IA pour le développement d''apps.', 'https://www.adalo.com/', 'Développement', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 50}, {"plan_name": "Business", "price": 100}]', true),
    
    ('Stable Diffusion', 'stable-diffusion', 'Modèle open-source de génération d''images. Un outil puissant et gratuit pour la création d''images IA.', 'https://stability.ai/', 'Génération d''Images', '[{"plan_name": "Open Source", "price": 0}]', true),
    
    ('Mubert', 'mubert', 'Plateforme de génération de musique par IA. Crée de la musique personnalisée pour différents usages.', 'https://mubert.com/', 'Génération Audio', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 15}]', true)

) AS d(name, slug, description, website_url, category_name, pricing, is_featured)
JOIN public.categories c ON c.name = d.category_name
ON CONFLICT (slug) DO UPDATE 
SET 
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;
