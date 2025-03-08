-- Insert AI tools batch 23
DO $$
DECLARE
    milvus_id UUID;
    mmdetection_id UUID;
    mxnet_id UUID;
    neptune_id UUID;
    networkx_id UUID;
    nltk_id UUID;
    numba_id UUID;
    numpy_id UUID;
    onnx_id UUID;
    optuna_id UUID;
    paddle_id UUID;
    petastorm_id UUID;
    pillow_id UUID;
    plotly_id UUID;
    polyaxon_id UUID;
BEGIN
    -- Insert Milvus
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Milvus',
        'Base de données vectorielle open-source. Une solution pour gérer et rechercher des vecteurs à grande échelle.',
        'https://milvus.io/',
        'milvus'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO milvus_id;

    -- Insert MMDetection
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'MMDetection',
        'Boîte à outils de détection d''objets. Une collection d''algorithmes et d''outils pour la détection d''objets.',
        'https://github.com/open-mmlab/mmdetection',
        'mmdetection'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO mmdetection_id;

    -- Insert MXNet
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'MXNet',
        'Framework de deep learning flexible. Un framework deep learning efficace supporté par Amazon.',
        'https://mxnet.apache.org/',
        'mxnet'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO mxnet_id;

    -- Insert Neptune
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Neptune',
        'Plateforme de suivi d''expériences ML. Un outil pour suivre, stocker et analyser les expériences d''apprentissage automatique.',
        'https://neptune.ai/',
        'neptune'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO neptune_id;

    -- Insert NetworkX
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'NetworkX',
        'Bibliothèque d''analyse de réseaux. Un outil pour créer et étudier des réseaux et des graphes complexes.',
        'https://networkx.org/',
        'networkx'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO networkx_id;

    -- Insert NLTK
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'NLTK',
        'Boîte à outils de traitement du langage naturel. Une bibliothèque complète pour le traitement du langage naturel en Python.',
        'https://www.nltk.org/',
        'nltk'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO nltk_id;

    -- Insert Numba
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Numba',
        'Compilateur JIT pour Python numérique. Un outil pour accélérer le code Python en le compilant en code machine.',
        'https://numba.pydata.org/',
        'numba'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO numba_id;

    -- Insert NumPy
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'NumPy',
        'Bibliothèque fondamentale pour le calcul scientifique. La base de l''écosystème scientifique Python pour les calculs numériques.',
        'https://numpy.org/',
        'numpy'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO numpy_id;

    -- Insert ONNX
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'ONNX',
        'Format ouvert pour les modèles ML. Un standard pour représenter les modèles d''apprentissage automatique.',
        'https://onnx.ai/',
        'onnx'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO onnx_id;

    -- Insert Optuna
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Optuna',
        'Framework d''optimisation hyperparamétrique. Un outil pour l''optimisation automatique des hyperparamètres des modèles ML.',
        'https://optuna.org/',
        'optuna'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO optuna_id;

    -- Insert PaddlePaddle
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'PaddlePaddle',
        'Plateforme deep learning de Baidu. Un framework complet pour le développement et le déploiement de modèles deep learning.',
        'https://www.paddlepaddle.org.cn/',
        'paddlepaddle'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO paddle_id;

    -- Insert Petastorm
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Petastorm',
        'Bibliothèque de données pour deep learning. Un outil pour lire des données depuis des systèmes de stockage dans des frameworks ML.',
        'https://github.com/uber/petastorm',
        'petastorm'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO petastorm_id;

    -- Insert Pillow
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Pillow',
        'Bibliothèque de traitement d''images Python. Fork maintenu de PIL pour le traitement d''images en Python.',
        'https://python-pillow.org/',
        'pillow'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO pillow_id;

    -- Insert Plotly
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Plotly',
        'Bibliothèque de visualisation interactive. Des outils de visualisation interactifs pour l''analyse de données et le ML.',
        'https://plotly.com/',
        'plotly'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO plotly_id;

    -- Insert Polyaxon
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Polyaxon',
        'Plateforme MLOps open-source. Une plateforme pour gérer le cycle de vie complet des projets ML.',
        'https://polyaxon.com/',
        'polyaxon'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO polyaxon_id;

END $$;
