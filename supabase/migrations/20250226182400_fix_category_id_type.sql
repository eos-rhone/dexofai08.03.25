-- Corriger les types pour les catégories
BEGIN;

-- Ajouter les outils restants de Collaboration IA
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

    -- Cybersécurité
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

    -- Développement
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

    -- Données & Préparation
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
