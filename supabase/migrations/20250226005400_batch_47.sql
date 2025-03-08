-- Batch 47: Restore AI tools (Outils de Données et Agents)
BEGIN;

-- Adala
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Adala',
    'adala',
    'Framework d''annotation de données qui utilise l''IA pour l''étiquetage',
    'https://github.com/HumanSignal/Adala',
    (SELECT id FROM categories WHERE slug = 'outils-donnees'),
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

-- Agent4Rec
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Agent4Rec',
    'agent4rec',
    'Système de recommandation basé sur des agents IA',
    'https://github.com/LehengTHU/Agent4Rec',
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

-- AgentForge
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'AgentForge',
    'agentforge',
    'Plateforme de développement d''agents IA autonomes',
    'https://github.com/DataBassGit/AgentForge',
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
SELECT id, 'Annotation IA', 'Étiquetage automatique' FROM ai_tools WHERE slug = 'adala'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Recommandation IA', 'Suggestions personnalisées' FROM ai_tools WHERE slug = 'agent4rec'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Création agents', 'Développement d''agents IA' FROM ai_tools WHERE slug = 'agentforge'
ON CONFLICT DO NOTHING;

COMMIT;
