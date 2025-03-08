-- Migration SQL pour les outils IA (Partie 2)
BEGIN;

-- Insère les 251 outils restants
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id) VALUES
('Adala', 'adala', 'Framework d''agent autonome pour l''étiquetage de données', 'https://github.com/HumanSignal/Adala', (SELECT id FROM public.categories WHERE slug = 'data')),
('Agent4Rec', 'agent4rec', 'Simulateur de système de recommandation utilisant des agents génératifs', 'https://github.com/LehengTHU/Agent4Rec', (SELECT id FROM public.categories WHERE slug = 'data')),
('AgentForge', 'agentforge', 'Plateforme de développement d''agents IA', 'https://github.com/DataBassGit/AgentForge', (SELECT id FROM public.categories WHERE slug = 'development')),
('AgentGPT', 'agentgpt', 'Version no-code d''AutoGPT basée sur navigateur', 'https://agentgpt.reworkd.ai/', (SELECT id FROM public.categories WHERE slug = 'productivity')),
('AutoGPT', 'autogpt', 'Agent IA autonome expérimental', 'https://agpt.co', (SELECT id FROM public.categories WHERE slug = 'development')),
('CAMEL', 'camel', 'Architecture pour l''exploration mentale des agents', 'https://github.com/camel-ai/camel', (SELECT id FROM public.categories WHERE slug = 'research')),
('Devin', 'devin', 'Premier ingénieur logiciel IA autonome', 'https://www.cognition-labs.com/devin', (SELECT id FROM public.categories WHERE slug = 'development')),
('GPT Researcher', 'gpt-researcher', 'Agent autonome pour la recherche approfondie', 'https://github.com/assafelovic/gpt-researcher', (SELECT id FROM public.categories WHERE slug = 'research')),
('Guidance', 'guidance', 'Langage pour contrôler les LLMs', 'https://github.com/microsoft/guidance', (SELECT id FROM public.categories WHERE slug = 'development')),
('Marvin', 'marvin', 'Framework pour construire des agents IA', 'https://www.askmarvin.ai/', (SELECT id FROM public.categories WHERE slug = 'development')),
('NotebookLM', 'notebooklm', 'Assistant IA pour la prise de notes intelligente', 'https://notebooklm.google/', (SELECT id FROM public.categories WHERE slug = 'productivity')),
('PromptFlow', 'promptflow', 'Plateforme pour développer des applications LLM', 'https://microsoft.github.io/promptflow/', (SELECT id FROM public.categories WHERE slug = 'development')),
('RAGs', 'rags', 'Framework pour la génération augmentée par récupération', 'https://github.com/explodinggradients/rags', (SELECT id FROM public.categories WHERE slug = 'development')),
('BLOOM', 'bloom', 'Modèle de langage multilingue open-source', 'https://huggingface.co/bigscience/bloom', (SELECT id FROM public.categories WHERE slug = 'text')),
('Detectron2', 'detectron2', 'Bibliothèque de vision par ordinateur de Facebook', 'https://github.com/facebookresearch/detectron2', (SELECT id FROM public.categories WHERE slug = 'image-generation')),
('Gradio', 'gradio', 'Création d''interfaces pour modèles ML', 'https://gradio.app/', (SELECT id FROM public.categories WHERE slug = 'development')),
('NetworkX', 'networkx', 'Bibliothèque d''analyse de réseaux', 'https://networkx.org/', (SELECT id FROM public.categories WHERE slug = 'data')),
('Petastorm', 'petastorm', 'Bibliothèque de données pour deep learning', 'https://github.com/uber/petastorm', (SELECT id FROM public.categories WHERE slug = 'data')),
('TensorFlow', 'tensorflow', 'Framework d''apprentissage automatique', 'https://www.tensorflow.org/', (SELECT id FROM public.categories WHERE slug = 'development')),
('XGBoost', 'xgboost', 'Bibliothèque de boosting gradient', 'https://xgboost.readthedocs.io/', (SELECT id FROM public.categories WHERE slug = 'data'));

COMMIT;
