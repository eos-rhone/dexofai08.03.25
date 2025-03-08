-- Insertion des outils IA
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
SELECT 
    d.name,
    LOWER(REGEXP_REPLACE(d.name, '\s+', '-', 'g')),
    d.description,
    d.website_url,
    c.id,
    d.pricing::jsonb,
    true,
    false
FROM (
    VALUES 
    ('AgentGPT', 'Plateforme no-code basée sur le navigateur permettant de créer et déployer des agents IA autonomes. Utilise les fonctions OpenAI et prend en charge GPT-3.5-16k avec des bases de données Pinecone et pg_vector.', 'https://agentgpt.reworkd.ai/', 'Chatbots & Assistants', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]'),
    ('AutoGen', 'Framework Microsoft pour développer des agents LLM qui peuvent collaborer entre eux pour résoudre des tâches. Permet une conversation multi-agents avec différents rôles et capacités.', 'https://github.com/microsoft/autogen', 'Chatbots & Assistants', '[{"plan_name": "Free", "price": 0}]'),
    ('ChatDev', 'Assistant de développement logiciel qui simule une entreprise de développement logiciel avec plusieurs agents IA collaborant sur des projets.', 'https://github.com/OpenBMB/ChatDev', 'Génération de Code', '[{"plan_name": "Free", "price": 0}]'),
    ('GPT Engineer', 'Spécifie ce que vous voulez construire, l''IA pose des questions de clarification et crée le code. Idéal pour le développement rapide de projets.', 'https://gptengineer.app/', 'Génération de Code', '[{"plan_name": "Free", "price": 0}]'),
    ('Midjourney', 'Outil de génération d''images IA créant des visuels artistiques de haute qualité à partir de descriptions textuelles.', 'https://www.midjourney.com/', 'Génération d''Images', '[{"plan_name": "Basic", "price": 10}, {"plan_name": "Standard", "price": 30}]'),
    ('DALL-E', 'Système de génération d''images par OpenAI capable de créer des images réalistes et artistiques à partir de descriptions textuelles.', 'https://openai.com/dall-e-2', 'Génération d''Images', '[{"plan_name": "Pay-per-use", "price": -1}]'),
    ('ElevenLabs', 'Plateforme de synthèse vocale IA offrant des voix naturelles et expressives dans plusieurs langues.', 'https://elevenlabs.io/', 'Audio & Voix', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Creator", "price": 22}]'),
    ('Synthesia', 'Plateforme de création vidéo IA permettant de générer des vidéos avec des avatars parlants à partir de texte.', 'https://www.synthesia.io/', 'Vidéo', '[{"plan_name": "Business", "price": 30}]')
) AS d(name, description, website_url, category_name, pricing)
JOIN public.categories c ON c.name = d.category_name
ON CONFLICT (slug) DO UPDATE 
SET 
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;
