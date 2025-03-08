-- Ajouter des outils pour Biotechnologie, Blockchain & Web3, Business & Marketing, et Chimie & Matériaux
BEGIN;

-- Outils de Biotechnologie
INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES
    (
        'DeepMind AlphaFold',
        'alphafold',
        'IA pour la prédiction de la structure des protéines avec une précision sans précédent.',
        'https://deepmind.com/research/case-studies/alphafold',
        (SELECT id FROM categories WHERE slug = 'biotechnologie'),
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        true
    ),
    (
        'Atomwise',
        'atomwise',
        'Plateforme de découverte de médicaments basée sur l''IA.',
        'https://www.atomwise.com/',
        (SELECT id FROM categories WHERE slug = 'biotechnologie'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        true
    ),
    (
        'Insilico Medicine',
        'insilico-medicine',
        'IA pour la découverte de médicaments et le développement de traitements.',
        'https://insilico.com/',
        (SELECT id FROM categories WHERE slug = 'biotechnologie'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Benchling',
        'benchling',
        'Plateforme cloud R&D pour la biotechnologie et les sciences de la vie.',
        'https://www.benchling.com/',
        (SELECT id FROM categories WHERE slug = 'biotechnologie'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'BenevolentAI',
        'benevolent-ai',
        'Plateforme d''IA pour la découverte de médicaments et la recherche biomédicale.',
        'https://www.benevolent.com/',
        (SELECT id FROM categories WHERE slug = 'biotechnologie'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'DeepChem',
        'deepchem',
        'Bibliothèque open-source pour l''apprentissage profond en chimie et biologie.',
        'https://deepchem.io/',
        (SELECT id FROM categories WHERE slug = 'biotechnologie'),
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        false
    ),
    (
        'Genedata',
        'genedata',
        'Solutions logicielles pour l''analyse de données en sciences de la vie.',
        'https://www.genedata.com/',
        (SELECT id FROM categories WHERE slug = 'biotechnologie'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Recursion',
        'recursion',
        'Plateforme de découverte de médicaments basée sur l''IA et l''imagerie cellulaire.',
        'https://www.recursion.com/',
        (SELECT id FROM categories WHERE slug = 'biotechnologie'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Schrödinger',
        'schrodinger',
        'Logiciel de modélisation moléculaire et de découverte de médicaments.',
        'https://www.schrodinger.com/',
        (SELECT id FROM categories WHERE slug = 'biotechnologie'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Absci',
        'absci',
        'Plateforme d''IA pour l''ingénierie des protéines et la découverte d''anticorps.',
        'https://www.absci.com/',
        (SELECT id FROM categories WHERE slug = 'biotechnologie'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    );

-- Outils Blockchain & Web3
INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES
    (
        'Ocean Protocol',
        'ocean-protocol',
        'Protocole décentralisé pour le partage de données et l''IA.',
        'https://oceanprotocol.com/',
        (SELECT id FROM categories WHERE slug = 'blockchain-&-web3'),
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        true
    ),
    (
        'SingularityNET',
        'singularitynet',
        'Marketplace décentralisé pour les services d''IA.',
        'https://singularitynet.io/',
        (SELECT id FROM categories WHERE slug = 'blockchain-&-web3'),
        '[{"plan_name": "Pay-per-use", "price": null}]'::jsonb,
        true,
        true
    ),
    (
        'Fetch.ai',
        'fetch-ai',
        'Plateforme d''agents autonomes et d''IA décentralisée.',
        'https://fetch.ai/',
        (SELECT id FROM categories WHERE slug = 'blockchain-&-web3'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Numerai',
        'numerai',
        'Hedge fund décentralisé utilisant l''IA et la blockchain.',
        'https://numer.ai/',
        (SELECT id FROM categories WHERE slug = 'blockchain-&-web3'),
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        false
    ),
    (
        'Matrix AI Network',
        'matrix-ai',
        'Blockchain intelligente avec capacités d''IA intégrées.',
        'https://www.matrix.io/',
        (SELECT id FROM categories WHERE slug = 'blockchain-&-web3'),
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        false
    ),
    (
        'DeepBrain Chain',
        'deepbrain-chain',
        'Infrastructure de calcul décentralisée pour l''IA.',
        'https://www.deepbrainchain.org/',
        (SELECT id FROM categories WHERE slug = 'blockchain-&-web3'),
        '[{"plan_name": "Pay-per-use", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Effect Network',
        'effect-network',
        'Plateforme décentralisée pour les tâches d''IA et de microtravail.',
        'https://effect.network/',
        (SELECT id FROM categories WHERE slug = 'blockchain-&-web3'),
        '[{"plan_name": "Pay-per-use", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Cortex Labs',
        'cortex-labs',
        'Blockchain pour l''exécution de modèles d''IA décentralisés.',
        'https://www.cortexlabs.ai/',
        (SELECT id FROM categories WHERE slug = 'blockchain-&-web3'),
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        false
    ),
    (
        'Velas',
        'velas',
        'Blockchain IA avec consensus neuroadaptif.',
        'https://www.velas.com/',
        (SELECT id FROM categories WHERE slug = 'blockchain-&-web3'),
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        false
    ),
    (
        'Alethea AI',
        'alethea-ai',
        'Protocole pour créer et monétiser des avatars IA intelligents.',
        'https://alethea.ai/',
        (SELECT id FROM categories WHERE slug = 'blockchain-&-web3'),
        '[{"plan_name": "Pay-per-use", "price": null}]'::jsonb,
        true,
        false
    );

-- Outils Business & Marketing
INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES
    (
        'HubSpot Marketing Hub',
        'hubspot-marketing',
        'Suite marketing tout-en-un avec fonctionnalités d''IA avancées.',
        'https://www.hubspot.com/products/marketing',
        (SELECT id FROM categories WHERE slug = 'business-&-marketing'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Starter", "price": 45}, {"plan_name": "Pro", "price": 800}]'::jsonb,
        true,
        true
    ),
    (
        'Salesforce Einstein',
        'salesforce-einstein',
        'IA intégrée pour CRM et automatisation marketing.',
        'https://www.salesforce.com/products/einstein/overview/',
        (SELECT id FROM categories WHERE slug = 'business-&-marketing'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        true
    ),
    (
        'Albert AI',
        'albert-ai',
        'Plateforme marketing autonome basée sur l''IA.',
        'https://albert.ai/',
        (SELECT id FROM categories WHERE slug = 'business-&-marketing'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Persado',
        'persado',
        'IA pour la génération et l''optimisation de contenu marketing.',
        'https://www.persado.com/',
        (SELECT id FROM categories WHERE slug = 'business-&-marketing'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Pattern89',
        'pattern89',
        'Prédiction et optimisation des performances marketing avec l''IA.',
        'https://www.pattern89.com/',
        (SELECT id FROM categories WHERE slug = 'business-&-marketing'),
        '[{"plan_name": "Pro", "price": 999}]'::jsonb,
        true,
        false
    ),
    (
        'Crayon',
        'crayon',
        'Intelligence concurrentielle et analyse de marché par IA.',
        'https://www.crayon.co/',
        (SELECT id FROM categories WHERE slug = 'business-&-marketing'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Phrasee',
        'phrasee',
        'IA pour l''optimisation du langage marketing.',
        'https://phrasee.co/',
        (SELECT id FROM categories WHERE slug = 'business-&-marketing'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Seventh Sense',
        'seventh-sense',
        'Optimisation des envois d''emails par IA.',
        'https://www.theseventhsense.com/',
        (SELECT id FROM categories WHERE slug = 'business-&-marketing'),
        '[{"plan_name": "Pro", "price": 99}]'::jsonb,
        true,
        false
    ),
    (
        'Drift',
        'drift',
        'Plateforme de conversation marketing avec IA.',
        'https://www.drift.com/',
        (SELECT id FROM categories WHERE slug = 'business-&-marketing'),
        '[{"plan_name": "Premium", "price": 1500}]'::jsonb,
        true,
        false
    ),
    (
        'Optimizely',
        'optimizely',
        'Plateforme d''expérimentation et personnalisation par IA.',
        'https://www.optimizely.com/',
        (SELECT id FROM categories WHERE slug = 'business-&-marketing'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    );

-- Outils Chimie & Matériaux
INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES
    (
        'Materials Project',
        'materials-project',
        'Base de données et outils d''IA pour la science des matériaux.',
        'https://materialsproject.org/',
        (SELECT id FROM categories WHERE slug = 'chimie-&-matériaux'),
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        true
    ),
    (
        'Citrine Informatics',
        'citrine-informatics',
        'Plateforme d''IA pour le développement de matériaux.',
        'https://citrine.io/',
        (SELECT id FROM categories WHERE slug = 'chimie-&-matériaux'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        true
    ),
    (
        'DeepChem',
        'deepchem-materials',
        'Bibliothèque d''apprentissage profond pour la chimie computationnelle.',
        'https://deepchem.io/',
        (SELECT id FROM categories WHERE slug = 'chimie-&-matériaux'),
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        false
    ),
    (
        'Kebotix',
        'kebotix',
        'Plateforme robotique et IA pour la découverte de matériaux.',
        'https://www.kebotix.com/',
        (SELECT id FROM categories WHERE slug = 'chimie-&-matériaux'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Schrödinger Materials',
        'schrodinger-materials',
        'Suite logicielle pour la simulation de matériaux.',
        'https://www.schrodinger.com/materials/',
        (SELECT id FROM categories WHERE slug = 'chimie-&-matériaux'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Graphcore Materials',
        'graphcore-materials',
        'IA pour l''analyse et la conception de nouveaux matériaux.',
        'https://www.graphcore.ai/materials',
        (SELECT id FROM categories WHERE slug = 'chimie-&-matériaux'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'ChemAxon',
        'chemaxon',
        'Solutions logicielles pour la chimie computationnelle.',
        'https://chemaxon.com/',
        (SELECT id FROM categories WHERE slug = 'chimie-&-matériaux'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Monocle',
        'monocle-materials',
        'Plateforme d''analyse prédictive pour les matériaux.',
        'https://www.monocle.ai/',
        (SELECT id FROM categories WHERE slug = 'chimie-&-matériaux'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'MaterialsZone',
        'materialszone',
        'Gestion de données et IA pour la recherche sur les matériaux.',
        'https://www.materials.zone/',
        (SELECT id FROM categories WHERE slug = 'chimie-&-matériaux'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Uncountable',
        'uncountable',
        'Plateforme d''optimisation R&D pour matériaux avancés.',
        'https://www.uncountable.com/',
        (SELECT id FROM categories WHERE slug = 'chimie-&-matériaux'),
        '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    );

COMMIT;
