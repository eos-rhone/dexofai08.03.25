-- Batch 33: Add remaining AI tools from Black Shrine
BEGIN;

-- Recherche spécialisée
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'ResearchRabbit',
    'research-rabbit',
    'Découverte de papers académiques par IA',
    'https://researchrabbit.ai',
    (SELECT id FROM categories WHERE slug = 'recherche'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 15}]'::jsonb,
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

-- Semantic Scholar
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Semantic Scholar',
    'semantic-scholar',
    'Recherche scientifique augmentée par l''IA',
    'https://semanticscholar.org',
    (SELECT id FROM categories WHERE slug = 'recherche'),
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

-- Add tool features
INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Cartographie citations', 'Visualisation des relations entre papers' FROM ai_tools WHERE slug = 'research-rabbit'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Recommandations IA', 'Suggestions de lectures pertinentes' FROM ai_tools WHERE slug = 'research-rabbit'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Analyse impact', 'Mesure de l''impact des recherches' FROM ai_tools WHERE slug = 'semantic-scholar'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Résumés IA', 'Synthèses automatiques des papers' FROM ai_tools WHERE slug = 'semantic-scholar'
ON CONFLICT DO NOTHING;

COMMIT;
