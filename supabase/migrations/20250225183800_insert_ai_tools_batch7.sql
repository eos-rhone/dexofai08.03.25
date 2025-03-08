-- Insert AI tools batch 7
DO $$
DECLARE
    adala_id UUID;
    agent4rec_id UUID;
    agentforge_id UUID;
    agentgpt_id UUID;
    agentpilot_id UUID;
    agents_id UUID;
    agentverse_id UUID;
    ai_legion_id UUID;
    aider_id UUID;
    ailice_id UUID;
    autogen_id UUID;
    autogpt_id UUID;
    automata_id UUID;
    autopr_id UUID;
    hr_chatbot_id UUID;
    babyagi_id UUID;
    babybeeagi_id UUID;
    babycatagi_id UUID;
    babydeeragi_id UUID;
    babyelfagi_id UUID;
    babycommandagi_id UUID;
    babyfoxagi_id UUID;
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
    agent_category_id UUID;
BEGIN
    -- Get the Agents & Automatisation category ID
    SELECT id INTO STRICT agent_category_id
    FROM categories
    WHERE slug = 'agents-automatisation';

    -- Insert Adala
    INSERT INTO ai_tools (name, description, website_url, slug, category_id)
    VALUES (
        'Adala',
        'Framework d''agent autonome pour l''étiquetage de données. Caractéristiques principales : agents fiables basés sur des données vérifiées, sortie contrôlable avec contraintes flexibles, spécialisé dans le traitement et l''étiquetage personnalisé des données, apprentissage autonome via observations et réflexions, runtime flexible et extensible, et facilement personnalisable pour des défis uniques.',
        'https://github.com/HumanSignal/Adala',
        'adala',
        agent_category_id
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO adala_id;

    -- Insert Agent4Rec
    INSERT INTO ai_tools (name, description, website_url, slug, category_id)
    VALUES (
        'Agent4Rec',
        'Simulateur de système de recommandation utilisant 1000 agents génératifs basés sur LLM. Les agents sont initialisés à partir du dataset MovieLens-1M, incarnant divers traits sociaux et préférences. Chaque agent interagit avec des recommandations de films personnalisées et effectue diverses actions comme regarder, évaluer, et interviewer.',
        'https://github.com/LehengTHU/Agent4Rec',
        'agent4rec',
        agent_category_id
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO agent4rec_id;

    -- Insert AgentForge
    INSERT INTO ai_tools (name, description, website_url, slug, category_id)
    VALUES (
        'AgentForge',
        'Plateforme agnostique LLM pour la construction et le test d''agents. Framework low-code conçu pour la création rapide, le test et l''itération d''agents autonomes IA et d''architectures cognitives. Compatible avec divers modèles LLM comme OpenAI et Claude d''Anthropic.',
        'https://github.com/DataBassGit/AgentForge',
        'agentforge',
        agent_category_id
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO agentforge_id;

    -- Insert AgentGPT
    INSERT INTO ai_tools (name, description, website_url, slug, category_id)
    VALUES (
        'AgentGPT',
        'Version no-code basée sur navigateur d''AutoGPT. Plateforme permettant d''assigner des objectifs à l''agent, observer son processus de réflexion, formuler un plan d''exécution et prendre des actions en conséquence. Utilise les fonctions OpenAI et supporte gpt-3.5-16k.',
        'https://agentgpt.reworkd.ai/',
        'agentgpt',
        agent_category_id
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO agentgpt_id;

    -- Continue with more tools...
    -- Note: This is just the start of the migration. I'll continue with the rest of the tools.
    -- The complete migration will include all tools from the list with their French translations.

END $$;
