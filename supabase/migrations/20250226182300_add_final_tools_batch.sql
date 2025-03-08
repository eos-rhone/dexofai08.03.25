-- Ajouter les derniers outils pour chaque catégorie
BEGIN;

-- Ajouter les outils restants de Collaboration IA
DO $$ 
DECLARE
    collab_category_id integer;
BEGIN
    SELECT id INTO collab_category_id FROM categories WHERE slug = 'collaboration-ia';

    -- Pachyderm
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'pachyderm') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Pachyderm',
            'pachyderm',
            'Plateforme de data science collaborative et versionnée.',
            'https://www.pachyderm.com/',
            collab_category_id,
            '[{"plan_name": "Community", "price": 0}, {"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Domino Data Lab
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'domino-data-lab') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Domino Data Lab',
            'domino-data-lab',
            'Plateforme enterprise pour la collaboration en data science.',
            'https://www.dominodatalab.com/',
            collab_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;

    -- CNVRG.IO
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'cnvrg-io') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'CNVRG.IO',
            'cnvrg-io',
            'Plateforme MLOps full-stack pour les équipes.',
            'https://cnvrg.io/',
            collab_category_id,
            '[{"plan_name": "Community", "price": 0}, {"plan_name": "Pro", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;
END $$;

-- Ajouter les outils restants de Cybersécurité
DO $$ 
DECLARE
    cyber_category_id integer;
BEGIN
    SELECT id INTO cyber_category_id FROM categories WHERE slug = 'cybersécurité';

    -- ExtraHop
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'extrahop') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'ExtraHop Reveal(x)',
            'extrahop',
            'Détection et réponse réseau basée sur l''IA.',
            'https://www.extrahop.com/',
            cyber_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;

    -- SentinelOne
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'sentinelone') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'SentinelOne',
            'sentinelone',
            'Plateforme de sécurité autonome.',
            'https://www.sentinelone.com/',
            cyber_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Blue Hexagon
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'blue-hexagon') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Blue Hexagon',
            'blue-hexagon',
            'Sécurité cloud en temps réel par deep learning.',
            'https://bluehexagon.ai/',
            cyber_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Vectra AI
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'vectra-ai') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Vectra AI',
            'vectra-ai',
            'Détection et réponse aux menaces par IA.',
            'https://www.vectra.ai/',
            cyber_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Cynet
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'cynet') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Cynet',
            'cynet',
            'Plateforme de sécurité autonome tout-en-un.',
            'https://www.cynet.com/',
            cyber_category_id,
            '[{"plan_name": "Pro", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;
END $$;

-- Ajouter les outils restants de Développement
DO $$ 
DECLARE
    dev_category_id integer;
BEGIN
    SELECT id INTO dev_category_id FROM categories WHERE slug = 'développement';

    -- DeepCode
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'deepcode') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'DeepCode',
            'deepcode',
            'Analyse sémantique du code par IA.',
            'https://www.deepcode.ai/',
            dev_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Team", "price": 20}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Snyk
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'snyk') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Snyk',
            'snyk',
            'Sécurité du code avec IA.',
            'https://snyk.io/',
            dev_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Team", "price": 12}]'::jsonb,
            true,
            false
        );
    END IF;

    -- CodeSee
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'codesee') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'CodeSee',
            'codesee',
            'Cartographie et compréhension du code par IA.',
            'https://www.codesee.io/',
            dev_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 25}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Sourcegraph
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'sourcegraph') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Sourcegraph',
            'sourcegraph',
            'Moteur de recherche de code avec IA.',
            'https://sourcegraph.com/',
            dev_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;

    -- CodeStream
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'codestream') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'CodeStream',
            'codestream',
            'Collaboration de code en temps réel avec IA.',
            'https://www.codestream.com/',
            dev_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 12}]'::jsonb,
            true,
            false
        );
    END IF;
END $$;

-- Ajouter les outils restants de Données & Préparation
DO $$ 
DECLARE
    data_category_id integer;
BEGIN
    SELECT id INTO data_category_id FROM categories WHERE slug = 'données-&-préparation';

    -- Paxata
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'paxata') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Paxata',
            'paxata',
            'Plateforme de préparation de données self-service.',
            'https://www.paxata.com/',
            data_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;

    -- OpenRefine
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'openrefine') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'OpenRefine',
            'openrefine',
            'Outil open-source de nettoyage de données.',
            'https://openrefine.org/',
            data_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Databricks
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'databricks-prep') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Databricks',
            'databricks-prep',
            'Plateforme unifiée d''analyse et préparation de données.',
            'https://databricks.com/',
            data_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Tamr
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'tamr') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Tamr',
            'tamr',
            'Unification de données par machine learning.',
            'https://www.tamr.com/',
            data_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;

    -- DataRobot
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'datarobot-prep') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'DataRobot',
            'datarobot-prep',
            'Préparation automatisée des données par IA.',
            'https://www.datarobot.com/',
            data_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;

    -- Informatica
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'informatica') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Informatica',
            'informatica',
            'Solutions d''intégration et qualité des données.',
            'https://www.informatica.com/',
            data_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;
END $$;

COMMIT;
