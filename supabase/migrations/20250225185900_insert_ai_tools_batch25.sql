-- Insert AI tools batch 25
DO $$
DECLARE
    allennlp_id UUID;
    bentoml_id UUID;
    clip_id UUID;
    cohere_id UUID;
    deepspeed_id UUID;
    detr_id UUID;
    fasttext_id UUID;
    feast_id UUID;
    great_expectations_id UUID;
    huggingface_hub_id UUID;
    kedro_id UUID;
    labelstudio_id UUID;
    langchain_id UUID;
    llama_index_id UUID;
    mlrun_id UUID;
BEGIN
    -- Insert AllenNLP
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'AllenNLP',
        'Bibliothèque NLP basée sur PyTorch. Une plateforme open-source pour développer des modèles de traitement du langage naturel.',
        'https://allennlp.org/',
        'allennlp'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO allennlp_id;

    -- Insert BentoML
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'BentoML',
        'Framework de serving ML unifié. Une plateforme pour servir, gérer et déployer des modèles ML en production.',
        'https://www.bentoml.com/',
        'bentoml'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO bentoml_id;

    -- Insert CLIP
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'CLIP',
        'Modèle de vision-langage d''OpenAI. Un modèle neuronal qui connecte texte et images de manière performante.',
        'https://github.com/openai/CLIP',
        'clip'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO clip_id;

    -- Insert Cohere
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Cohere',
        'Plateforme de modèles de langage. Une solution pour intégrer des modèles de langage avancés dans les applications.',
        'https://cohere.ai/',
        'cohere'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO cohere_id;

    -- Insert DeepSpeed
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'DeepSpeed',
        'Bibliothèque d''optimisation deep learning. Un outil Microsoft pour l''entraînement efficace de modèles massifs.',
        'https://www.deepspeed.ai/',
        'deepspeed'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO deepspeed_id;

    -- Insert DETR
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'DETR',
        'Transformers pour la détection d''objets. Une nouvelle approche de la détection d''objets basée sur les transformers.',
        'https://github.com/facebookresearch/detr',
        'detr'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO detr_id;

    -- Insert FastText
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'FastText',
        'Bibliothèque pour le text mining. Un outil Facebook pour l''apprentissage efficace de représentations de mots.',
        'https://fasttext.cc/',
        'fasttext'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO fasttext_id;

    -- Insert Feast
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Feast',
        'Feature store open-source. Une plateforme pour gérer et servir des features pour le ML en production.',
        'https://feast.dev/',
        'feast'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO feast_id;

    -- Insert Great Expectations
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Great Expectations',
        'Framework de validation de données. Un outil pour tester et valider les données dans les pipelines ML.',
        'https://greatexpectations.io/',
        'great-expectations'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO great_expectations_id;

    -- Insert Hugging Face Hub
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Hugging Face Hub',
        'Plateforme de modèles ML. Un dépôt central pour partager des modèles, des datasets et des démos.',
        'https://huggingface.co/',
        'huggingface-hub'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO huggingface_hub_id;

    -- Insert Kedro
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Kedro',
        'Framework de développement ML. Un outil pour créer des pipelines de data science reproductibles.',
        'https://kedro.readthedocs.io/',
        'kedro'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO kedro_id;

    -- Insert Label Studio
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'Label Studio',
        'Plateforme d''annotation de données. Un outil open-source pour l''étiquetage de données multimodales.',
        'https://labelstud.io/',
        'label-studio'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO labelstudio_id;

    -- Insert LangChain
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'LangChain',
        'Framework pour applications LLM. Un outil pour développer des applications basées sur les modèles de langage.',
        'https://langchain.com/',
        'langchain'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO langchain_id;

    -- Insert LlamaIndex
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'LlamaIndex',
        'Framework d''indexation pour LLMs. Un outil pour connecter des LLMs avec des sources de données externes.',
        'https://www.llamaindex.ai/',
        'llama-index'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO llama_index_id;

    -- Insert MLRun
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'MLRun',
        'Framework MLOps open-source. Une plateforme pour orchestrer et suivre des projets ML de bout en bout.',
        'https://www.mlrun.org/',
        'mlrun'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO mlrun_id;

END $$;
