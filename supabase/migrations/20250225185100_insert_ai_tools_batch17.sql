-- Insert AI tools batch 17
DO $$
DECLARE
    typebot_id UUID;
    unstructured_id UUID;
    vercel_id UUID;
    vllm_id UUID;
    vocode_id UUID;
    weaviate_id UUID;
    webllm_id UUID;
    whylogs_id UUID;
    wisdomprompt_id UUID;
    x_agent_id UUID;
    xturing_id UUID;
    yayi_id UUID;
    zephyr_id UUID;
BEGIN
    -- Insert Typebot
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Typebot',
        'Constructeur de chatbots conversationnels. Une alternative open-source à Typeform qui permet de créer des chatbots conversationnels avec une interface drag & drop.',
        'https://typebot.io/',
        'typebot'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO typebot_id;

    -- Insert Unstructured
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Unstructured',
        'Bibliothèque pour extraire du texte de documents. Une bibliothèque open-source pour pré-traiter et extraire du texte à partir de documents non structurés.',
        'https://unstructured.io/',
        'unstructured'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO unstructured_id;

    -- Insert Vercel AI SDK
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Vercel AI SDK',
        'SDK pour construire des applications IA. Un kit de développement qui simplifie l''intégration de fonctionnalités d''IA dans les applications web.',
        'https://sdk.vercel.ai/',
        'vercel-ai-sdk'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO vercel_id;

    -- Insert vLLM
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'vLLM',
        'Bibliothèque pour servir des LLMs. Une bibliothèque open-source pour servir des LLMs avec une mise en cache optimisée et une latence réduite.',
        'https://github.com/vllm-project/vllm',
        'vllm'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO vllm_id;

    -- Insert Vocode
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Vocode',
        'Bibliothèque pour créer des agents vocaux. Une bibliothèque open-source pour construire des agents conversationnels vocaux personnalisés.',
        'https://github.com/vocodedev/vocode-python',
        'vocode'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO vocode_id;

    -- Insert Weaviate
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Weaviate',
        'Base de données vectorielle open-source. Une base de données vectorielle pour stocker des objets et des vecteurs avec recherche sémantique.',
        'https://weaviate.io/',
        'weaviate'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO weaviate_id;

    -- Insert WebLLM
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'WebLLM',
        'LLMs dans le navigateur. Une solution pour exécuter des modèles de langage directement dans le navigateur web.',
        'https://webllm.mlc.ai/',
        'webllm'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO webllm_id;

    -- Insert whylogs
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'whylogs',
        'Framework de logging pour l''IA. Un framework open-source pour la collecte de statistiques et le monitoring des systèmes d''IA.',
        'https://github.com/whylabs/whylogs',
        'whylogs'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO whylogs_id;

    -- Insert WisdomPrompt
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'WisdomPrompt',
        'Framework pour l''optimisation de prompts. Un framework qui aide à créer et optimiser des prompts pour les modèles de langage.',
        'https://github.com/wisdom-prompt/wisdom-prompt',
        'wisdomprompt'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO wisdomprompt_id;

    -- Insert X-Agent
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'X-Agent',
        'Agent autonome pour le développement. Un agent IA autonome capable de développer des applications complètes à partir de descriptions.',
        'https://github.com/OpenBMB/XAgent',
        'x-agent'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO x_agent_id;

    -- Insert X-Turing
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'X-Turing',
        'Plateforme pour construire des applications LLM. Une plateforme qui simplifie la construction d''applications basées sur les modèles de langage.',
        'https://www.x-turing.com/',
        'x-turing'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO xturing_id;

    -- Insert YAYI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'YAYI',
        'Assistant IA multilingue. Un assistant IA capable de communiquer dans plusieurs langues et d''effectuer diverses tâches.',
        'https://github.com/wenge-research/YAYI',
        'yayi'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO yayi_id;

    -- Insert Zephyr
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Zephyr',
        'Modèle de langage open-source. Un modèle de langage open-source optimisé pour les performances et la facilité d''utilisation.',
        'https://github.com/huggingface/zephyr',
        'zephyr'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO zephyr_id;

END $$;
