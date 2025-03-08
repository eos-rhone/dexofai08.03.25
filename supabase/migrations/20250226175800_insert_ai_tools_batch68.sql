-- Batch 68: Audio and Acoustic Tools
BEGIN;

-- AudioLabs
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'AudioLabs',
    'audiolabs',
    'Suite d''outils IA pour l''amélioration et le traitement audio professionnel.',
    'https://www.audiolabs.io/',
    (SELECT id FROM categories WHERE slug = 'audio-musique'),
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

-- Cleanvoice
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Cleanvoice',
    'cleanvoice',
    'Nettoie automatiquement les enregistrements vocaux des bruits parasites.',
    'https://cleanvoice.ai/',
    (SELECT id FROM categories WHERE slug = 'audio-musique'),
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

-- Voicemod
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Voicemod',
    'voicemod',
    'Modificateur de voix en temps réel utilisant l''IA pour des effets créatifs.',
    'https://www.voicemod.net/',
    (SELECT id FROM categories WHERE slug = 'audio-musique'),
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

-- Adobe Enhanced Speech
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Adobe Enhanced Speech',
    'adobe-enhanced-speech',
    'Technologie d''amélioration vocale basée sur l''IA par Adobe.',
    'https://www.adobe.com/products/premiere/enhanced-speech.html',
    (SELECT id FROM categories WHERE slug = 'audio-musique'),
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

-- Accusonus
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Accusonus',
    'accusonus',
    'Suite d''outils de réparation audio professionnelle assistée par IA.',
    'https://accusonus.com/',
    (SELECT id FROM categories WHERE slug = 'audio-musique'),
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

-- iZotope RX
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'iZotope RX',
    'izotope-rx',
    'Suite de restauration audio professionnelle avec technologie IA.',
    'https://www.izotope.com/en/products/rx.html',
    (SELECT id FROM categories WHERE slug = 'audio-musique'),
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

-- Audionamix
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Audionamix',
    'audionamix',
    'Solutions de séparation audio professionnelle basées sur l''IA.',
    'https://audionamix.com/',
    (SELECT id FROM categories WHERE slug = 'audio-musique'),
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

-- Sonible
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Sonible',
    'sonible',
    'Plugins audio intelligents utilisant l''IA pour l''amélioration sonore.',
    'https://www.sonible.com/',
    (SELECT id FROM categories WHERE slug = 'audio-musique'),
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

-- Sound Theory
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Sound Theory',
    'sound-theory',
    'Outils de traitement audio avancé avec algorithmes IA.',
    'https://www.soundtheory.com/',
    (SELECT id FROM categories WHERE slug = 'audio-musique'),
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

-- Accentize
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
VALUES (
    'Accentize',
    'accentize',
    'Solutions de traitement audio professionnel basées sur l''IA.',
    'https://www.accentize.com/',
    (SELECT id FROM categories WHERE slug = 'audio-musique'),
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

COMMIT;
