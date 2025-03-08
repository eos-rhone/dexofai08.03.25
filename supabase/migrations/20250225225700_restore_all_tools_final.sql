-- Restauration complète de tous les outils
DO $$
DECLARE
    agents_auto_id uuid;
    gen_code_id uuid;
    gen_images_id uuid;
    video_id uuid;
    productivite_id uuid;
    design_id uuid;
    outils_donnees_id uuid;
    recommandation_id uuid;
    dev_agents_id uuid;
    gestion_taches_id uuid;
    redaction_id uuid;
    gen_audio_id uuid;
    vision_id uuid;
BEGIN
    -- Récupérer les IDs des catégories
    SELECT id INTO agents_auto_id FROM public.categories WHERE name = 'Agents & Automatisation';
    SELECT id INTO gen_code_id FROM public.categories WHERE name = 'Génération de Code';
    SELECT id INTO gen_images_id FROM public.categories WHERE name = 'Génération d''Images';
    SELECT id INTO video_id FROM public.categories WHERE name = 'Vidéo';
    SELECT id INTO productivite_id FROM public.categories WHERE name = 'Productivité';
    SELECT id INTO design_id FROM public.categories WHERE name = 'Design';
    SELECT id INTO outils_donnees_id FROM public.categories WHERE name = 'Outils de Données';
    SELECT id INTO recommandation_id FROM public.categories WHERE name = 'Recommandation';
    SELECT id INTO dev_agents_id FROM public.categories WHERE name = 'Développement d''Agents';
    SELECT id INTO gestion_taches_id FROM public.categories WHERE name = 'Gestion des Tâches';
    SELECT id INTO redaction_id FROM public.categories WHERE name = 'Rédaction';
    SELECT id INTO gen_audio_id FROM public.categories WHERE name = 'Génération Audio';
    SELECT id INTO vision_id FROM public.categories WHERE name = 'Vision';

    -- Batch 1 : Agents & Automatisation
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('AgentGPT', 'agentgpt', 'Plateforme no-code basée sur le navigateur permettant de créer et déployer des agents IA autonomes. Utilise les fonctions OpenAI et prend en charge GPT-3.5-16k avec des bases de données Pinecone et pg_vector.', 'https://agentgpt.reworkd.ai/', agents_auto_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]'::jsonb, true, true),
    ('AutoGen', 'autogen', 'Framework Microsoft pour développer des agents LLM qui peuvent collaborer entre eux pour résoudre des tâches. Permet une conversation multi-agents avec différents rôles et capacités.', 'https://github.com/microsoft/autogen', agents_auto_id, '[{"plan_name": "Free", "price": 0}]'::jsonb, true, false),
    ('AutoGPT', 'autogpt', 'Agent IA autonome qui peut accomplir des tâches complexes en les décomposant en sous-tâches et en les exécutant de manière itérative. Utilise GPT-4 pour la planification et l''exécution.', 'https://agpt.co', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}, {"plan_name": "Cloud", "price": 20}]'::jsonb, true, true)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 2 : Génération de Code
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('ChatDev', 'chatdev', 'Assistant de développement logiciel qui simule une entreprise de développement logiciel avec plusieurs agents IA collaborant sur des projets.', 'https://github.com/OpenBMB/ChatDev', gen_code_id, '[{"plan_name": "Free", "price": 0}]'::jsonb, true, false),
    ('GPT Engineer', 'gpt-engineer', 'Spécifie ce que vous voulez construire, l''IA pose des questions de clarification et crée le code. Idéal pour le développement rapide de projets.', 'https://gptengineer.app/', gen_code_id, '[{"plan_name": "Free", "price": 0}]'::jsonb, true, true),
    ('Aider', 'aider', 'Assistant de programmation IA qui aide au développement en temps réel avec des suggestions de code contextuelles.', 'https://github.com/paul-gauthier/aider', gen_code_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 3 : Génération d'Images et Médias
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('Midjourney', 'midjourney', 'Outil de génération d''images IA créant des visuels artistiques de haute qualité à partir de descriptions textuelles.', 'https://www.midjourney.com/', gen_images_id, '[{"plan_name": "Basic", "price": 10}, {"plan_name": "Standard", "price": 30}]'::jsonb, true, true),
    ('DALL-E', 'dall-e', 'Système de génération d''images par OpenAI capable de créer des images réalistes et artistiques à partir de descriptions textuelles.', 'https://openai.com/dall-e-2', gen_images_id, '[{"plan_name": "Pay-per-use", "price": -1}]'::jsonb, true, true),
    ('Synthesia', 'synthesia', 'Plateforme de création vidéo IA permettant de générer des vidéos avec des avatars parlants à partir de texte.', 'https://www.synthesia.io/', video_id, '[{"plan_name": "Business", "price": 30}]'::jsonb, true, true)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 4 : Productivité et Design
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('Notion AI', 'notion-ai-assistant', 'Assistant d''écriture et d''organisation intégré à Notion, aidant à la rédaction, au résumé et à l''analyse de contenu.', 'https://www.notion.so/product/ai', productivite_id, '[{"plan_name": "With Notion", "price": 10}]'::jsonb, true, false),
    ('Figma AI', 'figma-ai-design', 'Ensemble d''outils IA intégrés à Figma pour améliorer le processus de design, incluant la génération de variantes et l''aide à la mise en page.', 'https://www.figma.com/ai', design_id, '[{"plan_name": "Included", "price": 0}]'::jsonb, true, false),
    ('AIlice', 'ailice-task-planner', 'Agent sous forme de chatbot qui planifie indépendamment les tâches données en langage naturel et crée dynamiquement un arbre d''appels d''agents pour les exécuter.', 'https://github.com/myshell-ai/AIlice', productivite_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 5 : Outils de Développement et Gestion
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('Adala', 'adala', 'Framework d''annotation de données qui utilise l''IA pour automatiser et améliorer le processus d''étiquetage des données, avec un focus sur la qualité et l''efficacité.', 'https://github.com/HumanSignal/Adala', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Agent4Rec', 'agent4rec', 'Système de recommandation basé sur des agents IA qui personnalise les suggestions en fonction des préférences et du comportement des utilisateurs.', 'https://github.com/LehengTHU/Agent4Rec', recommandation_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('AgentForge', 'agentforge', 'Plateforme de développement d''agents IA qui simplifie la création et le déploiement d''agents autonomes pour diverses tâches.', 'https://github.com/DataBassGit/AgentForge', dev_agents_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 6 : Outils BabyAGI et autres
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('BabyAGI', 'babyagi', 'Framework simple pour la gestion des tâches utilisant l''IA. Crée et priorise automatiquement des tâches basées sur un objectif prédéfini.', 'https://github.com/yoheinakajima/babyagi', gestion_taches_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('BabyBeeAGI', 'babybeeagi', 'Version améliorée de BabyAGI avec une gestion des tâches plus complexe, permettant une analyse et une synthèse plus complètes des informations.', 'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyBeeAGI.py', gestion_taches_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('BabyCatAGI', 'babycatagi', 'Modification de BabyBeeAGI avec seulement 300 lignes de code. Inclut un agent de création de tâches unique.', 'https://replit.com/@YoheiNakajima/BabyCatAGI', gestion_taches_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 7 : Plus d'agents et d'outils d'automatisation
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('Adala', 'adala-agent', 'Framework d''agent autonome pour l''étiquetage de données. Caractéristiques principales : agents fiables basés sur des données vérifiées, sortie contrôlable avec contraintes flexibles, spécialisé dans le traitement et l''étiquetage personnalisé des données.', 'https://github.com/HumanSignal/Adala', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Agent4Rec', 'agent4rec-ai', 'Simulateur de système de recommandation utilisant 1000 agents génératifs basés sur LLM. Les agents sont initialisés à partir du dataset MovieLens-1M, incarnant divers traits sociaux et préférences.', 'https://github.com/LehengTHU/Agent4Rec', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('AgentForge', 'agentforge-ai', 'Plateforme agnostique LLM pour la construction et le test d''agents. Framework low-code conçu pour la création rapide, le test et l''itération d''agents autonomes IA et d''architectures cognitives.', 'https://github.com/DataBassGit/AgentForge', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('AgentGPT', 'agentgpt-ai', 'Version no-code basée sur navigateur d''AutoGPT. Plateforme permettant d''assigner des objectifs à l''agent, observer son processus de réflexion, formuler un plan d''exécution et prendre des actions en conséquence.', 'https://agentgpt.reworkd.ai/', agents_auto_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]'::jsonb, true, true)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 8 : Encore plus d'agents
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('AgentPilot', 'agentpilot', 'Application de bureau pour construire, gérer et discuter avec des agents IA. Intégré avec Open Interpreter et MemGPT, offrant des fonctionnalités de chat en groupe.', 'https://github.com/jbexta/AgentPilot', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Agents', 'agents-ai', 'Bibliothèque/framework pour construire des agents linguistiques. Équipé de mémoire à court et long terme via VectorDB, capacités d''utilisation d''outils externes, navigation web, et communication multi-agents.', 'https://github.com/aiwaves-cn/agents', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('AgentVerse', 'agentverse', 'Plateforme pour la résolution de tâches et la simulation d''agents. Permet d''assembler plusieurs agents pour accomplir des tâches collaborativement et de créer des environnements personnalisés.', 'https://github.com/OpenBMB/AgentVerse', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('AI Legion', 'ai-legion', 'Plateforme multi-agents TypeScript, similaire à AutoGPT. Une plateforme d''agents autonomes alimentée par LLM permettant aux agents de travailler ensemble pour accomplir des tâches.', 'https://github.com/eumemic/ai-legion', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 9 : Outils d'automatisation avancés
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('AutoGen', 'autogen-ms', 'Framework multi-agents avec une grande diversité d''agents. Permet de développer des applications LLM avec plusieurs agents conversationnels qui peuvent collaborer pour résoudre des tâches et interagir avec les humains.', 'https://github.com/microsoft/autogen', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),
    ('AutoGPT', 'autogpt-ai', 'Tentative expérimentale open-source de rendre GPT-4 totalement autonome. Enchaîne les "pensées" LLM pour atteindre automatiquement n''importe quel objectif fixé.', 'https://agpt.co', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),
    ('Automata', 'automata-ai', 'Génère du code basé sur le contexte de votre projet. Utilise GPT-4 pour prendre votre projet comme contexte, recevoir des tâches et exécuter les instructions de manière transparente.', 'https://github.com/emrgnt-cmplxty/automata', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('AutoPR', 'autopr', 'Agent de pull requests générées par IA qui corrige les problèmes. Déclenché en ajoutant un label contenant AutoPR à un problème, il planifie une correction, écrit le code, pousse une branche et ouvre une pull request.', 'https://github.com/irgolic/AutoPR', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 10 : Variantes de BabyAGI
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('BabyBeeAGI', 'babybeeagi-v2', 'Extension de BabyAGI pour la gestion des tâches et des fonctionnalités. Version plus avancée du code BabyAGI original, introduisant une invite de gestion des tâches plus complexe.', 'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyBeeAGI.py', gestion_taches_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('BabyCatAGI', 'babycatagi-v2', 'Modification de BabyBeeAGI en seulement 300 lignes de code. Inclut des fonctionnalités comme l''agent de création de tâches qui s''exécute une fois et l''agent d''exécution qui parcourt les tâches.', 'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyCatAGI.py', gestion_taches_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('BabyDeerAGI', 'babydeeragi', 'Modification de BabyAGI en environ 350 lignes de code. Caractéristiques : tâches parallèles (plus rapide), utilisation exclusive de GPT-3.5-turbo, outil d''entrée utilisateur.', 'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyDeerAGI.py', gestion_taches_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('BabyElfAGI', 'babyelfagi', 'Modification de BabyDeerAGI avec environ 895 lignes de code. Caractéristiques : classe de compétences permettant la création de nouvelles compétences, exemple de "liste de tâches dynamique".', 'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyElfAGI/main.py', gestion_taches_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 11 : Outils d'analyse et d'assistance
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('BambooAI', 'bambooai', 'Exploration et analyse de données pour non-programmeurs. Fonctionne en boucle, permet le mélange de différents modèles, maintient la mémoire des conversations précédentes.', 'https://github.com/pgalko/BambooAI', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('BeeBot', 'beebot', 'Projet en phase initiale pour une large gamme de tâches. Actuellement en développement, il est considéré comme un projet de recherche en phase précoce.', 'https://github.com/AutoPackAI/beebot', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Blinky', 'blinky', 'Agent de débogage IA open-source pour VSCode. Utilise les LLM pour identifier et corriger les erreurs de code backend, s''appuyant sur l''API VSCode et le protocole LSP.', 'https://github.com/seahyinghang8/blinky', gen_code_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('ChemCrow', 'chemcrow', 'Agent LangChain pour les tâches liées à la chimie. Package open source pour la résolution précise de tâches chimiques nécessitant du raisonnement.', 'https://github.com/ur-whitelab/chemcrow-public', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 12 : Outils de développement et documentation
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('Deepset Cloud', 'deepset-cloud', 'Plateforme NLP pour construire des applications de recherche sémantique. Une plateforme cloud pour construire des applications NLP de bout en bout avec des pipelines de recherche sémantique.', 'https://www.deepset.ai/deepset-cloud', agents_auto_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 99}]'::jsonb, true, false),
    ('Devin', 'devin', 'Premier ingénieur logiciel IA autonome au monde. Un agent IA capable de contribuer à des projets logiciels comme un ingénieur humain, pouvant planifier, écrire et déboguer du code.', 'https://www.cognition-labs.com/devin', gen_code_id, '[{"plan_name": "Contact Sales", "price": -1}]'::jsonb, true, true),
    ('DocsGPT', 'docsgpt', 'Solution open-source pour interroger la documentation technique. Un chatbot IA open-source qui simplifie la recherche et la compréhension de la documentation technique.', 'https://docsgpt.ai/', gen_code_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('FlowiseAI', 'flowiseai', 'Interface drag & drop pour construire des flux LangChain. Un outil open-source qui permet de construire des chaînes LangChain personnalisées avec une interface visuelle intuitive.', 'https://flowiseai.com/', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}, {"plan_name": "Cloud", "price": 19}]'::jsonb, true, true)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 13 : Outils d'éducation et de développement
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('GPT Pilot', 'gpt-pilot', 'Développeur IA qui écrit des applications évolutives. Un copilote de développement qui peut écrire des applications complètes et évolutives, en interagissant avec l''utilisateur.', 'https://github.com/Pythagora-io/gpt-pilot', gen_code_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),
    ('GPT Teacher', 'gpt-teacher', 'Assistant d''enseignement personnalisé alimenté par l''IA. Un agent IA conçu pour fournir un enseignement personnalisé, créer des plans de cours et générer du matériel pédagogique.', 'https://github.com/CognitiveCanvas/GPTTeacher', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('GPTStore', 'gptstore', 'Marketplace pour les agents GPT personnalisés. Une plateforme permettant de découvrir, partager et monétiser des agents GPT personnalisés pour diverses applications.', 'https://gptstore.ai/', agents_auto_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 29}]'::jsonb, true, true),
    ('IX', 'ix', 'Framework pour créer des agents IA. Un framework moderne pour créer des agents IA autonomes capables d''interagir avec des API et d''accomplir des tâches complexes.', 'https://github.com/kreneskyp/ix', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 14 : Frameworks et plateformes LLM
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('LlamaHub', 'llamahub', 'Collection de connecteurs de données pour LLMs. Une bibliothèque open-source de connecteurs de données pour intégrer diverses sources de données avec des modèles de langage.', 'https://llamahub.ai/', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('LlamaIndex', 'llamaindex', 'Framework pour connecter des données personnalisées aux LLMs. Un framework qui permet d''indexer et de requêter des données personnalisées avec des modèles de langage.', 'https://www.llamaindex.ai/', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),
    ('LocalAI', 'localai', 'Alternative open-source à OpenAI. Un drop-in replacement local pour l''API OpenAI, permettant d''exécuter des modèles d''IA en local avec une API compatible.', 'https://localai.io/', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),
    ('OctoAI', 'octoai', 'Plateforme d''inférence pour modèles d''IA. Une plateforme cloud qui permet de déployer et d''exécuter des modèles d''IA avec une mise à l''échelle automatique.', 'https://octoai.cloud/', agents_auto_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 99}]'::jsonb, true, false)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 15 : Outils d'interprétation et d'assistance
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('OpenCopilot', 'opencopilot', 'Framework open-source pour créer des copilotes IA. Une solution pour construire des assistants IA personnalisés qui peuvent être intégrés dans n''importe quelle application SaaS.', 'https://github.com/openchatai/OpenCopilot', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('OpenFlamingo', 'openflamingo', 'Framework open-source pour l''IA multimodale. Une implémentation open-source d''un modèle de langage multimodal capable de comprendre à la fois le texte et les images.', 'https://github.com/mlfoundations/open_flamingo', gen_images_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Open Interpreter', 'open-interpreter', 'Assistant qui peut exécuter du code sur votre ordinateur. Un interpréteur de langage naturel qui permet aux modèles de langage d''exécuter du code sur votre machine locale.', 'https://github.com/KillianLucas/open-interpreter', gen_code_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),
    ('PromptLayer', 'promptlayer', 'Plateforme de gestion et de versionnage des prompts. Un outil pour suivre, gérer et versionner les prompts d''IA, avec des fonctionnalités d''analyse et d''optimisation.', 'https://promptlayer.com/', agents_auto_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 49}]'::jsonb, true, false)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 16 : Plateformes et frameworks de développement
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('RAGs', 'rags', 'Framework pour la génération augmentée par récupération. Un framework qui combine la récupération d''informations avec la génération de texte pour produire des réponses plus précises.', 'https://github.com/explodinggradients/rags', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Replicate', 'replicate', 'Plateforme pour déployer des modèles d''IA. Une plateforme cloud qui permet de déployer et d''exécuter des modèles d''IA via API, avec versioning et scaling.', 'https://replicate.com/', agents_auto_id, '[{"plan_name": "Pay as you go", "price": -1}]'::jsonb, true, true),
    ('Rivet', 'rivet', 'Éditeur visuel pour créer des agents IA. Un éditeur visuel de type node qui permet de créer et de configurer des agents IA de manière intuitive.', 'https://github.com/Ironclad/rivet', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Textbase', 'textbase', 'Framework pour créer des chatbots IA. Un framework Python pour créer des chatbots personnalisés avec des modèles de langage.', 'https://github.com/textbase-ai/textbase', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 17 : Outils de traitement et d'intégration
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('Typebot', 'typebot', 'Constructeur de chatbots conversationnels. Une alternative open-source à Typeform qui permet de créer des chatbots conversationnels avec une interface drag & drop.', 'https://typebot.io/', agents_auto_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Starter", "price": 39}]'::jsonb, true, true),
    ('Unstructured', 'unstructured', 'Bibliothèque pour extraire du texte de documents. Une bibliothèque open-source pour pré-traiter et extraire du texte à partir de documents non structurés.', 'https://unstructured.io/', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Vercel AI SDK', 'vercel-ai-sdk', 'SDK pour construire des applications IA. Un kit de développement qui simplifie l''intégration de fonctionnalités d''IA dans les applications web.', 'https://sdk.vercel.ai/', gen_code_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),
    ('Zephyr', 'zephyr', 'Modèle de langage open-source. Un modèle de langage open-source optimisé pour les performances et la facilité d''utilisation.', 'https://github.com/huggingface/zephyr', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 18 : Plateformes et modèles d'IA majeurs
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('Airbyte', 'airbyte', 'Plateforme d''intégration de données open-source. Une plateforme qui automatise l''extraction et le chargement de données pour l''IA et l''analyse.', 'https://airbyte.com/', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}, {"plan_name": "Cloud", "price": 300}]'::jsonb, true, false),
    ('Anthropic', 'anthropic', 'Entreprise d''IA axée sur la sécurité. Développeur de Claude et d''autres modèles d''IA avancés, mettant l''accent sur l''IA éthique et sûre.', 'https://www.anthropic.com/', agents_auto_id, '[{"plan_name": "Pay as you go", "price": -1}]'::jsonb, true, true),
    ('AssemblyAI', 'assemblyai', 'API de reconnaissance vocale et d''analyse audio. Une API qui convertit la parole en texte et extrait des insights à partir de conversations et de contenus audio.', 'https://www.assemblyai.com/', gen_audio_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 99}]'::jsonb, true, false),
    ('Stable Diffusion', 'stable-diffusion', 'Modèle de génération d''images open-source. Un puissant modèle de génération d''images qui peut être exécuté localement avec des ressources modestes.', 'https://stability.ai/', gen_images_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 19 : Outils de développement et d'analyse
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('Jasper', 'jasper', 'Plateforme d''écriture assistée par IA. Un outil qui aide à créer du contenu marketing, des articles et des copies publicitaires avec l''aide de l''IA.', 'https://www.jasper.ai/', redaction_id, '[{"plan_name": "Creator", "price": 39}, {"plan_name": "Teams", "price": 99}]'::jsonb, true, true),
    ('Jupyter', 'jupyter', 'Environnement de développement interactif. Un outil essentiel pour le développement en science des données et l''apprentissage automatique.', 'https://jupyter.org/', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),
    ('Keras', 'keras', 'API de deep learning de haut niveau. Une interface conviviale pour construire et entraîner des modèles de deep learning.', 'https://keras.io/', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Pandas', 'pandas', 'Bibliothèque d''analyse de données Python. Un outil essentiel pour la manipulation et l''analyse de données en science des données.', 'https://pandas.pydata.org/', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 20 : Bibliothèques et outils d'apprentissage automatique
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('Scikit-learn', 'scikit-learn', 'Bibliothèque d''apprentissage automatique. Une bibliothèque Python populaire pour l''apprentissage automatique classique.', 'https://scikit-learn.org/', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),
    ('SentenceTransformers', 'sentence-transformers', 'Bibliothèque pour embeddings de texte. Un outil pour créer des représentations vectorielles de phrases et de documents.', 'https://www.sbert.net/', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('spaCy', 'spacy', 'Bibliothèque de traitement du langage naturel. Un outil rapide et efficace pour l''analyse et le traitement du texte.', 'https://spacy.io/', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),
    ('YOLO', 'yolo', 'Système de détection d''objets en temps réel. Un algorithme rapide et précis pour la détection d''objets dans les images et les vidéos.', 'https://pjreddie.com/darknet/yolo/', vision_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 21 : Frameworks et bibliothèques spécialisées
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('Alpaca', 'alpaca', 'Version fine-tunée de LLaMA. Un modèle de langage entraîné sur des instructions, offrant des performances similaires à GPT-3.5 avec moins de ressources.', 'https://github.com/tatsu-lab/stanford_alpaca', agents_auto_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Apache Spark', 'apache-spark', 'Framework de traitement de données distribué. Un moteur unifié pour le traitement de données à grande échelle et l''apprentissage automatique.', 'https://spark.apache.org/', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),
    ('AutoKeras', 'autokeras', 'Bibliothèque AutoML basée sur Keras. Un outil d''apprentissage automatique automatisé pour simplifier la création de modèles de deep learning.', 'https://autokeras.com/', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Detectron2', 'detectron2', 'Bibliothèque de vision par ordinateur. Une plateforme de Facebook pour la détection d''objets et la segmentation d''images.', 'https://github.com/facebookresearch/detectron2', vision_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 22 : Bibliothèques d'apprentissage profond et d'optimisation
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('fastai', 'fastai', 'Bibliothèque de deep learning de haut niveau. Une couche d''abstraction au-dessus de PyTorch qui simplifie l''apprentissage profond.', 'https://www.fast.ai/', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),
    ('Faiss', 'faiss', 'Bibliothèque de recherche de similarité. Un outil efficace pour la recherche et le clustering de vecteurs denses.', 'https://github.com/facebookresearch/faiss', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Flax', 'flax', 'Bibliothèque de deep learning basée sur JAX. Un framework flexible pour la recherche en apprentissage profond.', 'https://github.com/google/flax', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('LIME', 'lime', 'Outil d''explication de modèles ML. Une technique pour expliquer les prédictions de n''importe quel classifieur ML.', 'https://github.com/marcotcr/lime', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 23 : Outils de traitement et visualisation de données
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('Milvus', 'milvus', 'Base de données vectorielle open-source. Une solution pour gérer et rechercher des vecteurs à grande échelle.', 'https://milvus.io/', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}, {"plan_name": "Cloud", "price": 99}]'::jsonb, true, false),
    ('MMDetection', 'mmdetection', 'Boîte à outils de détection d''objets. Une collection d''algorithmes et d''outils pour la détection d''objets.', 'https://github.com/open-mmlab/mmdetection', vision_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),
    ('MXNet', 'mxnet', 'Framework de deep learning flexible. Un framework deep learning efficace supporté par Amazon.', 'https://mxnet.apache.org/', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Plotly', 'plotly', 'Bibliothèque de visualisation interactive. Des outils de visualisation interactifs pour l''analyse de données et le ML.', 'https://plotly.com/', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}, {"plan_name": "Enterprise", "price": 999}]'::jsonb, true, true)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

    -- Batch 24 : Outils de prévision et d'analyse avancée
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES 
    ('Prophet', 'prophet', 'Outil de prévision de séries temporelles. Une bibliothèque Facebook pour les prévisions de séries temporelles.', 'https://facebook.github.io/prophet/', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),
    ('PyTorch3D', 'pytorch3d', 'Bibliothèque de deep learning 3D. Des outils pour le deep learning sur données 3D avec PyTorch.', 'https://pytorch3d.org/', vision_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('RAPIDS', 'rapids', 'Suite d''outils data science GPU. Une suite d''outils pour exécuter l''ensemble du pipeline data science sur GPU.', 'https://rapids.ai/', outils_donnees_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),
    ('Weights & Biases', 'weights-biases', 'Plateforme MLOps pour le suivi d''expériences. Un outil pour suivre et visualiser les expériences d''apprentissage automatique.', 'https://wandb.ai/', outils_donnees_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 99}]'::jsonb, true, true)
    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

END $$;
