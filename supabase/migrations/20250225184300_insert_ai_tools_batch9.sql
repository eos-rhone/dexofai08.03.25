-- Insert AI tools batch 9
DO $$
DECLARE
    autogen_id UUID;
    autogpt_id UUID;
    automata_id UUID;
    autopr_id UUID;
    hr_chatbot_id UUID;
    babyagi_id UUID;
BEGIN
    -- Insert AutoGen
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'AutoGen',
        'Framework multi-agents avec une grande diversité d''agents. Permet de développer des applications LLM avec plusieurs agents conversationnels qui peuvent collaborer pour résoudre des tâches et interagir avec les humains. Simplifie les workflows LLM complexes et améliore l''inférence avec des fonctionnalités de réglage des performances.',
        'https://github.com/microsoft/autogen',
        'autogen'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO autogen_id;

    -- Insert AutoGPT
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'AutoGPT',
        'Tentative expérimentale open-source de rendre GPT-4 totalement autonome. Enchaîne les "pensées" LLM pour atteindre automatiquement n''importe quel objectif fixé. Dispose d''un accès Internet pour les recherches, d''une gestion de la mémoire à court et long terme, et peut exécuter de nombreuses commandes.',
        'https://agpt.co',
        'autogpt'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO autogpt_id;

    -- Insert Automata
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Automata',
        'Génère du code basé sur le contexte de votre projet. Utilise GPT-4 pour prendre votre projet comme contexte, recevoir des tâches et exécuter les instructions de manière transparente. Vise à évoluer vers un système d''IA auto-programmable entièrement autonome.',
        'https://github.com/emrgnt-cmplxty/automata',
        'automata'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO automata_id;

    -- Insert AutoPR
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'AutoPR',
        'Agent de pull requests générées par IA qui corrige les problèmes. Déclenché en ajoutant un label contenant AutoPR à un problème, il planifie une correction, écrit le code, pousse une branche et ouvre une pull request.',
        'https://github.com/irgolic/AutoPR',
        'autopr'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO autopr_id;

    -- Insert Autonomous HR Chatbot
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Autonomous HR Chatbot',
        'Agent qui répond aux requêtes RH en utilisant des outils. Une application d''entreprise prototype - un assistant RH autonome alimenté par GPT-3.5 qui peut répondre aux questions RH de manière autonome en utilisant des outils comme la politique de pointage, les données des employés et une calculatrice.',
        'https://github.com/stepanogil/autonomous-hr-chatbot',
        'autonomous-hr-chatbot'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO hr_chatbot_id;

    -- Insert BabyAGI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'BabyAGI',
        'Framework simple pour gérer des tâches en utilisant l''IA. Version simplifiée de l''agent autonome original, qui crée des tâches basées sur les résultats des tâches précédentes et un objectif prédéfini. Utilise les capacités NLP d''OpenAI pour créer de nouvelles tâches et gère une liste de tâches pour la priorisation.',
        'https://github.com/yoheinakajima/babyagi',
        'babyagi'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO babyagi_id;

END $$;
