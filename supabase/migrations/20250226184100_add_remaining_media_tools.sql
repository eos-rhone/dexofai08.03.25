-- Ajouter les outils manquants pour Médias & Divertissement
BEGIN;

DO $$ 
DECLARE
    media_category_id uuid := 'f5bd99ea-826a-47f7-b9fe-fff09aa3391a';  -- ID existant
BEGIN
    -- RunwayML
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'runwayml') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'RunwayML',
            'runwayml',
            'Plateforme créative d''IA pour les médias.',
            'https://runwayml.com/',
            media_category_id,
            '[{"plan_name": "Starter", "price": 0}, {"plan_name": "Pro", "price": 35}]'::jsonb,
            true,
            true
        );
    END IF;

    -- Descript
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'descript') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Descript',
            'descript',
            'Éditeur audio/vidéo basé sur l''IA.',
            'https://www.descript.com/',
            media_category_id,
            '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 12}]'::jsonb,
            true,
            true
        );
    END IF;

    -- Synthesia
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'synthesia') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Synthesia',
            'synthesia',
            'Création de vidéos avec présentateurs IA.',
            'https://www.synthesia.io/',
            media_category_id,
            '[{"plan_name": "Personal", "price": 30}, {"plan_name": "Business", "price": 250}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Artbreeder
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'artbreeder') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Artbreeder',
            'artbreeder',
            'Création et fusion d''images par IA.',
            'https://www.artbreeder.com/',
            media_category_id,
            '[{"plan_name": "Free", "price": 0}, {"plan_name": "Premium", "price": 8.99}]'::jsonb,
            true,
            false
        );
    END IF;

    -- DeepArt
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'deepart') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'DeepArt',
            'deepart',
            'Transfert de style artistique par IA.',
            'https://deepart.io/',
            media_category_id,
            '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Pro", "price": 19.99}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Mubert
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'mubert') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Mubert',
            'mubert',
            'Génération de musique par IA.',
            'https://mubert.com/',
            media_category_id,
            '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 24.99}]'::jsonb,
            true,
            false
        );
    END IF;

    -- DALL·E
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'dall-e') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'DALL·E',
            'dall-e',
            'Génération d''images à partir de descriptions textuelles.',
            'https://openai.com/dall-e-2',
            media_category_id,
            '[{"plan_name": "Credits", "price": null}]'::jsonb,
            true,
            true
        );
    END IF;

    -- Midjourney
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'midjourney') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Midjourney',
            'midjourney',
            'Création d''images artistiques par IA.',
            'https://www.midjourney.com/',
            media_category_id,
            '[{"plan_name": "Basic", "price": 10}, {"plan_name": "Standard", "price": 30}]'::jsonb,
            true,
            true
        );
    END IF;

END $$;

COMMIT;
