-- Insert AI tools batch 19
DO $$
DECLARE
    jasper_id UUID;
    jupyter_id UUID;
    keras_id UUID;
    langsmith_id UUID;
    leonardo_id UUID;
    ludwig_id UUID;
    midjourney_id UUID;
    mistral_id UUID;
    mlflow_id UUID;
    mosaicml_id UUID;
    nvidia_id UUID;
    openai_id UUID;
    pandas_id UUID;
    pytorch_id UUID;
    ray_id UUID;
BEGIN
    -- Insert Jasper
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Jasper',
        'Plateforme d''écriture assistée par IA. Un outil qui aide à créer du contenu marketing, des articles et des copies publicitaires avec l''aide de l''IA.',
        'https://www.jasper.ai/',
        'jasper'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO jasper_id;

    -- Insert Jupyter
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Jupyter',
        'Environnement de développement interactif. Un outil essentiel pour le développement en science des données et l''apprentissage automatique.',
        'https://jupyter.org/',
        'jupyter'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO jupyter_id;

    -- Insert Keras
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Keras',
        'API de deep learning de haut niveau. Une interface conviviale pour construire et entraîner des modèles de deep learning.',
        'https://keras.io/',
        'keras'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO keras_id;

    -- Insert LangSmith
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'LangSmith',
        'Plateforme de développement LLM. Un outil pour développer, tester et déployer des applications basées sur des modèles de langage.',
        'https://www.langsmith.com/',
        'langsmith'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO langsmith_id;

    -- Insert Leonardo.ai
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Leonardo.ai',
        'Plateforme de génération d''images par IA. Un outil puissant pour créer des images artistiques et professionnelles avec l''IA.',
        'https://leonardo.ai/',
        'leonardo-ai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO leonardo_id;

    -- Insert Ludwig
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Ludwig',
        'Boîte à outils de deep learning sans code. Une bibliothèque qui permet de construire des modèles de deep learning sans écrire de code.',
        'https://ludwig.ai/',
        'ludwig'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO ludwig_id;

    -- Insert Midjourney
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Midjourney',
        'Générateur d''images par IA. Un outil de création d''images artistiques basé sur des descriptions textuelles.',
        'https://www.midjourney.com/',
        'midjourney'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO midjourney_id;

    -- Insert Mistral AI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Mistral AI',
        'Entreprise de développement de LLMs. Une société française développant des modèles de langage open-source performants.',
        'https://mistral.ai/',
        'mistral-ai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO mistral_id;

    -- Insert MLflow
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'MLflow',
        'Plateforme de gestion du cycle de vie ML. Un outil open-source pour gérer le cycle de vie complet des projets d''apprentissage automatique.',
        'https://mlflow.org/',
        'mlflow'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO mlflow_id;

    -- Insert MosaicML
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'MosaicML',
        'Plateforme d''entraînement de modèles d''IA. Une solution pour entraîner des modèles d''IA à grande échelle de manière efficace.',
        'https://www.mosaicml.com/',
        'mosaicml'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO mosaicml_id;

    -- Insert NVIDIA AI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'NVIDIA AI',
        'Suite d''outils d''IA par NVIDIA. Une collection complète d''outils et de frameworks pour le développement et le déploiement d''applications d''IA.',
        'https://www.nvidia.com/en-us/ai-data-science/',
        'nvidia-ai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO nvidia_id;

    -- Insert OpenAI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'OpenAI',
        'Entreprise leader en recherche IA. Développeur de GPT, DALL-E et d''autres technologies d''IA avancées.',
        'https://openai.com/',
        'openai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO openai_id;

    -- Insert Pandas
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Pandas',
        'Bibliothèque d''analyse de données Python. Un outil essentiel pour la manipulation et l''analyse de données en science des données.',
        'https://pandas.pydata.org/',
        'pandas'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO pandas_id;

    -- Insert PyTorch
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'PyTorch',
        'Framework de deep learning. Une bibliothèque open-source populaire pour le développement de modèles d''apprentissage profond.',
        'https://pytorch.org/',
        'pytorch'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO pytorch_id;

    -- Insert Ray
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Ray',
        'Framework pour applications IA distribuées. Un framework open-source pour mettre à l''échelle les applications d''IA et de ML.',
        'https://www.ray.io/',
        'ray'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO ray_id;

END $$;
