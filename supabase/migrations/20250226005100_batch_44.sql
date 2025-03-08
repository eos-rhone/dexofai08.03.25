-- Batch 44: Restore AI tools (Génération de Code)
BEGIN;

-- ChatDev
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'ChatDev',
    'chatdev',
    'Assistant de développement logiciel qui simule une équipe de dev',
    'https://github.com/OpenBMB/ChatDev',
    (SELECT id FROM categories WHERE slug = 'generation-code'),
    '[{"plan_name": "Free", "price": 0}]'::jsonb,
    true,
    true
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

-- GPT Engineer
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'GPT Engineer',
    'gpt-engineer',
    'Spécifie ce que vous voulez construire, l''IA crée le code',
    'https://gptengineer.app',
    (SELECT id FROM categories WHERE slug = 'generation-code'),
    '[{"plan_name": "Free", "price": 0}]'::jsonb,
    true,
    true
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

-- Aider
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Aider',
    'aider',
    'Assistant de programmation IA qui aide au développement en temps réel',
    'https://aider.chat',
    (SELECT id FROM categories WHERE slug = 'generation-code'),
    '[{"plan_name": "Free", "price": 0}]'::jsonb,
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
SELECT id, 'Simulation équipe', 'Simulation d''une équipe de dev' FROM ai_tools WHERE slug = 'chatdev'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Génération projet', 'Création complète de projets' FROM ai_tools WHERE slug = 'gpt-engineer'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Assistance temps réel', 'Suggestions de code en direct' FROM ai_tools WHERE slug = 'aider'
ON CONFLICT DO NOTHING;

COMMIT;
