-- Fixed migration file for all AI tools
BEGIN;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('3DPrinterOS', '3dprinteros', 'Plateforme cloud de gestion d', 'impression 3D avec IA.', (SELECT id FROM categories WHERE slug = 'https://www.3dprinteros.com/'), '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Pro", "price": 29.99}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('AIGameDev', 'aigamedev', 'Ressources et outils pour l', 'IA dans les jeux.', (SELECT id FROM categories WHERE slug = 'https://aigamedev.com/'), '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Pro", "price": 49}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('AIGym', 'aigym', 'Plateforme d', 'entraînement pour agents IA de jeux.', (SELECT id FROM categories WHERE slug = 'https://aigym.com/'), '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Pro", "price": 29}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('AIlice', 'Créez des arbres d', 'appels d', 'agents pour exécuter vos tâches. Un agent sous forme de chatbot qui planifie indépendamment les tâches données en langage naturel et crée dynamiquement un arbre d', (SELECT id FROM categories WHERE slug = 'appels d'), 'agents pour les exécuter.', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('AIlice', 'ailice-task-planner', 'Agent sous forme de chatbot qui planifie indépendamment les tâches données en langage naturel et crée dynamiquement un arbre d', 'appels d', (SELECT id FROM categories WHERE slug = 'agents pour les exécuter.'), 'https://github.com/myshell-ai/AIlice', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Accentize', 'accentize', 'Solutions de traitement audio professionnel basées sur l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://www.accentize.com/'), 'audio-musique', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Accusonus', 'accusonus', 'Suite d', 'outils de réparation audio professionnelle assistée par IA.', (SELECT id FROM categories WHERE slug = 'https://accusonus.com/'), 'audio-musique', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Ada Health', 'ada-health', 'Application d', 'évaluation de la santé alimentée par l', (SELECT id FROM categories WHERE slug = 'IA.'), 'https://ada.com/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Adala', 'adala', 'Framework d', 'annotation de données qui utilise l', (SELECT id FROM categories WHERE slug = 'IA pour automatiser et améliorer le processus d'), 'étiquetage des données, avec un focus sur la qualité et l', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Adobe Enhanced Speech', 'adobe-enhanced-speech', 'Technologie d', 'amélioration vocale basée sur l', (SELECT id FROM categories WHERE slug = 'IA par Adobe.'), 'https://www.adobe.com/products/premiere/enhanced-speech.html', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('AgentForge', 'Plateforme agnostique LLM pour la construction et le test d', 'agents. Framework low-code conçu pour la création rapide, le test et l', 'itération d', (SELECT id FROM categories WHERE slug = 'agents autonomes IA et d'), 'architectures cognitives. Compatible avec divers modèles LLM comme OpenAI et Claude d', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('AgentForge', 'agentforge', 'Plateforme de développement d', 'agents IA qui simplifie la création et le déploiement d', (SELECT id FROM categories WHERE slug = 'agents autonomes pour diverses tâches.'), 'https://github.com/DataBassGit/AgentForge', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('AgentGPT', 'Version no-code basée sur navigateur d', 'AutoGPT. Plateforme permettant d', 'assigner des objectifs à l', (SELECT id FROM categories WHERE slug = 'agent, observer son processus de réflexion, formuler un plan d'), 'exécution et prendre des actions en conséquence. Utilise les fonctions OpenAI et supporte gpt-3.5-16k.', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('AgentVerse', 'Plateforme pour la résolution de tâches et la simulation d', 'agents. Permet d', 'assembler plusieurs agents pour accomplir des tâches collaborativement et de créer des environnements personnalisés pour observer ou interagir avec de multiples agents.', (SELECT id FROM categories WHERE slug = 'https://github.com/OpenBMB/AgentVerse'), 'agentverse', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Agents', 'Bibliothèque/framework pour construire des agents linguistiques. Équipé de mémoire à court et long terme via VectorDB, capacités d', 'utilisation d', 'outils externes, navigation web, et communication multi-agents. Permet une interaction humain-agent flexible.', (SELECT id FROM categories WHERE slug = 'https://github.com/aiwaves-cn/agents'), 'agents', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Akkio', 'akkio', 'Plateforme no-code d', 'IA pour l', (SELECT id FROM categories WHERE slug = 'analyse prédictive'), 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Alteryx', 'alteryx', 'Plateforme d', 'analyse et d', (SELECT id FROM categories WHERE slug = 'automatisation des processus analytiques.'), 'https://www.alteryx.com/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Alteryx', 'alteryx-prep', 'Plateforme d', 'analyse et préparation de données.', (SELECT id FROM categories WHERE slug = 'https://www.alteryx.com/'), '[{"plan_name": "Pro", "price": null}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Anthropic', 'Entreprise d', 'IA axée sur la sécurité. Développeur de Claude et d', 'autres modèles d', (SELECT id FROM categories WHERE slug = 'IA avancés, mettant l'), 'accent sur l', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Anthropic Claude 3', 'anthropic-claude-3', 'Dernière version de l', 'assistant IA d', (SELECT id FROM categories WHERE slug = 'Anthropic avec capacités multimodales avancées'), 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Anthropic Claude Pro', 'anthropic-claude-pro', 'Assistant d', 'écriture professionnel par Anthropic', (SELECT id FROM categories WHERE slug = 'https://images.unsplash.com/photo-1517842645767-c639042777db'), 'https://claude.ai', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('ArchAI', 'archai', 'Système d', 'IA pour la détection et l', (SELECT id FROM categories WHERE slug = 'analyse de sites archéologiques.'), 'https://www.arch-ai.org/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('ArchaeoGPT', 'archaeogpt', 'Assistant IA spécialisé dans l', 'analyse de données archéologiques.', (SELECT id FROM categories WHERE slug = 'https://archaeogpt.org/'), 'archaeology', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Archaeological Predictor', 'archaeological-predictor', 'Outil de prédiction des sites archéologiques basé sur l', 'apprentissage automatique.', (SELECT id FROM categories WHERE slug = 'https://archaeologicalpredictor.com/'), 'archaeology', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Archaeological Vision', 'archaeological-vision', 'Système de vision par ordinateur pour l', 'analyse de sites archéologiques.', (SELECT id FROM categories WHERE slug = 'https://archaeologicalvision.com/'), 'archaeology', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Artbreeder', 'artbreeder', 'Plateforme de création d', 'images par IA permettant de mélanger et d', (SELECT id FROM categories WHERE slug = 'éditer des styles artistiques.'), 'https://www.artbreeder.com/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Artefacts Analyzer', 'artefacts-analyzer', 'Outil d', 'analyse d', (SELECT id FROM categories WHERE slug = 'artefacts archéologiques utilisant l'), 'IA.', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('AstroPrint', 'astroprint', 'Plateforme intelligente de gestion d', 'impression 3D.', (SELECT id FROM categories WHERE slug = 'https://www.astroprint.com/'), '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Pro", "price": 19.99}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('AudioCraft', 'audiocraft', 'Suite d', 'outils Meta pour la génération audio et musicale', (SELECT id FROM categories WHERE slug = 'https://images.unsplash.com/photo-1511379938547-c1f69419868d'), 'https://github.com/facebookresearch/audiocraft', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('AudioLabs', 'audiolabs', 'Suite d', 'outils IA pour l', (SELECT id FROM categories WHERE slug = 'amélioration et le traitement audio professionnel.'), 'https://www.audiolabs.io/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Audionamix', 'audionamix', 'Solutions de séparation audio professionnelle basées sur l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://audionamix.com/'), 'audio-musique', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('AutoGPT', 'Tentative expérimentale open-source de rendre GPT-4 totalement autonome. Enchaîne les "pensées" LLM pour atteindre automatiquement n', 'importe quel objectif fixé. Dispose d', 'un accès Internet pour les recherches, d', (SELECT id FROM categories WHERE slug = 'une gestion de la mémoire à court et long terme, et peut exécuter de nombreuses commandes.'), 'https://agpt.co', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('AutoGPT', 'auto-gpt', 'Un agent autonome expérimental qui utilise GPT-4 pour atteindre des objectifs définis par l', 'utilisateur.', (SELECT id FROM categories WHERE slug = 'https://github.com/Significant-Gravitas/Auto-GPT'), 'automation', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('AutoGPT', 'autogpt', 'Agent IA autonome expérimental basé sur GPT-4 capable d', 'atteindre des objectifs complexes', (SELECT id FROM categories WHERE slug = 'https://agpt.co'), 'agents-automatisation', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('AutoGen', 'Framework multi-agents avec une grande diversité d', 'agents. Permet de développer des applications LLM avec plusieurs agents conversationnels qui peuvent collaborer pour résoudre des tâches et interagir avec les humains. Simplifie les workflows LLM complexes et améliore l', 'inférence avec des fonctionnalités de réglage des performances.', (SELECT id FROM categories WHERE slug = 'https://github.com/microsoft/autogen'), 'autogen', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Autodesk AEC Collection', 'autodesk-aec', 'Suite complète d', 'outils IA pour l', (SELECT id FROM categories WHERE slug = 'architecture, l'), 'ingénierie et la construction, incluant Revit et AutoCAD.', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('BabyAGI', 'Framework simple pour gérer des tâches en utilisant l', 'IA. Version simplifiée de l', 'agent autonome original, qui crée des tâches basées sur les résultats des tâches précédentes et un objectif prédéfini. Utilise les capacités NLP d', (SELECT id FROM categories WHERE slug = 'OpenAI pour créer de nouvelles tâches et gère une liste de tâches pour la priorisation.'), 'https://github.com/yoheinakajima/babyagi', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('BabyAGI', 'babyagi', 'Framework simple pour la gestion des tâches utilisant l', 'IA. Crée et priorise automatiquement des tâches basées sur un objectif prédéfini.', (SELECT id FROM categories WHERE slug = 'https://github.com/yoheinakajima/babyagi'), '[{"plan_name": "Open Source", "price": 0}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('BabyCatAGI', 'Modification de BabyBeeAGI en seulement 300 lignes de code. Inclut des fonctionnalités comme l', 'agent de création de tâches qui s', 'exécute une fois, l', (SELECT id FROM categories WHERE slug = 'agent d'), 'exécution qui parcourt les tâches, les dépendances des tâches, et combine les résultats pour créer un rapport de synthèse.', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('BabyCommandAGI', 'Test de combinaison entre CLI et LLM. Un agent conçu pour tester l', 'interaction entre l', 'interface en ligne de commande et les modèles de langage. Basé sur BabyAGI, il peut exécuter des commandes shell et réaliser de la programmation automatique.', (SELECT id FROM categories WHERE slug = 'https://github.com/saten-private/BabyCommandAGI'), 'babycommandagi', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Babylon Health', 'babylon-health', 'Service de consultation médicale en ligne utilisant l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://www.babylonhealth.com/'), 'health', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Beautiful.ai', 'beautiful-ai', 'Créez de belles présentations rapidement avec l', 'aide de l', (SELECT id FROM categories WHERE slug = 'IA.'), 'https://www.beautiful.ai/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('BeforeSunset', 'beforesunset', 'Assistant de planification et de gestion du temps basé sur l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://www.beforesunset.ai/'), 'productivity', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('BlackBerry Cylance', 'cylance', 'Solution antivirus et EDR basée sur l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://www.cylance.com/'), '[{"plan_name": "Pro", "price": null}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Blender AI', 'blender-ai', 'Suite d', 'outils IA pour Blender', (SELECT id FROM categories WHERE slug = 'https://blender.org'), '3d-animation', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Blinky', 'Agent de débogage IA open-source pour VSCode. Utilise les LLM pour identifier et corriger les erreurs de code backend, s', 'appuyant sur l', 'API VSCode, le protocole LSP et le débogage par instruction print.', (SELECT id FROM categories WHERE slug = 'https://github.com/seahyinghang8/blinky'), 'blinky', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Boomy', 'boomy', 'Créez de la musique originale en quelques secondes avec l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://boomy.com/'), 'audio', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('CAMEL', 'Architecture pour l', 'exploration "mentale" des agents. Une bibliothèque open-source conçue pour l', 'étude d', (SELECT id FROM categories WHERE slug = 'agents autonomes et communicatifs, avec un agent utilisateur IA donnant des instructions et un agent assistant IA suivant ces instructions.'), 'https://github.com/camel-ai/camel', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('CENTURY', 'century', 'Plateforme d', 'apprentissage personnalisé utilisant l', (SELECT id FROM categories WHERE slug = 'IA.'), 'https://www.century.tech/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('CUDA', 'Plateforme de calcul parallèle NVIDIA. Une architecture qui permet d', 'accélérer les calculs sur GPU pour l', 'apprentissage profond.', (SELECT id FROM categories WHERE slug = 'https://developer.nvidia.com/cuda-toolkit'), 'cuda', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Canva AI', 'canva-ai', 'Suite d', 'outils IA pour la création graphique', (SELECT id FROM categories WHERE slug = 'https://www.canva.com'), 'design', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Carnegie Learning', 'carnegie-learning', 'Plateforme d', 'apprentissage adaptatif pour les mathématiques.', (SELECT id FROM categories WHERE slug = 'https://www.carnegielearning.com/'), 'education', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Cascadeur', 'cascadeur', 'Logiciel d', 'animation 3D avec physique assistée par IA.', (SELECT id FROM categories WHERE slug = 'https://cascadeur.com/'), '3d-animation', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Century Tech', 'century-tech', 'Plateforme d', 'apprentissage adaptatif utilisant l', (SELECT id FROM categories WHERE slug = 'IA pour personnaliser l'), 'éducation.', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('ChatGPT', 'Assistant conversationnel d', 'OpenAI. Un modèle de langage avancé capable de dialoguer de manière naturelle et d', 'aider dans diverses tâches.', (SELECT id FROM categories WHERE slug = 'https://chat.openai.com/'), 'chatgpt', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('ChatGPT', 'chatgpt', 'Assistant conversationnel avancé basé sur GPT-4. Un modèle de langage puissant capable de comprendre et générer du texte naturel.', 'https://chat.openai.com/', (SELECT id FROM categories WHERE slug = 'Agents & Automatisation'), '[{"plan_name": "Free", "price": 0}, {"plan_name": "Plus", "price": 20}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Claude', 'Assistant IA d', 'Anthropic. Un modèle de langage avancé conçu pour être utile, honnête et inoffensif, capable d', 'analyses approfondies.', (SELECT id FROM categories WHERE slug = 'https://www.anthropic.com/claude'), 'claude', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Claude', 'claude', 'Discutez avec Claude, un assistant IA d', 'Anthropic.', (SELECT id FROM categories WHERE slug = 'https://claude.ai/'), 'text', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Clearscope', 'clearscope', 'Plateforme d', 'optimisation de contenu basée sur l', (SELECT id FROM categories WHERE slug = 'IA.'), 'https://www.clearscope.io/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('ClickUp AI', 'clickup-ai', 'Assistant de gestion de projet alimenté par l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://clickup.com/ai'), 'project', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Cognii', 'cognii', 'Assistant virtuel pour l', 'évaluation et le feedback en éducation.', (SELECT id FROM categories WHERE slug = 'https://www.cognii.com/'), '[{"plan_name": "Institution", "price": null}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Colossyan', 'colossyan', 'Créateur de vidéos d', 'apprentissage avec des présentateurs IA réalistes.', (SELECT id FROM categories WHERE slug = 'https://www.colossyan.com/'), 'video', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Compose AI', 'compose-ai', 'Extension de navigateur qui accélère l', 'écriture avec l', (SELECT id FROM categories WHERE slug = 'auto-complétion IA.'), 'https://www.compose.ai/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Copy.ai', 'copy-ai', 'Générateur de contenu marketing et publicitaire alimenté par l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://www.copy.ai/'), 'writing', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Cortex', 'Plateforme de déploiement d', 'IA. Un outil pour déployer des modèles d', 'IA en production sur Kubernetes.', (SELECT id FROM categories WHERE slug = 'https://www.cortex.dev/'), 'cortex', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Coursera AI', 'coursera-ai', 'Assistant d', 'apprentissage personnalisé', (SELECT id FROM categories WHERE slug = 'https://coursera.org'), 'education', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Craiyon', 'craiyon', 'Générateur d', 'images IA gratuit pour des descriptions textuelles simples', (SELECT id FROM categories WHERE slug = 'https://images.unsplash.com/photo-1677442136019-21780ecad995'), 'https://www.craiyon.com', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('CrewAI', 'crewai', 'Framework pour créer des équipes d', 'agents IA collaboratifs', (SELECT id FROM categories WHERE slug = 'https://github.com/joaomdmoura/crewAI'), 'agents-automatisation', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('CrowdStrike', 'crowdstrike', 'Protection des endpoints basée sur l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://www.crowdstrike.com/'), 'security', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('DALL·E', 'dall-e', 'Système de génération d', 'images par OpenAI capable de créer des images réalistes', (SELECT id FROM categories WHERE slug = 'https://openai.com/dall-e-2'), 'generation-images', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('DALL·E 2', 'dalle-2', 'Annonce de la sortie de DALL·E 2, un système avancé de génération d', 'images avec une résolution améliorée, des capacités de création d', (SELECT id FROM categories WHERE slug = 'images étendues et diverses mesures de sécurité.'), 'https://openai.com/blog/dall-e-2/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('DALL·E 3', 'dall-e-3', 'Version la plus avancée du générateur d', 'images d', (SELECT id FROM categories WHERE slug = 'OpenAI'), 'https://images.unsplash.com/photo-1677442136019-21780ecad995', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('DALL·E 3', 'dalle-3', 'Annonce du générateur d', 'images DALL·E 3.', (SELECT id FROM categories WHERE slug = 'https://openai.com/index/dall-e-3/'), 'milestone', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('DETR', 'Transformers pour la détection d', 'objets. Une nouvelle approche de la détection d', 'objets basée sur les transformers.', (SELECT id FROM categories WHERE slug = 'https://github.com/facebookresearch/detr'), 'detr', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Darktrace', 'darktrace', 'Plateforme de cybersécurité autonome basée sur l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://www.darktrace.com/'), 'cybersécurité', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('DataRobot', 'datarobot', 'Plateforme d', 'IA automatisée pour l', (SELECT id FROM categories WHERE slug = 'analyse'), 'https://datarobot.com', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Databricks', 'databricks-prep', 'Plateforme unifiée d', 'analyse et préparation de données.', (SELECT id FROM categories WHERE slug = 'https://databricks.com/'), '[{"plan_name": "Enterprise", "price": null}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Dataiku', 'dataiku', 'Plateforme collaborative de data science et d', 'analyse.', (SELECT id FROM categories WHERE slug = 'https://www.dataiku.com/'), 'data-analysis', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('DeepL Write', 'deepl-write', 'Assistant d', 'écriture et traduction IA', (SELECT id FROM categories WHERE slug = 'https://deepl.com/write'), 'traduction', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Deinfluencer', 'deinfluencer', 'Création de musique par IA sans droits d', 'auteur', (SELECT id FROM categories WHERE slug = 'https://images.unsplash.com/photo-1511379938547-c1f69419868d'), 'https://www.deinfluencer.ai', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Descript', 'descript', 'Éditeur audio et vidéo tout-en-un alimenté par l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://www.descript.com/'), 'audio', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Designs AI', 'designs-ai', 'Suite d', 'outils créatifs incluant un créateur de vidéos IA.', (SELECT id FROM categories WHERE slug = 'https://designs.ai/'), 'video', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Detectron2', 'Bibliothèque de vision par ordinateur. Une plateforme de Facebook pour la détection d', 'objets et la segmentation d', 'images.', (SELECT id FROM categories WHERE slug = 'https://github.com/facebookresearch/detectron2'), 'detectron2', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Digital Archaeology Tool', 'digital-archaeology-tool', 'Suite d', 'outils numériques pour l', (SELECT id FROM categories WHERE slug = 'analyse archéologique avec IA.'), 'https://digitalarchaeology.org.uk/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('DotAgent', 'Agent IA pour l', 'automatisation des tâches de développement. Un agent IA conçu pour automatiser les tâches de développement répétitives, capable de comprendre et d', 'exécuter des instructions en langage naturel.', (SELECT id FROM categories WHERE slug = 'https://github.com/DotAgent'), 'dotagent', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('DrugAI', 'Agent IA pour la découverte de médicaments. Un agent autonome spécialisé dans la recherche et la découverte de nouveaux médicaments, utilisant l', 'apprentissage automatique et l', 'IA pour analyser les composés chimiques.', (SELECT id FROM categories WHERE slug = 'https://github.com/GIST-CSBL/DrugAI'), 'drugai', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Duolingo', 'duolingo', 'Plateforme d', 'apprentissage des langues utilisant l', (SELECT id FROM categories WHERE slug = 'IA pour personnaliser l'), 'apprentissage.', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Eightfold AI', 'eightfold-ai', 'Plateforme de gestion des talents basée sur l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://eightfold.ai/'), 'hr', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Evals', 'Framework pour évaluer les modèles de langage. Un framework d', 'évaluation pour les LLMs qui permet de créer et d', 'exécuter des tests automatisés pour mesurer les performances des modèles.', (SELECT id FROM categories WHERE slug = 'https://github.com/openai/evals'), 'evals', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Figma AI', 'figma-ai', 'Ensemble d', 'outils IA intégrés à Figma pour améliorer le design', (SELECT id FROM categories WHERE slug = 'https://www.figma.com/ai'), 'design', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Figma AI', 'figma-ai-design', 'Ensemble d', 'outils IA intégrés à Figma pour améliorer le processus de design, incluant la génération de variantes et l', (SELECT id FROM categories WHERE slug = 'aide à la mise en page.'), 'https://www.figma.com/ai', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('FoodGenius', 'foodgenius', 'IA pour l', 'optimisation alimentaire', (SELECT id FROM categories WHERE slug = 'https://foodgenius.ai'), 'agroalimentaire', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Frase', 'frase', 'Plateforme d', 'optimisation de contenu et de SEO basée sur l', (SELECT id FROM categories WHERE slug = 'IA.'), 'https://www.frase.io/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('GET3D', 'get3d', 'Générateur de modèles 3D texturés à partir d', 'images.', (SELECT id FROM categories WHERE slug = 'https://nv-tlabs.github.io/GET3D/'), '3d', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('GPT Engineer', 'gpt-engineer', 'Spécifie ce que vous voulez construire, l', 'IA crée le code', (SELECT id FROM categories WHERE slug = 'https://gptengineer.app'), 'generation-code', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('GPT Teacher', 'Assistant d', 'enseignement personnalisé alimenté par l', 'IA. Un agent IA conçu pour fournir un enseignement personnalisé, créer des plans de cours et générer du matériel pédagogique adapté aux besoins de l', (SELECT id FROM categories WHERE slug = 'apprenant.'), 'https://github.com/CognitiveCanvas/GPTTeacher', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('GPT Teacher', 'gpt-teacher', 'Assistant d', 'enseignement personnalisé alimenté par l', (SELECT id FROM categories WHERE slug = 'IA'), 'https://github.com/CognitiveCanvas/GPTTeacher', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('GPT-4', 'Modèle de langage avancé d', 'OpenAI. Le modèle le plus puissant d', 'OpenAI, capable de comprendre images et texte, avec des capacités de raisonnement améliorées.', (SELECT id FROM categories WHERE slug = 'https://openai.com/gpt-4'), 'gpt-4', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('GameAI Studio', 'game-ai-studio', 'Suite d', 'outils IA pour développeurs de jeux', (SELECT id FROM categories WHERE slug = 'https://images.unsplash.com/photo-1550745165-9bc0b252726f'), 'https://gameaistudio.com', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Gamma', 'gamma', 'Créez de belles présentations en quelques minutes avec l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://gamma.app/'), 'presentation', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Gemini', 'Modèle d', 'IA multimodal de Google. Le modèle d', 'IA le plus avancé de Google, capable de comprendre et de générer texte, code, audio et images.', (SELECT id FROM categories WHERE slug = 'https://deepmind.google/technologies/gemini/'), 'gemini', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Gradio', 'Création d', 'interfaces pour modèles ML. Un outil pour créer rapidement des démos web pour les modèles d', 'apprentissage automatique.', (SELECT id FROM categories WHERE slug = 'https://gradio.app/'), 'gradio', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Grammarly', 'grammarly', 'Assistant d', 'écriture alimenté par l', (SELECT id FROM categories WHERE slug = 'IA qui aide à améliorer la grammaire, le style et le ton.'), 'https://www.grammarly.com/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('H2O.ai', 'h2o-ai', 'Plateforme d', 'IA automatisée pour l', (SELECT id FROM categories WHERE slug = 'entreprise'), 'analyse-donnees', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Harvey AI', 'harvey-ai', 'Assistant juridique alimenté par l', 'IA', (SELECT id FROM categories WHERE slug = 'https://harvey.ai'), 'juridique', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Heritage AI', 'heritage-ai', 'Plateforme d', 'IA pour la préservation et l', (SELECT id FROM categories WHERE slug = 'analyse du patrimoine culturel.'), 'https://heritage-ai.org/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('HiredScore', 'hiredscore', 'Solution de recrutement et de gestion des talents basée sur l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://www.hiredscore.com/'), 'hr', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('HttpsGPT', 'Utilisation sécurisée de l', 'API GPT via HTTPS. Un outil qui permet d', 'utiliser l', (SELECT id FROM categories WHERE slug = 'API GPT de manière sécurisée via HTTPS, avec des fonctionnalités de chiffrement et d'), 'authentification.', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('HubSpot Marketing Hub', 'hubspot-marketing', 'Suite marketing tout-en-un avec fonctionnalités d', 'IA avancées.', (SELECT id FROM categories WHERE slug = 'https://www.hubspot.com/products/marketing'), 'business-&-marketing', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('IX', 'Framework pour créer des agents IA. Un framework moderne pour créer des agents IA autonomes capables d', 'interagir avec des API et d', 'accomplir des tâches complexes.', (SELECT id FROM categories WHERE slug = 'https://github.com/kreneskyp/ix'), 'ix', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Informatica', 'informatica', 'Solutions d', 'intégration et qualité des données.', (SELECT id FROM categories WHERE slug = 'https://www.informatica.com/'), '[{"plan_name": "Enterprise", "price": null}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Jasper', 'Plateforme d', 'écriture assistée par IA. Un outil qui aide à créer du contenu marketing, des articles et des copies publicitaires avec l', 'aide de l', (SELECT id FROM categories WHERE slug = 'IA.'), 'https://www.jasper.ai/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Jasper', 'jasper', 'Plateforme d', 'IA générative pour créer du contenu marketing rapidement.', (SELECT id FROM categories WHERE slug = 'https://www.jasper.ai/'), 'productivity', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Kaedim', 'kaedim', 'Crée des modèles 3D à partir d', 'images 2D en utilisant l', (SELECT id FROM categories WHERE slug = 'IA.'), 'https://www.kaedim3d.com/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Kapwing', 'kapwing', 'Éditeur vidéo en ligne avec des fonctionnalités d', 'IA pour le montage.', (SELECT id FROM categories WHERE slug = 'https://www.kapwing.com/'), 'video', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Kavout', 'kavout', 'Plateforme d', 'intelligence artificielle pour l', (SELECT id FROM categories WHERE slug = 'investissement.'), 'https://www.kavout.com/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Khan Academy GPT', 'khan-academy-gpt', 'Tuteur IA personnalisé pour l', 'apprentissage', (SELECT id FROM categories WHERE slug = 'https://images.unsplash.com/photo-1546410531-bb4caa6b424d'), 'https://www.khanacademy.org', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Kinetix', 'kinetix', 'Plateforme de création d', 'animations 3D avec l', (SELECT id FROM categories WHERE slug = 'IA.'), 'https://www.kinetix.tech/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Klaviyo AI', 'klaviyo-ai', 'Marketing automation avec IA pour l', 'e-commerce', (SELECT id FROM categories WHERE slug = 'https://images.unsplash.com/photo-1460925895917-afdab827c52f'), 'https://www.klaviyo.com', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Knewton', 'knewton', 'Plateforme d', 'apprentissage adaptatif pour l', (SELECT id FROM categories WHERE slug = 'enseignement supérieur.'), 'https://www.knewton.com/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Knime', 'knime', 'Plateforme open-source d', 'analyse de données et d', (SELECT id FROM categories WHERE slug = 'IA'), 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Knowunity', 'knowunity', 'Plateforme d', 'apprentissage social avec IA', (SELECT id FROM categories WHERE slug = 'https://images.unsplash.com/photo-1546410531-bb4caa6b424d'), 'https://www.knowunity.de', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Komo', 'komo', 'Un moteur de recherche alimenté par l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://komo.ai/'), 'search', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('LALAL.AI', 'lalal-ai', 'Sépare la voix et les instruments dans n', 'importe quelle chanson avec une qualité exceptionnelle.', (SELECT id FROM categories WHERE slug = 'https://www.lalal.ai/'), 'audio', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('LIME', 'Outil d', 'explication de modèles ML. Une technique pour expliquer les prédictions de n', 'importe quel classifieur ML.', (SELECT id FROM categories WHERE slug = 'https://github.com/marcotcr/lime'), 'lime', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Language Tools', 'Collection d', 'outils pour le traitement du langage. Une suite d', 'outils pour le traitement du langage naturel, incluant des correcteurs grammaticaux et des assistants d', (SELECT id FROM categories WHERE slug = 'écriture.'), 'https://languagetools.io/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Latitude', 'latitude', 'Plateforme de création de jeux basée sur l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://latitude.io/'), 'gaming', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Leonardo.ai', 'Plateforme de génération d', 'images par IA. Un outil puissant pour créer des images artistiques et professionnelles avec l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://leonardo.ai/'), 'leonardo-ai', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Leonardo.ai', 'leonardo-ai', 'Créez des assets de jeu consistants avec l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://leonardo.ai/'), 'gaming', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('LocalAI', 'Alternative open-source à OpenAI. Un drop-in replacement local pour l', 'API OpenAI, permettant d', 'exécuter des modèles d', (SELECT id FROM categories WHERE slug = 'IA en local avec une API compatible.'), 'https://localai.io/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Lumen5', 'lumen5', 'Plateforme de création vidéo basée sur l', 'IA qui transforme du texte en vidéos engageantes.', (SELECT id FROM categories WHERE slug = 'https://lumen5.com/'), 'video', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('ML-Agents Toolkit', 'ml-agents-toolkit', 'Kit de développement pour l', 'IA dans les jeux Unity.', (SELECT id FROM categories WHERE slug = 'https://github.com/Unity-Technologies/ml-agents'), '[{"plan_name": "Gratuit", "price": 0}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('MMDetection', 'Boîte à outils de détection d', 'objets. Une collection d', 'algorithmes et d', (SELECT id FROM categories WHERE slug = 'outils pour la détection d'), 'objets.', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Mabl', 'mabl', 'Tests d', 'interface utilisateur intelligents.', (SELECT id FROM categories WHERE slug = 'https://www.mabl.com/'), 'testing', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Market Cipher', 'market-cipher', 'Indicateur de trading avancé utilisant l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://marketciphertrading.com/'), 'finance', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Marketmuse', 'marketmuse', 'Plateforme de marketing de contenu alimentée par l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://www.marketmuse.com/'), 'marketing', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Materials Project', 'materials-project', 'Base de données et outils d', 'IA pour la science des matériaux.', (SELECT id FROM categories WHERE slug = 'https://materialsproject.org/'), 'chimie-&-matériaux', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('MatterControl', 'mattercontrol', 'Suite logicielle d', 'impression 3D avec fonctionnalités IA.', (SELECT id FROM categories WHERE slug = 'https://www.matterhackers.com/store/l/mattercontrol/sk/MKZGTDW6'), '[{"plan_name": "Gratuit", "price": 0}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Mem.ai', 'mem-ai', 'Un espace de travail alimenté par l', 'IA qui organise votre travail et écrit pour vous.', (SELECT id FROM categories WHERE slug = 'https://mem.ai/'), 'productivity', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Mendeley', 'mendeley', 'Gestionnaire de références et réseau social académique avec fonctionnalités d', 'IA.', (SELECT id FROM categories WHERE slug = 'https://www.mendeley.com/'), 'research', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Meshcapade', 'meshcapade', 'Création de modèles 3D de corps humains réalistes avec l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://meshcapade.com/'), '3d-animation', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Meshy', 'meshy', 'Créez des modèles 3D à partir de texte ou d', 'images.', (SELECT id FROM categories WHERE slug = 'https://www.meshy.ai/'), '3d', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Midjourney', 'Générateur d', 'images par IA. Un outil de création d', 'images artistiques basé sur des descriptions textuelles.', (SELECT id FROM categories WHERE slug = 'https://www.midjourney.com/'), 'midjourney', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Midjourney', 'Outil de génération d', 'images IA créant des visuels artistiques de haute qualité à partir de descriptions textuelles.', 'https://www.midjourney.com/', (SELECT id FROM categories WHERE slug = 'Génération d'), 'Images', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Midjourney', 'midjourney', 'Outil de génération d', 'images IA créant des visuels artistiques de haute qualité', (SELECT id FROM categories WHERE slug = 'https://www.midjourney.com'), 'generation-images', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('MindsDB', 'mindsdb', 'Plateforme open source pour développer des applications d', 'IA avec SQL.', (SELECT id FROM categories WHERE slug = 'https://mindsdb.com/'), 'data', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Modl.ai', 'modl-ai', 'Plateforme d', 'automatisation des tests de jeux par IA.', (SELECT id FROM categories WHERE slug = 'https://modl.ai/'), '[{"plan_name": "Contact", "price": null}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('MonkeyLearn', 'monkeylearn', 'Plateforme d', 'analyse de texte et de données par IA.', (SELECT id FROM categories WHERE slug = 'https://monkeylearn.com/'), 'data', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Move AI', 'move-ai', 'Capture de mouvement et animation 3D basée sur l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://www.move.ai/'), '3d-animation', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('NVIDIA GameWorks AI', 'nvidia-gameworks-ai', 'Suite d', 'outils IA pour le développement de jeux.', (SELECT id FROM categories WHERE slug = 'https://developer.nvidia.com/gameworks'), '[{"plan_name": "License", "price": null}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Neptune', 'Plateforme de suivi d', 'expériences ML. Un outil pour suivre, stocker et analyser les expériences d', 'apprentissage automatique.', (SELECT id FROM categories WHERE slug = 'https://neptune.ai/'), 'neptune', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Notion AI', 'notion-ai', 'Assistant d', 'écriture et d', (SELECT id FROM categories WHERE slug = 'organisation intégré à Notion'), 'https://notion.so', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Notion AI', 'notion-ai-assistant', 'Assistant d', 'écriture et d', (SELECT id FROM categories WHERE slug = 'organisation intégré à Notion, aidant à la rédaction, au résumé et à l'), 'analyse de contenu.', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Numerous.ai', 'numerous-ai', 'Automatisation des feuilles de calcul et analyse de données avec l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://numerous.ai/'), 'automation', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Nvidia Canvas', 'nvidia-canvas', 'Transforme des croquis simples en paysages 3D photoréalistes avec l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://www.nvidia.com/en-us/studio/canvas/'), '3d-animation', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Obviously AI', 'obviously-ai', 'Plateforme d', 'analyse prédictive sans code pour les entreprises.', (SELECT id FROM categories WHERE slug = 'https://www.obviously.ai/'), 'data', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Ocean Protocol', 'ocean-protocol', 'Protocole décentralisé pour le partage de données et l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://oceanprotocol.com/'), 'blockchain-&-web3', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('OpenAI', 'Entreprise leader en recherche IA. Développeur de GPT, DALL-E et d', 'autres technologies d', 'IA avancées.', (SELECT id FROM categories WHERE slug = 'https://openai.com/'), 'openai', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('OpenAI API', 'openai-api', 'Annonce de l', 'API OpenAI pour les modèles d', (SELECT id FROM categories WHERE slug = 'IA texte-à-texte à usage général basés sur GPT-3.'), 'https://openai.com/blog/openai-api/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('OpenAI API', 'openai-api-tool', 'L', 'API d', (SELECT id FROM categories WHERE slug = 'OpenAI donne accès aux modèles GPT-3 et GPT-4, qui effectuent une grande variété de tâches en langage naturel, et à Codex, qui traduit le langage naturel en code.'), 'https://openai.com/api/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('OpenAgents', 'Collection open-source d', 'agents IA. Une collection d', 'agents IA open-source pour différentes tâches, avec des capacités de traitement du langage naturel.', (SELECT id FROM categories WHERE slug = 'https://github.com/OpenAgentsInc/openagents'), 'openagents', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('OpenFlamingo', 'Framework open-source pour l', 'IA multimodale. Une implémentation open-source d', 'un modèle de langage multimodal capable de comprendre à la fois le texte et les images.', (SELECT id FROM categories WHERE slug = 'https://github.com/mlfoundations/open_flamingo'), 'openflamingo', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Orange', 'orange-data-mining', 'Logiciel open-source d', 'analyse de données et d', (SELECT id FROM categories WHERE slug = 'apprentissage automatique avec interface visuelle.'), 'https://orangedatamining.com/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Otter AI', 'otter-ai', 'Assistant de réunion alimenté par l', 'IA qui enregistre l', (SELECT id FROM categories WHERE slug = 'audio, écrit des notes et capture les actions.'), 'https://otter.ai/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('PDF.ai', 'pdf-ai', 'Chatbot qui peut lire et répondre aux questions sur n', 'importe quel document PDF.', (SELECT id FROM categories WHERE slug = 'https://pdf.ai/'), 'productivity', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Pandas', 'Bibliothèque d', 'analyse de données Python. Un outil essentiel pour la manipulation et l', 'analyse de données en science des données.', (SELECT id FROM categories WHERE slug = 'https://pandas.pydata.org/'), 'pandas', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Paperpal', 'paperpal', 'Assistant d', 'écriture académique alimenté par l', (SELECT id FROM categories WHERE slug = 'IA.'), 'https://paperpal.com/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Pearson AI', 'pearson-ai', 'Solutions d', 'apprentissage personnalisé par IA', (SELECT id FROM categories WHERE slug = 'https://images.unsplash.com/photo-1546410531-bb4caa6b424d'), 'https://www.pearson.com', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Perplexity AI', 'perplexity-ai', 'Outils de recherche alimentés par l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://www.perplexity.ai/'), 'search', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Persado', 'persado', 'Optimisation du marketing par l', 'IA cognitive', (SELECT id FROM categories WHERE slug = 'https://images.unsplash.com/photo-1460925895917-afdab827c52f'), 'https://www.persado.com', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Phind', 'phind', 'Moteur de recherche basé sur l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://phind.com/'), 'search', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Pillow', 'Bibliothèque de traitement d', 'images Python. Fork maintenu de PIL pour le traitement d', 'images en Python.', (SELECT id FROM categories WHERE slug = 'https://python-pillow.org/'), 'pillow', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Plask', 'plask', 'Animation 3D automatisée à partir de vidéos avec l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://plask.ai/'), '3d-animation', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Playground AI', 'playground-ai', 'Plateforme de génération d', 'images avec interface intuitive', (SELECT id FROM categories WHERE slug = 'https://playground.ai'), 'generation-images', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Pottery Analyzer', 'pottery-analyzer', 'Outil d', 'analyse de poteries anciennes utilisant l', (SELECT id FROM categories WHERE slug = 'apprentissage profond.'), 'https://potteryanalyzer.org/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Power BI', 'power-bi', 'Solution de Business Intelligence avec fonctionnalités d', 'IA de Microsoft.', (SELECT id FROM categories WHERE slug = 'https://powerbi.microsoft.com/'), 'data-analysis', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Pro', '-pro', 'Solution professionnelle pour', 'https://images.unsplash.com/photo-1677442136019-21780ecad995', (SELECT id FROM categories WHERE slug = 'https://'), '-pro.ai', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('PrusaSlicer', 'prusaslicer', 'Logiciel de préparation d', 'impression 3D avec assistance IA.', (SELECT id FROM categories WHERE slug = 'https://www.prusa3d.com/prusaslicer/'), '[{"plan_name": "Gratuit", "price": 0}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Pymetrics', 'pymetrics', 'Plateforme d', 'évaluation des talents utilisant l', (SELECT id FROM categories WHERE slug = 'IA et les neurosciences.'), 'https://www.pymetrics.ai/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Qlik', 'qlik', 'Plateforme d', 'analyse de données avec IA cognitive.', (SELECT id FROM categories WHERE slug = 'https://www.qlik.com/'), 'data-analysis', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('QuestionAnything', 'Système de questions-réponses basé sur l', 'IA. Un outil qui permet de poser des questions et d', 'obtenir des réponses pertinentes à partir de diverses sources de données.', (SELECT id FROM categories WHERE slug = 'https://www.questionanything.ai/'), 'questionanything', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('RAPIDS', 'Suite d', 'outils data science GPU. Une suite d', 'outils pour exécuter l', (SELECT id FROM categories WHERE slug = 'ensemble du pipeline data science sur GPU.'), 'https://rapids.ai/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('RapidMiner', 'rapidminer', 'Plateforme unifiée pour la science des données et l', 'apprentissage automatique.', (SELECT id FROM categories WHERE slug = 'https://rapidminer.com/'), 'data', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Ray', 'Framework pour applications IA distribuées. Un framework open-source pour mettre à l', 'échelle les applications d', 'IA et de ML.', (SELECT id FROM categories WHERE slug = 'https://www.ray.io/'), 'ray', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Replicate', 'Plateforme pour déployer des modèles d', 'IA. Une plateforme cloud qui permet de déployer et d', 'exécuter des modèles d', (SELECT id FROM categories WHERE slug = 'IA via API, avec versioning et scaling.'), 'https://replicate.com/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Replit', 'replit', 'IDE en ligne avec des capacités d', 'IA pour le développement collaboratif.', (SELECT id FROM categories WHERE slug = 'https://replit.com/'), 'code', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Runway', 'runway', 'Suite créative avec des outils d', 'édition vidéo basés sur l', (SELECT id FROM categories WHERE slug = 'IA.'), 'https://runway.ml/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Runway', 'runwayml', 'Plateforme créative d', 'IA pour les médias.', (SELECT id FROM categories WHERE slug = 'https://runwayml.com/'), '[{"plan_name": "Starter", "price": 0}, {"plan_name": "Pro", "price": 35}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Rytr', 'rytr', 'Assistant d', 'écriture IA pour créer du contenu dans plus de 30 langues.', (SELECT id FROM categories WHERE slug = 'https://rytr.me/'), 'writing', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Scenario', 'scenario', 'Générez des assets pour les jeux avec l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://www.scenario.com/'), 'gaming', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Scispace', 'scispace', 'Plateforme de découverte de recherche alimentée par l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://scispace.com/'), 'research', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Semantic Kernel', 'SDK pour intégrer l', 'IA dans les applications. Un SDK open-source qui permet d', 'intégrer facilement des modèles de langage et d', (SELECT id FROM categories WHERE slug = 'autres capacités d'), 'IA dans les applications.', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Semantic Scholar', 'semantic-scholar', 'Moteur de recherche scientifique alimenté par l', 'IA qui aide à trouver des articles pertinents.', (SELECT id FROM categories WHERE slug = 'https://www.semanticscholar.org/'), 'research', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Sentimentrade', 'sentimentrade', 'Analyse du sentiment du marché en utilisant l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://sentimentrade.com/'), 'finance', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Shopify Magic', 'shopify-magic', 'Suite d', 'outils IA pour e-commerce', (SELECT id FROM categories WHERE slug = 'https://shopify.com/magic'), 'e-commerce', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Simplify3D', 'simplify3d', 'Logiciel professionnel d', 'impression 3D avec analyse IA.', (SELECT id FROM categories WHERE slug = 'https://www.simplify3d.com/'), '[{"plan_name": "Professional", "price": 149}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Sonible', 'sonible', 'Plugins audio intelligents utilisant l', 'IA pour l', (SELECT id FROM categories WHERE slug = 'amélioration sonore.'), 'https://www.sonible.com/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Spellbook', 'spellbook', 'Rédaction et analyse de contrats avec l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://www.spellbook.legal/'), 'legal', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Stability AI', 'Entreprise de développement d', 'IA générative. Créateur de Stable Diffusion et d', 'autres modèles d', (SELECT id FROM categories WHERE slug = 'IA générative open-source.'), 'https://stability.ai/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Stable Diffusion', 'Modèle de génération d', 'images open-source. Un puissant modèle de génération d', 'images qui peut être exécuté localement avec des ressources modestes.', (SELECT id FROM categories WHERE slug = 'https://stability.ai/'), 'stable-diffusion', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Stable Diffusion', 'stable-diffusion', 'Annonce de la sortie publique de Stable Diffusion, un modèle de génération d', 'images basé sur l', (SELECT id FROM categories WHERE slug = 'IA entraîné sur un large échantillon d'), 'internet et sous licence Creative ML OpenRAIL-M.', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('StealthGPT', 'stealthgpt', 'Outil d', 'écriture qui génère du contenu indétectable par les détecteurs d', (SELECT id FROM categories WHERE slug = 'IA.'), 'https://www.stealthgpt.ai/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Sudowrite', 'sudowrite', 'Assistant d', 'écriture créative qui aide à développer des histoires et des personnages.', (SELECT id FROM categories WHERE slug = 'https://www.sudowrite.com/'), 'writing', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('SuperAlign', 'Framework pour l', 'alignement des modèles d', 'IA. Un framework qui aide à aligner les modèles d', (SELECT id FROM categories WHERE slug = 'IA avec les objectifs et les valeurs humaines.'), 'https://github.com/alignment-research/superalign', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Surfer SEO', 'surfer-seo', 'Outil d', 'optimisation de contenu basé sur l', (SELECT id FROM categories WHERE slug = 'IA pour le SEO.'), 'https://surferseo.com/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Tableau', 'tableau', 'Plateforme de visualisation de données avec capacités d', 'IA.', (SELECT id FROM categories WHERE slug = 'https://www.tableau.com/'), 'data-analysis', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Talend', 'talend', 'Suite d', 'intégration et qualité des données.', (SELECT id FROM categories WHERE slug = 'https://www.talend.com/'), '[{"plan_name": "Pro", "price": null}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('TensorFlow', 'Framework d', 'apprentissage automatique. Une plateforme complète pour construire et déployer des modèles d', 'apprentissage automatique.', (SELECT id FROM categories WHERE slug = 'https://www.tensorflow.org/'), 'tensorflow', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Test Tool', 'test-tool', 'Test description', 'https://test.com', (SELECT id FROM categories WHERE slug = '1715f3fe-c800-425e-b5d3-ee8af4477a39'), '[{"plan_name": "Free", "price": 0}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Testim', 'testim', 'Tests automatisés alimentés par l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://www.testim.io/'), 'testing', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Tickeron', 'tickeron', 'Plateforme d', 'analyse financière basée sur l', (SELECT id FROM categories WHERE slug = 'IA.'), 'https://tickeron.com/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Together', 'Plateforme cloud pour l', 'IA. Une plateforme qui fournit l', 'infrastructure et les outils pour entraîner et déployer des modèles d', (SELECT id FROM categories WHERE slug = 'IA.'), 'https://www.together.ai/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Tome', 'tome', 'Génération de présentations narratives avec l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://tome.app/'), 'presentation', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Trade Ideas', 'trade-ideas', 'Plateforme de scanning de marché et d', 'analyse technique avec IA.', (SELECT id FROM categories WHERE slug = 'https://www.trade-ideas.com/'), 'finance', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('TradingView', 'tradingview', 'Plateforme d', 'analyse technique et de trading avec fonctionnalités d', (SELECT id FROM categories WHERE slug = 'IA.'), 'https://www.tradingview.com/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Typeform GPT', 'typeform-gpt', 'Création de formulaires intelligents avec l', 'IA', (SELECT id FROM categories WHERE slug = 'https://images.unsplash.com/photo-1460925895917-afdab827c52f'), 'https://www.typeform.com', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Typeframes', 'typeframes', 'Outil de storytelling qui aide à créer des histoires engageantes avec l', 'IA.', (SELECT id FROM categories WHERE slug = 'https://typeframes.com/'), 'writing', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Ultimaker Cura', 'ultimaker-cura', 'Logiciel de slicing avec IA pour optimisation de l', 'impression 3D.', (SELECT id FROM categories WHERE slug = 'https://ultimaker.com/software/ultimaker-cura'), '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Enterprise", "price": null}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Unity AI', 'unity-ai', 'Suite d', 'outils IA pour Unity', (SELECT id FROM categories WHERE slug = 'https://unity.com/products/ai'), 'gaming', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Unity ML-Agents', 'unity-ml-agents', 'Framework d', 'apprentissage par renforcement pour Unity.', (SELECT id FROM categories WHERE slug = 'https://unity.com/products/machine-learning-agents'), '[{"plan_name": "Gratuit", "price": 0}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Unreal Engine AI', 'unreal-engine-ai', 'Système d', 'IA intégré à Unreal Engine pour les jeux.', (SELECT id FROM categories WHERE slug = 'https://www.unrealengine.com/'), '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Custom", "price": null}]', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Veed', 'veed', 'Plateforme d', 'édition vidéo en ligne avec des fonctionnalités d', (SELECT id FROM categories WHERE slug = 'IA.'), 'https://www.veed.io/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Vercel AI SDK', 'SDK pour construire des applications IA. Un kit de développement qui simplifie l', 'intégration de fonctionnalités d', 'IA dans les applications web.', (SELECT id FROM categories WHERE slug = 'https://sdk.vercel.ai/'), 'vercel-ai-sdk', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Vertex AI', 'Plateforme ML de Google Cloud. Une plateforme unifiée pour construire, déployer et mettre à l', 'échelle des modèles d', 'IA.', (SELECT id FROM categories WHERE slug = 'https://cloud.google.com/vertex-ai'), 'vertex-ai', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Vertex AI', 'vertex-ai', 'Plateforme unifiée d', 'IA/ML de Google Cloud', (SELECT id FROM categories WHERE slug = 'https://images.unsplash.com/photo-1551288049-bebda4e38f71'), 'https://cloud.google.com/vertex-ai', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Voicemod', 'voicemod', 'Modificateur de voix en temps réel utilisant l', 'IA pour des effets créatifs.', (SELECT id FROM categories WHERE slug = 'https://www.voicemod.net/'), 'audio-musique', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('WebDiffusion', 'webdiffusion', 'Outil explorant le potentiel de l', 'IA générative pour le Web', (SELECT id FROM categories WHERE slug = 'https://images.unsplash.com/photo-1677442136019-21780ecad995'), 'https://arxiv.org/abs/2310.17370', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Weights & Biases', 'weights-and-biases', 'Plateforme MLOps pour la collaboration et le suivi d', 'expériences en équipe.', (SELECT id FROM categories WHERE slug = 'https://wandb.ai/'), 'collaboration-ia', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Whisper V3', 'whisper-v3', 'Système de reconnaissance vocale multilingue d', 'OpenAI', (SELECT id FROM categories WHERE slug = 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618'), 'https://openai.com/research/whisper', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Wordtune', 'wordtune', 'Assistant d', 'écriture qui aide à reformuler et améliorer vos textes.', (SELECT id FROM categories WHERE slug = 'https://www.wordtune.com/'), 'writing', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Writefull', 'writefull', 'Outil d', 'amélioration de l', (SELECT id FROM categories WHERE slug = 'écriture académique basé sur l'), 'IA.', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Writer', 'writer', 'Plateforme d', 'IA pour la création de contenu d', (SELECT id FROM categories WHERE slug = 'entreprise'), 'https://images.unsplash.com/photo-1517842645767-c639042777db', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Writesonic', 'writesonic', 'Plateforme d', 'IA pour créer du contenu optimisé pour le SEO.', (SELECT id FROM categories WHERE slug = 'https://writesonic.com/'), 'productivity', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('YOLO', 'Système de détection d', 'objets en temps réel. Un algorithme rapide et précis pour la détection d', 'objets dans les images et les vidéos.', (SELECT id FROM categories WHERE slug = 'https://pjreddie.com/darknet/yolo/'), 'yolo', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('You.com', 'you-com', 'Un moteur de recherche construit sur l', 'IA qui offre aux utilisateurs une expérience de recherche personnalisée tout en gardant leurs données 100% privées.', (SELECT id FROM categories WHERE slug = 'https://you.com/'), 'search', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('Zapier', 'zapier', 'Plateforme d', 'automatisation qui connecte vos apps et automatise les flux de travail avec l', (SELECT id FROM categories WHERE slug = 'IA.'), 'https://zapier.com/', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('data-to-paper', 'Recherche pilotée par l', 'IA des données aux articles de recherche vérifiables. Framework pour naviguer systématiquement dans la puissance de l', 'IA pour effectuer une recherche scientifique complète, des données brutes aux articles scientifiques complets.', (SELECT id FROM categories WHERE slug = 'https://github.com/Technion-Kishony-lab/data-to-paper'), 'data-to-paper', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('fastai', 'Bibliothèque de deep learning de haut niveau. Une couche d', 'abstraction au-dessus de PyTorch qui simplifie l', 'apprentissage profond.', (SELECT id FROM categories WHERE slug = 'https://www.fast.ai/'), 'fastai', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES
('whylogs', 'Framework de logging pour l', 'IA. Un framework open-source pour la collecte de statistiques et le monitoring des systèmes d', 'IA.', (SELECT id FROM categories WHERE slug = 'https://github.com/whylabs/whylogs'), 'whylogs', true, false)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;


COMMIT;
