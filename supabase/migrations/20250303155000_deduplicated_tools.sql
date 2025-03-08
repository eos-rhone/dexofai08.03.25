-- Deduplicated AI tools
BEGIN;

INSERT INTO public.ai_tools VALUES (
            '3DPrinterOS',
            '3dprinteros',
            'Plateforme cloud de gestion d''impression 3D avec IA.',
            'https://www.3dprinteros.com/',
            impression3d_category_id,
            '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Pro", "price": 29.99}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'AI Legion',
        'Plateforme multi-agents TypeScript, similaire à AutoGPT. Une plateforme d''agents autonomes alimentée par LLM permettant aux agents de travailler ensemble pour accomplir des tâches. Les interactions se font via des messages directs en console.',
        'https://github.com/eumemic/ai-legion',
        'ai-legion'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'AI Studios - DeepBrain',
    'ai-studios-deepbrain',
    'Plateforme de création de présentateurs virtuels et de vidéos avec des avatars IA.',
    'https://www.deepbrain.io/',
    (SELECT id FROM categories WHERE slug = 'video')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'AIGameDev',
            'aigamedev',
            'Ressources et outils pour l''IA dans les jeux.',
            'https://aigamedev.com/',
            games_category_id,
            '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Pro", "price": 49}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'AIGym',
            'aigym',
            'Plateforme d''entraînement pour agents IA de jeux.',
            'https://aigym.com/',
            games_category_id,
            '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Pro", "price": 29}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'AIVA',
    'aiva',
    'Composition musicale assistée par IA',
    'https://www.aiva.ai',
    (SELECT id FROM categories WHERE slug = 'creation-musicale')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'AIlice',
        'ailice-task-planner',
        'Agent sous forme de chatbot qui planifie indépendamment les tâches données en langage naturel et crée dynamiquement un arbre d''appels d''agents pour les exécuter.',
        'https://github.com/myshell-ai/AIlice',
        productivite_id,
        '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        true,
        false
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Accentize',
    'accentize',
    'Solutions de traitement audio professionnel basées sur l''IA.',
    'https://www.accentize.com/',
    (SELECT id FROM categories WHERE slug = 'audio-musique')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Accusonus',
    'accusonus',
    'Suite d''outils de réparation audio professionnelle assistée par IA.',
    'https://accusonus.com/',
    (SELECT id FROM categories WHERE slug = 'audio-musique')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Ada Health',
    'ada-health',
    'Assistant santé personnel par IA',
    'https://ada.com',
    (SELECT id FROM categories WHERE slug = 'sante')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Adala',
        'adala',
        'Framework d''annotation de données qui utilise l''IA pour automatiser et améliorer le processus d''étiquetage des données, avec un focus sur la qualité et l''efficacité.',
        'https://github.com/HumanSignal/Adala',
        outils_donnees_id,
        '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        true,
        false
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Adobe Enhanced Speech',
    'adobe-enhanced-speech',
    'Technologie d''amélioration vocale basée sur l''IA par Adobe.',
    'https://www.adobe.com/products/premiere/enhanced-speech.html',
    (SELECT id FROM categories WHERE slug = 'audio-musique')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Adobe Sensei',
            'adobe-sensei',
            'IA intégrée aux produits Adobe Creative Cloud.',
            'https://www.adobe.com/sensei.html',
            media_category_id,
            '[{"plan_name": "Creative Cloud", "price": 52.99}]'::jsonb,
            true,
            true
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Agent4Rec',
        'agent4rec',
        'Système de recommandation basé sur des agents IA qui personnalise les suggestions en fonction des préférences et du comportement des utilisateurs.',
        'https://github.com/LehengTHU/Agent4Rec',
        recommandation_id,
        '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        true,
        false
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'AgentForge',
        'agentforge',
        'Plateforme de développement d''agents IA qui simplifie la création et le déploiement d''agents autonomes pour diverses tâches.',
        'https://github.com/DataBassGit/AgentForge',
        dev_agents_id,
        '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        true,
        false
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES ('AgentGPT', 'Plateforme no-code basée sur le navigateur permettant de créer et déployer des agents IA autonomes. Utilise les fonctions OpenAI et prend en charge GPT-3.5-16k avec des bases de données Pinecone et pg_vector.', 'https://agentgpt.reworkd.ai/', 'Chatbots & Assistants', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'AgentPilot',
        'Application de bureau pour construire, gérer et discuter avec des agents IA. Intégré avec Open Interpreter et MemGPT, offrant des fonctionnalités de chat en groupe.',
        'https://github.com/jbexta/AgentPilot',
        'agentpilot'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'AgentVerse',
        'Plateforme pour la résolution de tâches et la simulation d''agents. Permet d''assembler plusieurs agents pour accomplir des tâches collaborativement et de créer des environnements personnalisés pour observer ou interagir avec de multiples agents.',
        'https://github.com/OpenBMB/AgentVerse',
        'agentverse'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Agents',
        'Bibliothèque/framework pour construire des agents linguistiques. Équipé de mémoire à court et long terme via VectorDB, capacités d''utilisation d''outils externes, navigation web, et communication multi-agents. Permet une interaction humain-agent flexible.',
        'https://github.com/aiwaves-cn/agents',
        'agents'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Aider',
        'Outil en ligne de commande pour éditer du code dans votre dépôt local. Permet de faire de la programmation en binôme avec GPT-3.5/GPT-4, de démarrer un nouveau projet ou de travailler sur un dépôt existant. Les modifications sont automatiquement committées avec des messages pertinents.',
        'https://github.com/paul-gauthier/aider',
        'aider'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'AirNav AI',
    'airnav-ai',
    'IA pour le contrôle aérien',
    'https://airnav.ai',
    (SELECT id FROM categories WHERE slug = 'aviation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Airbyte',
        'Plateforme d''intégration de données open-source. Une plateforme qui automatise l''extraction et le chargement de données pour l''IA et l''analyse, avec plus de 300 connecteurs.',
        'https://airbyte.com/',
        'airbyte'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'AllenNLP',
        'Bibliothèque NLP basée sur PyTorch. Une plateforme open-source pour développer des modèles de traitement du langage naturel.',
        'https://allennlp.org/',
        'allennlp'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Alpaca',
        'Version fine-tunée de LLaMA. Un modèle de langage entraîné sur des instructions, offrant des performances similaires à GPT-3.5 avec moins de ressources.',
        'https://github.com/tatsu-lab/stanford_alpaca',
        'alpaca'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Alteryx',
    'alteryx',
    'Plateforme d''analyse et d''automatisation des processus analytiques.',
    'https://www.alteryx.com/',
    (SELECT id FROM categories WHERE slug = 'data-analysis')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Amazon CodeWhisperer',
    'amazon-codewhisperer',
    'Assistant de codage IA qui génère des suggestions de code en temps réel.',
    'https://aws.amazon.com/codewhisperer/',
    (SELECT id FROM categories WHERE slug = 'code')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Amper',
    'amper',
    'Création musicale professionnelle par IA',
    'https://www.ampermusic.com',
    (SELECT id FROM categories WHERE slug = 'creation-musicale')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Ancient Scene',
        'ancient-scene',
        'Reconstitution de scènes historiques en 3D à partir de données archéologiques.',
        'https://ancient-scene.ai/',
        (SELECT id FROM categories WHERE slug = 'archéologie')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Anthropic',
        'Entreprise d''IA axée sur la sécurité. Développeur de Claude et d''autres modèles d''IA avancés, mettant l''accent sur l''IA éthique et sûre.',
        'https://www.anthropic.com/',
        'anthropic'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Anyword',
    'anyword',
    'Plateforme de copywriting qui génère et optimise du contenu marketing.',
    'https://anyword.com/',
    (SELECT id FROM categories WHERE slug = 'writing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Apache Spark',
        'Framework de traitement de données distribué. Un moteur unifié pour le traitement de données à grande échelle et l''apprentissage automatique.',
        'https://spark.apache.org/',
        'apache-spark'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'ArchAI',
    'archai',
    'Système d''IA pour la détection et l''analyse de sites archéologiques.',
    'https://www.arch-ai.org/',
    (SELECT id FROM categories WHERE slug = 'archaeology')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'ArchaeoGPT',
    'archaeogpt',
    'Assistant IA spécialisé dans l''analyse de données archéologiques.',
    'https://archaeogpt.org/',
    (SELECT id FROM categories WHERE slug = 'archaeology')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Archaeological Predictor',
    'archaeological-predictor',
    'Outil de prédiction des sites archéologiques basé sur l''apprentissage automatique.',
    'https://archaeologicalpredictor.com/',
    (SELECT id FROM categories WHERE slug = 'archaeology')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Archaeological Vision',
    'archaeological-vision',
    'Système de vision par ordinateur pour l''analyse de sites archéologiques.',
    'https://archaeologicalvision.com/',
    (SELECT id FROM categories WHERE slug = 'archaeology')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Artbreeder',
        'artbreeder',
        'Plateforme de création d''images par IA permettant de mélanger et d''éditer des styles artistiques.',
        'https://www.artbreeder.com/',
        (SELECT id FROM categories WHERE slug = 'art-&-créativité')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Artefacts Analyzer',
    'artefacts-analyzer',
    'Outil d''analyse d''artefacts archéologiques utilisant l''IA.',
    'https://artefactsanalyzer.com/',
    (SELECT id FROM categories WHERE slug = 'archaeology')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'AssemblyAI',
        'API de reconnaissance vocale et d''analyse audio. Une API qui convertit la parole en texte et extrait des insights à partir de conversations et de contenus audio.',
        'https://www.assemblyai.com/',
        'assemblyai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'AstroPrint',
            'astroprint',
            'Plateforme intelligente de gestion d''impression 3D.',
            'https://www.astroprint.com/',
            impression3d_category_id,
            '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Pro", "price": 19.99}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'AudioLabs',
    'audiolabs',
    'Suite d''outils IA pour l''amélioration et le traitement audio professionnel.',
    'https://www.audiolabs.io/',
    (SELECT id FROM categories WHERE slug = 'audio-musique')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Audionamix',
    'audionamix',
    'Solutions de séparation audio professionnelle basées sur l''IA.',
    'https://audionamix.com/',
    (SELECT id FROM categories WHERE slug = 'audio-musique')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Auto-GPT',
    'auto-gpt',
    'Un agent autonome expérimental qui utilise GPT-4 pour atteindre des objectifs définis par l''utilisateur.',
    'https://github.com/Significant-Gravitas/Auto-GPT',
    (SELECT id FROM categories WHERE slug = 'automation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'AutoGPT',
        'Tentative expérimentale open-source de rendre GPT-4 totalement autonome. Enchaîne les "pensées" LLM pour atteindre automatiquement n''importe quel objectif fixé. Dispose d''un accès Internet pour les recherches, d''une gestion de la mémoire à court et long terme, et peut exécuter de nombreuses commandes.',
        'https://agpt.co',
        'autogpt'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'AutoGen',
        'Framework multi-agents avec une grande diversité d''agents. Permet de développer des applications LLM avec plusieurs agents conversationnels qui peuvent collaborer pour résoudre des tâches et interagir avec les humains. Simplifie les workflows LLM complexes et améliore l''inférence avec des fonctionnalités de réglage des performances.',
        'https://github.com/microsoft/autogen',
        'autogen'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'AutoKeras',
        'Bibliothèque AutoML basée sur Keras. Un outil d''apprentissage automatique automatisé pour simplifier la création de modèles de deep learning.',
        'https://autokeras.com/',
        'autokeras'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'AutoPR',
        'Agent de pull requests générées par IA qui corrige les problèmes. Déclenché en ajoutant un label contenant AutoPR à un problème, il planifie une correction, écrit le code, pousse une branche et ouvre une pull request.',
        'https://github.com/irgolic/AutoPR',
        'autopr'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Autodesk AEC Collection',
        'autodesk-aec',
        'Suite complète d''outils IA pour l''architecture, l''ingénierie et la construction, incluant Revit et AutoCAD.',
        'https://www.autodesk.com/collections/architecture-engineering-construction/',
        (SELECT id FROM categories WHERE slug = 'architecture-&-construction')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Automata',
        'Génère du code basé sur le contexte de votre projet. Utilise GPT-4 pour prendre votre projet comme contexte, recevoir des tâches et exécuter les instructions de manière transparente. Vise à évoluer vers un système d''IA auto-programmable entièrement autonome.',
        'https://github.com/emrgnt-cmplxty/automata',
        'automata'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Autonomous HR Chatbot',
        'Agent qui répond aux requêtes RH en utilisant des outils. Une application d''entreprise prototype - un assistant RH autonome alimenté par GPT-3.5 qui peut répondre aux questions RH de manière autonome en utilisant des outils comme la politique de pointage, les données des employés et une calculatrice.',
        'https://github.com/stepanogil/autonomous-hr-chatbot',
        'autonomous-hr-chatbot'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Azure OpenAI',
        'Services OpenAI sur Azure. Version entreprise des modèles OpenAI, intégrée à l''infrastructure Azure avec des fonctionnalités de sécurité et de conformité avancées.',
        'https://azure.microsoft.com/products/cognitive-services/openai-service',
        'azure-openai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'BART',
        'Modèle de séquence à séquence par Facebook. Un modèle pré-entraîné pour la compréhension et la génération de texte.',
        'https://huggingface.co/facebook/bart-large',
        'bart'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'BERT',
        'Modèle de traitement du langage par Google. Un modèle révolutionnaire qui a transformé le NLP en comprenant le contexte bidirectionnel des mots.',
        'https://github.com/google-research/bert',
        'bert'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'BLOOM',
        'Modèle de langage multilingue. Le plus grand modèle de langage open-source entraîné sur plus de 46 langues.',
        'https://huggingface.co/bigscience/bloom',
        'bloom'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'BabyAGI',
        'babyagi',
        'Framework simple pour la gestion des tâches utilisant l''IA. Crée et priorise automatiquement des tâches basées sur un objectif prédéfini.',
        'https://github.com/yoheinakajima/babyagi',
        gestion_taches_id,
        '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        true,
        false
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'BabyBeeAGI',
        'babybeeagi',
        'Version améliorée de BabyAGI avec une gestion des tâches plus complexe, permettant une analyse et une synthèse plus complètes des informations.',
        'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyBeeAGI.py',
        gestion_taches_id,
        '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        true,
        false
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'BabyCatAGI',
        'babycatagi',
        'Modification de BabyBeeAGI avec seulement 300 lignes de code. Inclut un agent de création de tâches unique.',
        'https://replit.com/@YoheiNakajima/BabyCatAGI',
        gestion_taches_id,
        '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        true,
        false
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'BabyCommandAGI',
        'Test de combinaison entre CLI et LLM. Un agent conçu pour tester l''interaction entre l''interface en ligne de commande et les modèles de langage. Basé sur BabyAGI, il peut exécuter des commandes shell et réaliser de la programmation automatique.',
        'https://github.com/saten-private/BabyCommandAGI',
        'babycommandagi'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'BabyDeerAGI',
        'babydeeragi',
        'Version de BabyAGI avec environ 350 lignes de code, offrant des tâches parallèles et utilisant GPT-3.5-turbo.',
        'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyDeerAGI.py',
        gestion_taches_id,
        '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        true,
        false
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'BabyElfAGI',
        'babyelfagi',
        'Évolution de BabyDeerAGI avec environ 895 lignes de code. Inclut une classe de compétences personnalisables.',
        'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyElfAGI/main.py',
        gestion_taches_id,
        '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        true,
        false
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Babylon Health',
    'babylon-health',
    'Service de consultation médicale en ligne utilisant l''IA.',
    'https://www.babylonhealth.com/',
    (SELECT id FROM categories WHERE slug = 'health')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'BambooAI',
        'Exploration et analyse de données pour non-programmeurs. Fonctionne en boucle, permet le mélange de différents modèles, maintient la mémoire des conversations précédentes, et construit des prompts dynamiquement en utilisant un contexte pertinent de la base de données vectorielle Pinecone.',
        'https://github.com/pgalko/BambooAI',
        'bambooai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Bard',
    'bard',
    'Assistant IA de Google avec intégration des services Google',
    'https://bard.google.com',
    (SELECT id FROM categories WHERE slug = 'assistants-chatbots')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Beautiful.ai',
    'beautiful-ai',
    'Créez de belles présentations rapidement avec l''aide de l''IA.',
    'https://www.beautiful.ai/',
    (SELECT id FROM categories WHERE slug = 'presentation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'BeeBot',
        'Projet en phase initiale pour une large gamme de tâches. Actuellement en développement, il est considéré comme un projet de recherche en phase précoce, non destiné à une utilisation en production.',
        'https://github.com/AutoPackAI/beebot',
        'beebot'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'BeforeSunset',
    'beforesunset',
    'Assistant de planification et de gestion du temps basé sur l''IA.',
    'https://www.beforesunset.ai/',
    (SELECT id FROM categories WHERE slug = 'productivity')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'BentoML',
        'Framework de serving ML unifié. Une plateforme pour servir, gérer et déployer des modèles ML en production.',
        'https://www.bentoml.com/',
        'bentoml'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'BigScience',
        'Initiative de recherche collaborative en IA. Un projet open-source pour démocratiser la recherche en IA et créer des modèles multilingues.',
        'https://bigscience.huggingface.co/',
        'bigscience'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Bing Search',
    'bing-search',
    'Microsoft annonce une nouvelle version de son moteur de recherche Bing, alimenté par un modèle OpenAI de nouvelle génération.',
    'https://blogs.microsoft.com/blog/2023/02/07/reinventing-search-with-a-new-ai-powered-microsoft-bing-and-edge-your-copilot-for-the-web/',
    (SELECT id FROM categories WHERE slug = 'milestone')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'BlackBerry Cylance',
            'cylance',
            'Solution antivirus et EDR basée sur l''IA.',
            'https://www.cylance.com/',
            cyber_category_id,
            '[{"plan_name": "Pro", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Blender AI',
    'blender-ai',
    'Suite d''outils IA pour Blender',
    'https://blender.org',
    (SELECT id FROM categories WHERE slug = '3d-animation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Blinky',
        'Agent de débogage IA open-source pour VSCode. Utilise les LLM pour identifier et corriger les erreurs de code backend, s''appuyant sur l''API VSCode, le protocole LSP et le débogage par instruction print.',
        'https://github.com/seahyinghang8/blinky',
        'blinky'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Bloop',
        'Recherche de code IA, fonctionne pour Rust et TypeScript. Un moteur de recherche sémantique alimenté par GPT-4 utilisant un agent IA, offrant une navigation précise du code et construit sur des graphes de pile.',
        'https://bloop.ai/',
        'bloop'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Blue Hexagon',
            'blue-hexagon',
            'Sécurité cloud en temps réel par deep learning.',
            'https://bluehexagon.ai/',
            cyber_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'BondAI',
        'Interpréteur de code avec CLI et API RESTful/WebSocket. Un agent IA autonome hautement capable avec une CLI facile à utiliser, une API RESTful/WebSocket, une image Docker pré-construite et une suite robuste d''outils intégrés.',
        'https://bondai.dev/',
        'bondai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Boomy',
    'boomy',
    'Créez de la musique originale en quelques secondes avec l''IA.',
    'https://boomy.com/',
    (SELECT id FROM categories WHERE slug = 'audio')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'BuildAI',
    'buildai',
    'IA pour la gestion de chantier',
    'https://buildai.construction',
    (SELECT id FROM categories WHERE slug = 'construction')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'CAMEL',
        'Architecture pour l''exploration "mentale" des agents. Une bibliothèque open-source conçue pour l''étude d''agents autonomes et communicatifs, avec un agent utilisateur IA donnant des instructions et un agent assistant IA suivant ces instructions.',
        'https://github.com/camel-ai/camel',
        'camel'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'CENTURY',
    'century',
    'Plateforme d''apprentissage personnalisé utilisant l''IA.',
    'https://www.century.tech/',
    (SELECT id FROM categories WHERE slug = 'education')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'CLIP',
        'Modèle de vision-langage d''OpenAI. Un modèle neuronal qui connecte texte et images de manière performante.',
        'https://github.com/openai/CLIP',
        'clip'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'CNVRG.IO',
            'cnvrg-io',
            'Plateforme MLOps full-stack pour les équipes.',
            'https://cnvrg.io/',
            collab_category_id,
            '[{"plan_name": "Community", "price": 0}, {"plan_name": "Pro", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'CUDA',
        'Plateforme de calcul parallèle NVIDIA. Une architecture qui permet d''accélérer les calculs sur GPU pour l''apprentissage profond.',
        'https://developer.nvidia.com/cuda-toolkit',
        'cuda'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Cal.ai',
        'Assistant de planification open-source construit sur Cal.com. Peut réserver des réunions, résumer votre semaine et trouver du temps avec d''autres personnes en utilisant le langage naturel.',
        'https://cal.ai',
        'calai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Canva AI',
    'canva-ai',
    'Suite d''outils IA pour la création graphique',
    'https://www.canva.com',
    (SELECT id FROM categories WHERE slug = 'design')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Carnegie Learning',
    'carnegie-learning',
    'Plateforme d''apprentissage adaptatif pour les mathématiques.',
    'https://www.carnegielearning.com/',
    (SELECT id FROM categories WHERE slug = 'education')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Cascadeur',
    'cascadeur',
    'Logiciel d''animation 3D avec physique assistée par IA.',
    'https://cascadeur.com/',
    (SELECT id FROM categories WHERE slug = '3d-animation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'CatBoost',
        'Bibliothèque de boosting par Yandex. Un algorithme d''apprentissage automatique pour le boosting de gradient avec gestion native des variables catégorielles.',
        'https://catboost.ai/',
        'catboost'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Century Tech',
            'century-tech',
            'Plateforme d''apprentissage adaptatif utilisant l''IA pour personnaliser l''éducation.',
            'https://www.century.tech/',
            education_category_id,
            '[{"plan_name": "École", "price": null}, {"plan_name": "Institution", "price": null}]'::jsonb,
            true,
            true
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES ('Character.ai', 'character-ai', 'Chatbots personnalisés avec différentes personnalités', 'https://character.ai', chatbots_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 10}]'::jsonb, true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'ChatArena',
        'Outil de chat pour l''interaction multi-agents. Un environnement de jeu de langage multi-agents pour LLMs, visant à développer les capacités de communication et de collaboration des IA.',
        'https://www.chatarena.org/',
        'chatarena'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES ('ChatDev', 'Assistant de développement logiciel qui simule une entreprise de développement logiciel avec plusieurs agents IA collaborant sur des projets.', 'https://github.com/OpenBMB/ChatDev', 'Génération de Code', '[{"plan_name": "Free", "price": 0}]')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'ChatGPT',
        'Assistant conversationnel d''OpenAI. Un modèle de langage avancé capable de dialoguer de manière naturelle et d''aider dans diverses tâches.',
        'https://chat.openai.com/',
        'chatgpt'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Chatbot UI',
    'chatbot-ui',
    'Une interface utilisateur ChatGPT open source.',
    'https://www.chatbotui.com/',
    (SELECT id FROM categories WHERE slug = 'custom-interface')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'ChemCrow',
        'Agent LangChain pour les tâches liées à la chimie. Package open source pour la résolution précise de tâches chimiques nécessitant du raisonnement, intégrant 13 outils conçus par des experts.',
        'https://github.com/ur-whitelab/chemcrow-public',
        'chemcrow'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Claude',
        'Assistant IA d''Anthropic. Un modèle de langage avancé conçu pour être utile, honnête et inoffensif, capable d''analyses approfondies.',
        'https://www.anthropic.com/claude',
        'claude'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Cleanvoice',
    'cleanvoice',
    'Nettoie automatiquement les enregistrements vocaux des bruits parasites.',
    'https://cleanvoice.ai/',
    (SELECT id FROM categories WHERE slug = 'audio-musique')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'ClearML',
            'clearml',
            'Plateforme MLOps open-source pour la collaboration.',
            'https://clear.ml/',
            collab_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 100}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Clearscope',
    'clearscope',
    'Plateforme d''optimisation de contenu basée sur l''IA.',
    'https://www.clearscope.io/',
    (SELECT id FROM categories WHERE slug = 'marketing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'ClickUp AI',
    'clickup-ai',
    'Assistant de gestion de projet alimenté par l''IA.',
    'https://clickup.com/ai',
    (SELECT id FROM categories WHERE slug = 'project')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'ClimateAI',
    'climate-ai',
    'Analyse climatique par IA',
    'https://climate.ai',
    (SELECT id FROM categories WHERE slug = 'environnement')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Clippy',
        'Agent capable de planifier, écrire, déboguer et tester du code. Peut développer du code de manière autonome ou en collaboration avec l''utilisateur.',
        'https://github.com/ennucore/clippy/',
        'clippy'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'CodeFuse-ChatBot',
        'Agent servant l''ensemble du cycle de vie du développement logiciel. Un assistant intelligent alimenté par un framework multi-agents, travaillant avec des outils DevOps et des dépôts de code et de documentation.',
        'https://github.com/codefuse-ai/codefuse-chatbot',
        'codefuse-chatbot'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'CodeGuru',
            'codeguru',
            'Revue de code automatisée par Amazon.',
            'https://aws.amazon.com/codeguru/',
            dev_category_id,
            '[{"plan_name": "Pay-per-use", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'CodeSee',
            'codesee',
            'Cartographie et compréhension du code par IA.',
            'https://www.codesee.io/',
            dev_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 25}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'CodeStream',
            'codestream',
            'Collaboration de code en temps réel avec IA.',
            'https://www.codestream.com/',
            dev_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 12}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Codeium',
    'codeium',
    'Assistant de codage IA moderne et gratuit.',
    'https://codeium.com/',
    (SELECT id FROM categories WHERE slug = 'code')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Cody by Sourcegraph',
        'Agent qui écrit du code et répond à vos questions. Un assistant de code IA de Sourcegraph qui écrit du code et répond aux questions en lisant l''ensemble de votre base de code et le graphe de code.',
        'https://docs.sourcegraph.com/cody',
        'cody-sourcegraph'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Cody by ajhous44',
        'Interrogez et naviguez dans votre base de code. Un assistant IA conçu pour interroger votre base de code en langage naturel, utilisant des embeddings vectoriels et les modèles de langage d''OpenAI.',
        'https://github.com/ajhous44/cody',
        'cody-ajhous44'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Cognii',
            'cognii',
            'Assistant virtuel pour l''évaluation et le feedback en éducation.',
            'https://www.cognii.com/',
            education_category_id,
            '[{"plan_name": "Institution", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Cohere',
        'Plateforme d''IA pour les entreprises. Une suite d''outils d''IA pour créer des applications avec compréhension du langage naturel et génération de texte.',
        'https://cohere.ai/',
        'cohere'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Colossyan',
    'colossyan',
    'Créateur de vidéos d''apprentissage avec des présentateurs IA réalistes.',
    'https://www.colossyan.com/',
    (SELECT id FROM categories WHERE slug = 'video')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Comet ML',
            'comet-ml',
            'Plateforme de gestion du cycle de vie ML pour les équipes.',
            'https://www.comet.ml/',
            collab_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 49}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Compose AI',
    'compose-ai',
    'Extension de navigateur qui accélère l''écriture avec l''auto-complétion IA.',
    'https://www.compose.ai/',
    (SELECT id FROM categories WHERE slug = 'writing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Connected Papers',
    'connected-papers',
    'Outil de visualisation qui aide à découvrir et explorer des articles académiques connexes.',
    'https://www.connectedpapers.com/',
    (SELECT id FROM categories WHERE slug = 'research')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Consensus',
    'consensus',
    'Moteur de recherche pour articles scientifiques',
    'https://consensus.app',
    (SELECT id FROM categories WHERE slug = 'recherche')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Content Technologies',
            'content-technologies',
            'Création de contenu éducatif personnalisé par IA.',
            'https://contenttechnologies.com/',
            education_category_id,
            '[{"plan_name": "Pro", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Continue',
        'Pilote automatique open-source pour le développement logiciel. Apporte la puissance de ChatGPT à VS Code avec des fonctionnalités comme la réponse aux questions de codage, l''édition en langage naturel et la génération de fichiers.',
        'https://continue.dev/',
        'continue'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Convoy AI',
    'convoy-ai',
    'Optimisation logistique par IA',
    'https://convoy.com',
    (SELECT id FROM categories WHERE slug = 'logistique')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Copilot',
    'copilot',
    'Assistant IA de Microsoft pour la productivité',
    'https://copilot.microsoft.com',
    (SELECT id FROM categories WHERE slug = 'assistants-chatbots')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Copy AI',
    'copy-ai',
    'Utilisez l''IA pour générer du contenu marketing de haute qualité en quelques secondes.',
    'https://www.copy.ai/',
    (SELECT id FROM categories WHERE slug = 'productivity')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Copy.ai',
    'copy-ai',
    'Génération de textes marketing',
    'https://copy.ai',
    (SELECT id FROM categories WHERE slug = 'redaction-contenu')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Copysmith',
    'copysmith',
    'Plateforme de génération de contenu pour les équipes marketing et e-commerce.',
    'https://copysmith.ai/',
    (SELECT id FROM categories WHERE slug = 'writing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Coqui',
        'Boîte à outils de synthèse vocale. Une collection d''outils open-source pour la synthèse et le traitement de la parole.',
        'https://coqui.ai/',
        'coqui'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Cortex',
        'Plateforme de déploiement d''IA. Un outil pour déployer des modèles d''IA en production sur Kubernetes.',
        'https://www.cortex.dev/',
        'cortex'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Coursera AI',
    'coursera-ai',
    'Assistant d''apprentissage personnalisé',
    'https://coursera.org',
    (SELECT id FROM categories WHERE slug = 'education')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'CrewAI',
        'Framework pour orchestrer des agents jouant des rôles. Framework de pointe pour orchestrer des agents IA autonomes jouant des rôles, permettant une collaboration intelligente pour résoudre des tâches complexes.',
        'https://github.com/joaomdmoura/crewai',
        'crewai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'CrowdStrike',
    'crowdstrike',
    'Protection des endpoints basée sur l''IA.',
    'https://www.crowdstrike.com/',
    (SELECT id FROM categories WHERE slug = 'security')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'CuPy',
        'Bibliothèque NumPy sur GPU. Une implémentation de l''interface NumPy pour les calculs sur GPU avec CUDA.',
        'https://cupy.dev/',
        'cupy'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Cynet',
            'cynet',
            'Plateforme de sécurité autonome tout-en-un.',
            'https://www.cynet.com/',
            cyber_category_id,
            '[{"plan_name": "Pro", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'D-ID',
    'd-id',
    'Créez des vidéos avec des avatars parlants à partir de photos.',
    'https://www.d-id.com/',
    (SELECT id FROM categories WHERE slug = 'video')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'DALL-E',
        'Générateur d''images par IA d''OpenAI. Un modèle capable de créer des images réalistes et artistiques à partir de descriptions textuelles.',
        'https://openai.com/dall-e-3',
        'dall-e'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'DALL·E',
            'dall-e',
            'Génération d''images à partir de descriptions textuelles.',
            'https://openai.com/dall-e-2',
            media_category_id,
            '[{"plan_name": "Credits", "price": null}]'::jsonb,
            true,
            true
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'DALL·E 2',
    'dalle-2',
    'Annonce de la sortie de DALL·E 2, un système avancé de génération d''images avec une résolution améliorée, des capacités de création d''images étendues et diverses mesures de sécurité.',
    'https://openai.com/blog/dall-e-2/',
    (SELECT id FROM categories WHERE slug = 'milestone')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'DALL·E 3',
    'dalle-3',
    'Annonce du générateur d''images DALL·E 3.',
    'https://openai.com/index/dall-e-3/',
    (SELECT id FROM categories WHERE slug = 'milestone')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'DETR',
        'Transformers pour la détection d''objets. Une nouvelle approche de la détection d''objets basée sur les transformers.',
        'https://github.com/facebookresearch/detr',
        'detr'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Darktrace',
    'darktrace',
    'Cybersécurité autonome par IA',
    'https://darktrace.com',
    (SELECT id FROM categories WHERE slug = 'cybersecurite')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Dask',
        'Bibliothèque de calcul parallèle flexible. Un framework pour le calcul parallèle en Python, compatible avec l''écosystème PyData.',
        'https://dask.org/',
        'dask'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'DataRobot',
    'datarobot',
    'Plateforme d''IA automatisée pour l''analyse',
    'https://datarobot.com',
    (SELECT id FROM categories WHERE slug = 'analyse-donnees')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Databricks',
            'databricks-prep',
            'Plateforme unifiée d''analyse et préparation de données.',
            'https://databricks.com/',
            data_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Dataiku',
    'dataiku',
    'Plateforme collaborative de data science et d''analyse.',
    'https://www.dataiku.com/',
    (SELECT id FROM categories WHERE slug = 'data-analysis')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Deep Instinct',
            'deep-instinct',
            'Protection prédictive contre les malwares par deep learning.',
            'https://www.deepinstinct.com/',
            cyber_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'DeepArt',
            'deepart',
            'Transfert de style artistique par IA.',
            'https://deepart.io/',
            media_category_id,
            '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Pro", "price": 19.99}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'DeepL',
    'deepl',
    'Service de traduction automatique utilisant des réseaux de neurones profonds.',
    'https://www.deepl.com/',
    (SELECT id FROM categories WHERE slug = 'translation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'DeepL Write',
    'deepl-write',
    'Assistant d''écriture et traduction IA',
    'https://deepl.com/write',
    (SELECT id FROM categories WHERE slug = 'traduction')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'DeepMind',
        'Entreprise de recherche en IA de Google. Connue pour AlphaGo, AlphaFold et d''autres avancées majeures en intelligence artificielle.',
        'https://deepmind.google/',
        'deepmind'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'DeepMind AlphaFold',
        'alphafold',
        'IA pour la prédiction de la structure des protéines avec une précision sans précédent.',
        'https://deepmind.com/research/case-studies/alphafold',
        (SELECT id FROM categories WHERE slug = 'biotechnologie')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'DeepMind Lab',
            'deepmind-lab',
            'Environnement 3D pour la recherche en IA de jeux.',
            'https://github.com/deepmind/lab',
            games_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            true
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'DeepMind Research',
    'deepmind-research',
    'Outils IA pour la recherche scientifique',
    'https://deepmind.com/research',
    (SELECT id FROM categories WHERE slug = 'science-recherche')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'DeepSeek',
    'deepseek',
    'LLMs de pointe pour les entreprises, les consommateurs et les applications scientifiques.',
    'https://www.deepseek.com/',
    (SELECT id FROM categories WHERE slug = 'text')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'DeepSpeed',
        'Bibliothèque d''optimisation deep learning. Un outil Microsoft pour l''entraînement efficace de modèles massifs.',
        'https://www.deepspeed.ai/',
        'deepspeed'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Deepset Cloud',
        'Plateforme NLP pour construire des applications de recherche sémantique. Une plateforme cloud pour construire des applications NLP de bout en bout avec des pipelines de recherche sémantique, des systèmes de questions-réponses et des chatbots.',
        'https://www.deepset.ai/deepset-cloud',
        'deepset-cloud'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Descript',
    'descript',
    'Édition audio et vidéo par IA',
    'https://descript.com',
    (SELECT id FROM categories WHERE slug = 'audio-musique')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Designs AI',
    'designs-ai',
    'Suite d''outils créatifs incluant un créateur de vidéos IA.',
    'https://designs.ai/',
    (SELECT id FROM categories WHERE slug = 'video')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Detectron2',
        'Bibliothèque de vision par ordinateur. Une plateforme de Facebook pour la détection d''objets et la segmentation d''images.',
        'https://github.com/facebookresearch/detectron2',
        'detectron2'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Determined AI',
            'determined-ai',
            'Plateforme de formation et collaboration ML.',
            'https://www.determined.ai/',
            collab_category_id,
            '[{"plan_name": "Open Source", "price": 0}, {"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Devin',
        'Premier ingénieur logiciel IA autonome au monde. Un agent IA capable de contribuer à des projets logiciels comme un ingénieur humain, pouvant planifier, écrire et déboguer du code de manière autonome.',
        'https://www.cognition-labs.com/devin',
        'devin'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Diffusers',
        'Bibliothèque de modèles de diffusion. Une boîte à outils pour travailler avec des modèles de diffusion comme Stable Diffusion.',
        'https://github.com/huggingface/diffusers',
        'diffusers'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Digital Archaeology Tool',
    'digital-archaeology-tool',
    'Suite d''outils numériques pour l''analyse archéologique avec IA.',
    'https://digitalarchaeology.org.uk/',
    (SELECT id FROM categories WHERE slug = 'archaeology')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'DocArray',
        'Bibliothèque pour données non structurées. Un outil pour manipuler et traiter des données multimodales en deep learning.',
        'https://docarray.jina.ai/',
        'docarray'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'DocsBot AI',
    'docsbot-ai',
    'Assistant de documentation intelligent qui aide à créer et maintenir la documentation technique.',
    'https://docsbot.ai/',
    (SELECT id FROM categories WHERE slug = 'productivity')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'DocsGPT',
        'Solution open-source pour interroger la documentation technique. Un chatbot IA open-source qui simplifie la recherche et la compréhension de la documentation technique, avec une interface web et une extension VSCode.',
        'https://docsgpt.ai/',
        'docsgpt'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Domino Data Lab',
            'domino-data-lab',
            'Plateforme enterprise pour la collaboration en data science.',
            'https://www.dominodatalab.com/',
            collab_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'DotAgent',
        'Agent IA pour l''automatisation des tâches de développement. Un agent IA conçu pour automatiser les tâches de développement répétitives, capable de comprendre et d''exécuter des instructions en langage naturel.',
        'https://github.com/DotAgent',
        'dotagent'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'DrugAI',
        'Agent IA pour la découverte de médicaments. Un agent autonome spécialisé dans la recherche et la découverte de nouveaux médicaments, utilisant l''apprentissage automatique et l''IA pour analyser les composés chimiques.',
        'https://github.com/GIST-CSBL/DrugAI',
        'drugai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Duolingo',
    'duolingo',
    'Plateforme d''apprentissage des langues utilisant l''IA pour personnaliser l''apprentissage.',
    'https://www.duolingo.com/',
    (SELECT id FROM categories WHERE slug = 'education')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Duolingo Max',
    'duolingo-max',
    'Apprentissage des langues avec IA',
    'https://duolingo.com',
    (SELECT id FROM categories WHERE slug = 'education')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'E2B',
        'Infrastructure pour exécuter des agents IA en toute sécurité. Une plateforme cloud qui permet d''exécuter des agents IA dans des environnements isolés et sécurisés, avec accès à des outils et des API.',
        'https://e2b.dev',
        'e2b'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Edge Impulse',
    'edge-impulse',
    'Plateforme de développement IoT avec IA',
    'https://edgeimpulse.com',
    (SELECT id FROM categories WHERE slug = 'iot-robotique')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Eightfold AI',
    'eightfold-ai',
    'Plateforme de gestion des talents basée sur l''IA.',
    'https://eightfold.ai/',
    (SELECT id FROM categories WHERE slug = 'hr')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Elai',
    'elai',
    'Plateforme de création de vidéos avec des avatars IA personnalisables.',
    'https://elai.io/',
    (SELECT id FROM categories WHERE slug = 'video')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'EleutherAI',
        'Organisation de recherche en IA open-source. Un groupe qui développe des modèles de langage open-source et fait progresser la recherche en IA.',
        'https://www.eleuther.ai/',
        'eleutherai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'ElevenLabs',
    'elevenlabs',
    'Synthèse vocale ultra-réaliste',
    'https://elevenlabs.io',
    (SELECT id FROM categories WHERE slug = 'voix-parole')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Elicit',
    'elicit',
    'Assistant de recherche scientifique par IA',
    'https://elicit.org',
    (SELECT id FROM categories WHERE slug = 'recherche')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Evals',
        'Framework pour évaluer les modèles de langage. Un framework d''évaluation pour les LLMs qui permet de créer et d''exécuter des tests automatisés pour mesurer les performances des modèles.',
        'https://github.com/openai/evals',
        'evals'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'ExcelFormulaBot',
        'Assistant IA pour les formules Excel. Un bot qui aide à créer et à comprendre les formules Excel complexes, traduisant les descriptions en langage naturel en formules fonctionnelles.',
        'https://excelformulabot.com/',
        'excelformulabot'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Explainpaper',
    'explainpaper',
    'Outil qui explique les articles de recherche en termes simples.',
    'https://www.explainpaper.com/',
    (SELECT id FROM categories WHERE slug = 'research')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Faiss',
        'Bibliothèque de recherche de similarité. Un outil efficace pour la recherche et le clustering de vecteurs denses.',
        'https://github.com/facebookresearch/faiss',
        'faiss'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'FarmGPT',
    'farmgpt',
    'Assistant agricole intelligent',
    'https://farmgpt.ai',
    (SELECT id FROM categories WHERE slug = 'agriculture')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'FastGPT',
        'Plateforme pour construire des applications IA rapidement. Une plateforme qui permet de construire rapidement des applications basées sur les LLMs, avec des fonctionnalités de traitement de données et d''intégration.',
        'https://fastgpt.app/',
        'fastgpt'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'FastText',
        'Bibliothèque pour le text mining. Un outil Facebook pour l''apprentissage efficace de représentations de mots.',
        'https://fasttext.cc/',
        'fasttext'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Feast',
        'Feature store open-source. Une plateforme pour gérer et servir des features pour le ML en production.',
        'https://feast.dev/',
        'feast'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Figma AI',
        'figma-ai-design',
        'Ensemble d''outils IA intégrés à Figma pour améliorer le processus de design, incluant la génération de variantes et l''aide à la mise en page.',
        'https://www.figma.com/ai',
        design_id,
        '[{"plan_name": "Included", "price": 0}]'::jsonb,
        true,
        false
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'FinRL',
    'finrl',
    'Bibliothèque open source pour le trading par apprentissage par renforcement.',
    'https://github.com/AI4Finance-Foundation/FinRL',
    (SELECT id FROM categories WHERE slug = 'finance')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Fireflies AI',
    'fireflies-ai',
    'Enregistre, transcrit et analyse automatiquement vos réunions.',
    'https://fireflies.ai/',
    (SELECT id FROM categories WHERE slug = 'productivity')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'FitAI',
    'fitai',
    'Coach sportif personnel IA',
    'https://fitai.com',
    (SELECT id FROM categories WHERE slug = 'sport-fitness')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Flax',
        'Bibliothèque de deep learning basée sur JAX. Un framework flexible pour la recherche en apprentissage profond.',
        'https://github.com/google/flax',
        'flax'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'FlowiseAI',
        'Interface drag & drop pour construire des flux LangChain. Un outil open-source qui permet de construire des chaînes LangChain personnalisées avec une interface visuelle intuitive.',
        'https://flowiseai.com/',
        'flowiseai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'FoodGenius',
    'foodgenius',
    'IA pour l''optimisation alimentaire',
    'https://foodgenius.ai',
    (SELECT id FROM categories WHERE slug = 'agroalimentaire')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Frase',
    'frase',
    'Optimisation SEO et création de contenu',
    'https://frase.io',
    (SELECT id FROM categories WHERE slug = 'business-marketing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Functionary',
        'LLM entraîné pour l''appel de fonctions. Un modèle de langage spécialement entraîné pour comprendre et exécuter des appels de fonctions de manière fiable et précise.',
        'https://github.com/MeetKai/functionary',
        'functionary'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'GET3D',
    'get3d',
    'Générateur de modèles 3D texturés à partir d''images.',
    'https://nv-tlabs.github.io/GET3D/',
    (SELECT id FROM categories WHERE slug = '3d')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'GPT Engineer',
        'Agent qui spécifie, écrit et améliore le code. Un outil qui permet de générer des applications complètes à partir de descriptions en langage naturel, en utilisant GPT pour la génération de code.',
        'https://github.com/AntonOsika/gpt-engineer',
        'gpt-engineer'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'GPT Pilot',
        'Développeur IA qui écrit des applications évolutives. Un copilote de développement qui peut écrire des applications complètes et évolutives, en interagissant avec l''utilisateur pour comprendre les exigences et générer le code.',
        'https://github.com/Pythagora-io/gpt-pilot',
        'gpt-pilot'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'GPT Researcher',
        'Agent autonome pour la recherche approfondie. Un agent IA capable de mener des recherches approfondies sur n''importe quel sujet et de générer des rapports détaillés avec des citations.',
        'https://github.com/assafelovic/gpt-researcher',
        'gpt-researcher'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'GPT Teacher',
        'Assistant d''enseignement personnalisé alimenté par l''IA. Un agent IA conçu pour fournir un enseignement personnalisé, créer des plans de cours et générer du matériel pédagogique adapté aux besoins de l''apprenant.',
        'https://github.com/CognitiveCanvas/GPTTeacher',
        'gpt-teacher'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'GPT-4',
        'Modèle de langage avancé d''OpenAI. Le modèle le plus puissant d''OpenAI, capable de comprendre images et texte, avec des capacités de raisonnement améliorées.',
        'https://openai.com/gpt-4',
        'gpt-4'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'GPTStore',
        'Marketplace pour les agents GPT personnalisés. Une plateforme permettant de découvrir, partager et monétiser des agents GPT personnalisés pour diverses applications.',
        'https://gptstore.ai/',
        'gptstore'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'GPTs',
        'Versions personnalisées de ChatGPT par OpenAI. Des versions sur mesure de ChatGPT qui peuvent être créées sans code pour des cas d''utilisation spécifiques, avec des capacités et des connaissances personnalisées.',
        'https://openai.com/gpts',
        'gpts'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Gamma',
    'gamma',
    'Créez de belles présentations en quelques minutes avec l''IA.',
    'https://gamma.app/',
    (SELECT id FROM categories WHERE slug = 'presentation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Gemini',
        'Modèle d''IA multimodal de Google. Le modèle d''IA le plus avancé de Google, capable de comprendre et de générer texte, code, audio et images.',
        'https://deepmind.google/technologies/gemini/',
        'gemini'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Genius AI',
        'Plateforme no-code pour créer des agents IA. Une plateforme qui permet de créer des agents IA personnalisés sans code, avec des capacités de traitement du langage naturel et d''automatisation.',
        'https://www.genius.design/',
        'genius-ai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Gensim',
        'Bibliothèque de modélisation thématique. Un outil pour l''analyse sémantique non supervisée de textes.',
        'https://radimrehurek.com/gensim/',
        'gensim'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'GitHub Copilot',
        'Assistant de programmation IA. Un outil de complétion de code qui suggère des lignes ou des fonctions entières basées sur le contexte.',
        'https://github.com/features/copilot',
        'github-copilot'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Gopher',
    'gopher',
    'Gopher par DeepMind est un modèle de langage de 280 milliards de paramètres.',
    'https://www.deepmind.com/blog/language-modelling-at-scale-gopher-ethical-considerations-and-retrieval',
    (SELECT id FROM categories WHERE slug = 'text')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Gradescope',
            'gradescope',
            'Évaluation automatisée des travaux avec IA.',
            'https://www.gradescope.com/',
            education_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Institution", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Gradio',
        'Création d''interfaces pour modèles ML. Un outil pour créer rapidement des démos web pour les modèles d''apprentissage automatique.',
        'https://gradio.app/',
        'gradio'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Grammarly',
    'grammarly',
    'Assistant d''écriture alimenté par l''IA qui aide à améliorer la grammaire, le style et le ton.',
    'https://www.grammarly.com/',
    (SELECT id FROM categories WHERE slug = 'productivity')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Great Expectations',
        'Framework de validation de données. Un outil pour tester et valider les données dans les pipelines ML.',
        'https://greatexpectations.io/',
        'great-expectations'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'GridAI',
    'gridai',
    'Optimisation des réseaux électriques par IA',
    'https://gridai.energy',
    (SELECT id FROM categories WHERE slug = 'energie')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Grok',
    'grok',
    'Un LLM par xAI avec code source et poids ouverts.',
    'https://grok.x.ai/',
    (SELECT id FROM categories WHERE slug = 'text')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Guardrails',
        'Toolkit pour contrôler les sorties LLM. Un ensemble d''outils pour ajouter des garde-fous aux sorties des modèles de langage, assurant la qualité, la sécurité et le format des réponses.',
        'https://github.com/ShreyaR/guardrails',
        'guardrails'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Guidance',
        'Langage pour contrôler les LLMs. Un langage de programmation conçu pour contrôler précisément les modèles de langage, permettant des interactions structurées et des sorties formatées.',
        'https://github.com/microsoft/guidance',
        'guidance'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'H2O',
        'Plateforme d''apprentissage automatique. Une plateforme open-source pour l''apprentissage automatique évolutif.',
        'https://h2o.ai/',
        'h2o'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'H2O.ai',
    'h2o-ai',
    'Plateforme d''IA automatisée pour l''analyse de données.',
    'https://h2o.ai/',
    (SELECT id FROM categories WHERE slug = 'data-analysis')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Harvey AI',
    'harvey-ai',
    'Assistant juridique alimenté par l''IA',
    'https://harvey.ai',
    (SELECT id FROM categories WHERE slug = 'juridique')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Haystack',
        'Framework pour créer des applications NLP. Un framework open-source pour construire des applications de traitement du langage naturel, avec des composants pour la recherche sémantique et les questions-réponses.',
        'https://haystack.deepset.ai/',
        'haystack'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Helicone',
        'Plateforme d''observabilité pour LLMs. Une plateforme qui fournit des analyses détaillées et un suivi des performances pour les applications basées sur les modèles de langage.',
        'https://www.helicone.ai/',
        'helicone'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Heritage AI',
    'heritage-ai',
    'Plateforme d''IA pour la préservation et l''analyse du patrimoine culturel.',
    'https://heritage-ai.org/',
    (SELECT id FROM categories WHERE slug = 'archaeology')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'HiredScore',
    'hiredscore',
    'Plateforme de recrutement IA',
    'https://hiredscore.com',
    (SELECT id FROM categories WHERE slug = 'rh-recrutement')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Horovod',
        'Framework d''apprentissage distribué. Un outil pour l''entraînement distribué de modèles deep learning.',
        'https://horovod.ai/',
        'horovod'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Hour One',
    'hour-one',
    'Créez des vidéos avec des présentateurs virtuels à partir de texte.',
    'https://hourone.ai/',
    (SELECT id FROM categories WHERE slug = 'video')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'HttpsGPT',
        'Utilisation sécurisée de l''API GPT via HTTPS. Un outil qui permet d''utiliser l''API GPT de manière sécurisée via HTTPS, avec des fonctionnalités de chiffrement et d''authentification.',
        'https://httpsgpt.com/',
        'httpsgpt'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'HubSpot Marketing Hub',
        'hubspot-marketing',
        'Suite marketing tout-en-un avec fonctionnalités d''IA avancées.',
        'https://www.hubspot.com/products/marketing',
        (SELECT id FROM categories WHERE slug = 'business-&-marketing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Hugging Face',
        'Plateforme pour partager des modèles et des datasets. La plus grande plateforme pour partager des modèles d''IA, des datasets et des applications, avec une communauté active de chercheurs et de développeurs.',
        'https://huggingface.co/',
        'hugging-face'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Hugging Face Hub',
        'Plateforme de modèles ML. Un dépôt central pour partager des modèles, des datasets et des démos.',
        'https://huggingface.co/',
        'huggingface-hub'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Hyperopt',
        'Bibliothèque d''optimisation d''hyperparamètres. Un outil pour l''optimisation des paramètres des modèles d''apprentissage automatique.',
        'http://hyperopt.github.io/hyperopt/',
        'hyperopt'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Hypotenuse AI',
    'hypotenuse-ai',
    'Générateur de contenu qui transforme des mots-clés en articles complets.',
    'https://www.hypotenuse.ai/',
    (SELECT id FROM categories WHERE slug = 'writing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'IX',
        'Framework pour créer des agents IA. Un framework moderne pour créer des agents IA autonomes capables d''interagir avec des API et d''accomplir des tâches complexes.',
        'https://github.com/kreneskyp/ix',
        'ix'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'IceSL',
            'icesl',
            'Modeleur et slicer avec optimisation par IA.',
            'https://icesl.loria.fr/',
            impression3d_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'InVideo',
    'invideo',
    'Plateforme de création vidéo en ligne avec assistance IA.',
    'https://invideo.io/',
    (SELECT id FROM categories WHERE slug = 'video')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Inferkit',
    'inferkit',
    'Générateur de texte qui continue automatiquement votre écriture de manière cohérente.',
    'https://inferkit.com/',
    (SELECT id FROM categories WHERE slug = 'writing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Informatica',
            'informatica',
            'Solutions d''intégration et qualité des données.',
            'https://www.informatica.com/',
            data_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Inworld AI',
    'inworld-ai',
    'Créez des personnages IA pour les jeux et les mondes virtuels.',
    'https://www.inworld.ai/',
    (SELECT id FROM categories WHERE slug = 'gaming')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Iris AI',
    'iris-ai',
    'Assistant de recherche scientifique qui aide à explorer la littérature académique.',
    'https://iris.ai/',
    (SELECT id FROM categories WHERE slug = 'research')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'JAX',
        'Bibliothèque de calcul numérique. Un outil pour la différentiation automatique et les calculs XLA.',
        'https://github.com/google/jax',
        'jax'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'JamesGPT',
        'Assistant personnel alimenté par GPT. Un assistant IA personnel qui peut gérer des tâches quotidiennes, répondre à des questions et fournir des informations personnalisées.',
        'https://jamesgpt.com/',
        'jamesgpt'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Jasper',
        'Plateforme d''écriture assistée par IA. Un outil qui aide à créer du contenu marketing, des articles et des copies publicitaires avec l''aide de l''IA.',
        'https://www.jasper.ai/',
        'jasper'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Jina',
        'Framework de recherche neurale cloud-native. Une plateforme pour construire des systèmes de recherche multimodale.',
        'https://jina.ai/',
        'jina'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Joblib',
        'Bibliothèque de pipeline computing. Un ensemble d''outils pour sauvegarder et paralléliser des tâches Python.',
        'https://joblib.readthedocs.io/',
        'joblib'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Jupyter',
        'Environnement de développement interactif. Un outil essentiel pour le développement en science des données et l''apprentissage automatique.',
        'https://jupyter.org/',
        'jupyter'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Kaedim',
    'kaedim',
    'Transformez des images 2D en modèles 3D en quelques minutes.',
    'https://www.kaedim3d.com/',
    (SELECT id FROM categories WHERE slug = '3d')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Kapwing',
    'kapwing',
    'Éditeur vidéo en ligne avec des fonctionnalités d''IA pour le montage.',
    'https://www.kapwing.com/',
    (SELECT id FROM categories WHERE slug = 'video')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Kavout',
    'kavout',
    'Plateforme d''intelligence artificielle pour l''investissement.',
    'https://www.kavout.com/',
    (SELECT id FROM categories WHERE slug = 'finance')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Kedro',
        'Framework de développement ML. Un outil pour créer des pipelines de data science reproductibles.',
        'https://kedro.readthedocs.io/',
        'kedro'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Keras',
        'API de deep learning de haut niveau. Une interface conviviale pour construire et entraîner des modèles de deep learning.',
        'https://keras.io/',
        'keras'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Khoj',
        'Assistant IA pour rechercher dans vos notes. Un assistant IA open-source qui aide à rechercher et à naviguer dans vos notes personnelles, avec une compréhension contextuelle.',
        'https://khoj.dev/',
        'khoj'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Kinetix',
    'kinetix',
    'Plateforme de création d''animations 3D avec l''IA.',
    'https://www.kinetix.tech/',
    (SELECT id FROM categories WHERE slug = '3d-animation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Kite',
            'kite',
            'Assistant de programmation avec complétion de ligne.',
            'https://www.kite.com/',
            dev_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 16.6}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Knewton',
            'knewton',
            'Plateforme d''apprentissage adaptatif pour l''enseignement supérieur.',
            'https://www.knewton.com/',
            education_category_id,
            '[{"plan_name": "Base", "price": 0}, {"plan_name": "Premium", "price": 79}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Knime',
    'knime',
    'Plateforme open source d''analyse de données et d''apprentissage automatique.',
    'https://www.knime.com/',
    (SELECT id FROM categories WHERE slug = 'data')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Komo',
    'komo',
    'Un moteur de recherche alimenté par l''IA.',
    'https://komo.ai/',
    (SELECT id FROM categories WHERE slug = 'search')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Kornia',
        'Bibliothèque de vision par ordinateur différentiable. Un ensemble d''opérations de vision par ordinateur différentiables pour PyTorch.',
        'https://kornia.github.io/',
        'kornia'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'LALAL.AI',
    'lalal-ai',
    'Sépare la voix et les instruments dans n''importe quelle chanson avec une qualité exceptionnelle.',
    'https://www.lalal.ai/',
    (SELECT id FROM categories WHERE slug = 'audio')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'LIME',
        'Outil d''explication de modèles ML. Une technique pour expliquer les prédictions de n''importe quel classifieur ML.',
        'https://github.com/marcotcr/lime',
        'lime'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'LLaMA',
    'llama',
    'Llama LLM, un modèle de langage fondamental de 65 milliards de paramètres par Meta.',
    'https://ai.facebook.com/blog/large-language-model-llama-meta-ai/',
    (SELECT id FROM categories WHERE slug = 'milestone')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Label Studio',
        'Plateforme d''annotation de données. Un outil open-source pour l''étiquetage de données multimodales.',
        'https://labelstud.io/',
        'label-studio'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'LangChain',
        'Framework pour développer des applications avec LLMs. Un framework populaire pour développer des applications utilisant des modèles de langage, avec des composants pour le chaînage d''actions et la gestion de contexte.',
        'https://langchain.com/',
        'langchain'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'LangSmith',
        'Plateforme de développement LLM. Un outil pour développer, tester et déployer des applications basées sur des modèles de langage.',
        'https://www.langsmith.com/',
        'langsmith'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Language Tools',
        'Collection d''outils pour le traitement du langage. Une suite d''outils pour le traitement du langage naturel, incluant des correcteurs grammaticaux et des assistants d''écriture.',
        'https://languagetools.io/',
        'language-tools'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Latitude',
    'latitude',
    'Plateforme de création de jeux basée sur l''IA.',
    'https://latitude.io/',
    (SELECT id FROM categories WHERE slug = 'gaming')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Le Chat',
    'le-chat',
    'Discutez avec les modèles de langage de pointe de Mistral AI.',
    'https://chat.mistral.ai/',
    (SELECT id FROM categories WHERE slug = 'text')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Leonardo.ai',
        'Plateforme de génération d''images par IA. Un outil puissant pour créer des images artistiques et professionnelles avec l''IA.',
        'https://leonardo.ai/',
        'leonardo-ai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'LibreChat',
    'librechat',
    'LibreChat est une interface de chat gratuite et open source pour les assistants IA.',
    'https://librechat.ai/',
    (SELECT id FROM categories WHERE slug = 'custom-interface')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'LightGBM',
        'Framework de boosting gradient. Un algorithme de boosting gradient rapide et efficace par Microsoft.',
        'https://lightgbm.readthedocs.io/',
        'lightgbm'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'LlamaHub',
        'Collection de connecteurs de données pour LLMs. Une bibliothèque open-source de connecteurs de données pour intégrer diverses sources de données avec des modèles de langage.',
        'https://llamahub.ai/',
        'llamahub'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'LlamaIndex',
        'Framework pour connecter des données personnalisées aux LLMs. Un framework qui permet d''indexer et de requêter des données personnalisées avec des modèles de langage de manière efficace.',
        'https://www.llamaindex.ai/',
        'llamaindex'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'LocalAI',
        'Alternative open-source à OpenAI. Un drop-in replacement local pour l''API OpenAI, permettant d''exécuter des modèles d''IA en local avec une API compatible.',
        'https://localai.io/',
        'localai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Ludwig',
        'Boîte à outils de deep learning sans code. Une bibliothèque qui permet de construire des modèles de deep learning sans écrire de code.',
        'https://ludwig.ai/',
        'ludwig'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Lumen5',
    'lumen5',
    'Plateforme de création vidéo basée sur l''IA qui transforme du texte en vidéos engageantes.',
    'https://lumen5.com/',
    (SELECT id FROM categories WHERE slug = 'video')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'ML-Agents Toolkit',
            'ml-agents-toolkit',
            'Kit de développement pour l''IA dans les jeux Unity.',
            'https://github.com/Unity-Technologies/ml-agents',
            games_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'MLRun',
        'Framework MLOps open-source. Une plateforme pour orchestrer et suivre des projets ML de bout en bout.',
        'https://www.mlrun.org/',
        'mlrun'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'MLflow',
        'Plateforme de gestion du cycle de vie ML. Un outil open-source pour gérer le cycle de vie complet des projets d''apprentissage automatique.',
        'https://mlflow.org/',
        'mlflow'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'MMDetection',
        'Boîte à outils de détection d''objets. Une collection d''algorithmes et d''outils pour la détection d''objets.',
        'https://github.com/open-mmlab/mmdetection',
        'mmdetection'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'MRKL',
        'Système modulaire pour combiner LLMs et outils externes. Une architecture qui combine des modèles de langage avec des outils spécialisés pour résoudre des problèmes complexes.',
        'https://github.com/microsoft/MRKL',
        'mrkl'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'MXNet',
        'Framework de deep learning flexible. Un framework deep learning efficace supporté par Amazon.',
        'https://mxnet.apache.org/',
        'mxnet'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Mabl',
    'mabl',
    'Tests d''interface utilisateur intelligents.',
    'https://www.mabl.com/',
    (SELECT id FROM categories WHERE slug = 'testing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Market Cipher',
    'market-cipher',
    'Indicateur de trading avancé utilisant l''IA.',
    'https://marketciphertrading.com/',
    (SELECT id FROM categories WHERE slug = 'finance')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Marketmuse',
    'marketmuse',
    'Plateforme de marketing de contenu alimentée par l''IA.',
    'https://www.marketmuse.com/',
    (SELECT id FROM categories WHERE slug = 'marketing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Markopolo',
    'markopolo',
    'Création de campagnes publicitaires par IA',
    'https://markopolo.ai',
    (SELECT id FROM categories WHERE slug = 'business-marketing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Marvin',
        'Framework pour construire des agents IA. Un framework lightweight pour construire des agents IA qui peuvent comprendre et exécuter des tâches complexes.',
        'https://www.askmarvin.ai/',
        'marvin'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Masterpiece Studio',
    'masterpiece-studio',
    'Suite de création 3D en VR avec assistance IA.',
    'https://masterpiecestudio.com/',
    (SELECT id FROM categories WHERE slug = '3d-animation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Materials Project',
        'materials-project',
        'Base de données et outils d''IA pour la science des matériaux.',
        'https://materialsproject.org/',
        (SELECT id FROM categories WHERE slug = 'chimie-&-matériaux')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'MatterControl',
            'mattercontrol',
            'Suite logicielle d''impression 3D avec fonctionnalités IA.',
            'https://www.matterhackers.com/store/l/mattercontrol/sk/MKZGTDW6',
            impression3d_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Mem AI',
    'mem-ai',
    'Plateforme de prise de notes avec IA qui organise automatiquement vos informations.',
    'https://mem.ai/',
    (SELECT id FROM categories WHERE slug = 'productivity')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Mem.ai',
    'mem-ai',
    'Prise de notes augmentée par l''IA',
    'https://mem.ai',
    (SELECT id FROM categories WHERE slug = 'productivite')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'MemGPT',
        'Extension de mémoire pour les LLMs. Un système qui permet aux modèles de langage de maintenir des conversations longues avec une gestion efficace de la mémoire.',
        'https://github.com/cpacker/MemGPT',
        'memgpt'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Mendeley',
    'mendeley',
    'Gestionnaire de références et réseau social académique avec fonctionnalités d''IA.',
    'https://www.mendeley.com/',
    (SELECT id FROM categories WHERE slug = 'research')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Meshcapade',
    'meshcapade',
    'Création de modèles 3D de corps humains réalistes avec l''IA.',
    'https://meshcapade.com/',
    (SELECT id FROM categories WHERE slug = '3d-animation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Meshy',
    'meshy',
    'Créez des modèles 3D à partir de texte ou d''images.',
    'https://www.meshy.ai/',
    (SELECT id FROM categories WHERE slug = '3d')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Meta AI',
    'meta-ai',
    'Assistant IA de Meta pour accomplir des tâches, créer des images générées par IA, obtenir des réponses. Construit sur le LLM Llama.',
    'https://www.meta.ai/',
    (SELECT id FROM categories WHERE slug = 'text')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Metaphor',
    'metaphor',
    'Moteur de recherche alimenté par des modèles de langage.',
    'https://metaphor.systems/',
    (SELECT id FROM categories WHERE slug = 'search')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES ('Midjourney', 'Outil de génération d''images IA créant des visuels artistiques de haute qualité à partir de descriptions textuelles.', 'https://www.midjourney.com/', 'Génération d''Images', '[{"plan_name": "Basic", "price": 10}, {"plan_name": "Standard", "price": 30}]')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Milvus',
        'Base de données vectorielle open-source. Une solution pour gérer et rechercher des vecteurs à grande échelle.',
        'https://milvus.io/',
        'milvus'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'MindsDB',
    'mindsdb',
    'Prédictions IA dans votre base de données',
    'https://mindsdb.com',
    (SELECT id FROM categories WHERE slug = 'analyse-donnees')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'MiniGPT-4',
        'Version légère de GPT-4 avec capacités visuelles. Une implémentation plus légère et accessible de GPT-4 avec des capacités de traitement d''images.',
        'https://minigpt-4.github.io/',
        'minigpt4'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Mistral',
    'mistral',
    'Modèles LLM de pointe à poids ouverts par Mistral AI.',
    'https://mistral.ai/en/models',
    (SELECT id FROM categories WHERE slug = 'text')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Mistral AI',
        'Entreprise de développement de LLMs. Une société française développant des modèles de langage open-source performants.',
        'https://mistral.ai/',
        'mistral-ai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Modl.ai',
            'modl-ai',
            'Plateforme d''automatisation des tests de jeux par IA.',
            'https://modl.ai/',
            games_category_id,
            '[{"plan_name": "Contact", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'MonkeyLearn',
    'monkeylearn',
    'Plateforme d''analyse de texte et de données par IA.',
    'https://monkeylearn.com/',
    (SELECT id FROM categories WHERE slug = 'data')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'MosaicML',
        'Plateforme d''entraînement de modèles d''IA. Une solution pour entraîner des modèles d''IA à grande échelle de manière efficace.',
        'https://www.mosaicml.com/',
        'mosaicml'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Motion',
    'motion',
    'Planification automatique et intelligente des tâches.',
    'https://www.usemotion.com/',
    (SELECT id FROM categories WHERE slug = 'project')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Move AI',
    'move-ai',
    'Capture de mouvement et animation 3D basée sur l''IA.',
    'https://www.move.ai/',
    (SELECT id FROM categories WHERE slug = '3d-animation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES ('Mubert', 'mubert', 'Génération de musique par IA', 'https://mubert.com', music_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 15}]'::jsonb, true, true)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'MultiAgent',
        'Framework pour créer des systèmes multi-agents. Un framework permettant de créer et de gérer des systèmes avec plusieurs agents IA collaborant ensemble.',
        'https://github.com/OpenBMB/MultiAgent',
        'multiagent'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Murf',
    'murf',
    'Studio de voix-off IA',
    'https://murf.ai',
    (SELECT id FROM categories WHERE slug = 'voix-parole')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'NLTK',
        'Boîte à outils de traitement du langage naturel. Une bibliothèque complète pour le traitement du langage naturel en Python.',
        'https://www.nltk.org/',
        'nltk'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'NVIDIA AI',
        'Suite d''outils d''IA par NVIDIA. Une collection complète d''outils et de frameworks pour le développement et le déploiement d''applications d''IA.',
        'https://www.nvidia.com/en-us/ai-data-science/',
        'nvidia-ai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'NVIDIA Canvas',
    'nvidia-canvas',
    'Transformez de simples traits en paysages photoréalistes avec l''IA.',
    'https://www.nvidia.com/en-us/studio/canvas/',
    (SELECT id FROM categories WHERE slug = 'image')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'NVIDIA GameWorks AI',
            'nvidia-gameworks-ai',
            'Suite d''outils IA pour le développement de jeux.',
            'https://developer.nvidia.com/gameworks',
            games_category_id,
            '[{"plan_name": "License", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Neptune',
        'Plateforme de suivi d''expériences ML. Un outil pour suivre, stocker et analyser les expériences d''apprentissage automatique.',
        'https://neptune.ai/',
        'neptune'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Neptune.ai',
            'neptune-ai',
            'Plateforme de métadonnées pour les équipes MLOps.',
            'https://neptune.ai/',
            collab_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Team", "price": 49}]'::jsonb,
            true,
            true
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'NetworkX',
        'Bibliothèque d''analyse de réseaux. Un outil pour créer et étudier des réseaux et des graphes complexes.',
        'https://networkx.org/',
        'networkx'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'NotebookLM',
        'Assistant IA pour la prise de notes intelligente. Un outil d''IA qui aide à organiser, analyser et extraire des informations de vos notes et documents.',
        'https://notebooklm.google/',
        'notebooklm'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Notion AI',
        'notion-ai-assistant',
        'Assistant d''écriture et d''organisation intégré à Notion, aidant à la rédaction, au résumé et à l''analyse de contenu.',
        'https://www.notion.so/product/ai',
        productivite_id,
        '[{"plan_name": "With Notion", "price": 10}]'::jsonb,
        true,
        false
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'NumPy',
        'Bibliothèque fondamentale pour le calcul scientifique. La base de l''écosystème scientifique Python pour les calculs numériques.',
        'https://numpy.org/',
        'numpy'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Numba',
        'Compilateur JIT pour Python numérique. Un outil pour accélérer le code Python en le compilant en code machine.',
        'https://numba.pydata.org/',
        'numba'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Numerous.ai',
    'numerous-ai',
    'Automatisation des feuilles de calcul et analyse de données avec l''IA.',
    'https://numerous.ai/',
    (SELECT id FROM categories WHERE slug = 'automation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'ONNX',
        'Format ouvert pour les modèles ML. Un standard pour représenter les modèles d''apprentissage automatique.',
        'https://onnx.ai/',
        'onnx'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'OSS Insight',
        'Plateforme d''analyse pour projets open-source. Un outil qui fournit des analyses détaillées et des insights sur les projets open-source et leurs communautés.',
        'https://ossinsight.io/',
        'oss-insight'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Obviously AI',
    'obviously-ai',
    'Analyse prédictive sans code',
    'https://obviously.ai',
    (SELECT id FROM categories WHERE slug = 'analyse-donnees')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Ocean Protocol',
        'ocean-protocol',
        'Protocole décentralisé pour le partage de données et l''IA.',
        'https://oceanprotocol.com/',
        (SELECT id FROM categories WHERE slug = 'blockchain-&-web3')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'OctoAI',
        'Plateforme d''inférence pour modèles d''IA. Une plateforme cloud qui permet de déployer et d''exécuter des modèles d''IA avec une mise à l''échelle automatique.',
        'https://octoai.cloud/',
        'octoai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'OctoPrint',
            'octoprint',
            'Interface web pour impression 3D avec monitoring intelligent.',
            'https://octoprint.org/',
            impression3d_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            true
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Ollama',
        'Exécution locale de LLMs sur votre machine. Un outil qui permet d''exécuter des modèles de langage localement sur votre ordinateur, avec une configuration simple.',
        'https://ollama.ai/',
        'ollama'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Open Interpreter',
        'Assistant qui peut exécuter du code sur votre ordinateur. Un interpréteur de langage naturel qui permet aux modèles de langage d''exécuter du code sur votre machine locale.',
        'https://github.com/KillianLucas/open-interpreter',
        'open-interpreter'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'OpenAI',
        'Entreprise leader en recherche IA. Développeur de GPT, DALL-E et d''autres technologies d''IA avancées.',
        'https://openai.com/',
        'openai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'OpenAI API',
    'openai-api',
    'Annonce de l''API OpenAI pour les modèles d''IA texte-à-texte à usage général basés sur GPT-3.',
    'https://openai.com/blog/openai-api/',
    (SELECT id FROM categories WHERE slug = 'milestone')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'OpenAI Gym',
            'openai-gym',
            'Toolkit pour développer et comparer des algorithmes IA.',
            'https://gym.openai.com/',
            games_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            true
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'OpenAgents',
        'Collection open-source d''agents IA. Une collection d''agents IA open-source pour différentes tâches, avec des capacités de traitement du langage naturel.',
        'https://github.com/OpenAgentsInc/openagents',
        'openagents'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'OpenAssistant',
        'Assistant conversationnel open-source. Un projet communautaire pour créer un assistant IA conversationnel open-source, transparent et accessible à tous.',
        'https://open-assistant.io/',
        'openassistant'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'OpenCopilot',
        'Framework open-source pour créer des copilotes IA. Une solution pour construire des assistants IA personnalisés qui peuvent être intégrés dans n''importe quelle application SaaS.',
        'https://github.com/openchatai/OpenCopilot',
        'opencopilot'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'OpenFlamingo',
        'Framework open-source pour l''IA multimodale. Une implémentation open-source d''un modèle de langage multimodal capable de comprendre à la fois le texte et les images.',
        'https://github.com/mlfoundations/open_flamingo',
        'openflamingo'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'OpenRefine',
            'openrefine',
            'Outil open-source de nettoyage de données.',
            'https://openrefine.org/',
            data_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Optuna',
        'Framework d''optimisation hyperparamétrique. Un outil pour l''optimisation automatique des hyperparamètres des modèles ML.',
        'https://optuna.org/',
        'optuna'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Opus Clip',
    'opus-clip',
    'Outil qui crée automatiquement des clips viraux à partir de longues vidéos.',
    'https://opus.pro/',
    (SELECT id FROM categories WHERE slug = 'video')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Orange',
        'orange-data-mining',
        'Logiciel open-source d''analyse de données et d''apprentissage automatique avec interface visuelle.',
        'https://orangedatamining.com/',
        (SELECT id FROM categories WHERE slug = 'analyse-de-données')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Otter AI',
    'otter-ai',
    'Assistant de réunion alimenté par l''IA qui enregistre l''audio, écrit des notes et capture les actions.',
    'https://otter.ai/',
    (SELECT id FROM categories WHERE slug = 'productivity')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'PDF.ai',
    'pdf-ai',
    'Chatbot qui peut lire et répondre aux questions sur n''importe quel document PDF.',
    'https://pdf.ai/',
    (SELECT id FROM categories WHERE slug = 'productivity')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'PaddlePaddle',
        'Plateforme deep learning de Baidu. Un framework complet pour le développement et le déploiement de modèles deep learning.',
        'https://www.paddlepaddle.org.cn/',
        'paddlepaddle'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Pandas',
        'Bibliothèque d''analyse de données Python. Un outil essentiel pour la manipulation et l''analyse de données en science des données.',
        'https://pandas.pydata.org/',
        'pandas'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Paperpal',
    'paperpal',
    'Assistant d''écriture académique alimenté par l''IA.',
    'https://paperpal.com/',
    (SELECT id FROM categories WHERE slug = 'research')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Peppertype',
    'peppertype',
    'Générateur de contenu marketing qui crée des textes originaux et engageants.',
    'https://www.peppertype.ai/',
    (SELECT id FROM categories WHERE slug = 'writing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Perplexity AI',
    'perplexity-ai',
    'Moteur de recherche augmenté par l''IA',
    'https://perplexity.ai',
    (SELECT id FROM categories WHERE slug = 'recherche')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Petals',
        'Exécution distribuée de LLMs via BitTorrent. Une plateforme qui permet d''exécuter de grands modèles de langage de manière distribuée en utilisant le protocole BitTorrent.',
        'https://github.com/bigscience-workshop/petals',
        'petals'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Petastorm',
        'Bibliothèque de données pour deep learning. Un outil pour lire des données depuis des systèmes de stockage dans des frameworks ML.',
        'https://github.com/uber/petastorm',
        'petastorm'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Phind',
        'Moteur de recherche IA pour développeurs. Un moteur de recherche spécialisé qui utilise l''IA pour aider les développeurs à trouver des réponses à leurs questions techniques.',
        'https://www.phind.com/',
        'phind'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Pi',
    'pi',
    'Une plateforme IA personnalisée disponible comme assistant numérique.',
    'https://pi.ai',
    (SELECT id FROM categories WHERE slug = 'text')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Pictory',
    'pictory',
    'Créez automatiquement des vidéos courtes à partir de longs contenus.',
    'https://pictory.ai/',
    (SELECT id FROM categories WHERE slug = 'video')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Pillow',
        'Bibliothèque de traitement d''images Python. Fork maintenu de PIL pour le traitement d''images en Python.',
        'https://python-pillow.org/',
        'pillow'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Plask',
    'plask',
    'Animation 3D automatisée à partir de vidéos avec l''IA.',
    'https://plask.ai/',
    (SELECT id FROM categories WHERE slug = '3d-animation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Playground AI',
    'playground-ai',
    'Plateforme de génération d''images avec interface intuitive',
    'https://playground.ai',
    (SELECT id FROM categories WHERE slug = 'generation-images')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Plotly',
        'Bibliothèque de visualisation interactive. Des outils de visualisation interactifs pour l''analyse de données et le ML.',
        'https://plotly.com/',
        'plotly'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Point-E',
    'point-e',
    'Système de génération de nuages de points 3D par OpenAI.',
    'https://github.com/openai/point-e',
    (SELECT id FROM categories WHERE slug = '3d')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Polyaxon',
        'Plateforme MLOps open-source. Une plateforme pour gérer le cycle de vie complet des projets ML.',
        'https://polyaxon.com/',
        'polyaxon'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Polycam',
    'polycam',
    'Application de scan 3D et de photogrammétrie assistée par IA.',
    'https://poly.cam/',
    (SELECT id FROM categories WHERE slug = '3d-animation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Portkey',
        'SDK pour intégrer l''IA dans les applications. Un SDK qui simplifie l''intégration de fonctionnalités d''IA dans les applications, avec gestion des modèles et des prompts.',
        'https://portkey.ai/',
        'portkey'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Pottery Analyzer',
    'pottery-analyzer',
    'Outil d''analyse de poteries anciennes utilisant l''apprentissage profond.',
    'https://potteryanalyzer.org/',
    (SELECT id FROM categories WHERE slug = 'archaeology')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Power BI',
    'power-bi',
    'Solution de Business Intelligence avec fonctionnalités d''IA de Microsoft.',
    'https://powerbi.microsoft.com/',
    (SELECT id FROM categories WHERE slug = 'data-analysis')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'PrivateGPT',
        'LLM local pour documents confidentiels. Une solution pour interagir avec des documents privés en utilisant des modèles de langage exécutés localement, sans envoi de données.',
        'https://github.com/imartinez/privateGPT',
        'privategpt'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'PromptFlow',
        'Plateforme pour développer des applications LLM. Un outil pour construire, optimiser et déployer des applications basées sur des LLMs de manière efficace.',
        'https://microsoft.github.io/promptflow/',
        'promptflow'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'PromptLayer',
        'Plateforme de gestion de prompts pour LLMs. Une plateforme pour gérer, versionner et optimiser les prompts utilisés avec les modèles de langage.',
        'https://promptlayer.com/',
        'promptlayer'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'PromptTools',
        'Suite d''outils pour l''ingénierie de prompts. Une collection d''outils open-source pour développer et optimiser des prompts pour les modèles de langage.',
        'https://github.com/hegelai/prompttools',
        'prompttools'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Promptfoo',
        'Outil de test et d''évaluation de prompts. Un outil open-source pour tester, évaluer et comparer différents prompts pour les modèles de langage.',
        'https://github.com/promptfoo/promptfoo',
        'promptfoo'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Prophet',
        'Outil de prévision de séries temporelles. Une bibliothèque Facebook pour les prévisions de séries temporelles.',
        'https://facebook.github.io/prophet/',
        'prophet'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'PrusaSlicer',
            'prusaslicer',
            'Logiciel de préparation d''impression 3D avec assistance IA.',
            'https://www.prusa3d.com/prusaslicer/',
            impression3d_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            true
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'PyTorch',
        'Framework de deep learning. Une bibliothèque open-source populaire pour le développement de modèles d''apprentissage profond.',
        'https://pytorch.org/',
        'pytorch'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'PyTorch3D',
        'Bibliothèque de deep learning 3D. Des outils pour le deep learning sur données 3D avec PyTorch.',
        'https://pytorch3d.org/',
        'pytorch3d'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Pymetrics',
    'pymetrics',
    'Plateforme d''évaluation des talents utilisant l''IA et les neurosciences.',
    'https://www.pymetrics.ai/',
    (SELECT id FROM categories WHERE slug = 'hr')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Pythagora',
        'Plateforme de test pour applications IA. Une plateforme qui permet de tester automatiquement les applications basées sur l''IA pour assurer leur qualité.',
        'https://github.com/Pythagora-io/pythagora',
        'pythagora'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Qlik',
    'qlik',
    'Plateforme d''analyse de données avec IA cognitive.',
    'https://www.qlik.com/',
    (SELECT id FROM categories WHERE slug = 'data-analysis')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Querium',
            'querium',
            'Tutorat STEM personnalisé avec intelligence artificielle.',
            'https://www.querium.com/',
            education_category_id,
            '[{"plan_name": "Étudiant", "price": 29}, {"plan_name": "Institution", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'QuestionAnything',
        'Système de questions-réponses basé sur l''IA. Un outil qui permet de poser des questions et d''obtenir des réponses pertinentes à partir de diverses sources de données.',
        'https://www.questionanything.ai/',
        'questionanything'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Qwen',
    'qwen-model',
    'Une série de LLMs développés indépendamment par Alibaba Cloud.',
    'https://qwenlm.github.io/',
    (SELECT id FROM categories WHERE slug = 'text')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'RAGs',
        'Framework pour la génération augmentée par récupération. Un framework qui combine la récupération d''informations avec la génération de texte pour produire des réponses plus précises.',
        'https://github.com/explodinggradients/rags',
        'rags'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'RAPIDS',
        'Suite d''outils data science GPU. Une suite d''outils pour exécuter l''ensemble du pipeline data science sur GPU.',
        'https://rapids.ai/',
        'rapids'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'RapidMiner',
    'rapidminer',
    'Plateforme unifiée pour la science des données et l''apprentissage automatique.',
    'https://rapidminer.com/',
    (SELECT id FROM categories WHERE slug = 'data')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Ray',
        'Framework pour applications IA distribuées. Un framework open-source pour mettre à l''échelle les applications d''IA et de ML.',
        'https://www.ray.io/',
        'ray'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Ray Tune',
        'Bibliothèque de tuning hyperparamétrique. Un framework scalable pour l''optimisation des hyperparamètres.',
        'https://docs.ray.io/en/latest/tune/index.html',
        'ray-tune'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Repetier',
            'repetier',
            'Suite complète pour impression 3D avec fonctions intelligentes.',
            'https://www.repetier.com/',
            impression3d_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 98}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Replicate',
        'Plateforme pour déployer des modèles d''IA. Une plateforme cloud qui permet de déployer et d''exécuter des modèles d''IA via API, avec versioning et scaling.',
        'https://replicate.com/',
        'replicate'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Replit',
    'replit',
    'IDE en ligne avec des capacités d''IA pour le développement collaboratif.',
    'https://replit.com/',
    (SELECT id FROM categories WHERE slug = 'code')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'ResearchRabbit',
    'research-rabbit',
    'Découverte de papers académiques par IA',
    'https://researchrabbit.ai',
    (SELECT id FROM categories WHERE slug = 'recherche')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Rivet',
        'Éditeur visuel pour créer des agents IA. Un éditeur visuel de type node qui permet de créer et de configurer des agents IA de manière intuitive.',
        'https://github.com/Ironclad/rivet',
        'rivet'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Rune',
        'Framework d''IA pour jeux vidéo. Une plateforme pour intégrer l''IA dans les jeux vidéo.',
        'https://www.rune.ai/',
        'rune'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Runway',
    'runway',
    'Édition vidéo et effets spéciaux par IA',
    'https://runway.ml',
    (SELECT id FROM categories WHERE slug = 'video-animation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'RunwayML',
            'runwayml',
            'Plateforme créative d''IA pour les médias.',
            'https://runwayml.com/',
            media_category_id,
            '[{"plan_name": "Starter", "price": 0}, {"plan_name": "Pro", "price": 35}]'::jsonb,
            true,
            true
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Rytr',
    'rytr',
    'Assistant d''écriture IA pour créer du contenu dans plus de 30 langues.',
    'https://rytr.me/',
    (SELECT id FROM categories WHERE slug = 'writing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'SHAP',
        'Framework d''explicabilité des modèles. Un outil pour expliquer les prédictions des modèles ML.',
        'https://github.com/slundberg/shap',
        'shap'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Sacred',
        'Outil de suivi d''expériences. Une bibliothèque pour configurer, organiser et suivre les expériences ML.',
        'https://sacred.readthedocs.io/',
        'sacred'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Scenario',
    'scenario',
    'Générez des assets pour les jeux avec l''IA.',
    'https://www.scenario.com/',
    (SELECT id FROM categories WHERE slug = 'gaming')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Scholarcy',
    'scholarcy',
    'Outil qui résume et analyse automatiquement les articles de recherche.',
    'https://www.scholarcy.com/',
    (SELECT id FROM categories WHERE slug = 'research')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Scikit-learn',
        'Bibliothèque d''apprentissage automatique. Une bibliothèque Python populaire pour l''apprentissage automatique classique.',
        'https://scikit-learn.org/',
        'scikit-learn'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Scispace',
    'scispace',
    'Plateforme de découverte de recherche alimentée par l''IA.',
    'https://scispace.com/',
    (SELECT id FROM categories WHERE slug = 'research')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Scite',
    'scite',
    'Plateforme qui analyse les citations scientifiques pour évaluer leur fiabilité.',
    'https://scite.ai/',
    (SELECT id FROM categories WHERE slug = 'research')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Seaborn',
        'Bibliothèque de visualisation statistique. Un outil de visualisation de données statistiques basé sur matplotlib.',
        'https://seaborn.pydata.org/',
        'seaborn'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Semantic Kernel',
        'SDK pour intégrer l''IA dans les applications. Un SDK open-source qui permet d''intégrer facilement des modèles de langage et d''autres capacités d''IA dans les applications.',
        'https://github.com/microsoft/semantic-kernel',
        'semantic-kernel'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Semantic Scholar',
    'semantic-scholar',
    'Recherche scientifique augmentée par l''IA',
    'https://semanticscholar.org',
    (SELECT id FROM categories WHERE slug = 'recherche')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'SentenceTransformers',
        'Bibliothèque pour embeddings de texte. Un outil pour créer des représentations vectorielles de phrases et de documents.',
        'https://www.sbert.net/',
        'sentence-transformers'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Sentimentrade',
    'sentimentrade',
    'Analyse du sentiment du marché en utilisant l''IA.',
    'https://sentimentrade.com/',
    (SELECT id FROM categories WHERE slug = 'finance')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'SentinelOne',
            'sentinelone',
            'Plateforme de sécurité autonome.',
            'https://www.sentinelone.com/',
            cyber_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Shell GPT',
        'Assistant en ligne de commande alimenté par GPT. Un outil en ligne de commande qui utilise GPT pour aider avec les commandes shell et l''automatisation.',
        'https://github.com/TheR1D/shell_gpt',
        'shell-gpt'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Shopify Magic',
    'shopify-magic',
    'Suite d''outils IA pour e-commerce',
    'https://shopify.com/magic',
    (SELECT id FROM categories WHERE slug = 'e-commerce')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Sidekick',
        'Assistant de programmation basé sur l''IA. Un assistant qui aide les développeurs en fournissant des suggestions de code et des explications contextuelles.',
        'https://www.sidekick.com/',
        'sidekick'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Siemens MindSphere',
    'siemens-mindsphere',
    'Plateforme IoT industrielle avec IA',
    'https://siemens.mindsphere.io',
    (SELECT id FROM categories WHERE slug = 'industrie')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Simplified',
    'simplified',
    'Suite de création de contenu tout-en-un avec génération de texte IA.',
    'https://simplified.com/',
    (SELECT id FROM categories WHERE slug = 'writing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Simplify3D',
            'simplify3d',
            'Logiciel professionnel d''impression 3D avec analyse IA.',
            'https://www.simplify3d.com/',
            impression3d_category_id,
            '[{"plan_name": "Professional", "price": 149}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Slic3r',
            'slic3r',
            'Slicer open-source avec optimisation intelligente.',
            'https://slic3r.org/',
            impression3d_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Snyk',
            'snyk',
            'Sécurité du code avec IA.',
            'https://snyk.io/',
            dev_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Team", "price": 12}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Sonible',
    'sonible',
    'Plugins audio intelligents utilisant l''IA pour l''amélioration sonore.',
    'https://www.sonible.com/',
    (SELECT id FROM categories WHERE slug = 'audio-musique')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Sora',
    'sora',
    'Présentation de Sora, un grand modèle de génération vidéo.',
    'https://openai.com/research/video-generation-models-as-world-simulators',
    (SELECT id FROM categories WHERE slug = 'milestone')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Sound Theory',
    'sound-theory',
    'Outils de traitement audio avancé avec algorithmes IA.',
    'https://www.soundtheory.com/',
    (SELECT id FROM categories WHERE slug = 'audio-musique')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Soundraw',
    'soundraw',
    'Création de musique royalty-free par IA',
    'https://soundraw.io',
    (SELECT id FROM categories WHERE slug = 'creation-musicale')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Sourcegraph',
            'sourcegraph',
            'Moteur de recherche de code avec IA.',
            'https://sourcegraph.com/',
            dev_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Spellbook',
    'spellbook',
    'Rédaction et analyse de contrats avec l''IA.',
    'https://www.spellbook.legal/',
    (SELECT id FROM categories WHERE slug = 'legal')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Spirit AI',
            'spirit-ai',
            'IA pour les personnages et dialogues de jeux.',
            'https://spiritai.com/',
            games_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Stability AI',
        'Entreprise de développement d''IA générative. Créateur de Stable Diffusion et d''autres modèles d''IA générative open-source.',
        'https://stability.ai/',
        'stability-ai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Stable Diffusion',
        'Modèle de génération d''images open-source. Un puissant modèle de génération d''images qui peut être exécuté localement avec des ressources modestes.',
        'https://stability.ai/',
        'stable-diffusion'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'StealthGPT',
    'stealthgpt',
    'Outil d''écriture qui génère du contenu indétectable par les détecteurs d''IA.',
    'https://www.stealthgpt.ai/',
    (SELECT id FROM categories WHERE slug = 'writing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Steve AI',
    'steve-ai',
    'Créateur de vidéos automatisé qui transforme du texte en vidéos animées.',
    'https://www.steve.ai/',
    (SELECT id FROM categories WHERE slug = 'video')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Streamlit',
        'Framework d''applications ML. Un outil pour créer rapidement des applications web pour les projets de data science.',
        'https://streamlit.io/',
        'streamlit'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'StyleDNA',
    'styledna',
    'Assistant mode personnel par IA',
    'https://styledna.ai',
    (SELECT id FROM categories WHERE slug = 'mode-style')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Sudowrite',
    'sudowrite',
    'Assistant d''écriture créative qui aide à développer des histoires et des personnages.',
    'https://www.sudowrite.com/',
    (SELECT id FROM categories WHERE slug = 'writing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'SuperAgent',
        'Plateforme pour déployer des agents IA. Une plateforme qui simplifie le déploiement et la gestion d''agents IA pour diverses applications.',
        'https://github.com/homanp/superagent',
        'superagent'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'SuperAlign',
        'Framework pour l''alignement des modèles d''IA. Un framework qui aide à aligner les modèles d''IA avec les objectifs et les valeurs humaines.',
        'https://github.com/alignment-research/superalign',
        'superalign'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Surfer SEO',
    'surfer-seo',
    'Outil d''optimisation de contenu basé sur l''IA pour le SEO.',
    'https://surferseo.com/',
    (SELECT id FROM categories WHERE slug = 'marketing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Sweep',
        'Agent IA pour la gestion de code. Un agent qui aide à gérer les bugs, les refactorisations et les améliorations de code via des pull requests.',
        'https://github.com/sweepai/sweep',
        'sweep'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Synthesia',
    'synthesia',
    'Création de vidéos avec présentateurs virtuels',
    'https://synthesia.io',
    (SELECT id FROM categories WHERE slug = 'video-animation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Tabby',
        'Assistant de codage auto-hébergé. Un assistant de codage open-source qui peut être hébergé localement pour plus de confidentialité et de contrôle.',
        'https://github.com/TabbyML/tabby',
        'tabby'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Tableau',
    'tableau',
    'Plateforme de visualisation de données avec capacités d''IA.',
    'https://www.tableau.com/',
    (SELECT id FROM categories WHERE slug = 'data-analysis')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Tabnine',
    'tabnine',
    'Autocomplétion de code par IA',
    'https://tabnine.com',
    (SELECT id FROM categories WHERE slug = 'developpement')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Talend',
            'talend',
            'Suite d''intégration et qualité des données.',
            'https://www.talend.com/',
            data_category_id,
            '[{"plan_name": "Pro", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Tamr',
            'tamr',
            'Unification de données par machine learning.',
            'https://www.tamr.com/',
            data_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'TaskWeaver',
        'Framework pour créer des applications basées sur les tâches. Un framework qui permet de créer des applications qui décomposent et exécutent des tâches complexes.',
        'https://github.com/microsoft/TaskWeaver',
        'taskweaver'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Taskade AI',
    'taskade-ai',
    'Un espace de travail IA tout-en-un pour les équipes avec chat, organisation et collaboration.',
    'https://www.taskade.com/ai',
    (SELECT id FROM categories WHERE slug = 'productivity')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'TensorFlow',
        'Framework d''apprentissage automatique. Une plateforme complète pour construire et déployer des modèles d''apprentissage automatique.',
        'https://www.tensorflow.org/',
        'tensorflow'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Tesla Autopilot',
    'tesla-autopilot',
    'Système de conduite assistée par IA',
    'https://tesla.com/autopilot',
    (SELECT id FROM categories WHERE slug = 'automobile')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Testim',
    'testim',
    'Tests automatisés alimentés par l''IA.',
    'https://www.testim.io/',
    (SELECT id FROM categories WHERE slug = 'testing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Textbase',
        'Framework pour créer des chatbots IA. Un framework Python pour créer des chatbots personnalisés avec des modèles de langage.',
        'https://github.com/textbase-ai/textbase',
        'textbase'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'TheBloke',
        'Collection de modèles IA quantifiés. Une ressource majeure pour les modèles LLM optimisés et quantifiés.',
        'https://huggingface.co/TheBloke',
        'thebloke'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Thinkster Math',
            'thinkster-math',
            'Tutorat en mathématiques avec analyse IA du travail des élèves.',
            'https://hellothinkster.com/',
            education_category_id,
            '[{"plan_name": "Mensuel", "price": 39}, {"plan_name": "Annuel", "price": 360}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Third Space Learning',
            'third-space-learning',
            'Tutorat en mathématiques personnalisé avec IA.',
            'https://thirdspacelearning.com/',
            education_category_id,
            '[{"plan_name": "Basic", "price": 49}, {"plan_name": "Premium", "price": 99}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Tickeron',
    'tickeron',
    'Plateforme d''analyse financière basée sur l''IA.',
    'https://tickeron.com/',
    (SELECT id FROM categories WHERE slug = 'finance')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Together',
        'Plateforme cloud pour l''IA. Une plateforme qui fournit l''infrastructure et les outils pour entraîner et déployer des modèles d''IA.',
        'https://www.together.ai/',
        'together'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Tokenizers',
        'Bibliothèque de tokenisation rapide. Une bibliothèque optimisée pour la tokenisation de texte en apprentissage automatique.',
        'https://github.com/huggingface/tokenizers',
        'tokenizers'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Tome',
    'tome',
    'Génération de présentations narratives avec l''IA.',
    'https://tome.app/',
    (SELECT id FROM categories WHERE slug = 'presentation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Tomorrow.io',
    'tomorrow-io',
    'Prévisions météo de précision par IA',
    'https://tomorrow.io',
    (SELECT id FROM categories WHERE slug = 'meteo')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Toolformer',
        'Modèle de langage qui apprend à utiliser des outils. Un modèle qui peut apprendre à utiliser des API et des outils externes pour augmenter ses capacités.',
        'https://github.com/lucidrains/toolformer-pytorch',
        'toolformer'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'TorchServe',
        'Serveur de modèles PyTorch. Un outil pour servir des modèles PyTorch en production de manière performante.',
        'https://pytorch.org/serve/',
        'torchserve'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Trade Ideas',
    'trade-ideas',
    'Plateforme de scanning de marché et d''analyse technique avec IA.',
    'https://www.trade-ideas.com/',
    (SELECT id FROM categories WHERE slug = 'finance')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'TradingView',
    'tradingview',
    'Plateforme d''analyse technique et de trading avec fonctionnalités d''IA.',
    'https://www.tradingview.com/',
    (SELECT id FROM categories WHERE slug = 'finance')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'TradingView AI',
    'tradingview-ai',
    'Analyse technique et prédictions boursières',
    'https://tradingview.com',
    (SELECT id FROM categories WHERE slug = 'finance')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Transformers',
        'Bibliothèque de modèles de langage pré-entraînés. Une bibliothèque qui fournit des milliers de modèles pré-entraînés pour diverses tâches de traitement du langage.',
        'https://huggingface.co/transformers',
        'transformers'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Trifacta',
        'trifacta',
        'Plateforme de préparation de données intelligente.',
        'https://www.trifacta.com/',
        (SELECT id FROM categories WHERE slug = 'données-&-préparation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Triton Inference Server',
        'Serveur d''inférence ML. Un serveur optimisé pour le déploiement de modèles ML en production.',
        'https://github.com/triton-inference-server/server',
        'triton-inference-server'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Typebot',
        'Constructeur de chatbots conversationnels. Une alternative open-source à Typeform qui permet de créer des chatbots conversationnels avec une interface drag & drop.',
        'https://typebot.io/',
        'typebot'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Typeframes',
    'typeframes',
    'Outil de storytelling qui aide à créer des histoires engageantes avec l''IA.',
    'https://typeframes.com/',
    (SELECT id FROM categories WHERE slug = 'writing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Ultimaker Cura',
            'ultimaker-cura',
            'Logiciel de slicing avec IA pour optimisation de l''impression 3D.',
            'https://ultimaker.com/software/ultimaker-cura',
            impression3d_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            true
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Unity AI',
    'unity-ai',
    'Suite d''outils IA pour Unity',
    'https://unity.com/products/ai',
    (SELECT id FROM categories WHERE slug = 'gaming')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Unity ML-Agents',
            'unity-ml-agents',
            'Framework d''apprentissage par renforcement pour Unity.',
            'https://unity.com/products/machine-learning-agents',
            games_category_id,
            '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
            true,
            true
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Unreal Engine AI',
            'unreal-engine-ai',
            'Système d''IA intégré à Unreal Engine pour les jeux.',
            'https://www.unrealengine.com/',
            games_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Custom", "price": null}]'::jsonb,
            true,
            true
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Unstructured',
        'Bibliothèque pour extraire du texte de documents. Une bibliothèque open-source pour pré-traiter et extraire du texte à partir de documents non structurés.',
        'https://unstructured.io/',
        'unstructured'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Vectra AI',
            'vectra-ai',
            'Détection et réponse aux menaces par IA.',
            'https://www.vectra.ai/',
            cyber_category_id,
            '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Veed',
    'veed',
    'Plateforme d''édition vidéo en ligne avec des fonctionnalités d''IA.',
    'https://www.veed.io/',
    (SELECT id FROM categories WHERE slug = 'video')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Vercel AI SDK',
        'SDK pour construire des applications IA. Un kit de développement qui simplifie l''intégration de fonctionnalités d''IA dans les applications web.',
        'https://sdk.vercel.ai/',
        'vercel-ai-sdk'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Vertex AI',
        'Plateforme ML de Google Cloud. Une plateforme unifiée pour construire, déployer et mettre à l''échelle des modèles d''IA.',
        'https://cloud.google.com/vertex-ai',
        'vertex-ai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Vicuna-13B',
    'vicuna-13b',
    'Un chatbot open source entraîné en affinant LLaMA sur des conversations partagées par les utilisateurs collectées depuis ShareGPT.',
    'https://lmsys.org/blog/2023-03-30-vicuna/',
    (SELECT id FROM categories WHERE slug = 'text')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Vizcom',
    'vizcom',
    'Transformation de croquis en rendus 3D',
    'https://vizcom.ai',
    (SELECT id FROM categories WHERE slug = 'design')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Vocode',
        'Bibliothèque pour créer des agents vocaux. Une bibliothèque open-source pour construire des agents conversationnels vocaux personnalisés.',
        'https://github.com/vocodedev/vocode-python',
        'vocode'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Voicemod',
    'voicemod',
    'Modificateur de voix en temps réel utilisant l''IA pour des effets créatifs.',
    'https://www.voicemod.net/',
    (SELECT id FROM categories WHERE slug = 'audio-musique')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Waymo AI',
    'waymo-ai',
    'IA pour véhicules autonomes',
    'https://waymo.com',
    (SELECT id FROM categories WHERE slug = 'transport')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Weaviate',
        'Base de données vectorielle open-source. Une base de données vectorielle pour stocker des objets et des vecteurs avec recherche sémantique.',
        'https://weaviate.io/',
        'weaviate'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'WebLLM',
        'LLMs dans le navigateur. Une solution pour exécuter des modèles de langage directement dans le navigateur web.',
        'https://webllm.mlc.ai/',
        'webllm'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Weights & Biases',
        'Plateforme MLOps. Un outil pour suivre les expériences, gérer les modèles et collaborer en ML.',
        'https://wandb.ai/',
        'weights-and-biases'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Whisper',
        'Système de reconnaissance vocale d''OpenAI. Un modèle robuste pour la transcription et la traduction de la parole.',
        'https://github.com/openai/whisper',
        'whisper'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'WisdomPrompt',
        'Framework pour l''optimisation de prompts. Un framework qui aide à créer et optimiser des prompts pour les modèles de langage.',
        'https://github.com/wisdom-prompt/wisdom-prompt',
        'wisdomprompt'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Wolfram Alpha',
        'Moteur de connaissances computationnel. Un système qui combine connaissances et calculs pour répondre à des questions complexes.',
        'https://www.wolframalpha.com/',
        'wolfram-alpha'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
            'Wonder Dynamics',
            'wonder-dynamics',
            'IA pour effets visuels et animation.',
            'https://www.wonder.ai/',
            media_category_id,
            '[{"plan_name": "Contact", "price": null}]'::jsonb,
            true,
            false
        )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Wordtune',
    'wordtune',
    'Assistant d''écriture qui aide à reformuler et améliorer vos textes.',
    'https://www.wordtune.com/',
    (SELECT id FROM categories WHERE slug = 'writing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Writecream',
    'writecream',
    'Outil de création de contenu qui génère des textes personnalisés pour différents formats.',
    'https://writecream.com/',
    (SELECT id FROM categories WHERE slug = 'writing')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Writefull',
    'writefull',
    'Outil d''amélioration de l''écriture académique basé sur l''IA.',
    'https://writefull.com/',
    (SELECT id FROM categories WHERE slug = 'research')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Writesonic',
    'writesonic',
    'Plateforme d''IA pour créer du contenu optimisé pour le SEO.',
    'https://writesonic.com/',
    (SELECT id FROM categories WHERE slug = 'productivity')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'X-Agent',
        'Agent autonome pour le développement. Un agent IA autonome capable de développer des applications complètes à partir de descriptions.',
        'https://github.com/OpenBMB/XAgent',
        'x-agent'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'X-Turing',
        'Plateforme pour construire des applications LLM. Une plateforme qui simplifie la construction d''applications basées sur les modèles de langage.',
        'https://www.x-turing.com/',
        'x-turing'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'XGBoost',
        'Bibliothèque de boosting gradient. Un outil puissant et efficace pour l''apprentissage automatique basé sur les arbres de décision.',
        'https://xgboost.readthedocs.io/',
        'xgboost'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'YAYI',
        'Assistant IA multilingue. Un assistant IA capable de communiquer dans plusieurs langues et d''effectuer diverses tâches.',
        'https://github.com/wenge-research/YAYI',
        'yayi'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'YOLO',
        'Système de détection d''objets en temps réel. Un algorithme rapide et précis pour la détection d''objets dans les images et les vidéos.',
        'https://pjreddie.com/darknet/yolo/',
        'yolo'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Yellowbrick',
        'Suite de visualisation ML. Des outils de visualisation pour l''analyse et la validation de modèles ML.',
        'https://www.scikit-yb.org/',
        'yellowbrick'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'You.com',
    'you-com',
    'Moteur de recherche avec chat IA intégré',
    'https://you.com',
    (SELECT id FROM categories WHERE slug = 'recherche')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Zapier',
        'zapier',
        'Plateforme d''automatisation qui connecte vos apps et automatise les flux de travail avec l''IA.',
        'https://zapier.com/',
        (SELECT id FROM categories WHERE slug = 'automatisation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Zapier AI',
    'zapier-ai',
    'Automatisation des tâches avec IA',
    'https://zapier.com',
    (SELECT id FROM categories WHERE slug = 'automatisation')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'ZenML',
        'Framework MLOps extensible. Un outil open-source pour créer des pipelines ML reproductibles.',
        'https://zenml.io/',
        'zenml'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'Zephyr',
        'Modèle de langage open-source. Un modèle de langage open-source optimisé pour les performances et la facilité d''utilisation.',
        'https://github.com/huggingface/zephyr',
        'zephyr'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'Zillow AI',
    'zillow-ai',
    'Estimation et prédiction immobilière par IA',
    'https://zillow.com',
    (SELECT id FROM categories WHERE slug = 'immobilier')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'bumpgen',
        'Agent IA qui maintient les dépendances npm à jour. Met la gestion et les mises à jour des dépendances en pilote automatique, met à jour la version d''un package npm puis génère les corrections de code pour les changements incompatibles.',
        'https://github.com/xeol-io/bumpgen',
        'bumpgen'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'data-to-paper',
        'Recherche pilotée par l''IA des données aux articles de recherche vérifiables. Framework pour naviguer systématiquement dans la puissance de l''IA pour effectuer une recherche scientifique complète, des données brutes aux articles scientifiques complets.',
        'https://github.com/Technion-Kishony-lab/data-to-paper',
        'data-to-paper'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'fastai',
        'Bibliothèque de deep learning de haut niveau. Une couche d''abstraction au-dessus de PyTorch qui simplifie l''apprentissage profond.',
        'https://www.fast.ai/',
        'fastai'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'iZotope RX',
    'izotope-rx',
    'Suite de restauration audio professionnelle avec technologie IA.',
    'https://www.izotope.com/en/products/rx.html',
    (SELECT id FROM categories WHERE slug = 'audio-musique')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'llama.cpp',
        'Port C++ des modèles LLaMA. Une implémentation efficace des modèles LLaMA pour l''inférence sur CPU.',
        'https://github.com/ggerganov/llama.cpp',
        'llama-cpp'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
    'quivr',
    'quivr',
    'Déposez tous vos fichiers et discutez avec votre deuxième cerveau génératif IA en utilisant des LLMs et des embeddings.',
    'https://github.com/StanGirard/quivr',
    (SELECT id FROM categories WHERE slug = 'local-search')
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'spaCy',
        'Bibliothèque de traitement du langage naturel. Un outil rapide et efficace pour l''analyse et le traitement du texte.',
        'https://spacy.io/',
        'spacy'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'vLLM',
        'Bibliothèque pour servir des LLMs. Une bibliothèque open-source pour servir des LLMs avec une mise en cache optimisée et une latence réduite.',
        'https://github.com/vllm-project/vllm',
        'vllm'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools VALUES (
        'whylogs',
        'Framework de logging pour l''IA. Un framework open-source pour la collecte de statistiques et le monitoring des systèmes d''IA.',
        'https://github.com/whylabs/whylogs',
        'whylogs'
    )
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

COMMIT;
