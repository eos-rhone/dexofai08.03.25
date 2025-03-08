-- Insert AI tools batch 18
DO $$
DECLARE
    airbyte_id UUID;
    anthropic_id UUID;
    assemblyai_id UUID;
    azure_openai_id UUID;
    bert_id UUID;
    chatgpt_id UUID;
    claude_id UUID;
    cohere_id UUID;
    copilot_id UUID;
    dall_e_id UUID;
    deepmind_id UUID;
    diffusion_id UUID;
    eleuther_id UUID;
    gemini_id UUID;
    gpt4_id UUID;
BEGIN
    -- Insert Airbyte
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Airbyte',
        'Plateforme d''intégration de données open-source. Une plateforme qui automatise l''extraction et le chargement de données pour l''IA et l''analyse, avec plus de 300 connecteurs.',
        'https://airbyte.com/',
        'airbyte'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO airbyte_id;

    -- Insert Anthropic
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Anthropic',
        'Entreprise d''IA axée sur la sécurité. Développeur de Claude et d''autres modèles d''IA avancés, mettant l''accent sur l''IA éthique et sûre.',
        'https://www.anthropic.com/',
        'anthropic'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO anthropic_id;

    -- Insert AssemblyAI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'AssemblyAI',
        'API de reconnaissance vocale et d''analyse audio. Une API qui convertit la parole en texte et extrait des insights à partir de conversations et de contenus audio.',
        'https://www.assemblyai.com/',
        'assemblyai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO assemblyai_id;

    -- Insert Azure OpenAI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Azure OpenAI',
        'Services OpenAI sur Azure. Version entreprise des modèles OpenAI, intégrée à l''infrastructure Azure avec des fonctionnalités de sécurité et de conformité avancées.',
        'https://azure.microsoft.com/products/cognitive-services/openai-service',
        'azure-openai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO azure_openai_id;

    -- Insert BERT
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'BERT',
        'Modèle de traitement du langage par Google. Un modèle révolutionnaire qui a transformé le NLP en comprenant le contexte bidirectionnel des mots.',
        'https://github.com/google-research/bert',
        'bert'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO bert_id;

    -- Insert ChatGPT
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'ChatGPT',
        'Assistant conversationnel d''OpenAI. Un modèle de langage avancé capable de dialoguer de manière naturelle et d''aider dans diverses tâches.',
        'https://chat.openai.com/',
        'chatgpt'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO chatgpt_id;

    -- Insert Claude
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Claude',
        'Assistant IA d''Anthropic. Un modèle de langage avancé conçu pour être utile, honnête et inoffensif, capable d''analyses approfondies.',
        'https://www.anthropic.com/claude',
        'claude'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO claude_id;

    -- Insert Cohere
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Cohere',
        'Plateforme d''IA pour les entreprises. Une suite d''outils d''IA pour créer des applications avec compréhension du langage naturel et génération de texte.',
        'https://cohere.ai/',
        'cohere'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO cohere_id;

    -- Insert GitHub Copilot
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'GitHub Copilot',
        'Assistant de programmation IA. Un outil de complétion de code qui suggère des lignes ou des fonctions entières basées sur le contexte.',
        'https://github.com/features/copilot',
        'github-copilot'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO copilot_id;

    -- Insert DALL-E
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'DALL-E',
        'Générateur d''images par IA d''OpenAI. Un modèle capable de créer des images réalistes et artistiques à partir de descriptions textuelles.',
        'https://openai.com/dall-e-3',
        'dall-e'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO dall_e_id;

    -- Insert DeepMind
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'DeepMind',
        'Entreprise de recherche en IA de Google. Connue pour AlphaGo, AlphaFold et d''autres avancées majeures en intelligence artificielle.',
        'https://deepmind.google/',
        'deepmind'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO deepmind_id;

    -- Insert Stable Diffusion
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Stable Diffusion',
        'Modèle de génération d''images open-source. Un puissant modèle de génération d''images qui peut être exécuté localement avec des ressources modestes.',
        'https://stability.ai/',
        'stable-diffusion'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO diffusion_id;

    -- Insert EleutherAI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'EleutherAI',
        'Organisation de recherche en IA open-source. Un groupe qui développe des modèles de langage open-source et fait progresser la recherche en IA.',
        'https://www.eleuther.ai/',
        'eleutherai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO eleuther_id;

    -- Insert Gemini
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Gemini',
        'Modèle d''IA multimodal de Google. Le modèle d''IA le plus avancé de Google, capable de comprendre et de générer texte, code, audio et images.',
        'https://deepmind.google/technologies/gemini/',
        'gemini'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO gemini_id;

    -- Insert GPT-4
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'GPT-4',
        'Modèle de langage avancé d''OpenAI. Le modèle le plus puissant d''OpenAI, capable de comprendre images et texte, avec des capacités de raisonnement améliorées.',
        'https://openai.com/gpt-4',
        'gpt-4'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO gpt4_id;

END $$;
