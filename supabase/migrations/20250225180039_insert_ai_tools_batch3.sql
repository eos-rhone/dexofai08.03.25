-- Batch 3 : Génération d'Images et Médias
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
SELECT 
    d.name,
    LOWER(REGEXP_REPLACE(d.name, '\s+', '-', 'g')),
    d.description,
    d.website_url,
    c.id,
    d.pricing::jsonb,
    true,
    false
FROM (
    VALUES 
    ('Midjourney', 'Outil de génération d''images IA créant des visuels artistiques de haute qualité à partir de descriptions textuelles.', 'https://www.midjourney.com/', 'Génération d''Images', '[{"plan_name": "Basic", "price": 10}, {"plan_name": "Standard", "price": 30}]'),
    ('DALL-E', 'Système de génération d''images par OpenAI capable de créer des images réalistes et artistiques à partir de descriptions textuelles.', 'https://openai.com/dall-e-2', 'Génération d''Images', '[{"plan_name": "Pay-per-use", "price": -1}]'),
    ('Synthesia', 'Plateforme de création vidéo IA permettant de générer des vidéos avec des avatars parlants à partir de texte.', 'https://www.synthesia.io/', 'Vidéo', '[{"plan_name": "Business", "price": 30}]')
) AS d(name, description, website_url, category_name, pricing)
JOIN public.categories c ON c.name = d.category_name
ON CONFLICT (slug) DO UPDATE 
SET 
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;
