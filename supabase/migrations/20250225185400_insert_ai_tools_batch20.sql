-- Insert AI tools batch 20
DO $$
DECLARE
    scikit_id UUID;
    sentence_id UUID;
    spacy_id UUID;
    stability_id UUID;
    tensorflow_id UUID;
    thebloke_id UUID;
    tokenizers_id UUID;
    torchserve_id UUID;
    vertex_id UUID;
    whisper_id UUID;
    wolfram_id UUID;
    xgboost_id UUID;
    yolo_id UUID;
BEGIN
    -- Insert Scikit-learn
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Scikit-learn',
        'Bibliothèque d''apprentissage automatique. Une bibliothèque Python populaire pour l''apprentissage automatique classique.',
        'https://scikit-learn.org/',
        'scikit-learn'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO scikit_id;

    -- Insert SentenceTransformers
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'SentenceTransformers',
        'Bibliothèque pour embeddings de texte. Un outil pour créer des représentations vectorielles de phrases et de documents.',
        'https://www.sbert.net/',
        'sentence-transformers'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO sentence_id;

    -- Insert spaCy
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'spaCy',
        'Bibliothèque de traitement du langage naturel. Un outil rapide et efficace pour l''analyse et le traitement du texte.',
        'https://spacy.io/',
        'spacy'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO spacy_id;

    -- Insert Stability AI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Stability AI',
        'Entreprise de développement d''IA générative. Créateur de Stable Diffusion et d''autres modèles d''IA générative open-source.',
        'https://stability.ai/',
        'stability-ai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO stability_id;

    -- Insert TensorFlow
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'TensorFlow',
        'Framework d''apprentissage automatique. Une plateforme complète pour construire et déployer des modèles d''apprentissage automatique.',
        'https://www.tensorflow.org/',
        'tensorflow'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO tensorflow_id;

    -- Insert TheBloke
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'TheBloke',
        'Collection de modèles IA quantifiés. Une ressource majeure pour les modèles LLM optimisés et quantifiés.',
        'https://huggingface.co/TheBloke',
        'thebloke'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO thebloke_id;

    -- Insert Tokenizers
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Tokenizers',
        'Bibliothèque de tokenisation rapide. Une bibliothèque optimisée pour la tokenisation de texte en apprentissage automatique.',
        'https://github.com/huggingface/tokenizers',
        'tokenizers'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO tokenizers_id;

    -- Insert TorchServe
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'TorchServe',
        'Serveur de modèles PyTorch. Un outil pour servir des modèles PyTorch en production de manière performante.',
        'https://pytorch.org/serve/',
        'torchserve'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO torchserve_id;

    -- Insert Vertex AI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Vertex AI',
        'Plateforme ML de Google Cloud. Une plateforme unifiée pour construire, déployer et mettre à l''échelle des modèles d''IA.',
        'https://cloud.google.com/vertex-ai',
        'vertex-ai'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO vertex_id;

    -- Insert Whisper
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Whisper',
        'Système de reconnaissance vocale d''OpenAI. Un modèle robuste pour la transcription et la traduction de la parole.',
        'https://github.com/openai/whisper',
        'whisper'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO whisper_id;

    -- Insert Wolfram Alpha
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Wolfram Alpha',
        'Moteur de connaissances computationnel. Un système qui combine connaissances et calculs pour répondre à des questions complexes.',
        'https://www.wolframalpha.com/',
        'wolfram-alpha'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO wolfram_id;

    -- Insert XGBoost
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'XGBoost',
        'Bibliothèque de boosting gradient. Un outil puissant et efficace pour l''apprentissage automatique basé sur les arbres de décision.',
        'https://xgboost.readthedocs.io/',
        'xgboost'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO xgboost_id;

    -- Insert YOLO
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'YOLO',
        'Système de détection d''objets en temps réel. Un algorithme rapide et précis pour la détection d''objets dans les images et les vidéos.',
        'https://pjreddie.com/darknet/yolo/',
        'yolo'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO yolo_id;

END $$;
