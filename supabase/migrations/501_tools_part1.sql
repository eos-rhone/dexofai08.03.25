-- Migration SQL pour les outils IA (Partie 1)
BEGIN;

-- Supprime les tables existantes
DROP TABLE IF EXISTS public.ai_tools CASCADE;
DROP TABLE IF EXISTS public.categories CASCADE;

-- Crée la table des catégories
CREATE TABLE public.categories (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    name text NOT NULL,
    slug text NOT NULL UNIQUE,
    icon text DEFAULT 'default-icon.svg',
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Crée la table des outils
CREATE TABLE public.ai_tools (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    name text NOT NULL,
    slug text NOT NULL UNIQUE,
    description text,
    website_url text,
    category_id uuid REFERENCES public.categories(id),
    pricing jsonb DEFAULT '[]'::jsonb,
    is_active boolean DEFAULT true,
    is_featured boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Insère les catégories
INSERT INTO public.categories (name, slug) VALUES
    ('Traitement de Texte', 'text'),
    ('Développement', 'development'),
    ('Génération d''Images', 'image-generation'),
    ('Voix et Audio', 'voice'),
    ('Recherche', 'research'),
    ('Chatbots et Assistants', 'chatbots'),
    ('Données et Analytics', 'data'),
    ('Vidéo et Animation', 'video'),
    ('Rédaction et Contenu', 'writing'),
    ('Marketing', 'marketing'),
    ('Design', 'design'),
    ('Productivité', 'productivity'),
    ('Education', 'education'),
    ('Finance', 'finance'),
    ('Santé', 'health'),
    ('Musique', 'music'),
    ('Gaming', 'gaming'),
    ('Social Media', 'social'),
    ('Sécurité', 'security'),
    ('Juridique', 'legal'),
    ('Autres', 'unknown');

-- Insère les premiers 250 outils
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id) VALUES
('ChatGPT', 'chatgpt', 'Assistant conversationnel avancé basé sur GPT-4', 'https://chat.openai.com', (SELECT id FROM public.categories WHERE slug = 'chatbots')),
('Midjourney', 'midjourney', 'Outil de génération d''images IA créant des visuels artistiques de haute qualité', 'https://www.midjourney.com', (SELECT id FROM public.categories WHERE slug = 'image-generation')),
('Claude', 'claude', 'Assistant IA d''Anthropic conçu pour être utile, honnête et inoffensif', 'https://www.anthropic.com/claude', (SELECT id FROM public.categories WHERE slug = 'chatbots')),
('Stable Diffusion', 'stable-diffusion', 'Modèle de génération d''images open source', 'https://stability.ai', (SELECT id FROM public.categories WHERE slug = 'image-generation')),
('GitHub Copilot', 'github-copilot', 'Assistant de programmation IA', 'https://github.com/features/copilot', (SELECT id FROM public.categories WHERE slug = 'development')),
('DALL-E', 'dall-e', 'Système de génération d''images par OpenAI', 'https://openai.com/dall-e-2', (SELECT id FROM public.categories WHERE slug = 'image-generation')),
('Jasper', 'jasper', 'Plateforme d''écriture IA pour le marketing', 'https://www.jasper.ai', (SELECT id FROM public.categories WHERE slug = 'writing')),
('Notion AI', 'notion-ai', 'Assistant d''écriture intégré à Notion', 'https://www.notion.so/product/ai', (SELECT id FROM public.categories WHERE slug = 'productivity')),
('Anthropic Claude', 'anthropic-claude', 'Assistant IA avancé pour l''analyse et la rédaction', 'https://www.anthropic.com', (SELECT id FROM public.categories WHERE slug = 'chatbots')),
('Gemini', 'gemini', 'Modèle d''IA multimodal de Google', 'https://deepmind.google/technologies/gemini/', (SELECT id FROM public.categories WHERE slug = 'chatbots'));

COMMIT;
