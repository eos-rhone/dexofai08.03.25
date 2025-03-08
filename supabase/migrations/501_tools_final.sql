-- Migration SQL pour les outils IA

BEGIN;

DROP TABLE IF EXISTS public.ai_tools CASCADE;
DROP TABLE IF EXISTS public.categories CASCADE;

CREATE TABLE public.categories (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    name text NOT NULL,
    slug text NOT NULL UNIQUE,
    description text,
    icon text DEFAULT 'default-icon.svg',
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);

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
INSERT INTO public.categories (name, slug, description, icon) VALUES ('Assistants & Chatbots', 'assistants-chatbots', 'Agents conversationnels et assistants virtuels intelligents', 'MessageSquare');
INSERT INTO public.categories (name, slug, description, icon) VALUES ('Éducation', 'education', 'Outils d''''apprentissage et de formation par IA', 'GraduationCap');
INSERT INTO public.categories (name, slug, description, icon) VALUES ('3D & Animation', '3d-animation', 'Outils de création 3D et animation', 'Cube');
INSERT INTO public.categories (name, slug, description, icon) VALUES ('Traduction', 'traduction', 'Outils de traduction et localisation', 'Globe');
INSERT INTO public.categories (name, slug, description, icon) VALUES ('E-commerce', 'e-commerce', 'Solutions IA pour le commerce en ligne', 'ShoppingCart');
INSERT INTO public.categories (name, slug, description, icon) VALUES ('RH & Recrutement', 'rh-recrutement', 'Outils IA pour les ressources humaines', 'Users');
INSERT INTO public.categories (name, slug, description, icon) VALUES ('Gaming', 'gaming', 'IA pour les jeux vidéo', 'Gamepad');
INSERT INTO public.categories (name, slug, description, icon) VALUES ('Agriculture', 'agriculture', 'IA pour l''''agriculture', 'Leaf');
INSERT INTO public.categories (name, slug, description, icon) VALUES ('Transport', 'transport', 'IA pour les transports', 'Truck');
INSERT INTO public.categories (name, slug, description, icon) VALUES ('Industrie', 'industrie', 'IA pour l''''industrie 4.0', 'Factory');
INSERT INTO public.categories (name, slug, description, icon) VALUES ('Agroalimentaire', 'agroalimentaire', 'IA pour l''''industrie alimentaire', 'Coffee');

-- Insère les outils
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'AgentGPT', 'plateforme-no-code-basée-sur-le-navigateur-permettant-de-créer-et-déployer-des-agents-ia-autonomes.-utilise-les-fonctions-openai-et-prend-en-charge-gpt-3.5-16k-avec-des-bases-de-données-pinecone-et-pg_vector.', 'https://agentgpt.reworkd.ai/', 'Agents & Automatisation', (SELECT id FROM public.categories WHERE slug = '[{');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'ChatDev', 'assistant-de-développement-logiciel-qui-simule-une-entreprise-de-développement-logiciel-avec-plusieurs-agents-ia-collaborant-sur-des-projets.', 'https://github.com/OpenBMB/ChatDev', 'Génération de Code', (SELECT id FROM public.categories WHERE slug = '[{');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Midjourney', 'outil-de-génération-d''''images-ia-créant-des-visuels-artistiques-de-haute-qualité-à-partir-de-descriptions-textuelles.', 'https://www.midjourney.com/', 'Génération d''''Images', (SELECT id FROM public.categories WHERE slug = '[{');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Notion AI', 'notion-ai-assistant', 'Assistant d''''écriture et d''''organisation intégré à Notion, aidant à la rédaction, au résumé et à l''''analyse de contenu.', 'https://www.notion.so/product/ai'',
        productivite_id,
        ''[{"plan_name": "With Notion', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Figma AI', 'figma-ai-design', 'Ensemble d''''outils IA intégrés à Figma pour améliorer le processus de design, incluant la génération de variantes et l''''aide à la mise en page.', 'https://www.figma.com/ai'',
        design_id,
        ''[{"plan_name": "Included', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'AIlice', 'ailice-task-planner', 'Agent sous forme de chatbot qui planifie indépendamment les tâches données en langage naturel et crée dynamiquement un arbre d''''appels d''''agents pour les exécuter.', 'https://github.com/myshell-ai/AIlice'',
        productivite_id,
        ''[{"plan_name": "Open Source', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Adala', 'adala', 'Framework d''''annotation de données qui utilise l''''IA pour automatiser et améliorer le processus d''''étiquetage des données, avec un focus sur la qualité et l''''efficacité.', 'https://github.com/HumanSignal/Adala'',
        outils_donnees_id,
        ''[{"plan_name": "Open Source', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Agent4Rec', 'agent4rec', 'Système de recommandation basé sur des agents IA qui personnalise les suggestions en fonction des préférences et du comportement des utilisateurs.', 'https://github.com/LehengTHU/Agent4Rec'',
        recommandation_id,
        ''[{"plan_name": "Open Source', (SELECT id FROM public.categories WHERE slug = 'agentforge');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'AgentForge', 'agentforge', 'Plateforme de développement d''''agents IA qui simplifie la création et le déploiement d''''agents autonomes pour diverses tâches.', 'https://github.com/DataBassGit/AgentForge'',
        dev_agents_id,
        ''[{"plan_name": "Open Source', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'BabyAGI', 'babyagi', 'Framework simple pour la gestion des tâches utilisant l''''IA. Crée et priorise automatiquement des tâches basées sur un objectif prédéfini.', 'https://github.com/yoheinakajima/babyagi'',
        gestion_taches_id,
        ''[{"plan_name": "Open Source', (SELECT id FROM public.categories WHERE slug = 'babybeeagi');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'BabyBeeAGI', 'babybeeagi', 'Version améliorée de BabyAGI avec une gestion des tâches plus complexe, permettant une analyse et une synthèse plus complètes des informations.', 'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyBeeAGI.py'',
        gestion_taches_id,
        ''[{"plan_name": "Open Source', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'BabyCatAGI', 'babycatagi', 'Modification de BabyBeeAGI avec seulement 300 lignes de code. Inclut un agent de création de tâches unique.', 'https://replit.com/@YoheiNakajima/BabyCatAGI'',
        gestion_taches_id,
        ''[{"plan_name": "Open Source', (SELECT id FROM public.categories WHERE slug = 'autogpt');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'BabyDeerAGI', 'babydeeragi', 'Version de BabyAGI avec environ 350 lignes de code, offrant des tâches parallèles et utilisant GPT-3.5-turbo.', 'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyDeerAGI.py'',
        gestion_taches_id,
        ''[{"plan_name": "Open Source', (SELECT id FROM public.categories WHERE slug = 'babyelfagi');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'BabyElfAGI', 'babyelfagi', 'Évolution de BabyDeerAGI avec environ 895 lignes de code. Inclut une classe de compétences personnalisables.', 'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyElfAGI/main.py'',
        gestion_taches_id,
        ''[{"plan_name": "Open Source', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Adala', 'framework-d''''agent-autonome-pour-l''''étiquetage-de-données.-caractéristiques-principales-:-agents-fiables-basés-sur-des-données-vérifiées,-sortie-contrôlable-avec-contraintes-flexibles,-spécialisé-dans-le-traitement-et-l''''étiquetage-personnalisé-des-données,-apprentissage-autonome-via-observations-et-réflexions,-runtime-flexible-et-extensible,-et-facilement-personnalisable-pour-des-défis-uniques.', 'https://github.com/HumanSignal/Adala', 'adala'',
        agent_category_id
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Agent4Rec', (SELECT id FROM public.categories WHERE slug = 'Simulateur de système de recommandation utilisant 1000 agents génératifs basés sur LLM. Les agents sont initialisés à partir du dataset MovieLens-1M, incarnant divers traits sociaux et préférences. Chaque agent interagit avec des recommandations de films personnalisées et effectue diverses actions comme regarder, évaluer, et interviewer.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'AgentForge', 'plateforme-agnostique-llm-pour-la-construction-et-le-test-d''''agents.-framework-low-code-conçu-pour-la-création-rapide,-le-test-et-l''''itération-d''''agents-autonomes-ia-et-d''''architectures-cognitives.-compatible-avec-divers-modèles-llm-comme-openai-et-claude-d''''anthropic.', 'https://github.com/DataBassGit/AgentForge', 'agentforge'',
        agent_category_id
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''AgentGPT', (SELECT id FROM public.categories WHERE slug = 'Version no-code basée sur navigateur d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'AgentPilot', 'application-de-bureau-pour-construire,-gérer-et-discuter-avec-des-agents-ia.-intégré-avec-open-interpreter-et-memgpt,-offrant-des-fonctionnalités-de-chat-en-groupe.', 'https://github.com/jbexta/AgentPilot', 'agentpilot''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Agents', (SELECT id FROM public.categories WHERE slug = 'Bibliothèque/framework pour construire des agents linguistiques. Équipé de mémoire à court et long terme via VectorDB, capacités d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'AgentVerse', 'plateforme-pour-la-résolution-de-tâches-et-la-simulation-d''''agents.-permet-d''''assembler-plusieurs-agents-pour-accomplir-des-tâches-collaborativement-et-de-créer-des-environnements-personnalisés-pour-observer-ou-interagir-avec-de-multiples-agents.', 'https://github.com/OpenBMB/AgentVerse', 'agentverse''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''AI Legion', (SELECT id FROM public.categories WHERE slug = 'Plateforme multi-agents TypeScript, similaire à AutoGPT. Une plateforme d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Aider', 'outil-en-ligne-de-commande-pour-éditer-du-code-dans-votre-dépôt-local.-permet-de-faire-de-la-programmation-en-binôme-avec-gpt-3.5/gpt-4,-de-démarrer-un-nouveau-projet-ou-de-travailler-sur-un-dépôt-existant.-les-modifications-sont-automatiquement-committées-avec-des-messages-pertinents.', 'https://github.com/paul-gauthier/aider', 'aider''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''AIlice', (SELECT id FROM public.categories WHERE slug = 'Créez des arbres d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'AutoGen', 'framework-multi-agents-avec-une-grande-diversité-d''''agents.-permet-de-développer-des-applications-llm-avec-plusieurs-agents-conversationnels-qui-peuvent-collaborer-pour-résoudre-des-tâches-et-interagir-avec-les-humains.-simplifie-les-workflows-llm-complexes-et-améliore-l''''inférence-avec-des-fonctionnalités-de-réglage-des-performances.', 'https://github.com/microsoft/autogen', 'autogen''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''AutoGPT', (SELECT id FROM public.categories WHERE slug = 'Tentative expérimentale open-source de rendre GPT-4 totalement autonome. Enchaîne les ');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Automata', 'génère-du-code-basé-sur-le-contexte-de-votre-projet.-utilise-gpt-4-pour-prendre-votre-projet-comme-contexte,-recevoir-des-tâches-et-exécuter-les-instructions-de-manière-transparente.-vise-à-évoluer-vers-un-système-d''''ia-auto-programmable-entièrement-autonome.', 'https://github.com/emrgnt-cmplxty/automata', 'automata''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''AutoPR', (SELECT id FROM public.categories WHERE slug = 'Agent de pull requests générées par IA qui corrige les problèmes. Déclenché en ajoutant un label contenant AutoPR à un problème, il planifie une correction, écrit le code, pousse une branche et ouvre une pull request.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Autonomous HR Chatbot', 'agent-qui-répond-aux-requêtes-rh-en-utilisant-des-outils.-une-application-d''''entreprise-prototype---un-assistant-rh-autonome-alimenté-par-gpt-3.5-qui-peut-répondre-aux-questions-rh-de-manière-autonome-en-utilisant-des-outils-comme-la-politique-de-pointage,-les-données-des-employés-et-une-calculatrice.', 'https://github.com/stepanogil/autonomous-hr-chatbot', 'autonomous-hr-chatbot''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''BabyAGI', (SELECT id FROM public.categories WHERE slug = 'Framework simple pour gérer des tâches en utilisant l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'BabyBeeAGI', 'extension-de-babyagi-pour-la-gestion-des-tâches-et-des-fonctionnalités.-version-plus-avancée-du-code-babyagi-original,-introduisant-une-invite-de-gestion-des-tâches-plus-complexe-pour-une-analyse-et-une-synthèse-plus-complètes-des-informations.', 'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyBeeAGI.py', 'babybeeagi''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''BabyCatAGI', (SELECT id FROM public.categories WHERE slug = 'Modification de BabyBeeAGI en seulement 300 lignes de code. Inclut des fonctionnalités comme l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'BabyDeerAGI', 'modification-de-babyagi-en-environ-350-lignes-de-code.-caractéristiques-:-tâches-parallèles-(plus-rapide
on-conflict-(slug)-do-update-set
----name-=-excluded.name,
----description-=-excluded.description,
----website_url-=-excluded.website_url,
----category_id-=-excluded.category_id,
----pricing-=-excluded.pricing,
----is_active-=-excluded.is_active,
----is_featured-=-excluded.is_featured,
----updated_at-=-current_timestamp;

insert-into-public.ai_tools-(name,-slug,-description,-website_url,-category_id,-pricing,-is_active,-is_featured)-values-
--------''babyelfagi', 'Modification de BabyDeerAGI avec environ 895 lignes de code. Caractéristiques : classe de compétences permettant la création de nouvelles compétences, exemple de "liste de tâches dynamique" avec recherche vectorielle, agent de réflexion bêta, et capacité à lire, écrire et réviser son propre code.', 'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyElfAGI/main.py', (SELECT id FROM public.categories WHERE slug = 'babyelfagi');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'BabyCommandAGI', 'test-de-combinaison-entre-cli-et-llm.-un-agent-conçu-pour-tester-l''''interaction-entre-l''''interface-en-ligne-de-commande-et-les-modèles-de-langage.-basé-sur-babyagi,-il-peut-exécuter-des-commandes-shell-et-réaliser-de-la-programmation-automatique.', 'https://github.com/saten-private/BabyCommandAGI', 'babycommandagi''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''BabyFoxAGI', (SELECT id FROM public.categories WHERE slug = 'Modification de BabyAGI avec un nouveau panneau d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'BambooAI', 'exploration-et-analyse-de-données-pour-non-programmeurs.-fonctionne-en-boucle,-permet-le-mélange-de-différents-modèles,-maintient-la-mémoire-des-conversations-précédentes,-et-construit-des-prompts-dynamiquement-en-utilisant-un-contexte-pertinent-de-la-base-de-données-vectorielle-pinecone.', 'https://github.com/pgalko/BambooAI', 'bambooai''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''BeeBot', (SELECT id FROM public.categories WHERE slug = 'Projet en phase initiale pour une large gamme de tâches. Actuellement en développement, il est considéré comme un projet de recherche en phase précoce, non destiné à une utilisation en production.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Blinky', 'agent-de-débogage-ia-open-source-pour-vscode.-utilise-les-llm-pour-identifier-et-corriger-les-erreurs-de-code-backend,-s''''appuyant-sur-l''''api-vscode,-le-protocole-lsp-et-le-débogage-par-instruction-print.', 'https://github.com/seahyinghang8/blinky', 'blinky''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Bloop', (SELECT id FROM public.categories WHERE slug = 'Recherche de code IA, fonctionne pour Rust et TypeScript. Un moteur de recherche sémantique alimenté par GPT-4 utilisant un agent IA, offrant une navigation précise du code et construit sur des graphes de pile.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'BondAI', 'interpréteur-de-code-avec-cli-et-api-restful/websocket.-un-agent-ia-autonome-hautement-capable-avec-une-cli-facile-à-utiliser,-une-api-restful/websocket,-une-image-docker-pré-construite-et-une-suite-robuste-d''''outils-intégrés.', 'https://bondai.dev/', 'bondai''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''bumpgen', (SELECT id FROM public.categories WHERE slug = 'Agent IA qui maintient les dépendances npm à jour. Met la gestion et les mises à jour des dépendances en pilote automatique, met à jour la version d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Cal.ai', 'assistant-de-planification-open-source-construit-sur-cal.com.-peut-réserver-des-réunions,-résumer-votre-semaine-et-trouver-du-temps-avec-d''''autres-personnes-en-utilisant-le-langage-naturel.', 'https://cal.ai', 'calai''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''CAMEL', (SELECT id FROM public.categories WHERE slug = 'Architecture pour l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'ChatArena', 'outil-de-chat-pour-l''''interaction-multi-agents.-un-environnement-de-jeu-de-langage-multi-agents-pour-llms,-visant-à-développer-les-capacités-de-communication-et-de-collaboration-des-ia.', 'https://www.chatarena.org/', 'chatarena''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''ChatDev', (SELECT id FROM public.categories WHERE slug = 'Agents communicatifs pour le développement logiciel. Une entreprise logicielle virtuelle pilotée par de multiples agents intelligents assumant différents rôles (CEO, CPO, CTO, programmeur, reviewer, testeur, designer
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Clippy', 'agent-capable-de-planifier,-écrire,-déboguer-et-tester-du-code.-peut-développer-du-code-de-manière-autonome-ou-en-collaboration-avec-l''''utilisateur.', 'https://github.com/ennucore/clippy/', 'clippy''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''CodeFuse-ChatBot', (SELECT id FROM public.categories WHERE slug = 'Agent servant l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Cody by ajhous44', 'interrogez-et-naviguez-dans-votre-base-de-code.-un-assistant-ia-conçu-pour-interroger-votre-base-de-code-en-langage-naturel,-utilisant-des-embeddings-vectoriels-et-les-modèles-de-langage-d''''openai.', 'https://github.com/ajhous44/cody', 'cody-ajhous44''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Cody by Sourcegraph', (SELECT id FROM public.categories WHERE slug = 'Agent qui écrit du code et répond à vos questions. Un assistant de code IA de Sourcegraph qui écrit du code et répond aux questions en lisant l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Continue', 'pilote-automatique-open-source-pour-le-développement-logiciel.-apporte-la-puissance-de-chatgpt-à-vs-code-avec-des-fonctionnalités-comme-la-réponse-aux-questions-de-codage,-l''''édition-en-langage-naturel-et-la-génération-de-fichiers.', 'https://continue.dev/', 'continue''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''CrewAI', (SELECT id FROM public.categories WHERE slug = 'Framework pour orchestrer des agents jouant des rôles. Framework de pointe pour orchestrer des agents IA autonomes jouant des rôles, permettant une collaboration intelligente pour résoudre des tâches complexes.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'data-to-paper', 'recherche-pilotée-par-l''''ia-des-données-aux-articles-de-recherche-vérifiables.-framework-pour-naviguer-systématiquement-dans-la-puissance-de-l''''ia-pour-effectuer-une-recherche-scientifique-complète,-des-données-brutes-aux-articles-scientifiques-complets.', 'https://github.com/Technion-Kishony-lab/data-to-paper', 'data-to-paper''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Databerry', (SELECT id FROM public.categories WHERE slug = 'Construction de chatbot sans code (Pivoted to Chaindesk
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Devin', 'premier-ingénieur-logiciel-ia-autonome-au-monde.-un-agent-ia-capable-de-contribuer-à-des-projets-logiciels-comme-un-ingénieur-humain,-pouvant-planifier,-écrire-et-déboguer-du-code-de-manière-autonome.', 'https://www.cognition-labs.com/devin', 'devin''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''DocsGPT', (SELECT id FROM public.categories WHERE slug = 'Solution open-source pour interroger la documentation technique. Un chatbot IA open-source qui simplifie la recherche et la compréhension de la documentation technique, avec une interface web et une extension VSCode.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'DotAgent', 'agent-ia-pour-l''''automatisation-des-tâches-de-développement.-un-agent-ia-conçu-pour-automatiser-les-tâches-de-développement-répétitives,-capable-de-comprendre-et-d''''exécuter-des-instructions-en-langage-naturel.', 'https://github.com/DotAgent', 'dotagent''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''DrugAI', (SELECT id FROM public.categories WHERE slug = 'Agent IA pour la découverte de médicaments. Un agent autonome spécialisé dans la recherche et la découverte de nouveaux médicaments, utilisant l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'E2B', 'infrastructure-pour-exécuter-des-agents-ia-en-toute-sécurité.-une-plateforme-cloud-qui-permet-d''''exécuter-des-agents-ia-dans-des-environnements-isolés-et-sécurisés,-avec-accès-à-des-outils-et-des-api.', 'https://e2b.dev', 'e2b''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Embedchain', (SELECT id FROM public.categories WHERE slug = 'Framework pour construire des chatbots RAG. Un framework Python qui simplifie la création de chatbots avec Retrieval Augmented Generation (RAG
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'ExcelFormulaBot', 'assistant-ia-pour-les-formules-excel.-un-bot-qui-aide-à-créer-et-à-comprendre-les-formules-excel-complexes,-traduisant-les-descriptions-en-langage-naturel-en-formules-fonctionnelles.', 'https://excelformulabot.com/', 'excelformulabot''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''FastGPT', (SELECT id FROM public.categories WHERE slug = 'Plateforme pour construire des applications IA rapidement. Une plateforme qui permet de construire rapidement des applications basées sur les LLMs, avec des fonctionnalités de traitement de données et d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'FlowiseAI', 'interface-drag-&-drop-pour-construire-des-flux-langchain.-un-outil-open-source-qui-permet-de-construire-des-chaînes-langchain-personnalisées-avec-une-interface-visuelle-intuitive.', 'https://flowiseai.com/', 'flowiseai''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Functionary', (SELECT id FROM public.categories WHERE slug = 'LLM entraîné pour l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Genius AI', 'plateforme-no-code-pour-créer-des-agents-ia.-une-plateforme-qui-permet-de-créer-des-agents-ia-personnalisés-sans-code,-avec-des-capacités-de-traitement-du-langage-naturel-et-d''''automatisation.', 'https://www.genius.design/', 'genius-ai''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''GPT Engineer', (SELECT id FROM public.categories WHERE slug = 'Agent qui spécifie, écrit et améliore le code. Un outil qui permet de générer des applications complètes à partir de descriptions en langage naturel, en utilisant GPT pour la génération de code.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'GPT Researcher', 'agent-autonome-pour-la-recherche-approfondie.-un-agent-ia-capable-de-mener-des-recherches-approfondies-sur-n''''importe-quel-sujet-et-de-générer-des-rapports-détaillés-avec-des-citations.', 'https://github.com/assafelovic/gpt-researcher', 'gpt-researcher''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''GPT Pilot', (SELECT id FROM public.categories WHERE slug = 'Développeur IA qui écrit des applications évolutives. Un copilote de développement qui peut écrire des applications complètes et évolutives, en interagissant avec l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'GPT Teacher', 'assistant-d''''enseignement-personnalisé-alimenté-par-l''''ia.-un-agent-ia-conçu-pour-fournir-un-enseignement-personnalisé,-créer-des-plans-de-cours-et-générer-du-matériel-pédagogique-adapté-aux-besoins-de-l''''apprenant.', 'https://github.com/CognitiveCanvas/GPTTeacher', 'gpt-teacher''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''GPTStore', (SELECT id FROM public.categories WHERE slug = 'Marketplace pour les agents GPT personnalisés. Une plateforme permettant de découvrir, partager et monétiser des agents GPT personnalisés pour diverses applications.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'GPTs', 'versions-personnalisées-de-chatgpt-par-openai.-des-versions-sur-mesure-de-chatgpt-qui-peuvent-être-créées-sans-code-pour-des-cas-d''''utilisation-spécifiques,-avec-des-capacités-et-des-connaissances-personnalisées.', 'https://openai.com/gpts', 'gpts''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Guardrails', (SELECT id FROM public.categories WHERE slug = 'Toolkit pour contrôler les sorties LLM. Un ensemble d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Guidance', 'langage-pour-contrôler-les-llms.-un-langage-de-programmation-conçu-pour-contrôler-précisément-les-modèles-de-langage,-permettant-des-interactions-structurées-et-des-sorties-formatées.', 'https://github.com/microsoft/guidance', 'guidance''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Haystack', (SELECT id FROM public.categories WHERE slug = 'Framework pour créer des applications NLP. Un framework open-source pour construire des applications de traitement du langage naturel, avec des composants pour la recherche sémantique et les questions-réponses.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Helicone', 'plateforme-d''''observabilité-pour-llms.-une-plateforme-qui-fournit-des-analyses-détaillées-et-un-suivi-des-performances-pour-les-applications-basées-sur-les-modèles-de-langage.', 'https://www.helicone.ai/', 'helicone''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''HttpsGPT', (SELECT id FROM public.categories WHERE slug = 'Utilisation sécurisée de l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Hugging Face', 'plateforme-pour-partager-des-modèles-et-des-datasets.-la-plus-grande-plateforme-pour-partager-des-modèles-d''''ia,-des-datasets-et-des-applications,-avec-une-communauté-active-de-chercheurs-et-de-développeurs.', 'https://huggingface.co/', 'hugging-face''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''IX', (SELECT id FROM public.categories WHERE slug = 'Framework pour créer des agents IA. Un framework moderne pour créer des agents IA autonomes capables d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'JamesGPT', 'assistant-personnel-alimenté-par-gpt.-un-assistant-ia-personnel-qui-peut-gérer-des-tâches-quotidiennes,-répondre-à-des-questions-et-fournir-des-informations-personnalisées.', 'https://jamesgpt.com/', 'jamesgpt''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Khoj', (SELECT id FROM public.categories WHERE slug = 'Assistant IA pour rechercher dans vos notes. Un assistant IA open-source qui aide à rechercher et à naviguer dans vos notes personnelles, avec une compréhension contextuelle.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'LangChain', 'framework-pour-développer-des-applications-avec-llms.-un-framework-populaire-pour-développer-des-applications-utilisant-des-modèles-de-langage,-avec-des-composants-pour-le-chaînage-d''''actions-et-la-gestion-de-contexte.', 'https://langchain.com/', 'langchain''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Language Tools', (SELECT id FROM public.categories WHERE slug = 'Collection d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'LlamaHub', 'collection-de-connecteurs-de-données-pour-llms.-une-bibliothèque-open-source-de-connecteurs-de-données-pour-intégrer-diverses-sources-de-données-avec-des-modèles-de-langage.', 'https://llamahub.ai/', 'llamahub''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''LlamaIndex', (SELECT id FROM public.categories WHERE slug = 'Framework pour connecter des données personnalisées aux LLMs. Un framework qui permet d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'LocalAI', 'alternative-open-source-à-openai.-un-drop-in-replacement-local-pour-l''''api-openai,-permettant-d''''exécuter-des-modèles-d''''ia-en-local-avec-une-api-compatible.', 'https://localai.io/', 'localai''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Marvin', (SELECT id FROM public.categories WHERE slug = 'Framework pour construire des agents IA. Un framework lightweight pour construire des agents IA qui peuvent comprendre et exécuter des tâches complexes.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'MemGPT', 'extension-de-mémoire-pour-les-llms.-un-système-qui-permet-aux-modèles-de-langage-de-maintenir-des-conversations-longues-avec-une-gestion-efficace-de-la-mémoire.', 'https://github.com/cpacker/MemGPT', 'memgpt''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''MetaGPT', (SELECT id FROM public.categories WHERE slug = 'Framework multi-agents pour le développement logiciel. Un framework qui assigne différents rôles (PO, architecte, développeur, testeur
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'MRKL', 'système-modulaire-pour-combiner-llms-et-outils-externes.-une-architecture-qui-combine-des-modèles-de-langage-avec-des-outils-spécialisés-pour-résoudre-des-problèmes-complexes.', 'https://github.com/microsoft/MRKL', 'mrkl''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''MultiAgent', (SELECT id FROM public.categories WHERE slug = 'Framework pour créer des systèmes multi-agents. Un framework permettant de créer et de gérer des systèmes avec plusieurs agents IA collaborant ensemble.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Multimodal', 'agents-ia-capables-de-traiter-plusieurs-types-de-données.-des-agents-qui-peuvent-comprendre-et-traiter-différents-types-de-données-(texte,-images,-audio
on-conflict-(slug)-do-update-set
----name-=-excluded.name,
----description-=-excluded.description,
----website_url-=-excluded.website_url,
----category_id-=-excluded.category_id,
----pricing-=-excluded.pricing,
----is_active-=-excluded.is_active,
----is_featured-=-excluded.is_featured,
----updated_at-=-current_timestamp;

insert-into-public.ai_tools-(name,-slug,-description,-website_url,-category_id,-pricing,-is_active,-is_featured)-values-
--------''notebooklm', 'Assistant IA pour la prise de notes intelligente. Un outil d''''IA qui aide à organiser, analyser et extraire des informations de vos notes et documents.', 'https://notebooklm.google/', (SELECT id FROM public.categories WHERE slug = 'notebooklm');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'OctoAI', 'plateforme-d''''inférence-pour-modèles-d''''ia.-une-plateforme-cloud-qui-permet-de-déployer-et-d''''exécuter-des-modèles-d''''ia-avec-une-mise-à-l''''échelle-automatique.', 'https://octoai.cloud/', 'octoai''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Ollama', (SELECT id FROM public.categories WHERE slug = 'Exécution locale de LLMs sur votre machine. Un outil qui permet d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'OpenAgents', 'collection-open-source-d''''agents-ia.-une-collection-d''''agents-ia-open-source-pour-différentes-tâches,-avec-des-capacités-de-traitement-du-langage-naturel.', 'https://github.com/OpenAgentsInc/openagents', 'openagents''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''OpenAssistant', (SELECT id FROM public.categories WHERE slug = 'Assistant conversationnel open-source. Un projet communautaire pour créer un assistant IA conversationnel open-source, transparent et accessible à tous.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'OpenCopilot', 'framework-open-source-pour-créer-des-copilotes-ia.-une-solution-pour-construire-des-assistants-ia-personnalisés-qui-peuvent-être-intégrés-dans-n''''importe-quelle-application-saas.', 'https://github.com/openchatai/OpenCopilot', 'opencopilot''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''OpenFlamingo', (SELECT id FROM public.categories WHERE slug = 'Framework open-source pour l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Open Interpreter', 'assistant-qui-peut-exécuter-du-code-sur-votre-ordinateur.-un-interpréteur-de-langage-naturel-qui-permet-aux-modèles-de-langage-d''''exécuter-du-code-sur-votre-machine-locale.', 'https://github.com/KillianLucas/open-interpreter', 'open-interpreter''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''OSS Insight', (SELECT id FROM public.categories WHERE slug = 'Plateforme d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Petals', 'exécution-distribuée-de-llms-via-bittorrent.-une-plateforme-qui-permet-d''''exécuter-de-grands-modèles-de-langage-de-manière-distribuée-en-utilisant-le-protocole-bittorrent.', 'https://github.com/bigscience-workshop/petals', 'petals''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Phind', (SELECT id FROM public.categories WHERE slug = 'Moteur de recherche IA pour développeurs. Un moteur de recherche spécialisé qui utilise l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Portkey', 'sdk-pour-intégrer-l''''ia-dans-les-applications.-un-sdk-qui-simplifie-l''''intégration-de-fonctionnalités-d''''ia-dans-les-applications,-avec-gestion-des-modèles-et-des-prompts.', 'https://portkey.ai/', 'portkey''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''PrivateGPT', (SELECT id FROM public.categories WHERE slug = 'LLM local pour documents confidentiels. Une solution pour interagir avec des documents privés en utilisant des modèles de langage exécutés localement, sans envoi de données.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'PromptFlow', 'plateforme-pour-développer-des-applications-llm.-un-outil-pour-construire,-optimiser-et-déployer-des-applications-basées-sur-des-llms-de-manière-efficace.', 'https://microsoft.github.io/promptflow/', 'promptflow''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Promptfoo', (SELECT id FROM public.categories WHERE slug = 'Outil de test et d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'PromptLayer', 'plateforme-de-gestion-de-prompts-pour-llms.-une-plateforme-pour-gérer,-versionner-et-optimiser-les-prompts-utilisés-avec-les-modèles-de-langage.', 'https://promptlayer.com/', 'promptlayer''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''PromptTools', (SELECT id FROM public.categories WHERE slug = 'Suite d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Pythagora', 'plateforme-de-test-pour-applications-ia.-une-plateforme-qui-permet-de-tester-automatiquement-les-applications-basées-sur-l''''ia-pour-assurer-leur-qualité.', 'https://github.com/Pythagora-io/pythagora', 'pythagora''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''QuestionAnything', (SELECT id FROM public.categories WHERE slug = 'Système de questions-réponses basé sur l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Ragas', 'framework-d''''évaluation-pour-systèmes-rag.-un-framework-pour-évaluer-les-performances-des-systèmes-de-génération-augmentée-par-la-récupération-(rag
on-conflict-(slug)-do-update-set
----name-=-excluded.name,
----description-=-excluded.description,
----website_url-=-excluded.website_url,
----category_id-=-excluded.category_id,
----pricing-=-excluded.pricing,
----is_active-=-excluded.is_active,
----is_featured-=-excluded.is_featured,
----updated_at-=-current_timestamp;

insert-into-public.ai_tools-(name,-slug,-description,-website_url,-category_id,-pricing,-is_active,-is_featured)-values-
--------''rags', 'Framework pour la génération augmentée par récupération. Un framework qui combine la récupération d''''informations avec la génération de texte pour produire des réponses plus précises.', 'https://github.com/explodinggradients/rags', (SELECT id FROM public.categories WHERE slug = 'rags');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Replicate', 'plateforme-pour-déployer-des-modèles-d''''ia.-une-plateforme-cloud-qui-permet-de-déployer-et-d''''exécuter-des-modèles-d''''ia-via-api,-avec-versioning-et-scaling.', 'https://replicate.com/', 'replicate''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Rivet', (SELECT id FROM public.categories WHERE slug = 'Éditeur visuel pour créer des agents IA. Un éditeur visuel de type node qui permet de créer et de configurer des agents IA de manière intuitive.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Semantic Kernel', 'sdk-pour-intégrer-l''''ia-dans-les-applications.-un-sdk-open-source-qui-permet-d''''intégrer-facilement-des-modèles-de-langage-et-d''''autres-capacités-d''''ia-dans-les-applications.', 'https://github.com/microsoft/semantic-kernel', 'semantic-kernel''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Shell GPT', (SELECT id FROM public.categories WHERE slug = 'Assistant en ligne de commande alimenté par GPT. Un outil en ligne de commande qui utilise GPT pour aider avec les commandes shell et l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Sidekick', 'assistant-de-programmation-basé-sur-l''''ia.-un-assistant-qui-aide-les-développeurs-en-fournissant-des-suggestions-de-code-et-des-explications-contextuelles.', 'https://www.sidekick.com/', 'sidekick''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''SuperAgent', (SELECT id FROM public.categories WHERE slug = 'Plateforme pour déployer des agents IA. Une plateforme qui simplifie le déploiement et la gestion d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'SuperAlign', 'framework-pour-l''''alignement-des-modèles-d''''ia.-un-framework-qui-aide-à-aligner-les-modèles-d''''ia-avec-les-objectifs-et-les-valeurs-humaines.', 'https://github.com/alignment-research/superalign', 'superalign''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Sweep', (SELECT id FROM public.categories WHERE slug = 'Agent IA pour la gestion de code. Un agent qui aide à gérer les bugs, les refactorisations et les améliorations de code via des pull requests.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Tabby', 'assistant-de-codage-auto-hébergé.-un-assistant-de-codage-open-source-qui-peut-être-hébergé-localement-pour-plus-de-confidentialité-et-de-contrôle.', 'https://github.com/TabbyML/tabby', 'tabby''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''TaskWeaver', (SELECT id FROM public.categories WHERE slug = 'Framework pour créer des applications basées sur les tâches. Un framework qui permet de créer des applications qui décomposent et exécutent des tâches complexes.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Textbase', 'framework-pour-créer-des-chatbots-ia.-un-framework-python-pour-créer-des-chatbots-personnalisés-avec-des-modèles-de-langage.', 'https://github.com/textbase-ai/textbase', 'textbase''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Together', (SELECT id FROM public.categories WHERE slug = 'Plateforme cloud pour l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Toolformer', 'modèle-de-langage-qui-apprend-à-utiliser-des-outils.-un-modèle-qui-peut-apprendre-à-utiliser-des-api-et-des-outils-externes-pour-augmenter-ses-capacités.', 'https://github.com/lucidrains/toolformer-pytorch', 'toolformer''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Transformers', (SELECT id FROM public.categories WHERE slug = 'Bibliothèque de modèles de langage pré-entraînés. Une bibliothèque qui fournit des milliers de modèles pré-entraînés pour diverses tâches de traitement du langage.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Typebot', 'constructeur-de-chatbots-conversationnels.-une-alternative-open-source-à-typeform-qui-permet-de-créer-des-chatbots-conversationnels-avec-une-interface-drag-&-drop.', 'https://typebot.io/', 'typebot''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Unstructured', (SELECT id FROM public.categories WHERE slug = 'Bibliothèque pour extraire du texte de documents. Une bibliothèque open-source pour pré-traiter et extraire du texte à partir de documents non structurés.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Vercel AI SDK', 'sdk-pour-construire-des-applications-ia.-un-kit-de-développement-qui-simplifie-l''''intégration-de-fonctionnalités-d''''ia-dans-les-applications-web.', 'https://sdk.vercel.ai/', 'vercel-ai-sdk''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''vLLM', (SELECT id FROM public.categories WHERE slug = 'Bibliothèque pour servir des LLMs. Une bibliothèque open-source pour servir des LLMs avec une mise en cache optimisée et une latence réduite.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Vocode', 'bibliothèque-pour-créer-des-agents-vocaux.-une-bibliothèque-open-source-pour-construire-des-agents-conversationnels-vocaux-personnalisés.', 'https://github.com/vocodedev/vocode-python', 'vocode''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Weaviate', (SELECT id FROM public.categories WHERE slug = 'Base de données vectorielle open-source. Une base de données vectorielle pour stocker des objets et des vecteurs avec recherche sémantique.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'WebLLM', 'llms-dans-le-navigateur.-une-solution-pour-exécuter-des-modèles-de-langage-directement-dans-le-navigateur-web.', 'https://webllm.mlc.ai/', 'webllm''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''whylogs', (SELECT id FROM public.categories WHERE slug = 'Framework de logging pour l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'WisdomPrompt', 'framework-pour-l''''optimisation-de-prompts.-un-framework-qui-aide-à-créer-et-optimiser-des-prompts-pour-les-modèles-de-langage.', 'https://github.com/wisdom-prompt/wisdom-prompt', 'wisdomprompt''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''X-Agent', (SELECT id FROM public.categories WHERE slug = 'Agent autonome pour le développement. Un agent IA autonome capable de développer des applications complètes à partir de descriptions.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'X-Turing', 'plateforme-pour-construire-des-applications-llm.-une-plateforme-qui-simplifie-la-construction-d''''applications-basées-sur-les-modèles-de-langage.', 'https://www.x-turing.com/', 'x-turing''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''YAYI', (SELECT id FROM public.categories WHERE slug = 'Assistant IA multilingue. Un assistant IA capable de communiquer dans plusieurs langues et d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Zephyr', 'modèle-de-langage-open-source.-un-modèle-de-langage-open-source-optimisé-pour-les-performances-et-la-facilité-d''''utilisation.', 'https://github.com/huggingface/zephyr', 'zephyr''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Airbyte', (SELECT id FROM public.categories WHERE slug = 'Plateforme d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Anthropic', 'entreprise-d''''ia-axée-sur-la-sécurité.-développeur-de-claude-et-d''''autres-modèles-d''''ia-avancés,-mettant-l''''accent-sur-l''''ia-éthique-et-sûre.', 'https://www.anthropic.com/', 'anthropic''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''AssemblyAI', (SELECT id FROM public.categories WHERE slug = 'API de reconnaissance vocale et d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Azure OpenAI', 'services-openai-sur-azure.-version-entreprise-des-modèles-openai,-intégrée-à-l''''infrastructure-azure-avec-des-fonctionnalités-de-sécurité-et-de-conformité-avancées.', 'https://azure.microsoft.com/products/cognitive-services/openai-service', 'azure-openai''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''BERT', (SELECT id FROM public.categories WHERE slug = 'Modèle de traitement du langage par Google. Un modèle révolutionnaire qui a transformé le NLP en comprenant le contexte bidirectionnel des mots.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'ChatGPT', 'assistant-conversationnel-d''''openai.-un-modèle-de-langage-avancé-capable-de-dialoguer-de-manière-naturelle-et-d''''aider-dans-diverses-tâches.', 'https://chat.openai.com/', 'chatgpt''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Claude', (SELECT id FROM public.categories WHERE slug = 'Assistant IA d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Cohere', 'plateforme-d''''ia-pour-les-entreprises.-une-suite-d''''outils-d''''ia-pour-créer-des-applications-avec-compréhension-du-langage-naturel-et-génération-de-texte.', 'https://cohere.ai/', 'cohere''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''GitHub Copilot', (SELECT id FROM public.categories WHERE slug = 'Assistant de programmation IA. Un outil de complétion de code qui suggère des lignes ou des fonctions entières basées sur le contexte.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'DALL-E', 'générateur-d''''images-par-ia-d''''openai.-un-modèle-capable-de-créer-des-images-réalistes-et-artistiques-à-partir-de-descriptions-textuelles.', 'https://openai.com/dall-e-3', 'dall-e''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''DeepMind', (SELECT id FROM public.categories WHERE slug = 'Entreprise de recherche en IA de Google. Connue pour AlphaGo, AlphaFold et d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Stable Diffusion', 'modèle-de-génération-d''''images-open-source.-un-puissant-modèle-de-génération-d''''images-qui-peut-être-exécuté-localement-avec-des-ressources-modestes.', 'https://stability.ai/', 'stable-diffusion''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''EleutherAI', (SELECT id FROM public.categories WHERE slug = 'Organisation de recherche en IA open-source. Un groupe qui développe des modèles de langage open-source et fait progresser la recherche en IA.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Gemini', 'modèle-d''''ia-multimodal-de-google.-le-modèle-d''''ia-le-plus-avancé-de-google,-capable-de-comprendre-et-de-générer-texte,-code,-audio-et-images.', 'https://deepmind.google/technologies/gemini/', 'gemini''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''GPT-4', (SELECT id FROM public.categories WHERE slug = 'Modèle de langage avancé d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Jasper', 'plateforme-d''''écriture-assistée-par-ia.-un-outil-qui-aide-à-créer-du-contenu-marketing,-des-articles-et-des-copies-publicitaires-avec-l''''aide-de-l''''ia.', 'https://www.jasper.ai/', 'jasper''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Jupyter', (SELECT id FROM public.categories WHERE slug = 'Environnement de développement interactif. Un outil essentiel pour le développement en science des données et l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Keras', 'api-de-deep-learning-de-haut-niveau.-une-interface-conviviale-pour-construire-et-entraîner-des-modèles-de-deep-learning.', 'https://keras.io/', 'keras''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''LangSmith', (SELECT id FROM public.categories WHERE slug = 'Plateforme de développement LLM. Un outil pour développer, tester et déployer des applications basées sur des modèles de langage.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Leonardo.ai', 'plateforme-de-génération-d''''images-par-ia.-un-outil-puissant-pour-créer-des-images-artistiques-et-professionnelles-avec-l''''ia.', 'https://leonardo.ai/', 'leonardo-ai''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Ludwig', (SELECT id FROM public.categories WHERE slug = 'Boîte à outils de deep learning sans code. Une bibliothèque qui permet de construire des modèles de deep learning sans écrire de code.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Midjourney', 'générateur-d''''images-par-ia.-un-outil-de-création-d''''images-artistiques-basé-sur-des-descriptions-textuelles.', 'https://www.midjourney.com/', 'midjourney''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Mistral AI', (SELECT id FROM public.categories WHERE slug = 'Entreprise de développement de LLMs. Une société française développant des modèles de langage open-source performants.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'MLflow', 'plateforme-de-gestion-du-cycle-de-vie-ml.-un-outil-open-source-pour-gérer-le-cycle-de-vie-complet-des-projets-d''''apprentissage-automatique.', 'https://mlflow.org/', 'mlflow''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''MosaicML', (SELECT id FROM public.categories WHERE slug = 'Plateforme d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'NVIDIA AI', 'suite-d''''outils-d''''ia-par-nvidia.-une-collection-complète-d''''outils-et-de-frameworks-pour-le-développement-et-le-déploiement-d''''applications-d''''ia.', 'https://www.nvidia.com/en-us/ai-data-science/', 'nvidia-ai''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''OpenAI', (SELECT id FROM public.categories WHERE slug = 'Entreprise leader en recherche IA. Développeur de GPT, DALL-E et d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Pandas', 'bibliothèque-d''''analyse-de-données-python.-un-outil-essentiel-pour-la-manipulation-et-l''''analyse-de-données-en-science-des-données.', 'https://pandas.pydata.org/', 'pandas''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''PyTorch', (SELECT id FROM public.categories WHERE slug = 'Framework de deep learning. Une bibliothèque open-source populaire pour le développement de modèles d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Ray', 'framework-pour-applications-ia-distribuées.-un-framework-open-source-pour-mettre-à-l''''échelle-les-applications-d''''ia-et-de-ml.', 'https://www.ray.io/', 'ray''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Scikit-learn', (SELECT id FROM public.categories WHERE slug = 'Bibliothèque d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'SentenceTransformers', 'bibliothèque-pour-embeddings-de-texte.-un-outil-pour-créer-des-représentations-vectorielles-de-phrases-et-de-documents.', 'https://www.sbert.net/', 'sentence-transformers''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''spaCy', (SELECT id FROM public.categories WHERE slug = 'Bibliothèque de traitement du langage naturel. Un outil rapide et efficace pour l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Stability AI', 'entreprise-de-développement-d''''ia-générative.-créateur-de-stable-diffusion-et-d''''autres-modèles-d''''ia-générative-open-source.', 'https://stability.ai/', 'stability-ai''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''TensorFlow', (SELECT id FROM public.categories WHERE slug = 'Framework d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'TheBloke', 'collection-de-modèles-ia-quantifiés.-une-ressource-majeure-pour-les-modèles-llm-optimisés-et-quantifiés.', 'https://huggingface.co/TheBloke', 'thebloke''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Tokenizers', (SELECT id FROM public.categories WHERE slug = 'Bibliothèque de tokenisation rapide. Une bibliothèque optimisée pour la tokenisation de texte en apprentissage automatique.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'TorchServe', 'serveur-de-modèles-pytorch.-un-outil-pour-servir-des-modèles-pytorch-en-production-de-manière-performante.', 'https://pytorch.org/serve/', 'torchserve''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Vertex AI', (SELECT id FROM public.categories WHERE slug = 'Plateforme ML de Google Cloud. Une plateforme unifiée pour construire, déployer et mettre à l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Whisper', 'système-de-reconnaissance-vocale-d''''openai.-un-modèle-robuste-pour-la-transcription-et-la-traduction-de-la-parole.', 'https://github.com/openai/whisper', 'whisper''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Wolfram Alpha', (SELECT id FROM public.categories WHERE slug = 'Moteur de connaissances computationnel. Un système qui combine connaissances et calculs pour répondre à des questions complexes.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'XGBoost', 'bibliothèque-de-boosting-gradient.-un-outil-puissant-et-efficace-pour-l''''apprentissage-automatique-basé-sur-les-arbres-de-décision.', 'https://xgboost.readthedocs.io/', 'xgboost''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''YOLO', (SELECT id FROM public.categories WHERE slug = 'Système de détection d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Alpaca', 'version-fine-tunée-de-llama.-un-modèle-de-langage-entraîné-sur-des-instructions,-offrant-des-performances-similaires-à-gpt-3.5-avec-moins-de-ressources.', 'https://github.com/tatsu-lab/stanford_alpaca', 'alpaca''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Apache Spark', (SELECT id FROM public.categories WHERE slug = 'Framework de traitement de données distribué. Un moteur unifié pour le traitement de données à grande échelle et l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'AutoKeras', 'bibliothèque-automl-basée-sur-keras.-un-outil-d''''apprentissage-automatique-automatisé-pour-simplifier-la-création-de-modèles-de-deep-learning.', 'https://autokeras.com/', 'autokeras''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''BART', (SELECT id FROM public.categories WHERE slug = 'Modèle de séquence à séquence par Facebook. Un modèle pré-entraîné pour la compréhension et la génération de texte.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'BigScience', 'initiative-de-recherche-collaborative-en-ia.-un-projet-open-source-pour-démocratiser-la-recherche-en-ia-et-créer-des-modèles-multilingues.', 'https://bigscience.huggingface.co/', 'bigscience''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''BLOOM', (SELECT id FROM public.categories WHERE slug = 'Modèle de langage multilingue. Le plus grand modèle de langage open-source entraîné sur plus de 46 langues.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'CatBoost', 'bibliothèque-de-boosting-par-yandex.-un-algorithme-d''''apprentissage-automatique-pour-le-boosting-de-gradient-avec-gestion-native-des-variables-catégorielles.', 'https://catboost.ai/', 'catboost''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Coqui', (SELECT id FROM public.categories WHERE slug = 'Boîte à outils de synthèse vocale. Une collection d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Cortex', 'plateforme-de-déploiement-d''''ia.-un-outil-pour-déployer-des-modèles-d''''ia-en-production-sur-kubernetes.', 'https://www.cortex.dev/', 'cortex''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''CUDA', (SELECT id FROM public.categories WHERE slug = 'Plateforme de calcul parallèle NVIDIA. Une architecture qui permet d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'CuPy', 'bibliothèque-numpy-sur-gpu.-une-implémentation-de-l''''interface-numpy-pour-les-calculs-sur-gpu-avec-cuda.', 'https://cupy.dev/', 'cupy''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Dask', (SELECT id FROM public.categories WHERE slug = 'Bibliothèque de calcul parallèle flexible. Un framework pour le calcul parallèle en Python, compatible avec l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Detectron2', 'bibliothèque-de-vision-par-ordinateur.-une-plateforme-de-facebook-pour-la-détection-d''''objets-et-la-segmentation-d''''images.', 'https://github.com/facebookresearch/detectron2', 'detectron2''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Diffusers', (SELECT id FROM public.categories WHERE slug = 'Bibliothèque de modèles de diffusion. Une boîte à outils pour travailler avec des modèles de diffusion comme Stable Diffusion.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'DocArray', 'bibliothèque-pour-données-non-structurées.-un-outil-pour-manipuler-et-traiter-des-données-multimodales-en-deep-learning.', 'https://docarray.jina.ai/', 'docarray''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''fastai', (SELECT id FROM public.categories WHERE slug = 'Bibliothèque de deep learning de haut niveau. Une couche d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Faiss', 'bibliothèque-de-recherche-de-similarité.-un-outil-efficace-pour-la-recherche-et-le-clustering-de-vecteurs-denses.', 'https://github.com/facebookresearch/faiss', 'faiss''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Flax', (SELECT id FROM public.categories WHERE slug = 'Bibliothèque de deep learning basée sur JAX. Un framework flexible pour la recherche en apprentissage profond.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Gensim', 'bibliothèque-de-modélisation-thématique.-un-outil-pour-l''''analyse-sémantique-non-supervisée-de-textes.', 'https://radimrehurek.com/gensim/', 'gensim''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Gradio', (SELECT id FROM public.categories WHERE slug = 'Création d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'H2O', 'plateforme-d''''apprentissage-automatique.-une-plateforme-open-source-pour-l''''apprentissage-automatique-évolutif.', 'https://h2o.ai/', 'h2o''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Horovod', (SELECT id FROM public.categories WHERE slug = 'Framework d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Hyperopt', 'bibliothèque-d''''optimisation-d''''hyperparamètres.-un-outil-pour-l''''optimisation-des-paramètres-des-modèles-d''''apprentissage-automatique.', 'http://hyperopt.github.io/hyperopt/', 'hyperopt''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''JAX', (SELECT id FROM public.categories WHERE slug = 'Bibliothèque de calcul numérique. Un outil pour la différentiation automatique et les calculs XLA.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Jina', 'framework-de-recherche-neurale-cloud-native.-une-plateforme-pour-construire-des-systèmes-de-recherche-multimodale.', 'https://jina.ai/', 'jina''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Joblib', (SELECT id FROM public.categories WHERE slug = 'Bibliothèque de pipeline computing. Un ensemble d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Kornia', 'bibliothèque-de-vision-par-ordinateur-différentiable.-un-ensemble-d''''opérations-de-vision-par-ordinateur-différentiables-pour-pytorch.', 'https://kornia.github.io/', 'kornia''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''LightGBM', (SELECT id FROM public.categories WHERE slug = 'Framework de boosting gradient. Un algorithme de boosting gradient rapide et efficace par Microsoft.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'LIME', 'outil-d''''explication-de-modèles-ml.-une-technique-pour-expliquer-les-prédictions-de-n''''importe-quel-classifieur-ml.', 'https://github.com/marcotcr/lime', 'lime''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''llama.cpp', (SELECT id FROM public.categories WHERE slug = 'Port C++ des modèles LLaMA. Une implémentation efficace des modèles LLaMA pour l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Milvus', 'base-de-données-vectorielle-open-source.-une-solution-pour-gérer-et-rechercher-des-vecteurs-à-grande-échelle.', 'https://milvus.io/', 'milvus''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''MMDetection', (SELECT id FROM public.categories WHERE slug = 'Boîte à outils de détection d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'MXNet', 'framework-de-deep-learning-flexible.-un-framework-deep-learning-efficace-supporté-par-amazon.', 'https://mxnet.apache.org/', 'mxnet''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Neptune', (SELECT id FROM public.categories WHERE slug = 'Plateforme de suivi d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'NetworkX', 'bibliothèque-d''''analyse-de-réseaux.-un-outil-pour-créer-et-étudier-des-réseaux-et-des-graphes-complexes.', 'https://networkx.org/', 'networkx''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''NLTK', (SELECT id FROM public.categories WHERE slug = 'Boîte à outils de traitement du langage naturel. Une bibliothèque complète pour le traitement du langage naturel en Python.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Numba', 'compilateur-jit-pour-python-numérique.-un-outil-pour-accélérer-le-code-python-en-le-compilant-en-code-machine.', 'https://numba.pydata.org/', 'numba''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''NumPy', (SELECT id FROM public.categories WHERE slug = 'Bibliothèque fondamentale pour le calcul scientifique. La base de l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'ONNX', 'format-ouvert-pour-les-modèles-ml.-un-standard-pour-représenter-les-modèles-d''''apprentissage-automatique.', 'https://onnx.ai/', 'onnx''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Optuna', (SELECT id FROM public.categories WHERE slug = 'Framework d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'PaddlePaddle', 'plateforme-deep-learning-de-baidu.-un-framework-complet-pour-le-développement-et-le-déploiement-de-modèles-deep-learning.', 'https://www.paddlepaddle.org.cn/', 'paddlepaddle''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Petastorm', (SELECT id FROM public.categories WHERE slug = 'Bibliothèque de données pour deep learning. Un outil pour lire des données depuis des systèmes de stockage dans des frameworks ML.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Pillow', 'bibliothèque-de-traitement-d''''images-python.-fork-maintenu-de-pil-pour-le-traitement-d''''images-en-python.', 'https://python-pillow.org/', 'pillow''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Plotly', (SELECT id FROM public.categories WHERE slug = 'Bibliothèque de visualisation interactive. Des outils de visualisation interactifs pour l');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Polyaxon', 'plateforme-mlops-open-source.-une-plateforme-pour-gérer-le-cycle-de-vie-complet-des-projets-ml.', 'https://polyaxon.com/', 'polyaxon''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Prophet', (SELECT id FROM public.categories WHERE slug = 'Outil de prévision de séries temporelles. Une bibliothèque Facebook pour les prévisions de séries temporelles.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'PyTorch3D', 'bibliothèque-de-deep-learning-3d.-des-outils-pour-le-deep-learning-sur-données-3d-avec-pytorch.', 'https://pytorch3d.org/', 'pytorch3d''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''RAPIDS', (SELECT id FROM public.categories WHERE slug = 'Suite d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Ray Tune', 'bibliothèque-de-tuning-hyperparamétrique.-un-framework-scalable-pour-l''''optimisation-des-hyperparamètres.', 'https://docs.ray.io/en/latest/tune/index.html', 'ray-tune''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Replicate', (SELECT id FROM public.categories WHERE slug = 'Plateforme de déploiement de modèles ML. Un service pour déployer et exécuter des modèles ML dans le cloud.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Rune', 'framework-d''''ia-pour-jeux-vidéo.-une-plateforme-pour-intégrer-l''''ia-dans-les-jeux-vidéo.', 'https://www.rune.ai/', 'rune''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Sacred', (SELECT id FROM public.categories WHERE slug = 'Outil de suivi d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Seaborn', 'bibliothèque-de-visualisation-statistique.-un-outil-de-visualisation-de-données-statistiques-basé-sur-matplotlib.', 'https://seaborn.pydata.org/', 'seaborn''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''SHAP', (SELECT id FROM public.categories WHERE slug = 'Framework d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Streamlit', 'framework-d''''applications-ml.-un-outil-pour-créer-rapidement-des-applications-web-pour-les-projets-de-data-science.', 'https://streamlit.io/', 'streamlit''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Transformers', (SELECT id FROM public.categories WHERE slug = 'Bibliothèque de modèles NLP. Une collection de modèles de traitement du langage naturel pré-entraînés.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Triton Inference Server', 'serveur-d''''inférence-ml.-un-serveur-optimisé-pour-le-déploiement-de-modèles-ml-en-production.', 'https://github.com/triton-inference-server/server', 'triton-inference-server''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Weights & Biases', (SELECT id FROM public.categories WHERE slug = 'Plateforme MLOps. Un outil pour suivre les expériences, gérer les modèles et collaborer en ML.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Yellowbrick', 'suite-de-visualisation-ml.-des-outils-de-visualisation-pour-l''''analyse-et-la-validation-de-modèles-ml.', 'https://www.scikit-yb.org/', 'yellowbrick''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''ZenML', (SELECT id FROM public.categories WHERE slug = 'Framework MLOps extensible. Un outil open-source pour créer des pipelines ML reproductibles.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'AllenNLP', 'bibliothèque-nlp-basée-sur-pytorch.-une-plateforme-open-source-pour-développer-des-modèles-de-traitement-du-langage-naturel.', 'https://allennlp.org/', 'allennlp''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''BentoML', (SELECT id FROM public.categories WHERE slug = 'Framework de serving ML unifié. Une plateforme pour servir, gérer et déployer des modèles ML en production.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'CLIP', 'modèle-de-vision-langage-d''''openai.-un-modèle-neuronal-qui-connecte-texte-et-images-de-manière-performante.', 'https://github.com/openai/CLIP', 'clip''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Cohere', (SELECT id FROM public.categories WHERE slug = 'Plateforme de modèles de langage. Une solution pour intégrer des modèles de langage avancés dans les applications.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'DeepSpeed', 'bibliothèque-d''''optimisation-deep-learning.-un-outil-microsoft-pour-l''''entraînement-efficace-de-modèles-massifs.', 'https://www.deepspeed.ai/', 'deepspeed''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''DETR', (SELECT id FROM public.categories WHERE slug = 'Transformers pour la détection d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'FastText', 'bibliothèque-pour-le-text-mining.-un-outil-facebook-pour-l''''apprentissage-efficace-de-représentations-de-mots.', 'https://fasttext.cc/', 'fasttext''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Feast', (SELECT id FROM public.categories WHERE slug = 'Feature store open-source. Une plateforme pour gérer et servir des features pour le ML en production.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Great Expectations', 'framework-de-validation-de-données.-un-outil-pour-tester-et-valider-les-données-dans-les-pipelines-ml.', 'https://greatexpectations.io/', 'great-expectations''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Hugging Face Hub', (SELECT id FROM public.categories WHERE slug = 'Plateforme de modèles ML. Un dépôt central pour partager des modèles, des datasets et des démos.');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Kedro', 'framework-de-développement-ml.-un-outil-pour-créer-des-pipelines-de-data-science-reproductibles.', 'https://kedro.readthedocs.io/', 'kedro''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''Label Studio', (SELECT id FROM public.categories WHERE slug = 'Plateforme d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'LangChain', 'framework-pour-applications-llm.-un-outil-pour-développer-des-applications-basées-sur-les-modèles-de-langage.', 'https://langchain.com/', 'langchain''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
        ''LlamaIndex', (SELECT id FROM public.categories WHERE slug = 'Framework d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'MLRun', 'framework-mlops-open-source.-une-plateforme-pour-orchestrer-et-suivre-des-projets-ml-de-bout-en-bout.', 'https://www.mlrun.org/', 'mlrun''
    
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''OpenAI API', (SELECT id FROM public.categories WHERE slug = 'openai-api');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'GitHub Copilot', 'github-copilot', 'Annonce de Copilot, un nouveau programmeur en binôme IA qui vous aide à écrire un meilleur code.', 'https://github.blog/2021-06-29-introducing-github-copilot-ai-pair-programmer/'',
    (SELECT id FROM categories WHERE slug = ''milestone''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''DALL·E 2', (SELECT id FROM public.categories WHERE slug = 'tabnine');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Stable Diffusion', 'stable-diffusion', 'Annonce de la sortie publique de Stable Diffusion, un modèle de génération d''''images basé sur l''''IA entraîné sur un large échantillon d''''internet et sous licence Creative ML OpenRAIL-M.', 'https://stability.ai/blog/stable-diffusion-public-release'',
    (SELECT id FROM categories WHERE slug = ''milestone''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''ChatGPT', (SELECT id FROM public.categories WHERE slug = 'synthesia');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Bing Search', 'bing-search', 'Microsoft annonce une nouvelle version de son moteur de recherche Bing, alimenté par un modèle OpenAI de nouvelle génération.', 'https://blogs.microsoft.com/blog/2023/02/07/reinventing-search-with-a-new-ai-powered-microsoft-bing-and-edge-your-copilot-for-the-web/'',
    (SELECT id FROM categories WHERE slug = ''milestone''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''LLaMA', (SELECT id FROM public.categories WHERE slug = 'llama');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'GPT-4', 'gpt-4', 'Annonce de GPT-4, un grand modèle multimodal.', 'https://openai.com/research/gpt-4'',
    (SELECT id FROM categories WHERE slug = ''milestone''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''DALL·E 3', (SELECT id FROM public.categories WHERE slug = 'dalle-3');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Sora', 'sora', 'Présentation de Sora, un grand modèle de génération vidéo.', 'https://openai.com/research/video-generation-models-as-world-simulators'',
    (SELECT id FROM categories WHERE slug = ''milestone''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''OpenAI API', (SELECT id FROM public.categories WHERE slug = 'openai-api-tool');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Gopher', 'gopher', 'Gopher par DeepMind est un modèle de langage de 280 milliards de paramètres.', 'https://www.deepmind.com/blog/language-modelling-at-scale-gopher-ethical-considerations-and-retrieval'',
    (SELECT id FROM categories WHERE slug = ''text''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''OPT', (SELECT id FROM public.categories WHERE slug = 'opt');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Bloom', 'bloom', 'BLOOM par Hugging Face est un modèle similaire à GPT-3 qui a été entraîné sur 46 langues différentes et 13 langages de programmation.', 'https://huggingface.co/docs/transformers/model_doc/bloom'',
    (SELECT id FROM categories WHERE slug = ''text''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Claude', (SELECT id FROM public.categories WHERE slug = 'claude');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Vicuna-13B', 'vicuna-13b', 'Un chatbot open source entraîné en affinant LLaMA sur des conversations partagées par les utilisateurs collectées depuis ShareGPT.', 'https://lmsys.org/blog/2023-03-30-vicuna/'',
    (SELECT id FROM categories WHERE slug = ''text''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Mistral', (SELECT id FROM public.categories WHERE slug = 'mistral');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Grok', 'grok', 'Un LLM par xAI avec code source et poids ouverts.', 'https://grok.x.ai/'',
    (SELECT id FROM categories WHERE slug = ''text''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Qwen', (SELECT id FROM public.categories WHERE slug = 'qwen-model');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Gemini', 'gemini', 'Une famille de modèles de langage multimodaux développée par Google Deepmind.', 'https://gemini.google.com/'',
    (SELECT id FROM categories WHERE slug = ''text''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Meta AI', (SELECT id FROM public.categories WHERE slug = 'meta-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'DeepSeek', 'deepseek', 'LLMs de pointe pour les entreprises, les consommateurs et les applications scientifiques.', 'https://www.deepseek.com/'',
    (SELECT id FROM categories WHERE slug = ''text''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Character.AI', (SELECT id FROM public.categories WHERE slug = 'character-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Pi', 'pi', 'Une plateforme IA personnalisée disponible comme assistant numérique.', 'https://pi.ai'',
    (SELECT id FROM categories WHERE slug = ''text''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Le Chat', (SELECT id FROM public.categories WHERE slug = 'le-chat');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'LibreChat', 'librechat', 'LibreChat est une interface de chat gratuite et open source pour les assistants IA.', 'https://librechat.ai/'',
    (SELECT id FROM categories WHERE slug = ''custom-interface''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Chatbot UI', (SELECT id FROM public.categories WHERE slug = 'chatbot-ui');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Perplexity AI', 'perplexity-ai', 'Outils de recherche alimentés par l''''IA.', 'https://www.perplexity.ai/'',
    (SELECT id FROM categories WHERE slug = ''search''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Metaphor', (SELECT id FROM public.categories WHERE slug = 'metaphor');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Phind', 'phind', 'Moteur de recherche basé sur l''''IA.', 'https://phind.com/'',
    (SELECT id FROM categories WHERE slug = ''search''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''You.com', (SELECT id FROM public.categories WHERE slug = 'you-com');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Komo', 'komo', 'Un moteur de recherche alimenté par l''''IA.', 'https://komo.ai/'',
    (SELECT id FROM categories WHERE slug = ''search''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''privateGPT', (SELECT id FROM public.categories WHERE slug = 'private-gpt');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'quivr', 'quivr', 'Déposez tous vos fichiers et discutez avec votre deuxième cerveau génératif IA en utilisant des LLMs et des embeddings.', 'https://github.com/StanGirard/quivr'',
    (SELECT id FROM categories WHERE slug = ''local-search''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Auto-GPT', (SELECT id FROM public.categories WHERE slug = 'auto-gpt');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'BabyAGI', 'babyagi-1', 'Un système d''''agent IA simple qui peut générer et prioriser des tâches en fonction d''''un objectif.', 'https://github.com/yoheinakajima/babyagi'',
    (SELECT id FROM categories WHERE slug = ''automation''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''AgentGPT', (SELECT id FROM public.categories WHERE slug = 'babybeeagi');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Notion AI', 'notion-ai', 'Assistant d''''écriture IA intégré à Notion pour vous aider à écrire, éditer et résumer.', 'https://www.notion.so/product/ai'',
    (SELECT id FROM categories WHERE slug = ''productivity''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Mem.ai', (SELECT id FROM public.categories WHERE slug = 'figma-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Taskade AI', 'taskade-ai', 'Un espace de travail IA tout-en-un pour les équipes avec chat, organisation et collaboration.', 'https://www.taskade.com/ai'',
    (SELECT id FROM categories WHERE slug = ''productivity''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Otter AI', (SELECT id FROM public.categories WHERE slug = 'otter-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Fireflies AI', 'fireflies-ai', 'Enregistre, transcrit et analyse automatiquement vos réunions.', 'https://fireflies.ai/'',
    (SELECT id FROM categories WHERE slug = ''productivity''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Grammarly', (SELECT id FROM public.categories WHERE slug = 'pdf-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Jasper', 'jasper', 'Plateforme d''''IA générative pour créer du contenu marketing rapidement.', 'https://www.jasper.ai/'',
    (SELECT id FROM categories WHERE slug = ''productivity''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Copy AI', (SELECT id FROM public.categories WHERE slug = 'elevenlabs');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Writesonic', 'writesonic', 'Plateforme d''''IA pour créer du contenu optimisé pour le SEO.', 'https://writesonic.com/'',
    (SELECT id FROM categories WHERE slug = ''productivity''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''DeepL', (SELECT id FROM public.categories WHERE slug = 'deepl');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Tabnine', 'tabnine', 'Assistant de codage IA qui prédit et suggère votre prochain code en temps réel.', 'https://www.tabnine.com/'',
    (SELECT id FROM categories WHERE slug = ''code''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Amazon CodeWhisperer', (SELECT id FROM public.categories WHERE slug = 'amazon-codewhisperer');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Codeium', 'codeium', 'Assistant de codage IA moderne et gratuit.', 'https://codeium.com/'',
    (SELECT id FROM categories WHERE slug = ''code''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Replit', (SELECT id FROM public.categories WHERE slug = 'replit');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Wolfram Alpha', 'wolfram-alpha', 'Moteur de connaissance computationnelle qui répond directement aux questions.', 'https://www.wolframalpha.com/'',
    (SELECT id FROM categories WHERE slug = ''research''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Elicit', (SELECT id FROM public.categories WHERE slug = 'elicit');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Consensus', 'consensus', 'Moteur de recherche IA pour la recherche académique.', 'https://consensus.app/'',
    (SELECT id FROM categories WHERE slug = ''research''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Scispace', (SELECT id FROM public.categories WHERE slug = 'scispace');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Paperpal', 'paperpal', 'Assistant d''''écriture académique alimenté par l''''IA.', 'https://paperpal.com/'',
    (SELECT id FROM categories WHERE slug = ''research''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Mendeley', (SELECT id FROM public.categories WHERE slug = 'mendeley');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Mubert', 'mubert', 'Génération de musique en temps réel par IA pour le contenu et les applications.', 'https://mubert.com/'',
    (SELECT id FROM categories WHERE slug = ''audio''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Soundraw', (SELECT id FROM public.categories WHERE slug = 'soundraw');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Boomy', 'boomy', 'Créez de la musique originale en quelques secondes avec l''''IA.', 'https://boomy.com/'',
    (SELECT id FROM categories WHERE slug = ''audio''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Descript', (SELECT id FROM public.categories WHERE slug = 'descript');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Beautiful.ai', 'beautiful-ai', 'Créez de belles présentations rapidement avec l''''aide de l''''IA.', 'https://www.beautiful.ai/'',
    (SELECT id FROM categories WHERE slug = ''presentation''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Tome', (SELECT id FROM public.categories WHERE slug = 'tome');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Gamma', 'gamma', 'Créez de belles présentations en quelques minutes avec l''''IA.', 'https://gamma.app/'',
    (SELECT id FROM categories WHERE slug = ''presentation''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Pictory', (SELECT id FROM public.categories WHERE slug = 'pictory');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Synthesia', 'synthesia', 'Créez des vidéos avec des avatars IA qui parlent.', 'https://www.synthesia.io/'',
    (SELECT id FROM categories WHERE slug = ''video''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''D-ID', (SELECT id FROM public.categories WHERE slug = 'd-id');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Obviously AI', 'obviously-ai', 'Plateforme d''''analyse prédictive sans code pour les entreprises.', 'https://www.obviously.ai/'',
    (SELECT id FROM categories WHERE slug = ''data''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''MindsDB', (SELECT id FROM public.categories WHERE slug = 'mindsdb');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'MonkeyLearn', 'monkeylearn', 'Plateforme d''''analyse de texte et de données par IA.', 'https://monkeylearn.com/'',
    (SELECT id FROM categories WHERE slug = ''data''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''RapidMiner', (SELECT id FROM public.categories WHERE slug = 'rapidminer');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Knime', 'knime', 'Plateforme open source d''''analyse de données et d''''apprentissage automatique.', 'https://www.knime.com/'',
    (SELECT id FROM categories WHERE slug = ''data''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Marketmuse', (SELECT id FROM public.categories WHERE slug = 'marketmuse');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Surfer SEO', 'surfer-seo', 'Outil d''''optimisation de contenu basé sur l''''IA pour le SEO.', 'https://surferseo.com/'',
    (SELECT id FROM categories WHERE slug = ''marketing''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Frase', (SELECT id FROM public.categories WHERE slug = 'frase');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Clearscope', 'clearscope', 'Plateforme d''''optimisation de contenu basée sur l''''IA.', 'https://www.clearscope.io/'',
    (SELECT id FROM categories WHERE slug = ''marketing''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Ada Health', (SELECT id FROM public.categories WHERE slug = 'ada-health');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Babylon Health', 'babylon-health', 'Service de consultation médicale en ligne utilisant l''''IA.', 'https://www.babylonhealth.com/'',
    (SELECT id FROM categories WHERE slug = ''health''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Duolingo', (SELECT id FROM public.categories WHERE slug = 'duolingo');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Carnegie Learning', 'carnegie-learning', 'Plateforme d''''apprentissage adaptatif pour les mathématiques.', 'https://www.carnegielearning.com/'',
    (SELECT id FROM categories WHERE slug = ''education''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''CENTURY', (SELECT id FROM public.categories WHERE slug = 'century');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Eightfold AI', 'eightfold-ai', 'Plateforme de gestion des talents basée sur l''''IA.', 'https://eightfold.ai/'',
    (SELECT id FROM categories WHERE slug = ''hr''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''HiredScore', (SELECT id FROM public.categories WHERE slug = 'hiredscore');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Pymetrics', 'pymetrics', 'Plateforme d''''évaluation des talents utilisant l''''IA et les neurosciences.', 'https://www.pymetrics.ai/'',
    (SELECT id FROM categories WHERE slug = ''hr''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''GET3D', (SELECT id FROM public.categories WHERE slug = 'get3d');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Point-E', 'point-e', 'Système de génération de nuages de points 3D par OpenAI.', 'https://github.com/openai/point-e'',
    (SELECT id FROM categories WHERE slug = ''3d''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Kaedim', (SELECT id FROM public.categories WHERE slug = 'kaedim');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Scenario', 'scenario', 'Générez des assets pour les jeux avec l''''IA.', 'https://www.scenario.com/'',
    (SELECT id FROM categories WHERE slug = ''gaming''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Inworld AI', (SELECT id FROM public.categories WHERE slug = 'inworld-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Latitude', 'latitude', 'Plateforme de création de jeux basée sur l''''IA.', 'https://latitude.io/'',
    (SELECT id FROM categories WHERE slug = ''gaming''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''NVIDIA Canvas', (SELECT id FROM public.categories WHERE slug = 'nvidia-canvas');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Meshy', 'meshy', 'Créez des modèles 3D à partir de texte ou d''''images.', 'https://www.meshy.ai/'',
    (SELECT id FROM categories WHERE slug = ''3d''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Leonardo.Ai', (SELECT id FROM public.categories WHERE slug = 'leonardo-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'TradingView', 'tradingview', 'Plateforme d''''analyse technique et de trading avec fonctionnalités d''''IA.', 'https://www.tradingview.com/'',
    (SELECT id FROM categories WHERE slug = ''finance''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Alpaca', (SELECT id FROM public.categories WHERE slug = 'alpaca');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Kavout', 'kavout', 'Plateforme d''''intelligence artificielle pour l''''investissement.', 'https://www.kavout.com/'',
    (SELECT id FROM categories WHERE slug = ''finance''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''FinRL', (SELECT id FROM public.categories WHERE slug = 'finrl');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Sentimentrade', 'sentimentrade', 'Analyse du sentiment du marché en utilisant l''''IA.', 'https://sentimentrade.com/'',
    (SELECT id FROM categories WHERE slug = ''finance''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Market Cipher', (SELECT id FROM public.categories WHERE slug = 'market-cipher');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Tickeron', 'tickeron', 'Plateforme d''''analyse financière basée sur l''''IA.', 'https://tickeron.com/'',
    (SELECT id FROM categories WHERE slug = ''finance''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Trade Ideas', (SELECT id FROM public.categories WHERE slug = 'trade-ideas');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Darktrace', 'darktrace', 'Plateforme de cybersécurité autonome utilisant l''''IA.', 'https://www.darktrace.com/'',
    (SELECT id FROM categories WHERE slug = ''security''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''CrowdStrike', (SELECT id FROM public.categories WHERE slug = 'crowdstrike');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Testim', 'testim', 'Tests automatisés alimentés par l''''IA.', 'https://www.testim.io/'',
    (SELECT id FROM categories WHERE slug = ''testing''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Mabl', (SELECT id FROM public.categories WHERE slug = 'mabl');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Harvey AI', 'harvey-ai', 'Assistant juridique alimenté par l''''IA.', 'https://harvey.ai/'',
    (SELECT id FROM categories WHERE slug = ''legal''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Spellbook', (SELECT id FROM public.categories WHERE slug = 'spellbook');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'ClickUp AI', 'clickup-ai', 'Assistant de gestion de projet alimenté par l''''IA.', 'https://clickup.com/ai'',
    (SELECT id FROM categories WHERE slug = ''project''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Motion', (SELECT id FROM public.categories WHERE slug = 'motion');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Lumen5', 'lumen5', 'Plateforme de création vidéo basée sur l''''IA qui transforme du texte en vidéos engageantes.', 'https://lumen5.com/'',
    (SELECT id FROM categories WHERE slug = ''video''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''StealthGPT', (SELECT id FROM public.categories WHERE slug = 'stealthgpt');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'LALAL.AI', 'lalal-ai', 'Sépare la voix et les instruments dans n''''importe quelle chanson avec une qualité exceptionnelle.', 'https://www.lalal.ai/'',
    (SELECT id FROM categories WHERE slug = ''audio''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''DocsBot AI', (SELECT id FROM public.categories WHERE slug = 'docsbot-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Fireflies AI', 'fireflies-ai-1', 'Assistant de réunion qui enregistre, transcrit et crée des résumés intelligents.', 'https://fireflies.ai/'',
    (SELECT id FROM categories WHERE slug = ''productivity''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''PDF.ai', (SELECT id FROM public.categories WHERE slug = 'pdf-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'AI Studios - DeepBrain', 'ai-studios-deepbrain', 'Plateforme de création de présentateurs virtuels et de vidéos avec des avatars IA.', 'https://www.deepbrain.io/'',
    (SELECT id FROM categories WHERE slug = ''video''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Numerous.ai', (SELECT id FROM public.categories WHERE slug = 'numerous-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'BeforeSunset', 'beforesunset', 'Assistant de planification et de gestion du temps basé sur l''''IA.', 'https://www.beforesunset.ai/'',
    (SELECT id FROM categories WHERE slug = ''productivity''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Otter AI', (SELECT id FROM public.categories WHERE slug = 'otter-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Mem AI', 'mem-ai', 'Plateforme de prise de notes avec IA qui organise automatiquement vos informations.', 'https://mem.ai/'',
    (SELECT id FROM categories WHERE slug = ''productivity''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Taskade AI', (SELECT id FROM public.categories WHERE slug = 'taskade-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Elicit', 'elicit', 'Assistant de recherche IA qui analyse les articles scientifiques et résume les résultats.', 'https://elicit.org/'',
    (SELECT id FROM categories WHERE slug = ''research''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Consensus', (SELECT id FROM public.categories WHERE slug = 'research-rabbit');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Scholarcy', 'scholarcy', 'Outil qui résume et analyse automatiquement les articles de recherche.', 'https://www.scholarcy.com/'',
    (SELECT id FROM categories WHERE slug = ''research''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Iris AI', (SELECT id FROM public.categories WHERE slug = 'iris-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Scite', 'scite', 'Plateforme qui analyse les citations scientifiques pour évaluer leur fiabilité.', 'https://scite.ai/'',
    (SELECT id FROM categories WHERE slug = ''research''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Connected Papers', (SELECT id FROM public.categories WHERE slug = 'connected-papers');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Semantic Scholar', 'semantic-scholar', 'Moteur de recherche scientifique alimenté par l''''IA qui aide à trouver des articles pertinents.', 'https://www.semanticscholar.org/'',
    (SELECT id FROM categories WHERE slug = ''research''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Paperpal', (SELECT id FROM public.categories WHERE slug = 'blender-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Writefull', 'writefull', 'Outil d''''amélioration de l''''écriture académique basé sur l''''IA.', 'https://writefull.com/'',
    (SELECT id FROM categories WHERE slug = ''research''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Explainpaper', (SELECT id FROM public.categories WHERE slug = 'explainpaper');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'SciSpace', 'scispace', 'Plateforme de découverte de recherche qui simplifie la lecture et la compréhension des articles scientifiques.', 'https://scispace.com/'',
    (SELECT id FROM categories WHERE slug = ''research''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''ResearchRabbit', (SELECT id FROM public.categories WHERE slug = 'researchrabbit');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Copy.ai', 'copy-ai', 'Générateur de contenu marketing et publicitaire alimenté par l''''IA.', 'https://www.copy.ai/'',
    (SELECT id FROM categories WHERE slug = ''writing''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Writesonic', (SELECT id FROM public.categories WHERE slug = 'murf');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Rytr', 'rytr', 'Assistant d''''écriture IA pour créer du contenu dans plus de 30 langues.', 'https://rytr.me/'',
    (SELECT id FROM categories WHERE slug = ''writing''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Frase', (SELECT id FROM public.categories WHERE slug = 'frase');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Wordtune', 'wordtune', 'Assistant d''''écriture qui aide à reformuler et améliorer vos textes.', 'https://www.wordtune.com/'',
    (SELECT id FROM categories WHERE slug = ''writing''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Peppertype', (SELECT id FROM public.categories WHERE slug = 'peppertype');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Anyword', 'anyword', 'Plateforme de copywriting qui génère et optimise du contenu marketing.', 'https://anyword.com/'',
    (SELECT id FROM categories WHERE slug = ''writing''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Hypotenuse AI', (SELECT id FROM public.categories WHERE slug = 'hypotenuse-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Simplified', 'simplified', 'Suite de création de contenu tout-en-un avec génération de texte IA.', 'https://simplified.com/'',
    (SELECT id FROM categories WHERE slug = ''writing''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Copysmith', (SELECT id FROM public.categories WHERE slug = 'copysmith');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Writecream', 'writecream', 'Outil de création de contenu qui génère des textes personnalisés pour différents formats.', 'https://writecream.com/'',
    (SELECT id FROM categories WHERE slug = ''writing''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Typeframes', (SELECT id FROM public.categories WHERE slug = 'typeframes');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Sudowrite', 'sudowrite', 'Assistant d''''écriture créative qui aide à développer des histoires et des personnages.', 'https://www.sudowrite.com/'',
    (SELECT id FROM categories WHERE slug = ''writing''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Inferkit', (SELECT id FROM public.categories WHERE slug = 'inferkit');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Compose AI', 'compose-ai', 'Extension de navigateur qui accélère l''''écriture avec l''''auto-complétion IA.', 'https://www.compose.ai/'',
    (SELECT id FROM categories WHERE slug = ''writing''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Synthesia', (SELECT id FROM public.categories WHERE slug = 'synthesia');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Descript', 'descript', 'Éditeur vidéo et audio tout-en-un avec des fonctionnalités IA avancées.', 'https://www.descript.com/'',
    (SELECT id FROM categories WHERE slug = ''video''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''InVideo', (SELECT id FROM public.categories WHERE slug = 'zapier-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Pictory', 'pictory', 'Automatise la création de vidéos courtes à partir de longs contenus.', 'https://pictory.ai/'',
    (SELECT id FROM categories WHERE slug = ''video''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Hour One', (SELECT id FROM public.categories WHERE slug = 'opus-clip');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Kapwing', 'kapwing', 'Éditeur vidéo en ligne avec des fonctionnalités d''''IA pour le montage.', 'https://www.kapwing.com/'',
    (SELECT id FROM categories WHERE slug = ''video''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Runway', (SELECT id FROM public.categories WHERE slug = 'runway');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Elai', 'elai', 'Plateforme de création de vidéos avec des avatars IA personnalisables.', 'https://elai.io/'',
    (SELECT id FROM categories WHERE slug = ''video''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Steve AI', (SELECT id FROM public.categories WHERE slug = 'steve-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Pictory', 'pictory-1', 'Outil de création de vidéos qui extrait automatiquement les meilleurs moments.', 'https://pictory.ai/'',
    (SELECT id FROM categories WHERE slug = ''video''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Opus Clip', (SELECT id FROM public.categories WHERE slug = 'opus-clip');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Veed', 'veed', 'Plateforme d''''édition vidéo en ligne avec des fonctionnalités d''''IA.', 'https://www.veed.io/'',
    (SELECT id FROM categories WHERE slug = ''video''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Colossyan', (SELECT id FROM public.categories WHERE slug = 'colossyan');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Designs AI', 'designs-ai', 'Suite d''''outils créatifs incluant un créateur de vidéos IA.', 'https://designs.ai/'',
    (SELECT id FROM categories WHERE slug = ''video''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''AudioLabs', (SELECT id FROM public.categories WHERE slug = 'audiolabs');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Cleanvoice', 'cleanvoice', 'Nettoie automatiquement les enregistrements vocaux des bruits parasites.', 'https://cleanvoice.ai/'',
    (SELECT id FROM categories WHERE slug = ''audio-musique''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Voicemod', (SELECT id FROM public.categories WHERE slug = 'voicemod');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Adobe Enhanced Speech', 'adobe-enhanced-speech', 'Technologie d''''amélioration vocale basée sur l''''IA par Adobe.', 'https://www.adobe.com/products/premiere/enhanced-speech.html'',
    (SELECT id FROM categories WHERE slug = ''audio-musique''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Accusonus', (SELECT id FROM public.categories WHERE slug = 'accusonus');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'iZotope RX', 'izotope-rx', 'Suite de restauration audio professionnelle avec technologie IA.', 'https://www.izotope.com/en/products/rx.html'',
    (SELECT id FROM categories WHERE slug = ''audio-musique''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Audionamix', (SELECT id FROM public.categories WHERE slug = 'audionamix');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Sonible', 'sonible', 'Plugins audio intelligents utilisant l''''IA pour l''''amélioration sonore.', 'https://www.sonible.com/'',
    (SELECT id FROM categories WHERE slug = ''audio-musique''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Sound Theory', (SELECT id FROM public.categories WHERE slug = 'sound-theory');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Accentize', 'accentize', 'Solutions de traitement audio professionnel basées sur l''''IA.', 'https://www.accentize.com/'',
    (SELECT id FROM categories WHERE slug = ''audio-musique''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Nvidia Canvas', (SELECT id FROM public.categories WHERE slug = 'nvidia-canvas');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Kaedim', 'kaedim', 'Crée des modèles 3D à partir d''''images 2D en utilisant l''''IA.', 'https://www.kaedim3d.com/'',
    (SELECT id FROM categories WHERE slug = ''3d-animation''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Move AI', (SELECT id FROM public.categories WHERE slug = 'move-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Plask', 'plask', 'Animation 3D automatisée à partir de vidéos avec l''''IA.', 'https://plask.ai/'',
    (SELECT id FROM categories WHERE slug = ''3d-animation''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Cascadeur', (SELECT id FROM public.categories WHERE slug = 'cascadeur');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Leonardo.Ai', 'leonardo-ai', 'Plateforme de création d''''assets 3D et de textures avec l''''IA.', 'https://leonardo.ai/'',
    (SELECT id FROM categories WHERE slug = ''3d-animation''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Kinetix', (SELECT id FROM public.categories WHERE slug = 'playground-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Meshcapade', 'meshcapade', 'Création de modèles 3D de corps humains réalistes avec l''''IA.', 'https://meshcapade.com/'',
    (SELECT id FROM categories WHERE slug = ''3d-animation''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Polycam', (SELECT id FROM public.categories WHERE slug = 'polycam');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Masterpiece Studio', 'masterpiece-studio', 'Suite de création 3D en VR avec assistance IA.', 'https://masterpiecestudio.com/'',
    (SELECT id FROM categories WHERE slug = ''3d-animation''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Obviously AI', (SELECT id FROM public.categories WHERE slug = 'obviously-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'DataRobot', 'datarobot', 'Plateforme d''''IA automatisée pour l''''analyse prédictive.', 'https://www.datarobot.com/'',
    (SELECT id FROM categories WHERE slug = ''data-analysis''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''RapidMiner', (SELECT id FROM public.categories WHERE slug = 'rapidminer');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'H2O.ai', 'h2o-ai', 'Plateforme d''''IA automatisée pour l''''analyse de données.', 'https://h2o.ai/'',
    (SELECT id FROM categories WHERE slug = ''data-analysis''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Knime', (SELECT id FROM public.categories WHERE slug = 'knime');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Dataiku', 'dataiku', 'Plateforme collaborative de data science et d''''analyse.', 'https://www.dataiku.com/'',
    (SELECT id FROM categories WHERE slug = ''data-analysis''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Alteryx', (SELECT id FROM public.categories WHERE slug = 'alteryx');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Tableau', 'tableau', 'Plateforme de visualisation de données avec capacités d''''IA.', 'https://www.tableau.com/'',
    (SELECT id FROM categories WHERE slug = ''data-analysis''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Power BI', (SELECT id FROM public.categories WHERE slug = 'power-bi');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Qlik', 'qlik', 'Plateforme d''''analyse de données avec IA cognitive.', 'https://www.qlik.com/'',
    (SELECT id FROM categories WHERE slug = ''data-analysis''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''ArchAI', (SELECT id FROM public.categories WHERE slug = 'archai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Archaeological Predictor', 'archaeological-predictor', 'Outil de prédiction des sites archéologiques basé sur l''''apprentissage automatique.', 'https://archaeologicalpredictor.com/'',
    (SELECT id FROM categories WHERE slug = ''archaeology''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Digital Archaeology Tool', (SELECT id FROM public.categories WHERE slug = 'digital-archaeology-tool');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Heritage AI', 'heritage-ai', 'Plateforme d''''IA pour la préservation et l''''analyse du patrimoine culturel.', 'https://heritage-ai.org/'',
    (SELECT id FROM categories WHERE slug = ''archaeology''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Artefacts Analyzer', (SELECT id FROM public.categories WHERE slug = 'artefacts-analyzer');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'ArchaeoGPT', 'archaeogpt', 'Assistant IA spécialisé dans l''''analyse de données archéologiques.', 'https://archaeogpt.org/'',
    (SELECT id FROM categories WHERE slug = ''archaeology''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Archaeological Vision', (SELECT id FROM public.categories WHERE slug = 'archaeological-vision');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Pottery Analyzer', 'pottery-analyzer', 'Outil d''''analyse de poteries anciennes utilisant l''''apprentissage profond.', 'https://potteryanalyzer.org/'',
    (SELECT id FROM categories WHERE slug = ''archaeology''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
            ''Pachyderm', (SELECT id FROM public.categories WHERE slug = 'pachyderm');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Domino Data Lab', 'domino-data-lab', 'Plateforme enterprise pour la collaboration en data science.', 'https://www.dominodatalab.com/'',
            collab_category_id,
            ''[{"plan_name": "Enterprise', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'CNVRG.IO', 'cnvrg-io', 'Plateforme MLOps full-stack pour les équipes.', 'https://cnvrg.io/'',
            collab_category_id,
            ''[{"plan_name": "Community', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'ExtraHop Reveal(x
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
            ''SentinelOne', 'sentinelone', 'Plateforme de sécurité autonome.', 'https://www.sentinelone.com/'',
            cyber_category_id,
            ''[{"plan_name": "Enterprise', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Blue Hexagon', 'blue-hexagon', 'Sécurité cloud en temps réel par deep learning.', 'https://bluehexagon.ai/'',
            cyber_category_id,
            ''[{"plan_name": "Enterprise', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Vectra AI', 'vectra-ai', 'Détection et réponse aux menaces par IA.', 'https://www.vectra.ai/'',
            cyber_category_id,
            ''[{"plan_name": "Enterprise', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Cynet', 'cynet', 'Plateforme de sécurité autonome tout-en-un.', 'https://www.cynet.com/'',
            cyber_category_id,
            ''[{"plan_name": "Pro', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'DeepCode', 'deepcode', 'Analyse sémantique du code par IA.', 'https://www.deepcode.ai/'',
            dev_category_id,
            ''[{"plan_name": "Gratuit', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Snyk', 'snyk', 'Sécurité du code avec IA.', 'https://snyk.io/'',
            dev_category_id,
            ''[{"plan_name": "Gratuit', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'CodeSee', 'codesee', 'Cartographie et compréhension du code par IA.', 'https://www.codesee.io/'',
            dev_category_id,
            ''[{"plan_name": "Gratuit', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Sourcegraph', 'sourcegraph', 'Moteur de recherche de code avec IA.', 'https://sourcegraph.com/'',
            dev_category_id,
            ''[{"plan_name": "Gratuit', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'CodeStream', 'codestream', 'Collaboration de code en temps réel avec IA.', 'https://www.codestream.com/'',
            dev_category_id,
            ''[{"plan_name": "Gratuit', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Paxata', 'paxata', 'Plateforme de préparation de données self-service.', 'https://www.paxata.com/'',
            data_category_id,
            ''[{"plan_name": "Enterprise', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'OpenRefine', 'openrefine', 'Outil open-source de nettoyage de données.', 'https://openrefine.org/'',
            data_category_id,
            ''[{"plan_name": "Gratuit', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Databricks', 'databricks-prep', 'Plateforme unifiée d''''analyse et préparation de données.', 'https://databricks.com/'',
            data_category_id,
            ''[{"plan_name": "Enterprise', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Tamr', 'tamr', 'Unification de données par machine learning.', 'https://www.tamr.com/'',
            data_category_id,
            ''[{"plan_name": "Enterprise', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'DataRobot', 'datarobot-prep', 'Préparation automatisée des données par IA.', 'https://www.datarobot.com/'',
            data_category_id,
            ''[{"plan_name": "Enterprise', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Informatica', 'informatica', 'Solutions d''''intégration et qualité des données.', 'https://www.informatica.com/'',
            data_category_id,
            ''[{"plan_name": "Enterprise', (SELECT id FROM public.categories WHERE slug = 'price');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'ChatGPT', 'chatgpt', 'Assistant conversationnel avancé basé sur GPT-4', 'https://chat.openai.com'',
    (SELECT id FROM categories WHERE slug = ''assistants-chatbots''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Claude', (SELECT id FROM public.categories WHERE slug = 'claude');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Midjourney', 'midjourney', 'Génération d''''images par IA de haute qualité', 'https://www.midjourney.com'',
    (SELECT id FROM categories WHERE slug = ''generation-images''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''DALL-E', (SELECT id FROM public.categories WHERE slug = 'dall-e');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Stable Diffusion', 'stable-diffusion-1', 'Modèle open-source de génération d''''images', 'https://stability.ai'',
    (SELECT id FROM categories WHERE slug = ''generation-images''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Mubert', (SELECT id FROM public.categories WHERE slug = 'synthesia');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Bard', 'bard', 'Assistant IA de Google avec intégration des services Google', 'https://bard.google.com'',
    (SELECT id FROM categories WHERE slug = ''assistants-chatbots''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Copilot', (SELECT id FROM public.categories WHERE slug = 'copilot');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Duolingo Max', 'duolingo-max', 'Apprentissage des langues avec IA', 'https://duolingo.com'',
    (SELECT id FROM categories WHERE slug = ''education''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Runway', (SELECT id FROM public.categories WHERE slug = 'runway');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Jasper', 'jasper-1', 'Rédaction de contenu marketing par IA', 'https://jasper.ai'',
    (SELECT id FROM categories WHERE slug = ''redaction-contenu''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''ElevenLabs', (SELECT id FROM public.categories WHERE slug = 'elevenlabs');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Markopolo', 'markopolo', 'Création de campagnes publicitaires par IA', 'https://markopolo.ai'',
    (SELECT id FROM categories WHERE slug = ''business-marketing''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Obviously AI', (SELECT id FROM public.categories WHERE slug = 'obviously-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'MindsDB', 'mindsdb', 'Prédictions IA dans votre base de données', 'https://mindsdb.com'',
    (SELECT id FROM categories WHERE slug = ''analyse-donnees''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''DataRobot', (SELECT id FROM public.categories WHERE slug = 'datarobot');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Character.ai', 'character-ai', 'Chatbots personnalisés avec différentes personnalités', 'https://character.ai'',
    (SELECT id FROM categories WHERE slug = ''assistants-chatbots''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Soundraw', (SELECT id FROM public.categories WHERE slug = 'soundraw');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Leonardo.ai', 'leonardo-ai-1', 'Plateforme de création d''''images IA pour les professionnels', 'https://leonardo.ai'',
    (SELECT id FROM categories WHERE slug = ''generation-images''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Playground AI', (SELECT id FROM public.categories WHERE slug = 'playground-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'AIVA', 'aiva', 'Composition musicale assistée par IA', 'https://www.aiva.ai'',
    (SELECT id FROM categories WHERE slug = ''creation-musicale''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Amper', (SELECT id FROM public.categories WHERE slug = 'amper');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Notion AI', 'notion-ai-1', 'Assistant d''''écriture et d''''organisation intégré à Notion', 'https://notion.so'',
    (SELECT id FROM categories WHERE slug = ''productivite''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Mem.ai', (SELECT id FROM public.categories WHERE slug = 'figma-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Figma AI', 'figma-ai', 'Fonctionnalités IA dans Figma', 'https://figma.com'',
    (SELECT id FROM categories WHERE slug = ''design''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Vizcom', (SELECT id FROM public.categories WHERE slug = 'vizcom');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'GitHub Copilot', 'github-copilot-1', 'Assistant de programmation IA', 'https://github.com/features/copilot'',
    (SELECT id FROM categories WHERE slug = ''developpement''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Tabnine', (SELECT id FROM public.categories WHERE slug = 'tabnine');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Coursera AI', 'coursera-ai', 'Assistant d''''apprentissage personnalisé', 'https://coursera.org'',
    (SELECT id FROM categories WHERE slug = ''education''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Synthesia', (SELECT id FROM public.categories WHERE slug = 'synthesia');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Copy.ai', 'copy-ai-1', 'Génération de textes marketing', 'https://copy.ai'',
    (SELECT id FROM categories WHERE slug = ''redaction-contenu''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Murf', (SELECT id FROM public.categories WHERE slug = 'murf');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Frase', 'frase', 'Optimisation SEO et création de contenu', 'https://frase.io'',
    (SELECT id FROM categories WHERE slug = ''business-marketing''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Perplexity AI', (SELECT id FROM public.categories WHERE slug = 'perplexity-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'You.com', 'you-com', 'Moteur de recherche avec chat IA intégré', 'https://you.com'',
    (SELECT id FROM categories WHERE slug = ''recherche''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Consensus', (SELECT id FROM public.categories WHERE slug = 'consensus');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Elicit', 'elicit-1', 'Assistant de recherche scientifique par IA', 'https://elicit.org'',
    (SELECT id FROM categories WHERE slug = ''recherche''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''ResearchRabbit', (SELECT id FROM public.categories WHERE slug = 'research-rabbit');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Semantic Scholar', 'semantic-scholar-1', 'Recherche scientifique augmentée par l''''IA', 'https://semanticscholar.org'',
    (SELECT id FROM categories WHERE slug = ''recherche''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Blender AI', (SELECT id FROM public.categories WHERE slug = 'blender-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Descript', 'descript-1', 'Édition audio et vidéo par IA', 'https://descript.com'',
    (SELECT id FROM categories WHERE slug = ''audio-musique''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Zapier AI', (SELECT id FROM public.categories WHERE slug = 'zapier-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'DeepL Write', 'deepl-write', 'Assistant d''''écriture et traduction IA', 'https://deepl.com/write'',
    (SELECT id FROM categories WHERE slug = ''traduction''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''TradingView AI', (SELECT id FROM public.categories WHERE slug = 'tradingview-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Ada Health', 'ada-health', 'Assistant santé personnel par IA', 'https://ada.com'',
    (SELECT id FROM categories WHERE slug = ''sante''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Shopify Magic', (SELECT id FROM public.categories WHERE slug = 'shopify-magic');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Zillow AI', 'zillow-ai', 'Estimation et prédiction immobilière par IA', 'https://zillow.com'',
    (SELECT id FROM categories WHERE slug = ''immobilier''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Harvey AI', (SELECT id FROM public.categories WHERE slug = 'harvey-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'HiredScore', 'hiredscore', 'Plateforme de recrutement IA', 'https://hiredscore.com'',
    (SELECT id FROM categories WHERE slug = ''rh-recrutement''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''DeepMind Research', (SELECT id FROM public.categories WHERE slug = 'deepmind-research');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Edge Impulse', 'edge-impulse', 'Plateforme de développement IoT avec IA', 'https://edgeimpulse.com'',
    (SELECT id FROM categories WHERE slug = ''iot-robotique''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Unity AI', (SELECT id FROM public.categories WHERE slug = 'unity-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'StyleDNA', 'styledna', 'Assistant mode personnel par IA', 'https://styledna.ai'',
    (SELECT id FROM categories WHERE slug = ''mode-style''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''FitAI', (SELECT id FROM public.categories WHERE slug = 'fitai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'FarmGPT', 'farmgpt', 'Assistant agricole intelligent', 'https://farmgpt.ai'',
    (SELECT id FROM categories WHERE slug = ''agriculture''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Tomorrow.io', (SELECT id FROM public.categories WHERE slug = 'tomorrow-io');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'BuildAI', 'buildai', 'IA pour la gestion de chantier', 'https://buildai.construction'',
    (SELECT id FROM categories WHERE slug = ''construction''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Waymo AI', (SELECT id FROM public.categories WHERE slug = 'waymo-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'GridAI', 'gridai', 'Optimisation des réseaux électriques par IA', 'https://gridai.energy'',
    (SELECT id FROM categories WHERE slug = ''energie''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Darktrace', (SELECT id FROM public.categories WHERE slug = 'darktrace');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Siemens MindSphere', 'siemens-mindsphere', 'Plateforme IoT industrielle avec IA', 'https://siemens.mindsphere.io'',
    (SELECT id FROM categories WHERE slug = ''industrie''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Tesla Autopilot', (SELECT id FROM public.categories WHERE slug = 'tesla-autopilot');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Convoy AI', 'convoy-ai', 'Optimisation logistique par IA', 'https://convoy.com'',
    (SELECT id FROM categories WHERE slug = ''logistique''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''FoodGenius', (SELECT id FROM public.categories WHERE slug = 'foodgenius');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'ClimateAI', 'climate-ai', 'Analyse climatique par IA', 'https://climate.ai'',
    (SELECT id FROM categories WHERE slug = ''environnement''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''AirNav AI', (SELECT id FROM public.categories WHERE slug = 'airnav-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'AgentGPT', 'agentgpt', 'Plateforme no-code basée sur le navigateur permettant de créer et déployer des agents IA autonomes', 'https://agentgpt.reworkd.ai'',
    (SELECT id FROM categories WHERE slug = ''agents-automatisation''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''AutoGen', (SELECT id FROM public.categories WHERE slug = 'autogen');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'CrewAI', 'crewai', 'Framework pour créer des équipes d''''agents IA collaboratifs', 'https://github.com/joaomdmoura/crewAI'',
    (SELECT id FROM categories WHERE slug = ''agents-automatisation''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''ChatDev', (SELECT id FROM public.categories WHERE slug = 'chatdev');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'GPT Engineer', 'gpt-engineer', 'Spécifie ce que vous voulez construire, l''''IA crée le code', 'https://gptengineer.app'',
    (SELECT id FROM categories WHERE slug = ''generation-code''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Aider', (SELECT id FROM public.categories WHERE slug = 'aider');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Midjourney', 'midjourney-1', 'Outil de génération d''''images IA créant des visuels artistiques de haute qualité', 'https://www.midjourney.com'',
    (SELECT id FROM categories WHERE slug = ''generation-images''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''DALL-E', (SELECT id FROM public.categories WHERE slug = 'dall-e');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Stable Diffusion', 'stable-diffusion-2', 'Modèle open source de génération d''''images à partir de texte', 'https://stability.ai'',
    (SELECT id FROM categories WHERE slug = ''generation-images''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Synthesia', (SELECT id FROM public.categories WHERE slug = 'synthesia');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Notion AI', 'notion-ai-2', 'Assistant d''''écriture et d''''organisation intégré à Notion', 'https://www.notion.so/product/ai'',
    (SELECT id FROM categories WHERE slug = ''productivite''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Figma AI', (SELECT id FROM public.categories WHERE slug = 'figma-ai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Canva AI', 'canva-ai', 'Suite d''''outils IA pour la création graphique', 'https://www.canva.com'',
    (SELECT id FROM categories WHERE slug = ''design''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Adala', (SELECT id FROM public.categories WHERE slug = 'adala');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Agent4Rec', 'agent4rec-1', 'Système de recommandation basé sur des agents IA', 'https://github.com/LehengTHU/Agent4Rec'',
    (SELECT id FROM categories WHERE slug = ''agents-automatisation''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''AgentForge', (SELECT id FROM public.categories WHERE slug = 'agentforge');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'BabyAGI', 'babyagi-2', 'Framework simple pour la gestion des tâches utilisant l''''IA', 'https://github.com/yoheinakajima/babyagi'',
    (SELECT id FROM categories WHERE slug = ''agents-automatisation''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''BabyBeeAGI', (SELECT id FROM public.categories WHERE slug = 'babybeeagi');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'BabyCatAGI', 'babycatagi-1', 'Version légère de BabyBeeAGI avec agent de création de tâches', 'https://replit.com/@YoheiNakajima/BabyCatAGI'',
    (SELECT id FROM categories WHERE slug = ''agents-automatisation''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''AutoGPT', (SELECT id FROM public.categories WHERE slug = 'autogpt');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Automata', 'automata', 'Système de génération de code contextuel basé sur GPT-4', 'https://github.com/emrgnt-cmplxty/automata'',
    (SELECT id FROM categories WHERE slug = ''generation-code''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''AutoPR', (SELECT id FROM public.categories WHERE slug = 'autopr');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'BabyDeerAGI', 'babydeeragi-1', 'Version parallélisée de BabyAGI utilisant GPT-3.5-turbo', 'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyDeerAGI.py'',
    (SELECT id FROM categories WHERE slug = ''agents-automatisation''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''BabyElfAGI', (SELECT id FROM public.categories WHERE slug = 'babyelfagi');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'Deepset Cloud', 'deepset-cloud', 'Plateforme NLP pour construire des applications de recherche sémantique', 'https://www.deepset.ai/deepset-cloud'',
    (SELECT id FROM categories WHERE slug = ''outils-donnees''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''Devin', (SELECT id FROM public.categories WHERE slug = 'devin');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'DocsGPT', 'docsgpt', 'Solution open-source pour interroger la documentation technique', 'https://docsgpt.ai/'',
    (SELECT id FROM categories WHERE slug = ''outils-donnees''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''FlowiseAI', (SELECT id FROM public.categories WHERE slug = 'flowiseai');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'GPT Pilot', 'gpt-pilot', 'Développeur IA qui écrit des applications évolutives', 'https://github.com/Pythagora-io/gpt-pilot'',
    (SELECT id FROM categories WHERE slug = ''generation-code''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''GPT Teacher', (SELECT id FROM public.categories WHERE slug = 'gpt-teacher');

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT 'GPTStore', 'gptstore', 'Marketplace pour les agents GPT personnalisés', 'https://gptstore.ai/'',
    (SELECT id FROM categories WHERE slug = ''agents-automatisation''
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    is_active = EXCLUDED.is_active,
    is_featured = EXCLUDED.is_featured,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES 
    ''IX', (SELECT id FROM public.categories WHERE slug = 'ix');

COMMIT;
