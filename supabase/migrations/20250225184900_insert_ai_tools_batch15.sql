-- Insert AI tools batch 15
DO $$
DECLARE
    opencopilot_id UUID;
    openflamingo_id UUID;
    openinterpreter_id UUID;
    oss_id UUID;
    petals_id UUID;
    phind_id UUID;
    portkey_id UUID;
    privategpt_id UUID;
    promptflow_id UUID;
    promptfoo_id UUID;
    promptlayer_id UUID;
    prompttools_id UUID;
    pythagora_id UUID;
    questionanything_id UUID;
    ragas_id UUID;
BEGIN
    -- Insert OpenCopilot
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'OpenCopilot',
        'Framework open-source pour créer des copilotes IA. Une solution pour construire des assistants IA personnalisés qui peuvent être intégrés dans n''importe quelle application SaaS.',
        'https://github.com/openchatai/OpenCopilot',
        'opencopilot'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO opencopilot_id;

    -- Insert OpenFlamingo
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'OpenFlamingo',
        'Framework open-source pour l''IA multimodale. Une implémentation open-source d''un modèle de langage multimodal capable de comprendre à la fois le texte et les images.',
        'https://github.com/mlfoundations/open_flamingo',
        'openflamingo'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO openflamingo_id;

    -- Insert Open Interpreter
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Open Interpreter',
        'Assistant qui peut exécuter du code sur votre ordinateur. Un interpréteur de langage naturel qui permet aux modèles de langage d''exécuter du code sur votre machine locale.',
        'https://github.com/KillianLucas/open-interpreter',
        'open-interpreter'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO openinterpreter_id;

    -- Insert OSS Insight
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'OSS Insight',
        'Plateforme d''analyse pour projets open-source. Un outil qui fournit des analyses détaillées et des insights sur les projets open-source et leurs communautés.',
        'https://ossinsight.io/',
        'oss-insight'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO oss_id;

    -- Insert Petals
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Petals',
        'Exécution distribuée de LLMs via BitTorrent. Une plateforme qui permet d''exécuter de grands modèles de langage de manière distribuée en utilisant le protocole BitTorrent.',
        'https://github.com/bigscience-workshop/petals',
        'petals'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO petals_id;

    -- Insert Phind
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Phind',
        'Moteur de recherche IA pour développeurs. Un moteur de recherche spécialisé qui utilise l''IA pour aider les développeurs à trouver des réponses à leurs questions techniques.',
        'https://www.phind.com/',
        'phind'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO phind_id;

    -- Insert Portkey
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Portkey',
        'SDK pour intégrer l''IA dans les applications. Un SDK qui simplifie l''intégration de fonctionnalités d''IA dans les applications, avec gestion des modèles et des prompts.',
        'https://portkey.ai/',
        'portkey'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO portkey_id;

    -- Insert PrivateGPT
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'PrivateGPT',
        'LLM local pour documents confidentiels. Une solution pour interagir avec des documents privés en utilisant des modèles de langage exécutés localement, sans envoi de données.',
        'https://github.com/imartinez/privateGPT',
        'privategpt'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO privategpt_id;

    -- Insert PromptFlow
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'PromptFlow',
        'Plateforme pour développer des applications LLM. Un outil pour construire, optimiser et déployer des applications basées sur des LLMs de manière efficace.',
        'https://microsoft.github.io/promptflow/',
        'promptflow'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO promptflow_id;

    -- Insert Promptfoo
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Promptfoo',
        'Outil de test et d''évaluation de prompts. Un outil open-source pour tester, évaluer et comparer différents prompts pour les modèles de langage.',
        'https://github.com/promptfoo/promptfoo',
        'promptfoo'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO promptfoo_id;

    -- Insert PromptLayer
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'PromptLayer',
        'Plateforme de gestion de prompts pour LLMs. Une plateforme pour gérer, versionner et optimiser les prompts utilisés avec les modèles de langage.',
        'https://promptlayer.com/',
        'promptlayer'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO promptlayer_id;

    -- Insert PromptTools
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'PromptTools',
        'Suite d''outils pour l''ingénierie de prompts. Une collection d''outils open-source pour développer et optimiser des prompts pour les modèles de langage.',
        'https://github.com/hegelai/prompttools',
        'prompttools'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO prompttools_id;

    -- Insert Pythagora
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Pythagora',
        'Plateforme de test pour applications IA. Une plateforme qui permet de tester automatiquement les applications basées sur l''IA pour assurer leur qualité.',
        'https://github.com/Pythagora-io/pythagora',
        'pythagora'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO pythagora_id;

    -- Insert QuestionAnything
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'QuestionAnything',
        'Système de questions-réponses basé sur l''IA. Un outil qui permet de poser des questions et d''obtenir des réponses pertinentes à partir de diverses sources de données.',
        'https://www.questionanything.ai/',
        'questionanything'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO questionanything_id;

    -- Insert Ragas
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Ragas',
        'Framework d''évaluation pour systèmes RAG. Un framework pour évaluer les performances des systèmes de génération augmentée par la récupération (RAG).',
        'https://github.com/explodinggradients/ragas',
        'ragas'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO ragas_id;

END $$;
