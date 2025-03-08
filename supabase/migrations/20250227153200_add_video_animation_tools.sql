-- Ajouter des outils pour Vidéo & Animation
BEGIN;

-- Image HD pour Vidéo & Animation
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000'
WHERE name = 'Vidéo & Animation';

WITH new_tools (id, name, description, website_url, slug, image_url, pricing, is_active, is_featured) AS (
    VALUES 
    (
        gen_random_uuid(),
        'VideoEnhance AI',
        'Amélioration automatique de la qualité vidéo avec upscaling 4K et réduction du bruit.',
        'https://video-enhance-ai.example.com',
        'video-enhance-ai',
        'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000',
        '{"basic": "199", "pro": "599"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'AnimationStudio',
        'Suite complète d''animation 2D/3D avec personnages générés par IA.',
        'https://animation-studio.example.com',
        'animation-studio',
        'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000',
        '{"indie": "299", "studio": "999"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'MotionTrack',
        'Tracking de mouvement automatique et stabilisation vidéo intelligente.',
        'https://motion-track.example.com',
        'motion-track',
        'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000',
        '{"personal": "149", "business": "499"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'SceneEdit',
        'Édition de scènes vidéo avec découpage intelligent et transitions automatiques.',
        'https://scene-edit.example.com',
        'scene-edit',
        'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000',
        '{"basic": "99", "pro": "399"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'CharacterAI',
        'Création et animation de personnages 3D avec IA générative.',
        'https://character-ai.example.com',
        'character-ai-animation',
        'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000',
        '{"starter": "249", "professional": "799"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'VFXMaster',
        'Effets visuels automatisés avec intégration d''éléments 3D.',
        'https://vfx-master.example.com',
        'vfx-master',
        'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000',
        '{"indie": "399", "studio": "1299"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'AudioSync',
        'Synchronisation audio-vidéo automatique avec correction de lèvres.',
        'https://audio-sync.example.com',
        'audio-sync',
        'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000',
        '{"basic": "149", "pro": "499"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'StoryboardAI',
        'Génération de storyboards à partir de scripts avec IA.',
        'https://storyboard-ai.example.com',
        'storyboard-ai',
        'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000',
        '{"creator": "199", "studio": "699"}'::jsonb,
        true,
        true
    ),
    (
        gen_random_uuid(),
        'ColorMatch',
        'Étalonnage vidéo automatique avec correspondance de scènes.',
        'https://color-match-video.example.com',
        'color-match-video',
        'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000',
        '{"basic": "179", "pro": "599"}'::jsonb,
        true,
        false
    ),
    (
        gen_random_uuid(),
        'RenderFarm',
        'Service de rendu distribué avec optimisation IA des ressources.',
        'https://render-farm.example.com',
        'render-farm',
        'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000',
        '{"pay-as-you-go": true, "enterprise": "1999"}'::jsonb,
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
WHERE c.name = 'Vidéo & Animation'
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
    WHERE name = 'Vidéo & Animation'
)
AND NOT EXISTS (
    SELECT 1 FROM ai_tools 
    WHERE ai_tools.slug = t2.slug 
    AND ai_tools.category_id = t2.category_id
);

COMMIT;
