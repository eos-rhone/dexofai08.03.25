-- Batch 50: Restore AI tools (BabyAGI Family - Suite)
BEGIN;

-- BabyDeerAGI
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'BabyDeerAGI',
    'babydeeragi',
    'Version parallélisée de BabyAGI utilisant GPT-3.5-turbo',
    'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyDeerAGI.py',
    (SELECT id FROM categories WHERE slug = 'agents-automatisation'),
    '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
    true,
    false
)
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

-- BabyElfAGI
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'BabyElfAGI',
    'babyelfagi',
    'Version avancée de BabyAGI avec système de compétences dynamiques',
    'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyElfAGI/main.py',
    (SELECT id FROM categories WHERE slug = 'agents-automatisation'),
    '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
    true,
    false
)
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

-- Add features
INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Exécution parallèle', 'Tâches en parallèle' FROM ai_tools WHERE slug = 'babydeeragi'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Compétences dynamiques', 'Système de compétences évolutif' FROM ai_tools WHERE slug = 'babyelfagi'
ON CONFLICT DO NOTHING;

COMMIT;
