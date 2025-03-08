-- Batch 49: Restore AI tools (Agents & Automatisation - Suite)
BEGIN;

-- AutoGPT
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'AutoGPT',
    'autogpt',
    'Agent IA autonome expérimental basé sur GPT-4 capable d''atteindre des objectifs complexes',
    'https://agpt.co',
    (SELECT id FROM categories WHERE slug = 'agents-automatisation'),
    '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
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

-- Automata
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Automata',
    'automata',
    'Système de génération de code contextuel basé sur GPT-4',
    'https://github.com/emrgnt-cmplxty/automata',
    (SELECT id FROM categories WHERE slug = 'generation-code'),
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

-- AutoPR
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'AutoPR',
    'autopr',
    'Agent IA qui génère automatiquement des pull requests pour corriger les problèmes',
    'https://github.com/irgolic/AutoPR',
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
SELECT id, 'Agent autonome', 'Exécution autonome de tâches' FROM ai_tools WHERE slug = 'autogpt'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'Génération contextuelle', 'Code basé sur le contexte' FROM ai_tools WHERE slug = 'automata'
ON CONFLICT DO NOTHING;

INSERT INTO tool_features (tool_id, name, description)
SELECT id, 'PR automatiques', 'Génération de pull requests' FROM ai_tools WHERE slug = 'autopr'
ON CONFLICT DO NOTHING;

COMMIT;
