-- Catégorisation des outils d'IA et mise à jour des images

-- Outils de Traitement du Langage Naturel (NLP)
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Traitement du Langage Naturel'),
    image_url = 'https://images.unsplash.com/photo-1456324504439-367cee3b3c32?q=80&w=2000'
WHERE name IN ('BERT', 'FastText', 'NLTK', 'Tokenizers', 'AllenNLP', 'Transformers');

-- Outils de Vision par Ordinateur
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Vision par Ordinateur'),
    image_url = 'https://images.unsplash.com/photo-1561070791-2526d30994b5?q=80&w=2000'
WHERE name IN ('CLIP', 'DETR', 'PyTorch3D', 'Kornia', 'Pillow');

-- Outils de Génération de Texte
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Génération de Texte'),
    image_url = 'https://images.unsplash.com/photo-1455390582262-044cdead277a?q=80&w=2000'
WHERE name IN ('GPTs', 'Copy.ai', 'Rytr', 'Writesonic', 'Sudowrite', 'Anyword', 'Peppertype', 'Writecream', 'Writefull');

-- Outils de Développement
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Développement'),
    image_url = 'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?q=80&w=2000'
WHERE name IN ('Amazon CodeWhisperer', 'Cody by Sourcegraph', 'Continue', 'Bloop', 'Tabby', 'CodeFuse-ChatBot');

-- Outils de Visualisation de Données
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Visualisation de Données'),
    image_url = 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000'
WHERE name IN ('Tableau', 'Qlik', 'Seaborn', 'Streamlit', 'NetworkX');

-- Outils d'IA Générative
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'IA Générative'),
    image_url = 'https://images.unsplash.com/photo-1579547944212-c4f4961a8dd8?q=80&w=2000'
WHERE name IN ('DALL·E 2', 'DALL·E 3', 'Stable Diffusion', 'Point-E', 'OpenFlamingo');

-- Outils de Recherche et Documentation
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Recherche'),
    image_url = 'https://images.unsplash.com/photo-1542744094-3a31f272c490?q=80&w=2000'
WHERE name IN ('Marketmuse', 'Surfer SEO', 'NotebookLM', 'Scholarcy', 'SciSpace', 'Scite', 'Mendeley');

-- Outils d'Infrastructure IA
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Infrastructure'),
    image_url = 'https://images.unsplash.com/photo-1518432031352-d6fc5c10da5a?q=80&w=2000'
WHERE name IN ('Ray', 'CUDA', 'CuPy', 'vLLM', 'TorchServe', 'Triton Inference Server', 'BentoML');

-- Outils de Gestion de Projet
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Gestion de Projet'),
    image_url = 'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?q=80&w=2000'
WHERE name IN ('ClickUp AI', 'Taskade AI', 'Tome', 'Gamma');

-- Outils d'Automatisation
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Automatisation'),
    image_url = 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?q=80&w=2000'
WHERE name IN ('Auto-GPT', 'MetaGPT', 'SuperAgent', 'Sweep', 'TaskWeaver', 'X-Agent');

-- Outils de Vidéo
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Vidéo'),
    image_url = 'https://images.unsplash.com/photo-1492724441997-5dc865305da7?q=80&w=2000'
WHERE name IN ('D-ID', 'Hour One', 'InVideo', 'Lumen5', 'Colossyan', 'Typeframes');

-- Outils de Ressources Humaines
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Ressources Humaines'),
    image_url = 'https://images.unsplash.com/photo-1521791136064-7986c2920216?q=80&w=2000'
WHERE name IN ('Eightfold AI', 'HiredScore', 'Pymetrics', 'Autonomous HR Chatbot');

-- Vérification finale des outils sans catégorie ou avec image par défaut
SELECT t.name, t.image_url, c.name as category_name
FROM ai_tools t
LEFT JOIN categories c ON t.category_id = c.id
WHERE t.image_url = 'https://images.unsplash.com/photo-1677442136019-21780ecad995'
   OR t.category_id IS NULL
ORDER BY t.name;
