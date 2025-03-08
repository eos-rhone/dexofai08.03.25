-- Mettre à jour les outils de la catégorie Médias & Divertissement
BEGIN;

DO $$ 
DECLARE
    media_id uuid := 'f5bd99ea-826a-47f7-b9fe-fff09aa3391a';
BEGIN
    -- Adobe Sensei
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Adobe Sensei',
        'adobe-sensei',
        'Plateforme d''IA d''Adobe pour la création et l''édition de contenu multimédia.',
        'https://www.adobe.com/sensei.html',
        media_id,
        '[{"plan_name": "Creative Cloud", "price": 59.99}]'::jsonb,
        true,
        true
    )
    ON CONFLICT (slug) 
    DO UPDATE SET category_id = media_id;

    -- Wonder Dynamics
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Wonder Dynamics',
        'wonder-dynamics',
        'Plateforme d''IA pour la production cinématographique et les effets visuels.',
        'https://www.wonderdynamics.com/',
        media_id,
        '[{"plan_name": "Contact Sales", "price": null}]'::jsonb,
        true,
        true
    )
    ON CONFLICT (slug) 
    DO UPDATE SET category_id = media_id;

    -- RunwayML
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'RunwayML',
        'runwayml',
        'Suite d''outils créatifs alimentés par l''IA pour la création de contenu multimédia.',
        'https://runwayml.com/',
        media_id,
        '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 35}]'::jsonb,
        true,
        true
    )
    ON CONFLICT (slug) 
    DO UPDATE SET category_id = media_id;

    -- Descript
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Descript',
        'descript',
        'Éditeur audio et vidéo tout-en-un utilisant l''IA.',
        'https://www.descript.com/',
        media_id,
        '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 12}]'::jsonb,
        true,
        true
    )
    ON CONFLICT (slug) 
    DO UPDATE SET category_id = media_id;

    -- Synthesia
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Synthesia',
        'synthesia',
        'Plateforme de création vidéo avec avatars IA.',
        'https://www.synthesia.io/',
        media_id,
        '[{"plan_name": "Personal", "price": 30}, {"plan_name": "Business", "price": 250}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) 
    DO UPDATE SET category_id = media_id;

    -- DALL·E
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'DALL·E',
        'dall-e',
        'Système de génération d''images à partir de descriptions textuelles par OpenAI.',
        'https://openai.com/dall-e-2',
        media_id,
        '[{"plan_name": "Credits", "price": null}]'::jsonb,
        true,
        true
    )
    ON CONFLICT (slug) 
    DO UPDATE SET category_id = media_id;

    -- Midjourney
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Midjourney',
        'midjourney',
        'Outil de génération d''images artistiques par IA.',
        'https://www.midjourney.com/',
        media_id,
        '[{"plan_name": "Basic", "price": 10}, {"plan_name": "Standard", "price": 30}]'::jsonb,
        true,
        true
    )
    ON CONFLICT (slug) 
    DO UPDATE SET category_id = media_id;

END $$;

-- Vérifier les résultats
SELECT 
    c.name as category_name,
    COUNT(t.id) as tool_count,
    array_agg(t.name ORDER BY t.name) as tool_names
FROM categories c
LEFT JOIN ai_tools t ON c.id = t.category_id
WHERE c.id = 'f5bd99ea-826a-47f7-b9fe-fff09aa3391a'
GROUP BY c.name;

COMMIT;
