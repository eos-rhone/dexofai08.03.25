-- Insert AI tools batch 24
DO $$
DECLARE
    prophet_id UUID;
    pytorch3d_id UUID;
    rapids_id UUID;
    ray_tune_id UUID;
    replicate_id UUID;
    rune_id UUID;
    sacred_id UUID;
    seaborn_id UUID;
    shap_id UUID;
    streamlit_id UUID;
    transformers_id UUID;
    tritonclient_id UUID;
    weights_biases_id UUID;
    yellowbrick_id UUID;
    zenml_id UUID;
BEGIN
    -- Insert Prophet
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Prophet',
        'Outil de prévision de séries temporelles. Une bibliothèque Facebook pour les prévisions de séries temporelles.',
        'https://facebook.github.io/prophet/',
        'prophet'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO prophet_id;

    -- Insert PyTorch3D
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'PyTorch3D',
        'Bibliothèque de deep learning 3D. Des outils pour le deep learning sur données 3D avec PyTorch.',
        'https://pytorch3d.org/',
        'pytorch3d'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO pytorch3d_id;

    -- Insert RAPIDS
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'RAPIDS',
        'Suite d''outils data science GPU. Une suite d''outils pour exécuter l''ensemble du pipeline data science sur GPU.',
        'https://rapids.ai/',
        'rapids'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO rapids_id;

    -- Insert Ray Tune
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Ray Tune',
        'Bibliothèque de tuning hyperparamétrique. Un framework scalable pour l''optimisation des hyperparamètres.',
        'https://docs.ray.io/en/latest/tune/index.html',
        'ray-tune'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO ray_tune_id;

    -- Insert Replicate
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Replicate',
        'Plateforme de déploiement de modèles ML. Un service pour déployer et exécuter des modèles ML dans le cloud.',
        'https://replicate.com/',
        'replicate'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO replicate_id;

    -- Insert Rune
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Rune',
        'Framework d''IA pour jeux vidéo. Une plateforme pour intégrer l''IA dans les jeux vidéo.',
        'https://www.rune.ai/',
        'rune'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO rune_id;

    -- Insert Sacred
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Sacred',
        'Outil de suivi d''expériences. Une bibliothèque pour configurer, organiser et suivre les expériences ML.',
        'https://sacred.readthedocs.io/',
        'sacred'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO sacred_id;

    -- Insert Seaborn
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Seaborn',
        'Bibliothèque de visualisation statistique. Un outil de visualisation de données statistiques basé sur matplotlib.',
        'https://seaborn.pydata.org/',
        'seaborn'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO seaborn_id;

    -- Insert SHAP
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'SHAP',
        'Framework d''explicabilité des modèles. Un outil pour expliquer les prédictions des modèles ML.',
        'https://github.com/slundberg/shap',
        'shap'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO shap_id;

    -- Insert Streamlit
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Streamlit',
        'Framework d''applications ML. Un outil pour créer rapidement des applications web pour les projets de data science.',
        'https://streamlit.io/',
        'streamlit'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO streamlit_id;

    -- Insert Transformers
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Transformers',
        'Bibliothèque de modèles NLP. Une collection de modèles de traitement du langage naturel pré-entraînés.',
        'https://huggingface.co/transformers/',
        'transformers'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO transformers_id;

    -- Insert Triton Inference Server
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Triton Inference Server',
        'Serveur d''inférence ML. Un serveur optimisé pour le déploiement de modèles ML en production.',
        'https://github.com/triton-inference-server/server',
        'triton-inference-server'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO tritonclient_id;

    -- Insert Weights & Biases
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Weights & Biases',
        'Plateforme MLOps. Un outil pour suivre les expériences, gérer les modèles et collaborer en ML.',
        'https://wandb.ai/',
        'weights-and-biases'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO weights_biases_id;

    -- Insert Yellowbrick
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Yellowbrick',
        'Suite de visualisation ML. Des outils de visualisation pour l''analyse et la validation de modèles ML.',
        'https://www.scikit-yb.org/',
        'yellowbrick'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO yellowbrick_id;

    -- Insert ZenML
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'ZenML',
        'Framework MLOps extensible. Un outil open-source pour créer des pipelines ML reproductibles.',
        'https://zenml.io/',
        'zenml'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO zenml_id;

END $$;
