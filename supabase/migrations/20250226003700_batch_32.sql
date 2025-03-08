-- Batch 32: Add AI tools from Empty Dawn
BEGIN;

-- Recherche avancée
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Consensus',
    'consensus',
    'Moteur de recherche pour articles scientifiques',
    'https://consensus.app',
    (SELECT id FROM categories WHERE slug = 'recherche'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]'::jsonb,
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

-- Elicit
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Elicit',
    'elicit',
    'Assistant de recherche scientifique par IA',
    'https://elicit.org',
    (SELECT id FROM categories WHERE slug = 'recherche'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 25}]'::jsonb,
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

-- Add tool features
INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Analyse papers', 'Analyse d''articles scientifiques' FROM ai_tools WHERE slug = 'consensus'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Synthèse recherche', 'Résumés automatiques de recherches' FROM ai_tools WHERE slug = 'consensus'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Recherche intelligente', 'Compréhension du contexte scientifique' FROM ai_tools WHERE slug = 'elicit'
ON CONFLICT DO NOTHING;

COMMIT;
