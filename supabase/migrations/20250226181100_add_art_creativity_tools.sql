-- Ajouter des outils d'art et créativité
BEGIN;

INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES
    (
        'Artbreeder',
        'artbreeder',
        'Plateforme de création d''images par IA permettant de mélanger et d''éditer des styles artistiques.',
        'https://www.artbreeder.com/',
        (SELECT id FROM categories WHERE slug = 'art-&-créativité'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 8.99}]'::jsonb,
        true,
        true
    ),
    (
        'RunwayML',
        'runwayml',
        'Suite créative d''outils d''IA pour l''édition vidéo, la génération d''images et les effets spéciaux.',
        'https://runwayml.com/',
        (SELECT id FROM categories WHERE slug = 'art-&-créativité'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 15}]'::jsonb,
        true,
        true
    ),
    (
        'Wombo Dream',
        'wombo-dream',
        'Application de création d''œuvres d''art à partir de descriptions textuelles.',
        'https://www.wombo.art/',
        (SELECT id FROM categories WHERE slug = 'art-&-créativité'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 9.99}]'::jsonb,
        true,
        false
    ),
    (
        'NightCafe Creator',
        'nightcafe',
        'Plateforme de création artistique par IA avec plusieurs styles et algorithmes.',
        'https://nightcafe.studio/',
        (SELECT id FROM categories WHERE slug = 'art-&-créativité'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 9.99}]'::jsonb,
        true,
        false
    ),
    (
        'Deep Dream Generator',
        'deep-dream-generator',
        'Outil de création d''images surréalistes basé sur les réseaux de neurones.',
        'https://deepdreamgenerator.com/',
        (SELECT id FROM categories WHERE slug = 'art-&-créativité'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 19}]'::jsonb,
        true,
        false
    ),
    (
        'Prisma',
        'prisma',
        'Application mobile transformant les photos en œuvres d''art avec différents styles artistiques.',
        'https://prisma-ai.com/',
        (SELECT id FROM categories WHERE slug = 'art-&-créativité'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Premium", "price": 7.99}]'::jsonb,
        true,
        false
    ),
    (
        'Paintschainer',
        'paintschainer',
        'Outil de colorisation automatique pour les dessins et croquis.',
        'https://paintschainer.preferred.tech/',
        (SELECT id FROM categories WHERE slug = 'art-&-créativité'),
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        false
    ),
    (
        'Gaugan',
        'gaugan',
        'Outil de NVIDIA transformant des croquis en paysages photoréalistes.',
        'http://gaugan.org/',
        (SELECT id FROM categories WHERE slug = 'art-&-créativité'),
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        false
    ),
    (
        'Playform',
        'playform',
        'Plateforme d''art génératif permettant aux artistes de créer avec l''IA.',
        'https://www.playform.io/',
        (SELECT id FROM categories WHERE slug = 'art-&-créativité'),
        '[{"plan_name": "Essai", "price": 0}, {"plan_name": "Pro", "price": 29}]'::jsonb,
        true,
        false
    ),
    (
        'DeepArt',
        'deepart',
        'Transforme vos photos en utilisant le style d''œuvres d''art célèbres.',
        'https://deepart.io/',
        (SELECT id FROM categories WHERE slug = 'art-&-créativité'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 14.99}]'::jsonb,
        true,
        false
    ),
    (
        'Fotor GoArt',
        'fotor-goart',
        'Outil de transformation d''images en art avec des filtres basés sur l''IA.',
        'https://www.fotor.com/features/goart/',
        (SELECT id FROM categories WHERE slug = 'art-&-créativité'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 8.99}]'::jsonb,
        true,
        false
    ),
    (
        'Neural Style',
        'neural-style',
        'Application web de transfert de style artistique basée sur les réseaux de neurones.',
        'https://neural.style/',
        (SELECT id FROM categories WHERE slug = 'art-&-créativité'),
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Premium", "price": 12.99}]'::jsonb,
        true,
        false
    );

COMMIT;
