-- Insert AI tools batch 21
DO $$
DECLARE
    alpaca_id UUID;
    apache_spark_id UUID;
    autokeras_id UUID;
    bart_id UUID;
    bigscience_id UUID;
    bloom_id UUID;
    catboost_id UUID;
    coqui_id UUID;
    cortex_id UUID;
    cuda_id UUID;
    cupy_id UUID;
    dask_id UUID;
    detectron_id UUID;
    diffusers_id UUID;
    docarray_id UUID;
BEGIN
    -- Insert Alpaca
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Alpaca',
        'Version fine-tunée de LLaMA. Un modèle de langage entraîné sur des instructions, offrant des performances similaires à GPT-3.5 avec moins de ressources.',
        'https://github.com/tatsu-lab/stanford_alpaca',
        'alpaca'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO alpaca_id;

    -- Insert Apache Spark
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Apache Spark',
        'Framework de traitement de données distribué. Un moteur unifié pour le traitement de données à grande échelle et l''apprentissage automatique.',
        'https://spark.apache.org/',
        'apache-spark'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO apache_spark_id;

    -- Insert AutoKeras
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'AutoKeras',
        'Bibliothèque AutoML basée sur Keras. Un outil d''apprentissage automatique automatisé pour simplifier la création de modèles de deep learning.',
        'https://autokeras.com/',
        'autokeras'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO autokeras_id;

    -- Insert BART
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'BART',
        'Modèle de séquence à séquence par Facebook. Un modèle pré-entraîné pour la compréhension et la génération de texte.',
        'https://huggingface.co/facebook/bart-large',
        'bart'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO bart_id;

    -- Insert BigScience
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'BigScience',
        'Initiative de recherche collaborative en IA. Un projet open-source pour démocratiser la recherche en IA et créer des modèles multilingues.',
        'https://bigscience.huggingface.co/',
        'bigscience'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO bigscience_id;

    -- Insert BLOOM
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'BLOOM',
        'Modèle de langage multilingue. Le plus grand modèle de langage open-source entraîné sur plus de 46 langues.',
        'https://huggingface.co/bigscience/bloom',
        'bloom'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO bloom_id;

    -- Insert CatBoost
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'CatBoost',
        'Bibliothèque de boosting par Yandex. Un algorithme d''apprentissage automatique pour le boosting de gradient avec gestion native des variables catégorielles.',
        'https://catboost.ai/',
        'catboost'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO catboost_id;

    -- Insert Coqui
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Coqui',
        'Boîte à outils de synthèse vocale. Une collection d''outils open-source pour la synthèse et le traitement de la parole.',
        'https://coqui.ai/',
        'coqui'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO coqui_id;

    -- Insert Cortex
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Cortex',
        'Plateforme de déploiement d''IA. Un outil pour déployer des modèles d''IA en production sur Kubernetes.',
        'https://www.cortex.dev/',
        'cortex'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO cortex_id;

    -- Insert CUDA
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'CUDA',
        'Plateforme de calcul parallèle NVIDIA. Une architecture qui permet d''accélérer les calculs sur GPU pour l''apprentissage profond.',
        'https://developer.nvidia.com/cuda-toolkit',
        'cuda'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO cuda_id;

    -- Insert CuPy
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'CuPy',
        'Bibliothèque NumPy sur GPU. Une implémentation de l''interface NumPy pour les calculs sur GPU avec CUDA.',
        'https://cupy.dev/',
        'cupy'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO cupy_id;

    -- Insert Dask
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Dask',
        'Bibliothèque de calcul parallèle flexible. Un framework pour le calcul parallèle en Python, compatible avec l''écosystème PyData.',
        'https://dask.org/',
        'dask'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO dask_id;

    -- Insert Detectron2
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Detectron2',
        'Bibliothèque de vision par ordinateur. Une plateforme de Facebook pour la détection d''objets et la segmentation d''images.',
        'https://github.com/facebookresearch/detectron2',
        'detectron2'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO detectron_id;

    -- Insert Diffusers
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Diffusers',
        'Bibliothèque de modèles de diffusion. Une boîte à outils pour travailler avec des modèles de diffusion comme Stable Diffusion.',
        'https://github.com/huggingface/diffusers',
        'diffusers'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO diffusers_id;

    -- Insert DocArray
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'DocArray',
        'Bibliothèque pour données non structurées. Un outil pour manipuler et traiter des données multimodales en deep learning.',
        'https://docarray.jina.ai/',
        'docarray'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO docarray_id;

END $$;
