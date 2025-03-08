-- Insert AI tools batch 11
DO $$
DECLARE
    bambooai_id UUID;
    beebot_id UUID;
    blinky_id UUID;
    bloop_id UUID;
    bondai_id UUID;
    bumpgen_id UUID;
    calai_id UUID;
    camel_id UUID;
    chatarena_id UUID;
    chatdev_id UUID;
    chemcrow_id UUID;
    clippy_id UUID;
    codefuse_id UUID;
    cody_ajhous_id UUID;
    cody_sourcegraph_id UUID;
    continue_id UUID;
    crewai_id UUID;
    data_to_paper_id UUID;
    databerry_id UUID;
BEGIN
    -- Insert BambooAI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'BambooAI',
        'Exploration et analyse de données pour non-programmeurs. Fonctionne en boucle, permet le mélange de différents modèles, maintient la mémoire des conversations précédentes, et construit des prompts dynamiquement en utilisant un contexte pertinent de la base de données vectorielle Pinecone.',
        'https://github.com/pgalko/BambooAI',
        'bambooai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO bambooai_id;

    -- Insert BeeBot
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'BeeBot',
        'Projet en phase initiale pour une large gamme de tâches. Actuellement en développement, il est considéré comme un projet de recherche en phase précoce, non destiné à une utilisation en production.',
        'https://github.com/AutoPackAI/beebot',
        'beebot'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO beebot_id;

    -- Insert Blinky
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Blinky',
        'Agent de débogage IA open-source pour VSCode. Utilise les LLM pour identifier et corriger les erreurs de code backend, s''appuyant sur l''API VSCode, le protocole LSP et le débogage par instruction print.',
        'https://github.com/seahyinghang8/blinky',
        'blinky'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO blinky_id;

    -- Insert Bloop
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Bloop',
        'Recherche de code IA, fonctionne pour Rust et TypeScript. Un moteur de recherche sémantique alimenté par GPT-4 utilisant un agent IA, offrant une navigation précise du code et construit sur des graphes de pile.',
        'https://bloop.ai/',
        'bloop'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO bloop_id;

    -- Insert BondAI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'BondAI',
        'Interpréteur de code avec CLI et API RESTful/WebSocket. Un agent IA autonome hautement capable avec une CLI facile à utiliser, une API RESTful/WebSocket, une image Docker pré-construite et une suite robuste d''outils intégrés.',
        'https://bondai.dev/',
        'bondai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO bondai_id;

    -- Insert bumpgen
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'bumpgen',
        'Agent IA qui maintient les dépendances npm à jour. Met la gestion et les mises à jour des dépendances en pilote automatique, met à jour la version d''un package npm puis génère les corrections de code pour les changements incompatibles.',
        'https://github.com/xeol-io/bumpgen',
        'bumpgen'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO bumpgen_id;

    -- Insert Cal.ai
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Cal.ai',
        'Assistant de planification open-source construit sur Cal.com. Peut réserver des réunions, résumer votre semaine et trouver du temps avec d''autres personnes en utilisant le langage naturel.',
        'https://cal.ai',
        'calai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO calai_id;

    -- Insert CAMEL
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'CAMEL',
        'Architecture pour l''exploration "mentale" des agents. Une bibliothèque open-source conçue pour l''étude d''agents autonomes et communicatifs, avec un agent utilisateur IA donnant des instructions et un agent assistant IA suivant ces instructions.',
        'https://github.com/camel-ai/camel',
        'camel'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO camel_id;

    -- Insert ChatArena
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'ChatArena',
        'Outil de chat pour l''interaction multi-agents. Un environnement de jeu de langage multi-agents pour LLMs, visant à développer les capacités de communication et de collaboration des IA.',
        'https://www.chatarena.org/',
        'chatarena'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO chatarena_id;

    -- Insert ChatDev
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'ChatDev',
        'Agents communicatifs pour le développement logiciel. Une entreprise logicielle virtuelle pilotée par de multiples agents intelligents assumant différents rôles (CEO, CPO, CTO, programmeur, reviewer, testeur, designer).',
        'https://github.com/OpenBMB/ChatDev',
        'chatdev'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO chatdev_id;

    -- Insert ChemCrow
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'ChemCrow',
        'Agent LangChain pour les tâches liées à la chimie. Package open source pour la résolution précise de tâches chimiques nécessitant du raisonnement, intégrant 13 outils conçus par des experts.',
        'https://github.com/ur-whitelab/chemcrow-public',
        'chemcrow'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO chemcrow_id;

    -- Insert Clippy
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Clippy',
        'Agent capable de planifier, écrire, déboguer et tester du code. Peut développer du code de manière autonome ou en collaboration avec l''utilisateur.',
        'https://github.com/ennucore/clippy/',
        'clippy'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO clippy_id;

    -- Insert CodeFuse-ChatBot
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'CodeFuse-ChatBot',
        'Agent servant l''ensemble du cycle de vie du développement logiciel. Un assistant intelligent alimenté par un framework multi-agents, travaillant avec des outils DevOps et des dépôts de code et de documentation.',
        'https://github.com/codefuse-ai/codefuse-chatbot',
        'codefuse-chatbot'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO codefuse_id;

    -- Insert Cody (ajhous44)
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Cody by ajhous44',
        'Interrogez et naviguez dans votre base de code. Un assistant IA conçu pour interroger votre base de code en langage naturel, utilisant des embeddings vectoriels et les modèles de langage d''OpenAI.',
        'https://github.com/ajhous44/cody',
        'cody-ajhous44'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO cody_ajhous_id;

    -- Insert Cody (Sourcegraph)
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Cody by Sourcegraph',
        'Agent qui écrit du code et répond à vos questions. Un assistant de code IA de Sourcegraph qui écrit du code et répond aux questions en lisant l''ensemble de votre base de code et le graphe de code.',
        'https://docs.sourcegraph.com/cody',
        'cody-sourcegraph'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO cody_sourcegraph_id;

    -- Insert Continue
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Continue',
        'Pilote automatique open-source pour le développement logiciel. Apporte la puissance de ChatGPT à VS Code avec des fonctionnalités comme la réponse aux questions de codage, l''édition en langage naturel et la génération de fichiers.',
        'https://continue.dev/',
        'continue'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO continue_id;

    -- Insert CrewAI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'CrewAI',
        'Framework pour orchestrer des agents jouant des rôles. Framework de pointe pour orchestrer des agents IA autonomes jouant des rôles, permettant une collaboration intelligente pour résoudre des tâches complexes.',
        'https://github.com/joaomdmoura/crewai',
        'crewai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO crewai_id;

    -- Insert data-to-paper
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'data-to-paper',
        'Recherche pilotée par l''IA des données aux articles de recherche vérifiables. Framework pour naviguer systématiquement dans la puissance de l''IA pour effectuer une recherche scientifique complète, des données brutes aux articles scientifiques complets.',
        'https://github.com/Technion-Kishony-lab/data-to-paper',
        'data-to-paper'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO data_to_paper_id;

    -- Insert Databerry
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Databerry',
        'Construction de chatbot sans code (Pivoted to Chaindesk). Une plateforme no-code super facile pour créer des chatbots IA entraînés sur vos propres données, prêts à être déployés sur site web, Slack, Crisp ou Zapier.',
        'https://www.databerry.ai/',
        'databerry'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO databerry_id;

END $$;
