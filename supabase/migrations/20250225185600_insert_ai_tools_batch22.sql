-- Insert AI tools batch 22
DO $$
DECLARE
    fastai_id UUID;
    faiss_id UUID;
    flax_id UUID;
    gensim_id UUID;
    gradio_id UUID;
    h2o_id UUID;
    horovod_id UUID;
    hyperopt_id UUID;
    jax_id UUID;
    jina_id UUID;
    joblib_id UUID;
    kornia_id UUID;
    lightgbm_id UUID;
    lime_id UUID;
    llama_cpp_id UUID;
BEGIN
    -- Insert fastai
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'fastai',
        'Bibliothèque de deep learning de haut niveau. Une couche d''abstraction au-dessus de PyTorch qui simplifie l''apprentissage profond.',
        'https://www.fast.ai/',
        'fastai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO fastai_id;

    -- Insert Faiss
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Faiss',
        'Bibliothèque de recherche de similarité. Un outil efficace pour la recherche et le clustering de vecteurs denses.',
        'https://github.com/facebookresearch/faiss',
        'faiss'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO faiss_id;

    -- Insert Flax
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Flax',
        'Bibliothèque de deep learning basée sur JAX. Un framework flexible pour la recherche en apprentissage profond.',
        'https://github.com/google/flax',
        'flax'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO flax_id;

    -- Insert Gensim
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Gensim',
        'Bibliothèque de modélisation thématique. Un outil pour l''analyse sémantique non supervisée de textes.',
        'https://radimrehurek.com/gensim/',
        'gensim'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO gensim_id;

    -- Insert Gradio
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Gradio',
        'Création d''interfaces pour modèles ML. Un outil pour créer rapidement des démos web pour les modèles d''apprentissage automatique.',
        'https://gradio.app/',
        'gradio'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO gradio_id;

    -- Insert H2O
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'H2O',
        'Plateforme d''apprentissage automatique. Une plateforme open-source pour l''apprentissage automatique évolutif.',
        'https://h2o.ai/',
        'h2o'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO h2o_id;

    -- Insert Horovod
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Horovod',
        'Framework d''apprentissage distribué. Un outil pour l''entraînement distribué de modèles deep learning.',
        'https://horovod.ai/',
        'horovod'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO horovod_id;

    -- Insert Hyperopt
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Hyperopt',
        'Bibliothèque d''optimisation d''hyperparamètres. Un outil pour l''optimisation des paramètres des modèles d''apprentissage automatique.',
        'http://hyperopt.github.io/hyperopt/',
        'hyperopt'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO hyperopt_id;

    -- Insert JAX
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'JAX',
        'Bibliothèque de calcul numérique. Un outil pour la différentiation automatique et les calculs XLA.',
        'https://github.com/google/jax',
        'jax'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO jax_id;

    -- Insert Jina
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Jina',
        'Framework de recherche neurale cloud-native. Une plateforme pour construire des systèmes de recherche multimodale.',
        'https://jina.ai/',
        'jina'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO jina_id;

    -- Insert Joblib
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Joblib',
        'Bibliothèque de pipeline computing. Un ensemble d''outils pour sauvegarder et paralléliser des tâches Python.',
        'https://joblib.readthedocs.io/',
        'joblib'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO joblib_id;

    -- Insert Kornia
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Kornia',
        'Bibliothèque de vision par ordinateur différentiable. Un ensemble d''opérations de vision par ordinateur différentiables pour PyTorch.',
        'https://kornia.github.io/',
        'kornia'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO kornia_id;

    -- Insert LightGBM
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'LightGBM',
        'Framework de boosting gradient. Un algorithme de boosting gradient rapide et efficace par Microsoft.',
        'https://lightgbm.readthedocs.io/',
        'lightgbm'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO lightgbm_id;

    -- Insert LIME
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'LIME',
        'Outil d''explication de modèles ML. Une technique pour expliquer les prédictions de n''importe quel classifieur ML.',
        'https://github.com/marcotcr/lime',
        'lime'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO lime_id;

    -- Insert llama.cpp
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'llama.cpp',
        'Port C++ des modèles LLaMA. Une implémentation efficace des modèles LLaMA pour l''inférence sur CPU.',
        'https://github.com/ggerganov/llama.cpp',
        'llama-cpp'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO llama_cpp_id;

END $$;
