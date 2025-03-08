-- Restauration de tous les outils
DO $$
DECLARE
    agents_auto_id uuid;
    gen_code_id uuid;
    gen_images_id uuid;
    audio_voix_id uuid;
    video_id uuid;
    productivite_id uuid;
    design_id uuid;
    outils_donnees_id uuid;
    recommandation_id uuid;
    dev_agents_id uuid;
    gestion_taches_id uuid;
    nlp_id uuid;
    vision_id uuid;
    education_id uuid;
    robotique_id uuid;
    business_id uuid;
BEGIN
    -- Récupérer les IDs des catégories
    SELECT id INTO agents_auto_id FROM public.categories WHERE name = 'Agents & Automatisation';
    SELECT id INTO gen_code_id FROM public.categories WHERE name = 'Génération de Code';
    SELECT id INTO gen_images_id FROM public.categories WHERE name = 'Génération d''images';
    SELECT id INTO audio_voix_id FROM public.categories WHERE name = 'Audio & Voix';
    SELECT id INTO video_id FROM public.categories WHERE name = 'Vidéo';
    SELECT id INTO productivite_id FROM public.categories WHERE name = 'Productivité';
    SELECT id INTO design_id FROM public.categories WHERE name = 'Design';
    SELECT id INTO outils_donnees_id FROM public.categories WHERE name = 'Outils de Données';
    SELECT id INTO recommandation_id FROM public.categories WHERE name = 'Recommandation';
    SELECT id INTO dev_agents_id FROM public.categories WHERE name = 'Développement d''Agents';
    SELECT id INTO gestion_taches_id FROM public.categories WHERE name = 'Gestion des Tâches';
    SELECT id INTO nlp_id FROM public.categories WHERE name = 'Traitement du Langage Naturel';
    SELECT id INTO vision_id FROM public.categories WHERE name = 'Vision par Ordinateur';
    SELECT id INTO education_id FROM public.categories WHERE name = 'Éducation';
    SELECT id INTO robotique_id FROM public.categories WHERE name = 'Robotique';
    SELECT id INTO business_id FROM public.categories WHERE name = 'Business & Marketing';

    -- Batch 1 : Agents & Automatisation
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES
    ('AgentGPT', 'agentgpt', 'Plateforme no-code basée sur le navigateur permettant de créer et déployer des agents IA autonomes. Utilise les fonctions OpenAI et prend en charge GPT-3.5-16k avec des bases de données Pinecone et pg_vector.', 'https://agentgpt.reworkd.ai/', agents_auto_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]'::jsonb, true, true),
    ('AutoGen', 'autogen', 'Framework Microsoft pour développer des agents LLM qui peuvent collaborer entre eux pour résoudre des tâches. Permet une conversation multi-agents avec différents rôles et capacités.', 'https://github.com/microsoft/autogen', agents_auto_id, '[{"plan_name": "Free", "price": 0}]'::jsonb, true, false),
    ('AutoGPT', 'autogpt', 'Agent IA autonome qui peut accomplir des tâches complexes en les décomposant en sous-tâches et en les exécutant de manière itérative. Utilise GPT-4 pour la planification et l''exécution.', 'https://agpt.co', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}, {"plan_name": "Cloud", "price": 20}]'::jsonb, true, true),

    -- Batch 2 : Génération de Code
    ('ChatDev', 'chatdev', 'Assistant de développement logiciel qui simule une entreprise de développement logiciel avec plusieurs agents IA collaborant sur des projets.', 'https://github.com/OpenBMB/ChatDev', gen_code_id, '[{"plan_name": "Free", "price": 0}]'::jsonb, true, false),
    ('GPT Engineer', 'gpt-engineer', 'Spécifie ce que vous voulez construire, l''IA pose des questions de clarification et crée le code. Idéal pour le développement rapide de projets.', 'https://gptengineer.app/', gen_code_id, '[{"plan_name": "Free", "price": 0}]'::jsonb, true, true),
    ('Aider', 'aider', 'Assistant de programmation IA qui aide au développement en temps réel avec des suggestions de code contextuelles.', 'https://github.com/paul-gauthier/aider', gen_code_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),

    -- Batch 3 : Génération d'Images et Médias
    ('Midjourney', 'midjourney', 'Outil de génération d''images IA créant des visuels artistiques de haute qualité à partir de descriptions textuelles.', 'https://www.midjourney.com/', gen_images_id, '[{"plan_name": "Basic", "price": 10}, {"plan_name": "Standard", "price": 30}]'::jsonb, true, true),
    ('DALL-E', 'dall-e', 'Système de génération d''images par OpenAI capable de créer des images réalistes et artistiques à partir de descriptions textuelles.', 'https://openai.com/dall-e-2', gen_images_id, '[{"plan_name": "Pay-per-use", "price": -1}]'::jsonb, true, true),
    ('Synthesia', 'synthesia', 'Plateforme de création vidéo IA permettant de générer des vidéos avec des avatars parlants à partir de texte.', 'https://www.synthesia.io/', video_id, '[{"plan_name": "Business", "price": 30}]'::jsonb, true, true),

    -- Batch 4 : Productivité et Design
    ('Notion AI', 'notion-ai-assistant', 'Assistant d''écriture et d''organisation intégré à Notion, aidant à la rédaction, au résumé et à l''analyse de contenu.', 'https://www.notion.so/product/ai', productivite_id, '[{"plan_name": "With Notion", "price": 10}]'::jsonb, true, true),
    ('Figma AI', 'figma-ai-design', 'Ensemble d''outils IA intégrés à Figma pour améliorer le processus de design, incluant la génération de variantes et l''aide à la mise en page.', 'https://www.figma.com/ai', design_id, '[{"plan_name": "Included", "price": 0}]'::jsonb, true, true),
    ('AIlice', 'ailice-task-planner', 'Agent sous forme de chatbot qui planifie indépendamment les tâches données en langage naturel et crée dynamiquement un arbre d''appels d''agents pour les exécuter.', 'https://github.com/myshell-ai/AIlice', productivite_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),

    -- Batch 5 : Outils de Données et Recommandation
    ('Adala', 'adala', 'Framework d''annotation de données qui utilise l''IA pour automatiser et améliorer le processus d''étiquetage des données, avec un focus sur la qualité et l''efficacité.', 'https://github.com/HumanSignal/Adala', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Agent4Rec', 'agent4rec', 'Système de recommandation basé sur des agents IA qui personnalise les suggestions en fonction des préférences et du comportement des utilisateurs.', 'https://github.com/LehengTHU/Agent4Rec', recommandation_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('AgentForge', 'agentforge', 'Plateforme de développement d''agents IA qui simplifie la création et le déploiement d''agents autonomes pour diverses tâches.', 'https://github.com/DataBassGit/AgentForge', dev_agents_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),

    -- Batch 6 : Gestion des Tâches
    ('BabyAGI', 'babyagi', 'Framework simple pour la gestion des tâches utilisant l''IA. Crée et priorise automatiquement des tâches basées sur un objectif prédéfini.', 'https://github.com/yoheinakajima/babyagi', gestion_taches_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),
    ('BabyBeeAGI', 'babybeeagi', 'Version améliorée de BabyAGI avec une gestion des tâches plus complexe, permettant une analyse et une synthèse plus complètes des informations.', 'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyBeeAGI.py', gestion_taches_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('BabyCatAGI', 'babycatagi', 'Modification de BabyBeeAGI avec seulement 300 lignes de code. Inclut un agent de création de tâches unique.', 'https://replit.com/@YoheiNakajima/BabyCatAGI', gestion_taches_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false)

    -- Batch 7 : Plus d'agents et d'outils d'automatisation
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES
    ('AgentPilot', 'agentpilot', 'Interface utilisateur pour créer et gérer des agents IA. Permet de créer des agents personnalisés avec différents modèles de langage et personnalités.', 'https://github.com/jbexta/AgentPilot', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Agents', 'agents', 'Framework pour créer des agents IA qui peuvent interagir avec des API et effectuer des tâches complexes.', 'https://github.com/aiwaves-cn/agents', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('AgentVerse', 'agentverse', 'Plateforme pour simuler des interactions entre plusieurs agents IA dans un environnement virtuel.', 'https://github.com/OpenBMB/AgentVerse', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('AI Legion', 'ai-legion', 'Framework pour créer des équipes d''agents IA collaboratifs qui peuvent travailler ensemble sur des projets complexes.', 'https://github.com/eumemic/ai-legion', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Automata', 'automata', 'Assistant de développement qui utilise l''IA pour automatiser les tâches de programmation répétitives.', 'https://github.com/mshumer/automata', gen_code_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('AutoPR', 'autopr', 'Outil qui génère automatiquement des pull requests avec des corrections de code en utilisant l''IA.', 'https://github.com/irgolic/AutoPR', gen_code_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('HR Chatbot', 'hr-chatbot', 'Assistant virtuel spécialisé dans les ressources humaines et le recrutement.', 'https://github.com/microsoft/HR-Agent-Chat', business_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('BabyDeerAGI', 'babydeeragi', 'Version de BabyAGI optimisée pour la planification et l''exécution de tâches séquentielles.', 'https://github.com/yoheinakajima/babyagi/tree/main/classic/BabyDeerAGI', gestion_taches_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('BabyElfAGI', 'babyelfagi', 'Implémentation légère de BabyAGI avec des capacités de raisonnement améliorées.', 'https://github.com/yoheinakajima/babyagi/tree/main/classic/BabyElfAGI', gestion_taches_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('BabyCommandAGI', 'babycommandagi', 'Version de BabyAGI spécialisée dans l''exécution de commandes système.', 'https://github.com/yoheinakajima/babyagi/tree/main/classic/BabyCommandAGI', gestion_taches_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('BabyFoxAGI', 'babyfoxagi', 'Variante de BabyAGI avec des capacités de recherche et d''analyse améliorées.', 'https://github.com/yoheinakajima/babyagi/tree/main/classic/BabyFoxAGI', gestion_taches_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('BambooAI', 'bambooai', 'Assistant IA pour la gestion de projet et la collaboration d''équipe.', 'https://bambooai.app', productivite_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 19.99}]'::jsonb, true, false),
    ('BeeBot', 'beebot', 'Assistant conversationnel pour l''automatisation des tâches de support client.', 'https://github.com/beebotai/beebot', business_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Blinky', 'blinky', 'Assistant IA pour l''analyse et la visualisation de données.', 'https://github.com/blinkyai/blinky', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Bloop', 'bloop', 'Moteur de recherche de code source alimenté par l''IA.', 'https://bloop.ai', gen_code_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 15}]'::jsonb, true, false),
    ('BondAI', 'bondai', 'Framework pour créer des agents IA avec des capacités de raisonnement avancées.', 'https://github.com/krohling/bondai', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('BumpGen', 'bumpgen', 'Générateur automatique de changelogs et de versions pour les projets.', 'https://github.com/bump-sh/bumpgen', productivite_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('CalAI', 'calai', 'Assistant IA pour la gestion de calendrier et la planification de réunions.', 'https://cal.ai', productivite_id, '[{"plan_name": "Beta", "price": 0}, {"plan_name": "Pro", "price": 9.99}]'::jsonb, true, false),
    ('CAMEL', 'camel', 'Framework pour créer des agents IA qui peuvent communiquer et collaborer de manière naturelle.', 'https://github.com/camel-ai/camel', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('ChatArena', 'chatarena', 'Plateforme pour tester et évaluer les performances des agents conversationnels.', 'https://github.com/chatarena/chatarena', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false)

    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

END $$;
