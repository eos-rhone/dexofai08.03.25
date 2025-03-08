-- Ajouter des outils pour Jeux vidéo et Médias & Divertissement
BEGIN;

DO $$ 
DECLARE
    games_category_id uuid := 'b1230acd-170b-4490-a64d-c55e33e5a19e';
    media_category_id uuid := 'f5bd99ea-826a-47f7-b9fe-fff09aa3391a';
BEGIN
    -- Outils pour Jeux vidéo

    -- Unity ML-Agents
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'unity-ml-agents') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Unity ML-Agents',
            'unity-ml-agents',
            'Framework d''apprentissage par renforcement pour Unity.',
            'https://unity.com/products/machine-learning-agents',
            games_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            true
        );
    END IF;

    -- Unreal Engine AI
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'unreal-engine-ai') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Unreal Engine AI',
            'unreal-engine-ai',
            'Système d''IA intégré à Unreal Engine pour les jeux.',
            'https://www.unrealengine.com/',
            games_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Custom", "price": null}]'::jsonb,
            true,
            true
        );
    END IF;

    -- NVIDIA GameWorks AI
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'nvidia-gameworks-ai') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'NVIDIA GameWorks AI',
            'nvidia-gameworks-ai',
            'Suite d''outils IA pour le développement de jeux.',
            'https://developer.nvidia.com/gameworks',
            games_category_id,
            '[{"plan_name": "License", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Modl.ai
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'modl-ai') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Modl.ai',
            'modl-ai',
            'Plateforme d''automatisation des tests de jeux par IA.',
            'https://modl.ai/',
            games_category_id,
            '[{"plan_name": "Contact", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Spirit AI
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'spirit-ai') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Spirit AI',
            'spirit-ai',
            'IA pour les personnages et dialogues de jeux.',
            'https://spiritai.com/',
            games_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;

    -- AIGameDev
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'aigamedev') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'AIGameDev',
            'aigamedev',
            'Ressources et outils pour l''IA dans les jeux.',
            'https://aigamedev.com/',
            games_category_id,
            '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Pro", "price": 49}]'::jsonb,
            true,
            false
        );
    END IF;

    -- DeepMind Lab
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'deepmind-lab') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'DeepMind Lab',
            'deepmind-lab',
            'Environnement 3D pour la recherche en IA de jeux.',
            'https://github.com/deepmind/lab',
            games_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            true
        );
    END IF;

    -- OpenAI Gym
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'openai-gym') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'OpenAI Gym',
            'openai-gym',
            'Toolkit pour développer et comparer des algorithmes IA.',
            'https://gym.openai.com/',
            games_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            true
        );
    END IF;

    -- ML-Agents Toolkit
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'ml-agents-toolkit') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'ML-Agents Toolkit',
            'ml-agents-toolkit',
            'Kit de développement pour l''IA dans les jeux Unity.',
            'https://github.com/Unity-Technologies/ml-agents',
            games_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            false
        );
    END IF;

    -- AIGym
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'aigym') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'AIGym',
            'aigym',
            'Plateforme d''entraînement pour agents IA de jeux.',
            'https://aigym.com/',
            games_category_id,
            '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Pro", "price": 29}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Outils pour Médias & Divertissement

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

    -- Adobe Sensei
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'adobe-sensei') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Adobe Sensei',
            'adobe-sensei',
            'IA intégrée aux produits Adobe Creative Cloud.',
            'https://www.adobe.com/sensei.html',
            media_category_id,
            '[{"plan_name": "Creative Cloud", "price": 52.99}]'::jsonb,
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

    -- Wonder Dynamics
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'wonder-dynamics') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Wonder Dynamics',
            'wonder-dynamics',
            'IA pour effets visuels et animation.',
            'https://www.wonder.ai/',
            media_category_id,
            '[{"plan_name": "Contact", "price": null}]'::jsonb,
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
