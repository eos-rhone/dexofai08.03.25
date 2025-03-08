-- Mise à jour des outils restants qui utilisent l'image par défaut
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Design'),
    image_url = 'https://images.unsplash.com/photo-1561070791-2526d30994b5?q=80&w=2000'
WHERE name = 'Beautiful.ai';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Archéologie'),
    image_url = 'https://images.unsplash.com/photo-1599930113854-d6d7fd521f10?q=80&w=2000'
WHERE name = 'Artefacts Analyzer';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Vision par Ordinateur'),
    image_url = 'https://images.unsplash.com/photo-1561883088-039e53143d73?q=80&w=2000'
WHERE name = 'YOLO';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Analyse de données'),
    image_url = 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000'
WHERE name = 'Power BI';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Recherche'),
    image_url = 'https://images.unsplash.com/photo-1456324504439-367cee3b3c32?q=80&w=2000'
WHERE name = 'Elicit';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Vidéo'),
    image_url = 'https://images.unsplash.com/photo-1492724441997-5dc865305da7?q=80&w=2000'
WHERE name = 'Kapwing';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = '3D & Animation'),
    image_url = 'https://images.unsplash.com/photo-1620428268482-cf1851a36764?q=80&w=2000'
WHERE name = 'GET3D';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Écriture & Rédaction'),
    image_url = 'https://images.unsplash.com/photo-1455390582262-044cdead277a?q=80&w=2000'
WHERE name = 'Sudowrite';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Productivité'),
    image_url = 'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?q=80&w=2000'
WHERE name = 'Fireflies AI';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Design'),
    image_url = 'https://images.unsplash.com/photo-1561070791-2526d30994b5?q=80&w=2000'
WHERE name = 'Simplified';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Recherche'),
    image_url = 'https://images.unsplash.com/photo-1456324504439-367cee3b3c32?q=80&w=2000'
WHERE name = 'Explainpaper';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Recherche'),
    image_url = 'https://images.unsplash.com/photo-1507842217343-583bb7270b66?q=80&w=2000'
WHERE name = 'Semantic Scholar';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Tests & QA'),
    image_url = 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?q=80&w=2000'
WHERE name = 'Testim';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Écriture & Rédaction'),
    image_url = 'https://images.unsplash.com/photo-1455390582262-044cdead277a?q=80&w=2000'
WHERE name = 'Anyword';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Audio & Musique'),
    image_url = 'https://images.unsplash.com/photo-1511379938547-c1f69419868d?q=80&w=2000'
WHERE name = 'LALAL.AI';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Écriture & Rédaction'),
    image_url = 'https://images.unsplash.com/photo-1455390582262-044cdead277a?q=80&w=2000'
WHERE name = 'Frase';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Assistants & Chatbots'),
    image_url = 'https://images.unsplash.com/photo-1675557014937-b415f773d22d?q=80&w=2000'
WHERE name IN ('Le Chat', 'Grok', 'GPT-4', 'Gemini', 'Mistral');

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Audio & Voix'),
    image_url = 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618?q=80&w=2000'
WHERE name = 'Otter AI';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Vidéo'),
    image_url = 'https://images.unsplash.com/photo-1492724441997-5dc865305da7?q=80&w=2000'
WHERE name = 'AI Studios - DeepBrain';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Analyse de données'),
    image_url = 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000'
WHERE name = 'Obviously AI';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Archéologie'),
    image_url = 'https://images.unsplash.com/photo-1599930113854-d6d7fd521f10?q=80&w=2000'
WHERE name = 'Archaeological Vision';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Recherche'),
    image_url = 'https://images.unsplash.com/photo-1456324504439-367cee3b3c32?q=80&w=2000'
WHERE name = 'Iris AI';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Vision par Ordinateur'),
    image_url = 'https://images.unsplash.com/photo-1561883088-039e53143d73?q=80&w=2000'
WHERE name = 'MMDetection';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Développement'),
    image_url = 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?q=80&w=2000'
WHERE name = 'Phind';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Santé'),
    image_url = 'https://images.unsplash.com/photo-1576091160550-2173dba999ef?q=80&w=2000'
WHERE name = 'Ada Health';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Ressources Humaines'),
    image_url = 'https://images.unsplash.com/photo-1521791136064-7986c2920216?q=80&w=2000'
WHERE name = 'Eightfold AI';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Vidéo'),
    image_url = 'https://images.unsplash.com/photo-1492724441997-5dc865305da7?q=80&w=2000'
WHERE name = 'Pictory';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Archéologie'),
    image_url = 'https://images.unsplash.com/photo-1599930113854-d6d7fd521f10?q=80&w=2000'
WHERE name = 'Digital Archaeology Tool';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Vision par Ordinateur'),
    image_url = 'https://images.unsplash.com/photo-1561883088-039e53143d73?q=80&w=2000'
WHERE name = 'Detectron2';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Juridique'),
    image_url = 'https://images.unsplash.com/photo-1589829545856-d10d557cf95f?q=80&w=2000'
WHERE name = 'Harvey AI';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Recherche'),
    image_url = 'https://images.unsplash.com/photo-1456324504439-367cee3b3c32?q=80&w=2000'
WHERE name = 'Connected Papers';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Frameworks & Bibliothèques'),
    image_url = 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=2000'
WHERE name IN ('MLflow', 'NumPy', 'Label Studio', 'Ray Tune', 'H2O');

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Recherche'),
    image_url = 'https://images.unsplash.com/photo-1507842217343-583bb7270b66?q=80&w=2000'
WHERE name = 'You.com';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Recherche'),
    image_url = 'https://images.unsplash.com/photo-1456324504439-367cee3b3c32?q=80&w=2000'
WHERE name = 'QuestionAnything';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Design'),
    image_url = 'https://images.unsplash.com/photo-1561070791-2526d30994b5?q=80&w=2000'
WHERE name = 'Designs AI';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Assistants & Chatbots'),
    image_url = 'https://images.unsplash.com/photo-1675557014937-b415f773d22d?q=80&w=2000'
WHERE name IN ('Ollama', 'BART', 'LLaMA', 'BeforeSunset', 'MRKL', 'E2B', 'Marvin', 'StealthGPT', 'WebLLM', 'Promptfoo', 'BabyAGI');

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Développement'),
    image_url = 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?q=80&w=2000'
WHERE name IN ('PromptTools', 'Shell GPT', 'ZenML', 'Vertex AI', 'Joblib', 'HttpsGPT');

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Recherche'),
    image_url = 'https://images.unsplash.com/photo-1456324504439-367cee3b3c32?q=80&w=2000'
WHERE name IN ('Consensus', 'Metaphor', 'MiniGPT-4');

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Développement'),
    image_url = 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?q=80&w=2000'
WHERE name = 'OSS Insight';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Génération d''Images'),
    image_url = 'https://images.unsplash.com/photo-1579547944212-c4f4961a8dd8?q=80&w=2000'
WHERE name = 'DALL·E 3';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Recherche'),
    image_url = 'https://images.unsplash.com/photo-1456324504439-367cee3b3c32?q=80&w=2000'
WHERE name = 'Perplexity AI';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Vidéo'),
    image_url = 'https://images.unsplash.com/photo-1492724441997-5dc865305da7?q=80&w=2000'
WHERE name IN ('Veed', 'Runway');

-- Vérification finale des outils sans catégorie ou avec image par défaut
SELECT t.name, t.image_url, c.name as category_name
FROM ai_tools t
LEFT JOIN categories c ON t.category_id = c.id
WHERE t.image_url = 'https://images.unsplash.com/photo-1677442136019-21780ecad995'
   OR t.category_id IS NULL
ORDER BY t.name;
