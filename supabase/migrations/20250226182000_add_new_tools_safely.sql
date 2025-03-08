-- Ajouter de nouveaux outils en toute sécurité
BEGIN;

-- Mise à jour des outils de Collaboration IA
DO $$ 
DECLARE
    collab_category_id integer;
BEGIN
    SELECT id INTO collab_category_id FROM categories WHERE slug = 'collaboration-ia';

    -- Neptune.ai
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'neptune-ai') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Neptune.ai',
            'neptune-ai',
            'Plateforme de métadonnées pour les équipes MLOps.',
            'https://neptune.ai/',
            collab_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Team", "price": 49}]'::jsonb,
            true,
            true
        );
    END IF;

    -- DVC
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'dvc') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'DVC (Data Version Control)',
            'dvc',
            'Système de versioning pour les projets ML en équipe.',
            'https://dvc.org/',
            collab_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        );
    END IF;

    -- ClearML
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'clearml') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'ClearML',
            'clearml',
            'Plateforme MLOps open-source pour la collaboration.',
            'https://clear.ml/',
            collab_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 100}]'::jsonb,
            true,
            false
        );
    END IF;
END $$;

-- Mise à jour des outils de Cybersécurité
DO $$ 
DECLARE
    cyber_category_id integer;
BEGIN
    SELECT id INTO cyber_category_id FROM categories WHERE slug = 'cybersécurité';

    -- Darktrace
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'darktrace') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Darktrace',
            'darktrace',
            'Plateforme de cybersécurité autonome basée sur l''IA.',
            'https://www.darktrace.com/',
            cyber_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            true
        );
    END IF;

    -- CrowdStrike
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'crowdstrike') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'CrowdStrike',
            'crowdstrike',
            'Protection des endpoints avec IA avancée.',
            'https://www.crowdstrike.com/',
            cyber_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            true
        );
    END IF;
END $$;

-- Mise à jour des outils de Développement
DO $$ 
DECLARE
    dev_category_id integer;
BEGIN
    SELECT id INTO dev_category_id FROM categories WHERE slug = 'développement';

    -- GitHub Copilot
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'github-copilot') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'GitHub Copilot',
            'github-copilot',
            'Assistant de programmation IA pour les développeurs.',
            'https://github.com/features/copilot',
            dev_category_id,
            '[{"plan_name": "Pro", "price": 10}]'::jsonb,
            true,
            true
        );
    END IF;

    -- Tabnine
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'tabnine') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Tabnine',
            'tabnine',
            'Autocomplétion de code IA multi-langages.',
            'https://www.tabnine.com/',
            dev_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 12}]'::jsonb,
            true,
            true
        );
    END IF;
END $$;

-- Mise à jour des outils de Données & Préparation
DO $$ 
DECLARE
    data_category_id integer;
BEGIN
    SELECT id INTO data_category_id FROM categories WHERE slug = 'données-&-préparation';

    -- Trifacta
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'trifacta') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Trifacta',
            'trifacta',
            'Plateforme de préparation de données intelligente.',
            'https://www.trifacta.com/',
            data_category_id,
            '[{"plan_name": "Pro", "price": null}]'::jsonb,
            true,
            true
        );
    END IF;

    -- Dataiku
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'dataiku-prep') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Dataiku',
            'dataiku-prep',
            'Plateforme collaborative de data science.',
            'https://www.dataiku.com/',
            data_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            true
        );
    END IF;
END $$;

-- Mettre à jour les catégories des outils existants
UPDATE ai_tools 
SET category_id = (SELECT id FROM categories WHERE slug = 'collaboration-ia')
WHERE slug IN ('weights-and-biases', 'neptune-ai', 'dvc', 'clearml', 'comet-ml');

UPDATE ai_tools 
SET category_id = (SELECT id FROM categories WHERE slug = 'cybersécurité')
WHERE slug IN ('darktrace', 'crowdstrike', 'cylance', 'deep-instinct', 'extrahop');

UPDATE ai_tools 
SET category_id = (SELECT id FROM categories WHERE slug = 'développement')
WHERE slug IN ('github-copilot', 'tabnine', 'kite', 'codeguru', 'deepcode');

UPDATE ai_tools 
SET category_id = (SELECT id FROM categories WHERE slug = 'données-&-préparation')
WHERE slug IN ('trifacta', 'dataiku-prep', 'alteryx-prep', 'talend', 'paxata');

COMMIT;
