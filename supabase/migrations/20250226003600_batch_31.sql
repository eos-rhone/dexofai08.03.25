-- Batch 31: Add AI tools from Holy Pebble
BEGIN;

-- Recherche
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Perplexity AI',
    'perplexity-ai',
    'Moteur de recherche augmenté par l''IA',
    'https://perplexity.ai',
    (SELECT id FROM categories WHERE slug = 'recherche'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]'::jsonb,
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

-- You.com
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'You.com',
    'you-com',
    'Moteur de recherche avec chat IA intégré',
    'https://you.com',
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

-- Add tool features
INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Recherche temps réel', 'Résultats à jour et vérifiés' FROM ai_tools WHERE slug = 'perplexity-ai'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Citations sources', 'Références des informations' FROM ai_tools WHERE slug = 'perplexity-ai'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Chat intégré', 'Assistant IA pour la recherche' FROM ai_tools WHERE slug = 'you-com'
ON CONFLICT DO NOTHING;

COMMIT;
