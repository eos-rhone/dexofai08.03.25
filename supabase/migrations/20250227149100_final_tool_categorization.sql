-- Categorize AI tools based on their functionality
DO $$
DECLARE
    infrastructure_id INTEGER;
    nlp_id INTEGER;
    conversational_id INTEGER;
    productivity_id INTEGER;
    audio_id INTEGER;
    image_id INTEGER;
    mlops_id INTEGER;
    data_id INTEGER;
    hr_id INTEGER;
    writing_id INTEGER;
BEGIN
    -- Get category IDs
    SELECT id INTO infrastructure_id FROM categories WHERE name = 'Infrastructure';
    SELECT id INTO nlp_id FROM categories WHERE name = 'NLP';
    SELECT id INTO conversational_id FROM categories WHERE name = 'Conversational AI';
    SELECT id INTO productivity_id FROM categories WHERE name = 'Productivity';
    SELECT id INTO audio_id FROM categories WHERE name = 'Audio and Music';
    SELECT id INTO image_id FROM categories WHERE name = 'Image Generation';
    SELECT id INTO mlops_id FROM categories WHERE name = 'MLOps';
    SELECT id INTO data_id FROM categories WHERE name = 'Data Science';
    SELECT id INTO hr_id FROM categories WHERE name = 'HR and Recruitment';
    SELECT id INTO writing_id FROM categories WHERE name = 'Writing and Content';

    -- Infrastructure tools
    UPDATE ai_tools SET category_id = infrastructure_id WHERE name IN (
        'BentoML', 'CUDA', 'CuPy', 'Dask', 'DeepSpeed', 'Horovod', 'Hugging Face Hub',
        'NVIDIA AI', 'ONNX', 'PaddlePaddle', 'Petals', 'Ray', 'TorchServe', 
        'Triton Inference Server', 'vLLM'
    );

    -- NLP tools
    UPDATE ai_tools SET category_id = nlp_id WHERE name IN (
        'GPTs', 'LangChain', 'LangSmith', 'Language Tools', 'MonkeyLearn',
        'OpenAI', 'OpenAI API', 'Semantic Kernel', 'TheBloke', 'Together'
    );

    -- Conversational AI
    UPDATE ai_tools SET category_id = conversational_id WHERE name IN (
        'Azure OpenAI', 'Character.AI', 'ChatArena', 'Chatbot UI', 'Clippy',
        'FastGPT', 'JamesGPT', 'LibreChat', 'OpenAssistant', 'Pi', 'PrivateGPT'
    );

    -- Productivity tools
    UPDATE ai_tools SET category_id = productivity_id WHERE name IN (
        'ClickUp AI', 'DocArray', 'Embedchain', 'Gamma', 'MindsDB', 'Taskade AI',
        'Tome', 'Weaviate'
    );

    -- Audio and Music tools
    UPDATE ai_tools SET category_id = audio_id WHERE name IN (
        'AssemblyAI', 'Boomy', 'Coqui', 'Soundraw', 'Vocode', 'Whisper'
    );

    -- Image Generation tools
    UPDATE ai_tools SET category_id = image_id WHERE name IN (
        'DALL·E 2', 'DALL·E 3', 'Diffusers', 'Meshy', 'OpenFlamingo', 'Point-E',
        'Sora', 'Stability AI', 'Stable Diffusion', 'Steve AI'
    );

    -- MLOps tools
    UPDATE ai_tools SET category_id = mlops_id WHERE name IN (
        'BabyCommandAGI', 'BabyFoxAGI', 'DeepMind', 'DotAgent', 'Evals', 'Feast',
        'Gradio', 'Guardrails', 'Haystack', 'Helicone', 'Kedro', 'MLRun', 'MultiAgent',
        'Neptune', 'Optuna', 'Portkey', 'PromptFlow', 'Sacred', 'SuperAlign', 'whylogs'
    );

    -- Data Science and Analytics
    UPDATE ai_tools SET category_id = data_id WHERE name IN (
        'Great Expectations', 'NetworkX', 'Qlik', 'Ragas', 'Seaborn', 'SHAP',
        'Streamlit', 'Tableau', 'Wolfram Alpha', 'Yellowbrick'
    );

    -- HR and Recruitment
    UPDATE ai_tools SET category_id = hr_id WHERE name IN (
        'Autonomous HR Chatbot', 'Eightfold AI', 'HiredScore', 'Pymetrics'
    );

    -- Writing and Content Creation
    UPDATE ai_tools SET category_id = writing_id WHERE name IN (
        'Anyword', 'Compose AI', 'Copy.ai', 'Copysmith', 'Frase', 'Grammarly',
        'Hypotenuse AI', 'Inferkit', 'Peppertype', 'Rytr', 'Spellbook', 'Sudowrite',
        'WisdomPrompt', 'Wordtune', 'Writecream', 'Writefull', 'Writesonic'
    );

    -- Verify no tools are left uncategorized
    RAISE NOTICE 'Uncategorized tools:';
    FOR r IN (SELECT name FROM ai_tools WHERE category_id IS NULL) LOOP
        RAISE NOTICE '%', r.name;
    END LOOP;
END $$;
