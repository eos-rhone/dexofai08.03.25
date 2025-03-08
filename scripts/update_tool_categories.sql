-- Migration SQL pour mettre à jour les catégories des outils IA

BEGIN;

-- Mise à jour des catégories pour chaque outil
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Science & Recherche')
WHERE name = 'ResearchGPT';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Science des données')
WHERE name = 'DataSynth';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Recherche')
WHERE name = 'LitReview';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Analyse de données')
WHERE name = 'HypoTest';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Science & Recherche')
WHERE name = 'LabAssist';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Rédaction & Contenu')
WHERE name = 'PaperCraft';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Visualisation & Analyse')
WHERE name = 'DataViz';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Recherche')
WHERE name = 'PeerReviewAI';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Rédaction & Contenu')
WHERE name = 'GrantWriter';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Collaboration IA')
WHERE name = 'CollabNet';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Nanotechnologie')
WHERE name = 'NanoSim Pro';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Nanotechnologie')
WHERE name = 'AtomicForge';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Nanotechnologie')
WHERE name = 'NanoVision';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Nanotechnologie')
WHERE name = 'QuantumDot';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Nanotechnologie')
WHERE name = 'NanoCAD';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Traduction & Localisation')
WHERE name = 'DeepL Write';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Traduction & Localisation')
WHERE name = 'Lokalise AI';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Assistants & Chatbots')
WHERE name = 'Marvin';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Développement')
WHERE name = 'Promptfoo';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Développement d''Agents')
WHERE name = 'E2B';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Assistants & Chatbots')
WHERE name = 'privateGPT';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Art & Créativité')
WHERE name = 'Artbreeder';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Génération d''images')
WHERE name = 'Wombo Dream';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Art & Créativité')
WHERE name = 'NightCafe Creator';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Vidéo')
WHERE name = 'VideoEnhance AI';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'3D & Animation')
WHERE name = 'AnimationStudio';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Vidéo')
WHERE name = 'MotionTrack';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'3D & Animation')
WHERE name = 'CharacterAI';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Audio & Voix')
WHERE name = 'AudioSync';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Vidéo & Animation')
WHERE name = 'StoryboardAI';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Vidéo')
WHERE name = 'ColorMatch';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'3D & Animation')
WHERE name = 'RenderFarm';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Blockchain & Web3')
WHERE name = 'Ocean Protocol';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Blockchain & Web3')
WHERE name = 'Fetch.ai';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Métavers & Mondes virtuels')
WHERE name = 'Ready Player Me';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Blockchain & Web3')
WHERE name = 'Matrix AI Network';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Traitement du Langage Naturel')
WHERE name = 'Gemini';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Développement')
WHERE name = 'LangSmith';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Métavers & Mondes virtuels')
WHERE name = 'Nvidia Omniverse';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Métavers & Mondes virtuels')
WHERE name = 'Decentraland';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'RH & Recrutement')
WHERE name = 'Eightfold AI';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Télécommunications')
WHERE name = 'Huawei iMaster';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Santé')
WHERE name = 'Mindstrong';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Rencontres & Relations')
WHERE name = 'Lovebot';

UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = E'Océanographie')
WHERE name = 'MarineLife';

COMMIT;
