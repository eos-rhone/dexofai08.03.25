-- Batch 46: Restore AI tools (Productivité et Design)
BEGIN;

-- Notion AI
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Notion AI',
    'notion-ai',
    'Assistant d''écriture et d''organisation intégré à Notion',
    'https://www.notion.so/product/ai',
    (SELECT id FROM categories WHERE slug = 'productivite'),
    '[{"plan_name": "With Notion", "price": 10}]'::jsonb,
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

-- Figma AI
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Figma AI',
    'figma-ai',
    'Ensemble d''outils IA intégrés à Figma pour améliorer le design',
    'https://www.figma.com/ai',
    (SELECT id FROM categories WHERE slug = 'design'),
    '[{"plan_name": "Included", "price": 0}]'::jsonb,
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

-- Canva AI
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Canva AI',
    'canva-ai',
    'Suite d''outils IA pour la création graphique',
    'https://www.canva.com',
    (SELECT id FROM categories WHERE slug = 'design'),
    '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 12.99}, {"plan_name": "Enterprise", "price": 30}]'::jsonb,
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

-- Add features
INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Assistant écriture', 'Aide à la rédaction' FROM ai_tools WHERE slug = 'notion-ai'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Design IA', 'Création de designs par IA' FROM ai_tools WHERE slug = 'figma-ai'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Création graphique', 'Design assisté par IA' FROM ai_tools WHERE slug = 'canva-ai'
ON CONFLICT DO NOTHING;

COMMIT;
