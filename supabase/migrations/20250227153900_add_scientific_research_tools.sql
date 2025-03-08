-- Ajouter des outils pour Recherche scientifique
BEGIN;

-- Image HD pour Recherche scientifique
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1532094349884-543bc11b234d?q=80&w=2000'
WHERE name = 'Recherche scientifique';

WITH new_tools (id, name, description, website_url, slug, image_url, pricing, is_active, is_featured) AS (
    VALUES 
    (
        gen_random_uuid(),
        'ResearchGPT',
        'Assistant IA pour la recherche scientifique avec analyse de publications et génération de résumés.',
        'research-gpt.example.com',
        'research-gpt',
        'https://images.unsplash.com/photo-1532094349884-543bc11b234d?q=80&w=2000',
        '{"academic": "299", "lab": "999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'DataSynth',
        'Génération de données synthétiques pour la validation d''hypothèses scientifiques.',
        'data-synth.example.com',
        'data-synth',
        'https://images.unsplash.com/photo-1532094349884-543bc11b234d?q=80&w=2000',
        '{"basic": "199", "pro": "699"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'LitReview',
        'Analyse automatisée de la littérature scientifique avec cartographie des concepts.',
        'lit-review.example.com',
        'lit-review',
        'https://images.unsplash.com/photo-1532094349884-543bc11b234d?q=80&w=2000',
        '{"researcher": "399", "institution": "1299"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'HypoTest',
        'Tests d''hypothèses automatisés avec analyse statistique avancée.',
        'hypo-test.example.com',
        'hypo-test',
        'https://images.unsplash.com/photo-1532094349884-543bc11b234d?q=80&w=2000',
        '{"free": "0", "premium": "499"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'LabAssist',
        'Assistant virtuel pour la planification et l''exécution d''expériences.',
        'lab-assist.example.com',
        'lab-assist',
        'https://images.unsplash.com/photo-1532094349884-543bc11b234d?q=80&w=2000',
        '{"basic": "299", "enterprise": "999"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'PaperCraft',
        'Rédaction assistée d''articles scientifiques avec formatage automatique.',
        'paper-craft.example.com',
        'paper-craft',
        'https://images.unsplash.com/photo-1532094349884-543bc11b234d?q=80&w=2000',
        '{"student": "99", "professor": "399"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'DataViz',
        'Visualisation interactive de données scientifiques avec IA.',
        'data-viz-science.example.com',
        'data-viz-science',
        'https://images.unsplash.com/photo-1532094349884-543bc11b234d?q=80&w=2000',
        '{"basic": "199", "pro": "599"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'PeerReviewAI',
        'Analyse automatique de manuscrits pour la revue par les pairs.',
        'peer-review-ai.example.com',
        'peer-review-ai',
        'https://images.unsplash.com/photo-1532094349884-543bc11b234d?q=80&w=2000',
        '{"reviewer": "299", "journal": "999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'GrantWriter',
        'Assistant IA pour la rédaction de demandes de subventions.',
        'grant-writer.example.com',
        'grant-writer',
        'https://images.unsplash.com/photo-1532094349884-543bc11b234d?q=80&w=2000',
        '{"researcher": "399", "institution": "1299"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'CollabNet',
        'Plateforme de collaboration scientifique avec matching automatique.',
        'collab-net.example.com',
        'collab-net',
        'https://images.unsplash.com/photo-1532094349884-543bc11b234d?q=80&w=2000',
        '{"individual": "199", "team": "699"}'::jsonb,
        true,
        false
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
WHERE c.name = 'Recherche scientifique';

-- Copier dans ai_tools
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
    WHERE name = 'Recherche scientifique'
)
AND NOT EXISTS (
    SELECT 1 FROM ai_tools 
    WHERE ai_tools.slug = t2.slug 
    AND ai_tools.category_id = t2.category_id
);

COMMIT;
