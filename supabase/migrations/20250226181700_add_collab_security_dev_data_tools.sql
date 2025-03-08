-- Ajouter des outils pour Collaboration IA, Cybersécurité, Développement et Données & Préparation
BEGIN;

-- Outils de Collaboration IA
INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES
    (
        'Weights & Biases',
        'weights-and-biases',
        'Plateforme MLOps pour la collaboration et le suivi d''expériences en équipe.',
        'https://wandb.ai/',
        (SELECT id FROM categories WHERE slug = 'collaboration-ia'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Team", "price": 99}]'::jsonb,
        true,
        true
    ),
    (
        'Neptune.ai',
        'neptune-ai',
        'Plateforme de métadonnées pour les équipes MLOps.',
        'https://neptune.ai/',
        (SELECT id FROM categories WHERE slug = 'collaboration-ia'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Team", "price": 49}]'::jsonb,
        true,
        true
    ),
    (
        'DVC (Data Version Control)',
        'dvc',
        'Système de versioning pour les projets ML en équipe.',
        'https://dvc.org/',
        (SELECT id FROM categories WHERE slug = 'collaboration-ia'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'ClearML',
        'clearml',
        'Plateforme MLOps open-source pour la collaboration.',
        'https://clear.ml/',
        (SELECT id FROM categories WHERE slug = 'collaboration-ia'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 100}]'::jsonb,
        true,
        false
    ),
    (
        'Comet ML',
        'comet-ml',
        'Plateforme de gestion du cycle de vie ML pour les équipes.',
        'https://www.comet.ml/',
        (SELECT id FROM categories WHERE slug = 'collaboration-ia'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 49}]'::jsonb,
        true,
        false
    ),
    (
        'Determined AI',
        'determined-ai',
        'Plateforme de formation et collaboration ML.',
        'https://www.determined.ai/',
        (SELECT id FROM categories WHERE slug = 'collaboration-ia'),
        '[{"plan_name": "Open Source", "price": 0}, {"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Pachyderm',
        'pachyderm',
        'Plateforme de data science collaborative et versionnée.',
        'https://www.pachyderm.com/',
        (SELECT id FROM categories WHERE slug = 'collaboration-ia'),
        '[{"plan_name": "Community", "price": 0}, {"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Domino Data Lab',
        'domino-data-lab',
        'Plateforme enterprise pour la collaboration en data science.',
        'https://www.dominodatalab.com/',
        (SELECT id FROM categories WHERE slug = 'collaboration-ia'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'CNVRG.IO',
        'cnvrg-io',
        'Plateforme MLOps full-stack pour les équipes.',
        'https://cnvrg.io/',
        (SELECT id FROM categories WHERE slug = 'collaboration-ia'),
        '[{"plan_name": "Community", "price": 0}, {"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Polyaxon',
        'polyaxon',
        'Plateforme MLOps pour orchestrer les projets ML en équipe.',
        'https://polyaxon.com/',
        (SELECT id FROM categories WHERE slug = 'collaboration-ia'),
        '[{"plan_name": "CE", "price": 0}, {"plan_name": "Team", "price": 199}]'::jsonb,
        true,
        false
    );

-- Outils de Cybersécurité
INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES
    (
        'Darktrace',
        'darktrace',
        'Plateforme de cybersécurité autonome basée sur l''IA.',
        'https://www.darktrace.com/',
        (SELECT id FROM categories WHERE slug = 'cybersécurité'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        true
    ),
    (
        'CrowdStrike',
        'crowdstrike',
        'Protection des endpoints avec IA avancée.',
        'https://www.crowdstrike.com/',
        (SELECT id FROM categories WHERE slug = 'cybersécurité'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        true
    ),
    (
        'BlackBerry Cylance',
        'cylance',
        'Solution antivirus et EDR basée sur l''IA.',
        'https://www.cylance.com/',
        (SELECT id FROM categories WHERE slug = 'cybersécurité'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Deep Instinct',
        'deep-instinct',
        'Protection prédictive contre les malwares par deep learning.',
        'https://www.deepinstinct.com/',
        (SELECT id FROM categories WHERE slug = 'cybersécurité'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'ExtraHop Reveal(x)',
        'extrahop',
        'Détection et réponse réseau basée sur l''IA.',
        'https://www.extrahop.com/',
        (SELECT id FROM categories WHERE slug = 'cybersécurité'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'SentinelOne',
        'sentinelone',
        'Plateforme de sécurité autonome.',
        'https://www.sentinelone.com/',
        (SELECT id FROM categories WHERE slug = 'cybersécurité'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Blue Hexagon',
        'blue-hexagon',
        'Sécurité cloud en temps réel par deep learning.',
        'https://bluehexagon.ai/',
        (SELECT id FROM categories WHERE slug = 'cybersécurité'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Vectra AI',
        'vectra-ai',
        'Détection et réponse aux menaces par IA.',
        'https://www.vectra.ai/',
        (SELECT id FROM categories WHERE slug = 'cybersécurité'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Cynet',
        'cynet',
        'Plateforme de sécurité autonome tout-en-un.',
        'https://www.cynet.com/',
        (SELECT id FROM categories WHERE slug = 'cybersécurité'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'CloudStrike',
        'cloudstrike',
        'Protection cloud native avec IA.',
        'https://www.cloudstrike.ai/',
        (SELECT id FROM categories WHERE slug = 'cybersécurité'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    );

-- Outils de Développement
INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES
    (
        'GitHub Copilot',
        'github-copilot',
        'Assistant de programmation IA pour les développeurs.',
        'https://github.com/features/copilot',
        (SELECT id FROM categories WHERE slug = 'développement'),
        '[{"plan_name": "Pro", "price": 10}]'::jsonb,
        true,
        true
    ),
    (
        'Tabnine',
        'tabnine',
        'Autocomplétion de code IA multi-langages.',
        'https://www.tabnine.com/',
        (SELECT id FROM categories WHERE slug = 'développement'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 12}]'::jsonb,
        true,
        true
    ),
    (
        'Kite',
        'kite',
        'Assistant de programmation avec complétion de ligne.',
        'https://www.kite.com/',
        (SELECT id FROM categories WHERE slug = 'développement'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 16.6}]'::jsonb,
        true,
        false
    ),
    (
        'CodeGuru',
        'codeguru',
        'Revue de code automatisée par Amazon.',
        'https://aws.amazon.com/codeguru/',
        (SELECT id FROM categories WHERE slug = 'développement'),
        '[{"plan_name": "Pay-per-use", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'DeepCode',
        'deepcode',
        'Analyse sémantique du code par IA.',
        'https://www.deepcode.ai/',
        (SELECT id FROM categories WHERE slug = 'développement'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Team", "price": 20}]'::jsonb,
        true,
        false
    ),
    (
        'Snyk',
        'snyk',
        'Sécurité du code avec IA.',
        'https://snyk.io/',
        (SELECT id FROM categories WHERE slug = 'développement'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Team", "price": 12}]'::jsonb,
        true,
        false
    ),
    (
        'CodeSee',
        'codesee',
        'Cartographie et compréhension du code par IA.',
        'https://www.codesee.io/',
        (SELECT id FROM categories WHERE slug = 'développement'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 25}]'::jsonb,
        true,
        false
    ),
    (
        'Replit',
        'replit',
        'IDE collaboratif avec fonctionnalités IA.',
        'https://replit.com/',
        (SELECT id FROM categories WHERE slug = 'développement'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 7}]'::jsonb,
        true,
        false
    ),
    (
        'Sourcegraph',
        'sourcegraph',
        'Moteur de recherche de code avec IA.',
        'https://sourcegraph.com/',
        (SELECT id FROM categories WHERE slug = 'développement'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'CodeStream',
        'codestream',
        'Collaboration de code en temps réel avec IA.',
        'https://www.codestream.com/',
        (SELECT id FROM categories WHERE slug = 'développement'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 12}]'::jsonb,
        true,
        false
    );

-- Outils de Données & Préparation
INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES
    (
        'Trifacta',
        'trifacta',
        'Plateforme de préparation de données intelligente.',
        'https://www.trifacta.com/',
        (SELECT id FROM categories WHERE slug = 'données-&-préparation'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        true
    ),
    (
        'Dataiku',
        'dataiku-prep',
        'Plateforme collaborative de data science.',
        'https://www.dataiku.com/',
        (SELECT id FROM categories WHERE slug = 'données-&-préparation'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        true
    ),
    (
        'Alteryx',
        'alteryx-prep',
        'Plateforme d''analyse et préparation de données.',
        'https://www.alteryx.com/',
        (SELECT id FROM categories WHERE slug = 'données-&-préparation'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Talend',
        'talend',
        'Suite d''intégration et qualité des données.',
        'https://www.talend.com/',
        (SELECT id FROM categories WHERE slug = 'données-&-préparation'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Paxata',
        'paxata',
        'Plateforme de préparation de données self-service.',
        'https://www.paxata.com/',
        (SELECT id FROM categories WHERE slug = 'données-&-préparation'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'OpenRefine',
        'openrefine',
        'Outil open-source de nettoyage de données.',
        'https://openrefine.org/',
        (SELECT id FROM categories WHERE slug = 'données-&-préparation'),
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        false
    ),
    (
        'Databricks',
        'databricks-prep',
        'Plateforme unifiée d''analyse et préparation de données.',
        'https://databricks.com/',
        (SELECT id FROM categories WHERE slug = 'données-&-préparation'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Tamr',
        'tamr',
        'Unification de données par machine learning.',
        'https://www.tamr.com/',
        (SELECT id FROM categories WHERE slug = 'données-&-préparation'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'DataRobot',
        'datarobot-prep',
        'Préparation automatisée des données par IA.',
        'https://www.datarobot.com/',
        (SELECT id FROM categories WHERE slug = 'données-&-préparation'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Informatica',
        'informatica',
        'Solutions d''intégration et qualité des données.',
        'https://www.informatica.com/',
        (SELECT id FROM categories WHERE slug = 'données-&-préparation'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    );

COMMIT;
