-- Batch 66: Text Generation and Writing Tools
BEGIN;

-- Copy.ai
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Copy.ai',
    'copy-ai',
    'Générateur de contenu marketing et publicitaire alimenté par l''IA.',
    'https://www.copy.ai/',
    (SELECT id FROM categories WHERE slug = 'writing'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Writesonic
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Writesonic',
    'writesonic',
    'Plateforme d''écriture IA pour créer du contenu marketing et des articles de blog.',
    'https://writesonic.com/',
    (SELECT id FROM categories WHERE slug = 'writing'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Rytr
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Rytr',
    'rytr',
    'Assistant d''écriture IA pour créer du contenu dans plus de 30 langues.',
    'https://rytr.me/',
    (SELECT id FROM categories WHERE slug = 'writing'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Frase
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Frase',
    'frase',
    'Outil d''optimisation de contenu et de SEO basé sur l''IA.',
    'https://www.frase.io/',
    (SELECT id FROM categories WHERE slug = 'writing'),
    '[{"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Wordtune
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Wordtune',
    'wordtune',
    'Assistant d''écriture qui aide à reformuler et améliorer vos textes.',
    'https://www.wordtune.com/',
    (SELECT id FROM categories WHERE slug = 'writing'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Peppertype
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Peppertype',
    'peppertype',
    'Générateur de contenu marketing qui crée des textes originaux et engageants.',
    'https://www.peppertype.ai/',
    (SELECT id FROM categories WHERE slug = 'writing'),
    '[{"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Anyword
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Anyword',
    'anyword',
    'Plateforme de copywriting qui génère et optimise du contenu marketing.',
    'https://anyword.com/',
    (SELECT id FROM categories WHERE slug = 'writing'),
    '[{"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Hypotenuse AI
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Hypotenuse AI',
    'hypotenuse-ai',
    'Générateur de contenu qui transforme des mots-clés en articles complets.',
    'https://www.hypotenuse.ai/',
    (SELECT id FROM categories WHERE slug = 'writing'),
    '[{"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Simplified
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Simplified',
    'simplified',
    'Suite de création de contenu tout-en-un avec génération de texte IA.',
    'https://simplified.com/',
    (SELECT id FROM categories WHERE slug = 'writing'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Copysmith
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Copysmith',
    'copysmith',
    'Plateforme de génération de contenu pour les équipes marketing et e-commerce.',
    'https://copysmith.ai/',
    (SELECT id FROM categories WHERE slug = 'writing'),
    '[{"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Writecream
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Writecream',
    'writecream',
    'Outil de création de contenu qui génère des textes personnalisés pour différents formats.',
    'https://writecream.com/',
    (SELECT id FROM categories WHERE slug = 'writing'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Typeframes
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Typeframes',
    'typeframes',
    'Outil de storytelling qui aide à créer des histoires engageantes avec l''IA.',
    'https://typeframes.com/',
    (SELECT id FROM categories WHERE slug = 'writing'),
    '[{"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Sudowrite
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Sudowrite',
    'sudowrite',
    'Assistant d''écriture créative qui aide à développer des histoires et des personnages.',
    'https://www.sudowrite.com/',
    (SELECT id FROM categories WHERE slug = 'writing'),
    '[{"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Inferkit
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Inferkit',
    'inferkit',
    'Générateur de texte qui continue automatiquement votre écriture de manière cohérente.',
    'https://inferkit.com/',
    (SELECT id FROM categories WHERE slug = 'writing'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": null}]'::jsonb,
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

-- Compose AI
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Compose AI',
    'compose-ai',
    'Extension de navigateur qui accélère l''écriture avec l''auto-complétion IA.',
    'https://www.compose.ai/',
    (SELECT id FROM categories WHERE slug = 'writing'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": null}]'::jsonb,
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

COMMIT;
