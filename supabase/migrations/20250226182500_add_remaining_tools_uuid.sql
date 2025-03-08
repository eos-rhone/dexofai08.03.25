-- Ajouter les outils restants avec le type UUID corrigé
BEGIN;

DO $$ 
DECLARE
    collab_category_id uuid;
    cyber_category_id uuid;
    dev_category_id uuid;
    data_category_id uuid;
BEGIN
    -- Récupérer les IDs des catégories
    SELECT id INTO collab_category_id FROM categories WHERE slug = 'collaboration-ia';
    SELECT id INTO cyber_category_id FROM categories WHERE slug = 'cybersécurité';
    SELECT id INTO dev_category_id FROM categories WHERE slug = 'développement';
    SELECT id INTO data_category_id FROM categories WHERE slug = 'données-&-préparation';

    -- Collaboration IA
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

    -- Cybersécurité
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

    -- Développement
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

    -- Données & Préparation
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
