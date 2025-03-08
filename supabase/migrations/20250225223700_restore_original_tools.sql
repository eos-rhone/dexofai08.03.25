-- Restauration des outils originaux
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
SELECT 
    d.name,
    LOWER(REGEXP_REPLACE(d.name, '\s+', '-', 'g')),
    d.description,
    d.website_url,
    c.id,
    d.pricing::jsonb,
    true,
    d.is_featured
FROM (
    VALUES 
    -- Agents & Automatisation
    ('AgentGPT', 'Plateforme no-code basée sur le navigateur permettant de créer et déployer des agents IA autonomes. Utilise les fonctions OpenAI et prend en charge GPT-3.5-16k avec des bases de données Pinecone et pg_vector.', 'https://agentgpt.reworkd.ai/', 'Agents & Automatisation', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]', true),
    ('AutoGen', 'Framework Microsoft pour développer des agents LLM qui peuvent collaborer entre eux pour résoudre des tâches. Permet une conversation multi-agents avec différents rôles et capacités.', 'https://github.com/microsoft/autogen', 'Agents & Automatisation', '[{"plan_name": "Free", "price": 0}]', false),
    ('AutoGPT', 'Agent IA autonome qui peut accomplir des tâches complexes en les décomposant en sous-tâches et en les exécutant de manière itérative. Utilise GPT-4 pour la planification et l''exécution.', 'https://agpt.co', 'Agents & Automatisation', '[{"plan_name": "Open Source", "price": 0}, {"plan_name": "Cloud", "price": 20}]', true),
    
    -- Génération de Code
    ('ChatDev', 'Assistant de développement logiciel qui simule une entreprise de développement logiciel avec plusieurs agents IA collaborant sur des projets.', 'https://github.com/OpenBMB/ChatDev', 'Génération de Code', '[{"plan_name": "Free", "price": 0}]', false),
    ('GPT Engineer', 'Spécifie ce que vous voulez construire, l''IA pose des questions de clarification et crée le code. Idéal pour le développement rapide de projets.', 'https://gptengineer.app/', 'Génération de Code', '[{"plan_name": "Free", "price": 0}]', true),
    ('GitHub Copilot', 'Assistant de programmation IA qui suggère du code et des fonctions entières directement dans votre éditeur.', 'https://github.com/features/copilot', 'Génération de Code', '[{"plan_name": "Individual", "price": 10}, {"plan_name": "Business", "price": 19}]', true),
    
    -- Génération d'images
    ('Midjourney', 'Outil de génération d''images IA créant des visuels artistiques de haute qualité à partir de descriptions textuelles.', 'https://www.midjourney.com/', 'Génération d''images', '[{"plan_name": "Basic", "price": 10}, {"plan_name": "Standard", "price": 30}]', true),
    ('DALL-E', 'Système de génération d''images par OpenAI capable de créer des images réalistes et artistiques à partir de descriptions textuelles.', 'https://openai.com/dall-e-2', 'Génération d''images', '[{"plan_name": "Pay-per-use", "price": -1}]', true),
    ('Stable Diffusion', 'Modèle open source de génération d''images par IA, permettant de créer des images détaillées à partir de descriptions textuelles.', 'https://stability.ai/', 'Génération d''images', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]', true),
    
    -- Audio & Voix
    ('ElevenLabs', 'Plateforme de synthèse vocale IA offrant des voix naturelles et expressives dans plusieurs langues.', 'https://elevenlabs.io/', 'Audio & Voix', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Creator", "price": 22}]', true),
    ('Murf', 'Studio de voix IA en ligne pour créer des voix off professionnelles avec des voix naturelles.', 'https://murf.ai/', 'Audio & Voix', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 29}]', false),
    ('Play.ht', 'Générateur de voix IA permettant de convertir du texte en parole naturelle dans plus de 20 langues.', 'https://play.ht/', 'Audio & Voix', '[{"plan_name": "Creator", "price": 14.99}, {"plan_name": "Pro", "price": 39.99}]', false),
    
    -- Vidéo
    ('Synthesia', 'Plateforme de création vidéo IA permettant de générer des vidéos avec des avatars parlants à partir de texte.', 'https://www.synthesia.io/', 'Vidéo', '[{"plan_name": "Personal", "price": 29}, {"plan_name": "Business", "price": 99}]', true),
    ('D-ID', 'Création d''avatars vidéo photoréalistes à partir de photos et de texte.', 'https://www.d-id.com/', 'Vidéo', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 25}]', false),
    ('HeyGen', 'Plateforme de création de vidéos IA avec des avatars personnalisés et une synthèse vocale naturelle.', 'https://www.heygen.com/', 'Vidéo', '[{"plan_name": "Creator", "price": 29}, {"plan_name": "Business", "price": 79}]', false),
    
    -- Traitement du Langage Naturel
    ('ChatGPT', 'Assistant conversationnel avancé basé sur GPT-4, capable de comprendre et générer du texte naturel.', 'https://chat.openai.com/', 'Traitement du Langage Naturel', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Plus", "price": 20}]', true),
    ('Claude', 'Assistant IA développé par Anthropic, conçu pour être utile, honnête et inoffensif.', 'https://claude.ai/', 'Traitement du Langage Naturel', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]', true),
    ('Cohere', 'Plateforme d''IA proposant des modèles de langage pour diverses applications commerciales.', 'https://cohere.ai/', 'Traitement du Langage Naturel', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Enterprise", "price": -1}]', false),
    
    -- Vision par Ordinateur
    ('Roboflow', 'Plateforme complète pour la vision par ordinateur, de l''annotation à l''entraînement et au déploiement.', 'https://roboflow.com/', 'Vision par Ordinateur', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Starter", "price": 50}]', true),
    ('Clarifai', 'Plateforme de vision par ordinateur pour la reconnaissance d''images et la détection d''objets.', 'https://www.clarifai.com/', 'Vision par Ordinateur', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Enterprise", "price": -1}]', false),
    ('Ultralytics', 'Bibliothèque open-source pour la vision par ordinateur, incluant YOLOv8.', 'https://ultralytics.com/', 'Vision par Ordinateur', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Enterprise", "price": -1}]', false)
) AS d(name, description, website_url, category_name, pricing, is_featured)
JOIN public.categories c ON c.name = d.category_name
ON CONFLICT (slug) DO UPDATE 
SET 
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;
