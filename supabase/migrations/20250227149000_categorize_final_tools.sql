-- Catégorisation des outils restants

-- Outils d'IA Conversationnelle
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'IA Conversationnelle'),
    image_url = 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=2000'
WHERE name IN ('Character.AI', 'ChatArena', 'Chatbot UI', 'LibreChat', 'Pi', 'OpenAssistant');

-- Outils d'IA Fondamentale
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'IA Fondamentale'),
    image_url = 'https://images.unsplash.com/photo-1677442136019-21780ecad995'
WHERE name IN ('DeepMind', 'EleutherAI', 'Mistral AI', 'MosaicML', 'OpenAI', 'Stability AI', 'Together');

-- Outils de MLOps
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'MLOps'),
    image_url = 'https://images.unsplash.com/photo-1518432031352-d6fc5c10da5a?q=80&w=2000'
WHERE name IN ('Gradio', 'Kedro', 'MLRun', 'Neptune', 'Optuna', 'Sacred', 'whylogs');

-- Outils de Traitement Audio
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Audio'),
    image_url = 'https://images.unsplash.com/photo-1493723843671-1d655e66ac1c?q=80&w=2000'
WHERE name IN ('AssemblyAI', 'Coqui', 'Soundraw', 'Vocode', 'Whisper');

-- Outils de Base de Données et Vectorisation
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Base de Données'),
    image_url = 'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?q=80&w=2000'
WHERE name IN ('Weaviate', 'MindsDB', 'DocArray', 'Embedchain');

-- Outils d'Analyse et Explicabilité
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Analyse'),
    image_url = 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000'
WHERE name IN ('Great Expectations', 'SHAP', 'Yellowbrick', 'Ragas');

-- Outils de Recherche Spécialisée
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Recherche'),
    image_url = 'https://images.unsplash.com/photo-1542744094-3a31f272c490?q=80&w=2000'
WHERE name IN ('ArchaeoGPT', 'GPT Researcher', 'Khoj', 'PDF.ai', 'Pottery Analyzer');

-- Outils d'Agents et Mémoire
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Agents'),
    image_url = 'https://images.unsplash.com/photo-1518432031352-d6fc5c10da5a?q=80&w=2000'
WHERE name IN ('BabyCommandAGI', 'BabyFoxAGI', 'DotAgent', 'Mem AI', 'MemGPT', 'MultiAgent', 'OpenAgents');

-- Outils de Santé
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Santé'),
    image_url = 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?q=80&w=2000'
WHERE name IN ('Babylon Health', 'DrugAI');

-- Vérification finale des outils sans catégorie ou avec image par défaut
SELECT t.name, t.image_url, c.name as category_name
FROM ai_tools t
LEFT JOIN categories c ON t.category_id = c.id
WHERE t.image_url = 'https://images.unsplash.com/photo-1677442136019-21780ecad995'
   OR t.category_id IS NULL
ORDER BY t.name;
