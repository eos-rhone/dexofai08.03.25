-- Ajouter des outils d'automatisation
BEGIN;

INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES
    (
        'Zapier',
        'zapier',
        'Plateforme d''automatisation qui connecte vos apps et automatise les flux de travail avec l''IA.',
        'https://zapier.com/',
        (SELECT id FROM categories WHERE slug = 'automatisation'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 19.99}, {"plan_name": "Team", "price": 49.99}]'::jsonb,
        true,
        true
    ),
    (
        'Make (Integromat)',
        'make-integromat',
        'Plateforme visuelle d''automatisation avec des scénarios complexes et intelligence artificielle.',
        'https://www.make.com/',
        (SELECT id FROM categories WHERE slug = 'automatisation'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 9}, {"plan_name": "Team", "price": 16}]'::jsonb,
        true,
        true
    ),
    (
        'Power Automate',
        'power-automate',
        'Solution Microsoft d''automatisation des processus avec IA intégrée.',
        'https://powerautomate.microsoft.com/',
        (SELECT id FROM categories WHERE slug = 'automatisation'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Premium", "price": 15}]'::jsonb,
        true,
        false
    ),
    (
        'n8n',
        'n8n',
        'Plateforme d''automatisation open-source avec capacités d''IA et workflow fair-code.',
        'https://n8n.io/',
        (SELECT id FROM categories WHERE slug = 'automatisation'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Starter", "price": 20}, {"plan_name": "Pro", "price": 45}]'::jsonb,
        true,
        false
    ),
    (
        'Workato',
        'workato',
        'Plateforme d''automatisation enterprise avec IA pour l''intégration et les processus.',
        'https://www.workato.com/',
        (SELECT id FROM categories WHERE slug = 'automatisation'),
        '[{"plan_name": "Sur devis", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Automation Anywhere',
        'automation-anywhere',
        'Plateforme RPA (Robotic Process Automation) avec intelligence artificielle intégrée.',
        'https://www.automationanywhere.com/',
        (SELECT id FROM categories WHERE slug = 'automatisation'),
        '[{"plan_name": "Essai", "price": 0}, {"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'UiPath',
        'uipath',
        'Suite d''automatisation RPA avec capacités d''IA avancées.',
        'https://www.uipath.com/',
        (SELECT id FROM categories WHERE slug = 'automatisation'),
        '[{"plan_name": "Community", "price": 0}, {"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Tray.io',
        'tray-io',
        'Plateforme d''automatisation générale avec intégration d''IA pour les entreprises.',
        'https://tray.io/',
        (SELECT id FROM categories WHERE slug = 'automatisation'),
        '[{"plan_name": "Pro", "price": null}, {"plan_name": "Enterprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Automate.io',
        'automate-io',
        'Solution d''automatisation cloud avec intégrations multiples et IA.',
        'https://automate.io/',
        (SELECT id FROM categories WHERE slug = 'automatisation'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 29}, {"plan_name": "Business", "price": 99}]'::jsonb,
        true,
        false
    ),
    (
        'Pabbly Connect',
        'pabbly-connect',
        'Outil d''automatisation des tâches avec IA et intégrations multiples.',
        'https://www.pabbly.com/connect/',
        (SELECT id FROM categories WHERE slug = 'automatisation'),
        '[{"plan_name": "Starter", "price": 9}, {"plan_name": "Pro", "price": 19}]'::jsonb,
        true,
        false
    ),
    (
        'Automa',
        'automa',
        'Extension de navigateur pour l''automatisation web avec capacités d''IA.',
        'https://www.automa.site/',
        (SELECT id FROM categories WHERE slug = 'automatisation'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 8}]'::jsonb,
        true,
        false
    ),
    (
        'Huginn',
        'huginn',
        'Agent d''automatisation open-source auto-hébergé avec capacités d''IA.',
        'https://github.com/huginn/huginn',
        (SELECT id FROM categories WHERE slug = 'automatisation'),
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        false
    );

COMMIT;
