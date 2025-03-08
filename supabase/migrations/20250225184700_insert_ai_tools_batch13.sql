-- Insert AI tools batch 13
DO $$
DECLARE
    gpt_pilot_id UUID;
    gpt_teacher_id UUID;
    gptstore_id UUID;
    gpts_id UUID;
    guardrails_id UUID;
    guidance_id UUID;
    haystack_id UUID;
    helicone_id UUID;
    httpsgpt_id UUID;
    huggingface_id UUID;
    ix_id UUID;
    jamesgpt_id UUID;
    khoj_id UUID;
    langchain_id UUID;
    languagetools_id UUID;
BEGIN
    -- Insert GPT Pilot
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'GPT Pilot',
        'Développeur IA qui écrit des applications évolutives. Un copilote de développement qui peut écrire des applications complètes et évolutives, en interagissant avec l''utilisateur pour comprendre les exigences et générer le code.',
        'https://github.com/Pythagora-io/gpt-pilot',
        'gpt-pilot'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO gpt_pilot_id;

    -- Insert GPT Teacher
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'GPT Teacher',
        'Assistant d''enseignement personnalisé alimenté par l''IA. Un agent IA conçu pour fournir un enseignement personnalisé, créer des plans de cours et générer du matériel pédagogique adapté aux besoins de l''apprenant.',
        'https://github.com/CognitiveCanvas/GPTTeacher',
        'gpt-teacher'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO gpt_teacher_id;

    -- Insert GPTStore
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'GPTStore',
        'Marketplace pour les agents GPT personnalisés. Une plateforme permettant de découvrir, partager et monétiser des agents GPT personnalisés pour diverses applications.',
        'https://gptstore.ai/',
        'gptstore'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO gptstore_id;

    -- Insert GPTs
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'GPTs',
        'Versions personnalisées de ChatGPT par OpenAI. Des versions sur mesure de ChatGPT qui peuvent être créées sans code pour des cas d''utilisation spécifiques, avec des capacités et des connaissances personnalisées.',
        'https://openai.com/gpts',
        'gpts'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO gpts_id;

    -- Insert Guardrails
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Guardrails',
        'Toolkit pour contrôler les sorties LLM. Un ensemble d''outils pour ajouter des garde-fous aux sorties des modèles de langage, assurant la qualité, la sécurité et le format des réponses.',
        'https://github.com/ShreyaR/guardrails',
        'guardrails'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO guardrails_id;

    -- Insert Guidance
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Guidance',
        'Langage pour contrôler les LLMs. Un langage de programmation conçu pour contrôler précisément les modèles de langage, permettant des interactions structurées et des sorties formatées.',
        'https://github.com/microsoft/guidance',
        'guidance'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO guidance_id;

    -- Insert Haystack
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Haystack',
        'Framework pour créer des applications NLP. Un framework open-source pour construire des applications de traitement du langage naturel, avec des composants pour la recherche sémantique et les questions-réponses.',
        'https://haystack.deepset.ai/',
        'haystack'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO haystack_id;

    -- Insert Helicone
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Helicone',
        'Plateforme d''observabilité pour LLMs. Une plateforme qui fournit des analyses détaillées et un suivi des performances pour les applications basées sur les modèles de langage.',
        'https://www.helicone.ai/',
        'helicone'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO helicone_id;

    -- Insert HttpsGPT
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'HttpsGPT',
        'Utilisation sécurisée de l''API GPT via HTTPS. Un outil qui permet d''utiliser l''API GPT de manière sécurisée via HTTPS, avec des fonctionnalités de chiffrement et d''authentification.',
        'https://httpsgpt.com/',
        'httpsgpt'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO httpsgpt_id;

    -- Insert Hugging Face
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Hugging Face',
        'Plateforme pour partager des modèles et des datasets. La plus grande plateforme pour partager des modèles d''IA, des datasets et des applications, avec une communauté active de chercheurs et de développeurs.',
        'https://huggingface.co/',
        'hugging-face'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO huggingface_id;

    -- Insert IX
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'IX',
        'Framework pour créer des agents IA. Un framework moderne pour créer des agents IA autonomes capables d''interagir avec des API et d''accomplir des tâches complexes.',
        'https://github.com/kreneskyp/ix',
        'ix'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO ix_id;

    -- Insert JamesGPT
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'JamesGPT',
        'Assistant personnel alimenté par GPT. Un assistant IA personnel qui peut gérer des tâches quotidiennes, répondre à des questions et fournir des informations personnalisées.',
        'https://jamesgpt.com/',
        'jamesgpt'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO jamesgpt_id;

    -- Insert Khoj
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Khoj',
        'Assistant IA pour rechercher dans vos notes. Un assistant IA open-source qui aide à rechercher et à naviguer dans vos notes personnelles, avec une compréhension contextuelle.',
        'https://khoj.dev/',
        'khoj'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO khoj_id;

    -- Insert LangChain
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'LangChain',
        'Framework pour développer des applications avec LLMs. Un framework populaire pour développer des applications utilisant des modèles de langage, avec des composants pour le chaînage d''actions et la gestion de contexte.',
        'https://langchain.com/',
        'langchain'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO langchain_id;

    -- Insert Language Tools
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Language Tools',
        'Collection d''outils pour le traitement du langage. Une suite d''outils pour le traitement du langage naturel, incluant des correcteurs grammaticaux et des assistants d''écriture.',
        'https://languagetools.io/',
        'language-tools'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO languagetools_id;

END $$;
