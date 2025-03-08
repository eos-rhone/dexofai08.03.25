-- Ajouter les outils restants
BEGIN;

-- Ajouter les outils de Collaboration IA
DO $$ 
DECLARE
    collab_category_id integer;
BEGIN
    SELECT id INTO collab_category_id FROM categories WHERE slug = 'collaboration-ia';

    -- Comet ML
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'comet-ml') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Comet ML',
            'comet-ml',
            'Plateforme de gestion du cycle de vie ML pour les équipes.',
            'https://www.comet.ml/',
            collab_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 49}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Determined AI
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'determined-ai') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Determined AI',
            'determined-ai',
            'Plateforme de formation et collaboration ML.',
            'https://www.determined.ai/',
            collab_category_id,
            '[{"plan_name": "Open Source", "price": 0}, {"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;
END $$;

-- Ajouter les outils de Cybersécurité
DO $$ 
DECLARE
    cyber_category_id integer;
BEGIN
    SELECT id INTO cyber_category_id FROM categories WHERE slug = 'cybersécurité';

    -- Cylance
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'cylance') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'BlackBerry Cylance',
            'cylance',
            'Solution antivirus et EDR basée sur l''IA.',
            'https://www.cylance.com/',
            cyber_category_id,
            '[{"plan_name": "Pro", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Deep Instinct
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'deep-instinct') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Deep Instinct',
            'deep-instinct',
            'Protection prédictive contre les malwares par deep learning.',
            'https://www.deepinstinct.com/',
            cyber_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;
END $$;

-- Ajouter les outils de Développement
DO $$ 
DECLARE
    dev_category_id integer;
BEGIN
    SELECT id INTO dev_category_id FROM categories WHERE slug = 'développement';

    -- Kite
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'kite') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Kite',
            'kite',
            'Assistant de programmation avec complétion de ligne.',
            'https://www.kite.com/',
            dev_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 16.6}]'::jsonb,
            true,
            false
        );
    END IF;

    -- CodeGuru
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'codeguru') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'CodeGuru',
            'codeguru',
            'Revue de code automatisée par Amazon.',
            'https://aws.amazon.com/codeguru/',
            dev_category_id,
            '[{"plan_name": "Pay-per-use", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;
END $$;

-- Ajouter les outils de Données & Préparation
DO $$ 
DECLARE
    data_category_id integer;
BEGIN
    SELECT id INTO data_category_id FROM categories WHERE slug = 'données-&-préparation';

    -- Alteryx
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'alteryx-prep') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Alteryx',
            'alteryx-prep',
            'Plateforme d''analyse et préparation de données.',
            'https://www.alteryx.com/',
            data_category_id,
            '[{"plan_name": "Pro", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Talend
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'talend') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Talend',
            'talend',
            'Suite d''intégration et qualité des données.',
            'https://www.talend.com/',
            data_category_id,
            '[{"plan_name": "Pro", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;
END $$;

COMMIT;
