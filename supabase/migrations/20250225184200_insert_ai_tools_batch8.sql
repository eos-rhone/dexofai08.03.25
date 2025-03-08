-- Insert AI tools batch 8
DO $$
DECLARE
    agentpilot_id UUID;
    agents_id UUID;
    agentverse_id UUID;
    ai_legion_id UUID;
    aider_id UUID;
    ailice_id UUID;
BEGIN
    -- Insert AgentPilot
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'AgentPilot',
        'Application de bureau pour construire, gérer et discuter avec des agents IA. Intégré avec Open Interpreter et MemGPT, offrant des fonctionnalités de chat en groupe.',
        'https://github.com/jbexta/AgentPilot',
        'agentpilot'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO agentpilot_id;

    -- Insert Agents
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Agents',
        'Bibliothèque/framework pour construire des agents linguistiques. Équipé de mémoire à court et long terme via VectorDB, capacités d''utilisation d''outils externes, navigation web, et communication multi-agents. Permet une interaction humain-agent flexible.',
        'https://github.com/aiwaves-cn/agents',
        'agents'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO agents_id;

    -- Insert AgentVerse
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'AgentVerse',
        'Plateforme pour la résolution de tâches et la simulation d''agents. Permet d''assembler plusieurs agents pour accomplir des tâches collaborativement et de créer des environnements personnalisés pour observer ou interagir avec de multiples agents.',
        'https://github.com/OpenBMB/AgentVerse',
        'agentverse'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO agentverse_id;

    -- Insert AI Legion
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'AI Legion',
        'Plateforme multi-agents TypeScript, similaire à AutoGPT. Une plateforme d''agents autonomes alimentée par LLM permettant aux agents de travailler ensemble pour accomplir des tâches. Les interactions se font via des messages directs en console.',
        'https://github.com/eumemic/ai-legion',
        'ai-legion'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO ai_legion_id;

    -- Insert Aider
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Aider',
        'Outil en ligne de commande pour éditer du code dans votre dépôt local. Permet de faire de la programmation en binôme avec GPT-3.5/GPT-4, de démarrer un nouveau projet ou de travailler sur un dépôt existant. Les modifications sont automatiquement committées avec des messages pertinents.',
        'https://github.com/paul-gauthier/aider',
        'aider'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO aider_id;

    -- Insert AIlice
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'AIlice',
        'Créez des arbres d''appels d''agents pour exécuter vos tâches. Un agent sous forme de chatbot qui planifie indépendamment les tâches données en langage naturel et crée dynamiquement un arbre d''appels d''agents pour les exécuter.',
        'https://github.com/myshell-ai/AIlice',
        'ailice'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO ailice_id;

END $$;
