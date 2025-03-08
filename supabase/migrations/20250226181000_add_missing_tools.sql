-- Ajouter les outils manquants
BEGIN;

-- Outils d'analyse de données
INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES
    (
        'Orange',
        'orange-data-mining',
        'Logiciel open-source d''analyse de données et d''apprentissage automatique avec interface visuelle.',
        'https://orangedatamining.com/',
        (SELECT id FROM categories WHERE slug = 'analyse-de-données'),
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        false
    ),
    (
        'Weka',
        'weka',
        'Collection d''algorithmes d''apprentissage automatique pour les tâches de data mining.',
        'https://www.cs.waikato.ac.nz/ml/weka/',
        (SELECT id FROM categories WHERE slug = 'analyse-de-données'),
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        false
    );

-- Outils d'archéologie
INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES
    (
        'Ancient Scene',
        'ancient-scene',
        'Reconstitution de scènes historiques en 3D à partir de données archéologiques.',
        'https://ancient-scene.ai/',
        (SELECT id FROM categories WHERE slug = 'archéologie'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Stratus',
        'stratus-archaeology',
        'Analyse de données stratigraphiques et cartographie des sites archéologiques.',
        'https://stratus-archaeology.com/',
        (SELECT id FROM categories WHERE slug = 'archéologie'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Pottery Scanner',
        'pottery-scanner',
        'Scanner 3D et analyse de poteries archéologiques avec IA.',
        'https://pottery-scanner.org/',
        (SELECT id FROM categories WHERE slug = 'archéologie'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Site Detector',
        'site-detector',
        'Détection de sites archéologiques par analyse d''images satellites.',
        'https://site-detector.ai/',
        (SELECT id FROM categories WHERE slug = 'archéologie'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Artifact Analyzer',
        'artifact-analyzer',
        'Analyse et classification automatique d''artéfacts archéologiques.',
        'https://artifact-analyzer.com/',
        (SELECT id FROM categories WHERE slug = 'archéologie'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    );

COMMIT;
