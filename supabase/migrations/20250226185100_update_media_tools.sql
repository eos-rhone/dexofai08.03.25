-- Mettre à jour les outils de la catégorie Médias & Divertissement
BEGIN;

DO $$ 
DECLARE
    media_id uuid := 'f5bd99ea-826a-47f7-b9fe-fff09aa3391a';
BEGIN
    -- RunwayML
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'RunwayML',
        'runwayml',
        'Plateforme créative d''IA pour les médias.',
        'https://runwayml.com/',
        media_id,
        '[{"plan_name": "Starter", "price": 0}, {"plan_name": "Pro", "price": 35}]'::jsonb,
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
        'Éditeur audio/vidéo basé sur l''IA.',
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
        'Création de vidéos avec présentateurs IA.',
        'https://www.synthesia.io/',
        media_id,
        '[{"plan_name": "Personal", "price": 30}, {"plan_name": "Business", "price": 250}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) 
    DO UPDATE SET category_id = media_id;

    -- Artbreeder
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Artbreeder',
        'artbreeder',
        'Création et fusion d''images par IA.',
        'https://www.artbreeder.com/',
        media_id,
        '[{"plan_name": "Free", "price": 0}, {"plan_name": "Premium", "price": 8.99}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) 
    DO UPDATE SET category_id = media_id;

    -- DeepArt
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'DeepArt',
        'deepart',
        'Transfert de style artistique par IA.',
        'https://deepart.io/',
        media_id,
        '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Pro", "price": 19.99}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) 
    DO UPDATE SET category_id = media_id;

    -- Mubert
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Mubert',
        'mubert',
        'Génération de musique par IA.',
        'https://mubert.com/',
        media_id,
        '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 24.99}]'::jsonb,
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
        'Génération d''images à partir de descriptions textuelles.',
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
        'Création d''images artistiques par IA.',
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
