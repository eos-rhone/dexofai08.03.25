-- Insert AI tools batch 16
DO $$
DECLARE
    rags_id UUID;
    replicate_id UUID;
    rivet_id UUID;
    semantic_kernel_id UUID;
    shell_gpt_id UUID;
    sidekick_id UUID;
    superagent_id UUID;
    superalign_id UUID;
    sweep_id UUID;
    tabby_id UUID;
    taskweaver_id UUID;
    textbase_id UUID;
    together_id UUID;
    toolformer_id UUID;
    transformers_id UUID;
BEGIN
    -- Insert RAGs
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'RAGs',
        'Framework pour la génération augmentée par récupération. Un framework qui combine la récupération d''informations avec la génération de texte pour produire des réponses plus précises.',
        'https://github.com/explodinggradients/rags',
        'rags'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO rags_id;

    -- Insert Replicate
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Replicate',
        'Plateforme pour déployer des modèles d''IA. Une plateforme cloud qui permet de déployer et d''exécuter des modèles d''IA via API, avec versioning et scaling.',
        'https://replicate.com/',
        'replicate'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO replicate_id;

    -- Insert Rivet
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Rivet',
        'Éditeur visuel pour créer des agents IA. Un éditeur visuel de type node qui permet de créer et de configurer des agents IA de manière intuitive.',
        'https://github.com/Ironclad/rivet',
        'rivet'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO rivet_id;

    -- Insert Semantic Kernel
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Semantic Kernel',
        'SDK pour intégrer l''IA dans les applications. Un SDK open-source qui permet d''intégrer facilement des modèles de langage et d''autres capacités d''IA dans les applications.',
        'https://github.com/microsoft/semantic-kernel',
        'semantic-kernel'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO semantic_kernel_id;

    -- Insert Shell GPT
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Shell GPT',
        'Assistant en ligne de commande alimenté par GPT. Un outil en ligne de commande qui utilise GPT pour aider avec les commandes shell et l''automatisation.',
        'https://github.com/TheR1D/shell_gpt',
        'shell-gpt'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO shell_gpt_id;

    -- Insert Sidekick
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Sidekick',
        'Assistant de programmation basé sur l''IA. Un assistant qui aide les développeurs en fournissant des suggestions de code et des explications contextuelles.',
        'https://www.sidekick.com/',
        'sidekick'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO sidekick_id;

    -- Insert SuperAgent
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'SuperAgent',
        'Plateforme pour déployer des agents IA. Une plateforme qui simplifie le déploiement et la gestion d''agents IA pour diverses applications.',
        'https://github.com/homanp/superagent',
        'superagent'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO superagent_id;

    -- Insert SuperAlign
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'SuperAlign',
        'Framework pour l''alignement des modèles d''IA. Un framework qui aide à aligner les modèles d''IA avec les objectifs et les valeurs humaines.',
        'https://github.com/alignment-research/superalign',
        'superalign'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO superalign_id;

    -- Insert Sweep
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Sweep',
        'Agent IA pour la gestion de code. Un agent qui aide à gérer les bugs, les refactorisations et les améliorations de code via des pull requests.',
        'https://github.com/sweepai/sweep',
        'sweep'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO sweep_id;

    -- Insert Tabby
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Tabby',
        'Assistant de codage auto-hébergé. Un assistant de codage open-source qui peut être hébergé localement pour plus de confidentialité et de contrôle.',
        'https://github.com/TabbyML/tabby',
        'tabby'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO tabby_id;

    -- Insert TaskWeaver
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'TaskWeaver',
        'Framework pour créer des applications basées sur les tâches. Un framework qui permet de créer des applications qui décomposent et exécutent des tâches complexes.',
        'https://github.com/microsoft/TaskWeaver',
        'taskweaver'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO taskweaver_id;

    -- Insert Textbase
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Textbase',
        'Framework pour créer des chatbots IA. Un framework Python pour créer des chatbots personnalisés avec des modèles de langage.',
        'https://github.com/textbase-ai/textbase',
        'textbase'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO textbase_id;

    -- Insert Together
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Together',
        'Plateforme cloud pour l''IA. Une plateforme qui fournit l''infrastructure et les outils pour entraîner et déployer des modèles d''IA.',
        'https://www.together.ai/',
        'together'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO together_id;

    -- Insert Toolformer
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Toolformer',
        'Modèle de langage qui apprend à utiliser des outils. Un modèle qui peut apprendre à utiliser des API et des outils externes pour augmenter ses capacités.',
        'https://github.com/lucidrains/toolformer-pytorch',
        'toolformer'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO toolformer_id;

    -- Insert Transformers
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Transformers',
        'Bibliothèque de modèles de langage pré-entraînés. Une bibliothèque qui fournit des milliers de modèles pré-entraînés pour diverses tâches de traitement du langage.',
        'https://huggingface.co/transformers',
        'transformers'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO transformers_id;

END $$;
