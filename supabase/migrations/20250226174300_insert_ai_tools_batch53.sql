-- Batch 53: Milestones
BEGIN;

-- OpenAI API
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'OpenAI API',
    'openai-api',
    'Annonce de l''API OpenAI pour les modèles d''IA texte-à-texte à usage général basés sur GPT-3.',
    'https://openai.com/blog/openai-api/',
    (SELECT id FROM categories WHERE slug = 'milestone'),
    '[{"plan_name": "Payant", "price": null}]'::jsonb,
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

-- GitHub Copilot
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'GitHub Copilot',
    'github-copilot',
    'Annonce de Copilot, un nouveau programmeur en binôme IA qui vous aide à écrire un meilleur code.',
    'https://github.blog/2021-06-29-introducing-github-copilot-ai-pair-programmer/',
    (SELECT id FROM categories WHERE slug = 'milestone'),
    '[{"plan_name": "Payant", "price": null}]'::jsonb,
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

-- DALL·E 2
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'DALL·E 2',
    'dalle-2',
    'Annonce de la sortie de DALL·E 2, un système avancé de génération d''images avec une résolution améliorée, des capacités de création d''images étendues et diverses mesures de sécurité.',
    'https://openai.com/blog/dall-e-2/',
    (SELECT id FROM categories WHERE slug = 'milestone'),
    '[{"plan_name": "Payant", "price": null}]'::jsonb,
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

-- Stable Diffusion
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Stable Diffusion',
    'stable-diffusion',
    'Annonce de la sortie publique de Stable Diffusion, un modèle de génération d''images basé sur l''IA entraîné sur un large échantillon d''internet et sous licence Creative ML OpenRAIL-M.',
    'https://stability.ai/blog/stable-diffusion-public-release',
    (SELECT id FROM categories WHERE slug = 'milestone'),
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

-- ChatGPT
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'ChatGPT',
    'chatgpt',
    'Annonce de ChatGPT, un modèle conversationnel entraîné pour répondre aux questions de suivi, admettre ses erreurs, contester les prémisses incorrectes et rejeter les demandes inappropriées.',
    'https://openai.com/blog/chatgpt/',
    (SELECT id FROM categories WHERE slug = 'milestone'),
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Plus", "price": null}]'::jsonb,
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

-- Bing Search
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Bing Search',
    'bing-search',
    'Microsoft annonce une nouvelle version de son moteur de recherche Bing, alimenté par un modèle OpenAI de nouvelle génération.',
    'https://blogs.microsoft.com/blog/2023/02/07/reinventing-search-with-a-new-ai-powered-microsoft-bing-and-edge-your-copilot-for-the-web/',
    (SELECT id FROM categories WHERE slug = 'milestone'),
    '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
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

-- LLaMA
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'LLaMA',
    'llama',
    'Llama LLM, un modèle de langage fondamental de 65 milliards de paramètres par Meta.',
    'https://ai.facebook.com/blog/large-language-model-llama-meta-ai/',
    (SELECT id FROM categories WHERE slug = 'milestone'),
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

-- GPT-4
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'GPT-4',
    'gpt-4',
    'Annonce de GPT-4, un grand modèle multimodal.',
    'https://openai.com/research/gpt-4',
    (SELECT id FROM categories WHERE slug = 'milestone'),
    '[{"plan_name": "Payant", "price": null}]'::jsonb,
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

-- DALL·E 3
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'DALL·E 3',
    'dalle-3',
    'Annonce du générateur d''images DALL·E 3.',
    'https://openai.com/index/dall-e-3/',
    (SELECT id FROM categories WHERE slug = 'milestone'),
    '[{"plan_name": "Payant", "price": null}]'::jsonb,
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

-- Sora
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Sora',
    'sora',
    'Présentation de Sora, un grand modèle de génération vidéo.',
    'https://openai.com/research/video-generation-models-as-world-simulators',
    (SELECT id FROM categories WHERE slug = 'milestone'),
    '[{"plan_name": "Bientôt disponible", "price": null}]'::jsonb,
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

COMMIT;
