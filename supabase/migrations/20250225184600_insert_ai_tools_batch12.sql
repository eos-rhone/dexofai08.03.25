-- Insert AI tools batch 12
DO $$
DECLARE
    deepset_cloud_id UUID;
    devin_id UUID;
    docsgpt_id UUID;
    dotagent_id UUID;
    drugai_id UUID;
    e2b_id UUID;
    embedchain_id UUID;
    evals_id UUID;
    excelformulabot_id UUID;
    fastgpt_id UUID;
    flowiseai_id UUID;
    functionary_id UUID;
    geniusai_id UUID;
    gpt_engineer_id UUID;
    gpt_researcher_id UUID;
BEGIN
    -- Insert Deepset Cloud
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Deepset Cloud',
        'Plateforme NLP pour construire des applications de recherche sémantique. Une plateforme cloud pour construire des applications NLP de bout en bout avec des pipelines de recherche sémantique, des systèmes de questions-réponses et des chatbots.',
        'https://www.deepset.ai/deepset-cloud',
        'deepset-cloud'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO deepset_cloud_id;

    -- Insert Devin
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Devin',
        'Premier ingénieur logiciel IA autonome au monde. Un agent IA capable de contribuer à des projets logiciels comme un ingénieur humain, pouvant planifier, écrire et déboguer du code de manière autonome.',
        'https://www.cognition-labs.com/devin',
        'devin'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO devin_id;

    -- Insert DocsGPT
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'DocsGPT',
        'Solution open-source pour interroger la documentation technique. Un chatbot IA open-source qui simplifie la recherche et la compréhension de la documentation technique, avec une interface web et une extension VSCode.',
        'https://docsgpt.ai/',
        'docsgpt'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO docsgpt_id;

    -- Insert DotAgent
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'DotAgent',
        'Agent IA pour l''automatisation des tâches de développement. Un agent IA conçu pour automatiser les tâches de développement répétitives, capable de comprendre et d''exécuter des instructions en langage naturel.',
        'https://github.com/DotAgent',
        'dotagent'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO dotagent_id;

    -- Insert DrugAI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'DrugAI',
        'Agent IA pour la découverte de médicaments. Un agent autonome spécialisé dans la recherche et la découverte de nouveaux médicaments, utilisant l''apprentissage automatique et l''IA pour analyser les composés chimiques.',
        'https://github.com/GIST-CSBL/DrugAI',
        'drugai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO drugai_id;

    -- Insert E2B
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'E2B',
        'Infrastructure pour exécuter des agents IA en toute sécurité. Une plateforme cloud qui permet d''exécuter des agents IA dans des environnements isolés et sécurisés, avec accès à des outils et des API.',
        'https://e2b.dev',
        'e2b'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO e2b_id;

    -- Insert Embedchain
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Embedchain',
        'Framework pour construire des chatbots RAG. Un framework Python qui simplifie la création de chatbots avec Retrieval Augmented Generation (RAG), permettant d''entraîner des bots sur des données personnalisées.',
        'https://github.com/embedchain/embedchain',
        'embedchain'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO embedchain_id;

    -- Insert Evals
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Evals',
        'Framework pour évaluer les modèles de langage. Un framework d''évaluation pour les LLMs qui permet de créer et d''exécuter des tests automatisés pour mesurer les performances des modèles.',
        'https://github.com/openai/evals',
        'evals'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO evals_id;

    -- Insert ExcelFormulaBot
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'ExcelFormulaBot',
        'Assistant IA pour les formules Excel. Un bot qui aide à créer et à comprendre les formules Excel complexes, traduisant les descriptions en langage naturel en formules fonctionnelles.',
        'https://excelformulabot.com/',
        'excelformulabot'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO excelformulabot_id;

    -- Insert FastGPT
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'FastGPT',
        'Plateforme pour construire des applications IA rapidement. Une plateforme qui permet de construire rapidement des applications basées sur les LLMs, avec des fonctionnalités de traitement de données et d''intégration.',
        'https://fastgpt.app/',
        'fastgpt'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO fastgpt_id;

    -- Insert FlowiseAI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'FlowiseAI',
        'Interface drag & drop pour construire des flux LangChain. Un outil open-source qui permet de construire des chaînes LangChain personnalisées avec une interface visuelle intuitive.',
        'https://flowiseai.com/',
        'flowiseai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO flowiseai_id;

    -- Insert Functionary
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Functionary',
        'LLM entraîné pour l''appel de fonctions. Un modèle de langage spécialement entraîné pour comprendre et exécuter des appels de fonctions de manière fiable et précise.',
        'https://github.com/MeetKai/functionary',
        'functionary'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO functionary_id;

    -- Insert Genius AI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Genius AI',
        'Plateforme no-code pour créer des agents IA. Une plateforme qui permet de créer des agents IA personnalisés sans code, avec des capacités de traitement du langage naturel et d''automatisation.',
        'https://www.genius.design/',
        'genius-ai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO geniusai_id;

    -- Insert GPT Engineer
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'GPT Engineer',
        'Agent qui spécifie, écrit et améliore le code. Un outil qui permet de générer des applications complètes à partir de descriptions en langage naturel, en utilisant GPT pour la génération de code.',
        'https://github.com/AntonOsika/gpt-engineer',
        'gpt-engineer'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO gpt_engineer_id;

    -- Insert GPT Researcher
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'GPT Researcher',
        'Agent autonome pour la recherche approfondie. Un agent IA capable de mener des recherches approfondies sur n''importe quel sujet et de générer des rapports détaillés avec des citations.',
        'https://github.com/assafelovic/gpt-researcher',
        'gpt-researcher'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO gpt_researcher_id;

END $$;
