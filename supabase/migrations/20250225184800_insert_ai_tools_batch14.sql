-- Insert AI tools batch 14
DO $$
DECLARE
    llama_hub_id UUID;
    llama_index_id UUID;
    localai_id UUID;
    marvin_id UUID;
    memgpt_id UUID;
    metagen_id UUID;
    minigpt4_id UUID;
    mrkl_id UUID;
    multiagent_id UUID;
    multimodal_id UUID;
    notebooklm_id UUID;
    octoai_id UUID;
    ollama_id UUID;
    openagents_id UUID;
    openassistant_id UUID;
BEGIN
    -- Insert LlamaHub
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'LlamaHub',
        'Collection de connecteurs de données pour LLMs. Une bibliothèque open-source de connecteurs de données pour intégrer diverses sources de données avec des modèles de langage.',
        'https://llamahub.ai/',
        'llamahub'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO llama_hub_id;

    -- Insert LlamaIndex
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'LlamaIndex',
        'Framework pour connecter des données personnalisées aux LLMs. Un framework qui permet d''indexer et de requêter des données personnalisées avec des modèles de langage de manière efficace.',
        'https://www.llamaindex.ai/',
        'llamaindex'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO llama_index_id;

    -- Insert LocalAI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'LocalAI',
        'Alternative open-source à OpenAI. Un drop-in replacement local pour l''API OpenAI, permettant d''exécuter des modèles d''IA en local avec une API compatible.',
        'https://localai.io/',
        'localai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO localai_id;

    -- Insert Marvin
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Marvin',
        'Framework pour construire des agents IA. Un framework lightweight pour construire des agents IA qui peuvent comprendre et exécuter des tâches complexes.',
        'https://www.askmarvin.ai/',
        'marvin'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO marvin_id;

    -- Insert MemGPT
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'MemGPT',
        'Extension de mémoire pour les LLMs. Un système qui permet aux modèles de langage de maintenir des conversations longues avec une gestion efficace de la mémoire.',
        'https://github.com/cpacker/MemGPT',
        'memgpt'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO memgpt_id;

    -- Insert MetaGPT
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'MetaGPT',
        'Framework multi-agents pour le développement logiciel. Un framework qui assigne différents rôles (PO, architecte, développeur, testeur) à des agents pour collaborer sur des projets logiciels.',
        'https://github.com/geekan/MetaGPT',
        'metagpt'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO metagen_id;

    -- Insert MiniGPT-4
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'MiniGPT-4',
        'Version légère de GPT-4 avec capacités visuelles. Une implémentation plus légère et accessible de GPT-4 avec des capacités de traitement d''images.',
        'https://minigpt-4.github.io/',
        'minigpt4'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO minigpt4_id;

    -- Insert MRKL
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'MRKL',
        'Système modulaire pour combiner LLMs et outils externes. Une architecture qui combine des modèles de langage avec des outils spécialisés pour résoudre des problèmes complexes.',
        'https://github.com/microsoft/MRKL',
        'mrkl'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO mrkl_id;

    -- Insert MultiAgent
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'MultiAgent',
        'Framework pour créer des systèmes multi-agents. Un framework permettant de créer et de gérer des systèmes avec plusieurs agents IA collaborant ensemble.',
        'https://github.com/OpenBMB/MultiAgent',
        'multiagent'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO multiagent_id;

    -- Insert Multimodal
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Multimodal',
        'Agents IA capables de traiter plusieurs types de données. Des agents qui peuvent comprendre et traiter différents types de données (texte, images, audio) simultanément.',
        'https://github.com/openai/multimodal',
        'multimodal'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO multimodal_id;

    -- Insert NotebookLM
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'NotebookLM',
        'Assistant IA pour la prise de notes intelligente. Un outil d''IA qui aide à organiser, analyser et extraire des informations de vos notes et documents.',
        'https://notebooklm.google/',
        'notebooklm'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO notebooklm_id;

    -- Insert OctoAI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'OctoAI',
        'Plateforme d''inférence pour modèles d''IA. Une plateforme cloud qui permet de déployer et d''exécuter des modèles d''IA avec une mise à l''échelle automatique.',
        'https://octoai.cloud/',
        'octoai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO octoai_id;

    -- Insert Ollama
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Ollama',
        'Exécution locale de LLMs sur votre machine. Un outil qui permet d''exécuter des modèles de langage localement sur votre ordinateur, avec une configuration simple.',
        'https://ollama.ai/',
        'ollama'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO ollama_id;

    -- Insert OpenAgents
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'OpenAgents',
        'Collection open-source d''agents IA. Une collection d''agents IA open-source pour différentes tâches, avec des capacités de traitement du langage naturel.',
        'https://github.com/OpenAgentsInc/openagents',
        'openagents'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO openagents_id;

    -- Insert OpenAssistant
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'OpenAssistant',
        'Assistant conversationnel open-source. Un projet communautaire pour créer un assistant IA conversationnel open-source, transparent et accessible à tous.',
        'https://open-assistant.io/',
        'openassistant'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO openassistant_id;

END $$;
