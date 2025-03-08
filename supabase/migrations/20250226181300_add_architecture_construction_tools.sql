-- Ajouter des outils d'architecture et construction
BEGIN;

INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES
    (
        'Autodesk AEC Collection',
        'autodesk-aec',
        'Suite complète d''outils IA pour l''architecture, l''ingénierie et la construction, incluant Revit et AutoCAD.',
        'https://www.autodesk.com/collections/architecture-engineering-construction/',
        (SELECT id FROM categories WHERE slug = 'architecture-&-construction'),
        '[{"plan_name": "Pro", "price": 350}]'::jsonb,
        true,
        true
    ),
    (
        'TestFit',
        'testfit',
        'Logiciel d''optimisation de conception architecturale utilisant l''IA pour générer rapidement des plans de bâtiments.',
        'https://testfit.io/',
        (SELECT id FROM categories WHERE slug = 'architecture-&-construction'),
        '[{"plan_name": "Pro", "price": 299}]'::jsonb,
        true,
        true
    ),
    (
        'Spacemaker',
        'spacemaker',
        'Plateforme d''optimisation de site et d''analyse pour le développement immobilier.',
        'https://spacemaker.ai/',
        (SELECT id FROM categories WHERE slug = 'architecture-&-construction'),
        '[{"plan_name": "Sur devis", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'ArchiStar',
        'archistar',
        'Plateforme de conception générative pour l''architecture et le développement immobilier.',
        'https://www.archistar.ai/',
        (SELECT id FROM categories WHERE slug = 'architecture-&-construction'),
        '[{"plan_name": "Essai", "price": 0}, {"plan_name": "Pro", "price": 199}]'::jsonb,
        true,
        false
    ),
    (
        'Building System Planning',
        'bsp-platform',
        'Outil d''optimisation des systèmes de construction et de planification énergétique.',
        'https://www.bsp-platform.com/',
        (SELECT id FROM categories WHERE slug = 'architecture-&-construction'),
        '[{"plan_name": "Pro", "price": 249}]'::jsonb,
        true,
        false
    ),
    (
        'Alice Technologies',
        'alice-technologies',
        'Plateforme d''optimisation de la construction utilisant l''IA pour la planification et la gestion de projet.',
        'https://www.alicetechnologies.com/',
        (SELECT id FROM categories WHERE slug = 'architecture-&-construction'),
        '[{"plan_name": "Entreprise", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'Hypar',
        'hypar',
        'Plateforme de génération automatique de concepts architecturaux et d''analyse de performance.',
        'https://hypar.io/',
        (SELECT id FROM categories WHERE slug = 'architecture-&-construction'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 99}]'::jsonb,
        true,
        false
    ),
    (
        'BeamChain',
        'beamchain',
        'Solution IA pour l''optimisation structurelle et la conception de poutres.',
        'https://www.beamchain.com/',
        (SELECT id FROM categories WHERE slug = 'architecture-&-construction'),
        '[{"plan_name": "Pro", "price": 199}]'::jsonb,
        true,
        false
    ),
    (
        'BuildingSP',
        'buildingsp',
        'Logiciel d''acheminement MEP automatisé utilisant l''IA pour optimiser les installations.',
        'https://www.buildingsp.com/',
        (SELECT id FROM categories WHERE slug = 'architecture-&-construction'),
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    ),
    (
        'ConstructionSuite AI',
        'constructionsuite-ai',
        'Suite d''outils IA pour la gestion de projet de construction et l''estimation des coûts.',
        'https://www.constructionsuite.ai/',
        (SELECT id FROM categories WHERE slug = 'architecture-&-construction'),
        '[{"plan_name": "Standard", "price": 149}, {"plan_name": "Pro", "price": 299}]'::jsonb,
        true,
        false
    ),
    (
        'Buildr',
        'buildr',
        'Plateforme d''analyse prédictive pour la construction et la maintenance des bâtiments.',
        'https://www.buildr.ai/',
        (SELECT id FROM categories WHERE slug = 'architecture-&-construction'),
        '[{"plan_name": "Essai", "price": 0}, {"plan_name": "Pro", "price": 199}]'::jsonb,
        true,
        false
    ),
    (
        'SmartPlan',
        'smartplan',
        'Générateur de plans d''étage intelligent utilisant l''IA pour optimiser l''espace.',
        'https://www.smartplan.ai/',
        (SELECT id FROM categories WHERE slug = 'architecture-&-construction'),
        '[{"plan_name": "Basic", "price": 49}, {"plan_name": "Pro", "price": 149}]'::jsonb,
        true,
        false
    );

COMMIT;
