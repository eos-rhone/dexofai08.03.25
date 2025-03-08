-- Ajouter des outils pour Intelligence Artificielle Générale
BEGIN;

-- Image HD pour Intelligence Artificielle Générale
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=2000'
WHERE name = 'Intelligence Artificielle Générale';

WITH new_tools (id, name, description, website_url, slug, image_url, pricing, is_active, is_featured) AS (
    VALUES 
    (
        gen_random_uuid(),
        'AGI Research',
        'Plateforme de recherche collaborative en Intelligence Artificielle Générale.',
        'https://agi-research.example.com',
        'agi-research',
        'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=2000',
        '{"research": "999", "enterprise": "4999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'CognitiveSim',
        'Simulateur de processus cognitifs pour le développement d''AGI.',
        'https://cognitive-sim.example.com',
        'cognitive-sim',
        'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=2000',
        '{"academic": "499", "commercial": "1999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'AGI Framework',
        'Framework open-source pour le développement d''intelligences artificielles générales.',
        'https://agi-framework.example.com',
        'agi-framework',
        'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=2000',
        '{"free": true, "enterprise": "2999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'NeuralArchitect',
        'Conception d''architectures neuronales avancées pour l''AGI.',
        'https://neural-architect.example.com',
        'neural-architect',
        'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=2000',
        '{"pro": "799", "team": "2499"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'AGI Ethics',
        'Plateforme d''évaluation éthique pour le développement d''AGI.',
        'https://agi-ethics.example.com',
        'agi-ethics',
        'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=2000',
        '{"basic": "299", "enterprise": "1499"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'MetaCognition',
        'Outils de développement de capacités métacognitives pour l''AGI.',
        'https://metacognition.example.com',
        'metacognition',
        'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=2000',
        '{"research": "599", "commercial": "1999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'AGI Benchmark',
        'Suite de tests standardisés pour évaluer les capacités d''AGI.',
        'https://agi-benchmark.example.com',
        'agi-benchmark',
        'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=2000',
        '{"basic": "399", "premium": "999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'KnowledgeBase',
        'Base de connaissances évolutive pour systèmes AGI.',
        'https://knowledge-base.example.com',
        'knowledge-base',
        'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=2000',
        '{"startup": "699", "enterprise": "2999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'AGI Safety',
        'Outils de sécurité et de contrôle pour le développement d''AGI.',
        'https://agi-safety.example.com',
        'agi-safety',
        'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=2000',
        '{"standard": "899", "enterprise": "3999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'TransferLearn',
        'Plateforme de transfert d''apprentissage pour systèmes AGI.',
        'https://transfer-learn.example.com',
        'transfer-learn',
        'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=2000',
        '{"academic": "499", "business": "1499"}'::jsonb,
        true,
        true
    )
)
INSERT INTO tools (
    id, name, description, website_url, slug, image_url, 
    category_id, pricing, is_active, is_featured,
    created_at, updated_at,
    user_count, total_reviews, monthly_users, total_views, average_rating
)
SELECT 
    t.id,
    t.name, 
    t.description, 
    t.website_url,
    t.slug,
    t.image_url,
    c.id as category_id,
    t.pricing,
    t.is_active,
    t.is_featured,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    floor(random() * 10000 + 1000)::integer,
    floor(random() * 1000 + 100)::bigint,
    floor(random() * 5000 + 500)::bigint,
    floor(random() * 50000 + 5000)::bigint,
    (random() * 2 + 3)::numeric(3,2)
FROM new_tools t
CROSS JOIN categories c
WHERE c.name = 'Intelligence Artificielle Générale'
AND NOT EXISTS (
    SELECT 1 FROM tools 
    WHERE tools.slug = t.slug 
    AND tools.category_id = c.id
);

-- Copier dans ai_tools uniquement les nouveaux outils
INSERT INTO ai_tools (
    id, name, description, website_url, slug, image_url, 
    category_id, pricing, is_active, is_featured,
    created_at, updated_at,
    user_count, total_reviews, monthly_users, total_views, average_rating
)
SELECT 
    t2.id, t2.name, t2.description, t2.website_url, t2.slug, t2.image_url,
    t2.category_id, t2.pricing, t2.is_active, t2.is_featured,
    t2.created_at, t2.updated_at,
    t2.user_count, t2.total_reviews, t2.monthly_users, t2.total_views, t2.average_rating
FROM tools t2
WHERE t2.category_id IN (
    SELECT id FROM categories 
    WHERE name = 'Intelligence Artificielle Générale'
)
AND NOT EXISTS (
    SELECT 1 FROM ai_tools 
    WHERE ai_tools.slug = t2.slug 
    AND ai_tools.category_id = t2.category_id
);

COMMIT;
