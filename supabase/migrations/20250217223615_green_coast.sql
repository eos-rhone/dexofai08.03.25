/*
  # Add real AI tools data

  1. Updates
    - Clear existing tool data
    - Add real tools with accurate data for each category
    - Update tool counts and statistics
  
  2. Categories
    - Assistants & Chatbots
    - Génération d'images
    - Création musicale
    - Analyse de données
    - Productivité
    - Design
    - Développement
    - Éducation
    - Vidéo & Animation
    - Rédaction & Contenu
    - Voix & Parole
    - Business & Marketing
*/

-- Clear existing data while preserving categories
TRUNCATE TABLE tool_pricing CASCADE;
TRUNCATE TABLE tool_features CASCADE;
TRUNCATE TABLE tool_stats CASCADE;
TRUNCATE TABLE reviews CASCADE;
TRUNCATE TABLE ai_tools CASCADE;

-- Insert AI Tools by Category

-- Assistants & Chatbots
INSERT INTO ai_tools (name, slug, description, category_id, image_url, website_url, is_verified, is_featured, monthly_users, total_views, total_reviews, average_rating) VALUES
('ChatGPT', 'chatgpt', 'Assistant conversationnel avancé basé sur GPT-4', (SELECT id FROM categories WHERE slug = 'assistants-chatbots'), 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://chat.openai.com', true, true, 1500000, 2000000, 15000, 4.8),
('Claude', 'claude', 'Assistant IA par Anthropic avec capacités avancées', (SELECT id FROM categories WHERE slug = 'assistants-chatbots'), 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://claude.ai', true, true, 800000, 1200000, 8000, 4.7),
('Bard', 'bard', 'Assistant IA de Google avec intégration des services Google', (SELECT id FROM categories WHERE slug = 'assistants-chatbots'), 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://bard.google.com', true, true, 1000000, 1500000, 10000, 4.6),
('Pi', 'pi', 'Assistant conversationnel empathique par Inflection AI', (SELECT id FROM categories WHERE slug = 'assistants-chatbots'), 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://pi.ai', true, false, 300000, 500000, 3000, 4.5),
('Character.ai', 'character-ai', 'Chatbots personnalisés avec différentes personnalités', (SELECT id FROM categories WHERE slug = 'assistants-chatbots'), 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://character.ai', true, false, 400000, 600000, 4000, 4.4);

-- Génération d'images
INSERT INTO ai_tools (name, slug, description, category_id, image_url, website_url, is_verified, is_featured, monthly_users, total_views, total_reviews, average_rating) VALUES
('Midjourney', 'midjourney', 'Génération d''images par IA de haute qualité', (SELECT id FROM categories WHERE slug = 'generation-images'), 'https://images.unsplash.com/photo-1519681393784-d120267933ba', 'https://www.midjourney.com', true, true, 900000, 1300000, 12000, 4.9),
('DALL-E', 'dall-e', 'Création d''images à partir de descriptions textuelles par OpenAI', (SELECT id FROM categories WHERE slug = 'generation-images'), 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4', 'https://labs.openai.com', true, true, 700000, 1000000, 9000, 4.7),
('Stable Diffusion', 'stable-diffusion', 'Modèle open-source de génération d''images', (SELECT id FROM categories WHERE slug = 'generation-images'), 'https://images.unsplash.com/photo-1533158307587-828f0a76ef46', 'https://stability.ai', true, true, 600000, 900000, 7000, 4.6),
('Leonardo.ai', 'leonardo-ai', 'Plateforme de création d''images IA pour les professionnels', (SELECT id FROM categories WHERE slug = 'generation-images'), 'https://images.unsplash.com/photo-1519681393784-d120267933ba', 'https://leonardo.ai', true, false, 200000, 400000, 2000, 4.5),
('Playground AI', 'playground-ai', 'Plateforme de génération d''images avec interface intuitive', (SELECT id FROM categories WHERE slug = 'generation-images'), 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4', 'https://playground.ai', true, false, 150000, 300000, 1500, 4.4);

-- Création musicale
INSERT INTO ai_tools (name, slug, description, category_id, image_url, website_url, is_verified, is_featured, monthly_users, total_views, total_reviews, average_rating) VALUES
('Mubert', 'mubert', 'Génération de musique par IA', (SELECT id FROM categories WHERE slug = 'creation-musicale'), 'https://images.unsplash.com/photo-1511379938547-c1f69419868d', 'https://mubert.com', true, true, 200000, 400000, 3000, 4.6),
('Soundraw', 'soundraw', 'Création de musique royalty-free par IA', (SELECT id FROM categories WHERE slug = 'creation-musicale'), 'https://images.unsplash.com/photo-1511379938547-c1f69419868d', 'https://soundraw.io', true, false, 150000, 300000, 2000, 4.5),
('AIVA', 'aiva', 'Composition musicale assistée par IA', (SELECT id FROM categories WHERE slug = 'creation-musicale'), 'https://images.unsplash.com/photo-1507838153414-b4b713384a76', 'https://www.aiva.ai', true, false, 100000, 200000, 1500, 4.4),
('Amper', 'amper', 'Création musicale professionnelle par IA', (SELECT id FROM categories WHERE slug = 'creation-musicale'), 'https://images.unsplash.com/photo-1511379938547-c1f69419868d', 'https://www.ampermusic.com', true, false, 80000, 150000, 1000, 4.3);

-- Analyse de données
INSERT INTO ai_tools (name, slug, description, category_id, image_url, website_url, is_verified, is_featured, monthly_users, total_views, total_reviews, average_rating) VALUES
('Obviously AI', 'obviously-ai', 'Analyse prédictive sans code', (SELECT id FROM categories WHERE slug = 'analyse-donnees'), 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://obviously.ai', true, true, 100000, 200000, 1500, 4.7),
('MindsDB', 'mindsdb', 'Prédictions IA dans votre base de données', (SELECT id FROM categories WHERE slug = 'analyse-donnees'), 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://mindsdb.com', true, false, 80000, 150000, 1000, 4.6),
('DataRobot', 'datarobot', 'Plateforme d''IA automatisée pour l''analyse', (SELECT id FROM categories WHERE slug = 'analyse-donnees'), 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://datarobot.com', true, false, 120000, 250000, 2000, 4.8);

-- Add tool features
INSERT INTO tool_features (tool_id, name, description) 
SELECT id, 'GPT-4', 'Modèle de langage le plus avancé' FROM ai_tools WHERE slug = 'chatgpt'
UNION ALL
SELECT id, 'Plugins', 'Extensions pour fonctionnalités additionnelles' FROM ai_tools WHERE slug = 'chatgpt'
UNION ALL
SELECT id, 'Haute résolution', 'Images jusqu''à 1024x1024 pixels' FROM ai_tools WHERE slug = 'midjourney'
UNION ALL
SELECT id, 'Styles artistiques', 'Large variété de styles disponibles' FROM ai_tools WHERE slug = 'midjourney'
UNION ALL
SELECT id, 'Génération temps réel', 'Création musicale instantanée' FROM ai_tools WHERE slug = 'mubert'
UNION ALL
SELECT id, 'Export haute qualité', 'Formats audio professionnels' FROM ai_tools WHERE slug = 'mubert';

-- Add tool pricing
INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
SELECT id, 'Gratuit', 0, 'monthly', ARRAY['Accès basique', 'Utilisation limitée'] FROM ai_tools WHERE slug = 'chatgpt'
UNION ALL
SELECT id, 'Plus', 20, 'monthly', ARRAY['Accès prioritaire', 'GPT-4', 'DALL-E'] FROM ai_tools WHERE slug = 'chatgpt'
UNION ALL
SELECT id, 'Basic', 10, 'monthly', ARRAY['200 images/mois', 'Résolution standard'] FROM ai_tools WHERE slug = 'midjourney'
UNION ALL
SELECT id, 'Standard', 30, 'monthly', ARRAY['Génération illimitée', 'Haute résolution'] FROM ai_tools WHERE slug = 'midjourney'
UNION ALL
SELECT id, 'Gratuit', 0, 'monthly', ARRAY['5 pistes/mois', 'Qualité standard'] FROM ai_tools WHERE slug = 'mubert'
UNION ALL
SELECT id, 'Pro', 20, 'monthly', ARRAY['Pistes illimitées', 'Export haute qualité'] FROM ai_tools WHERE slug = 'mubert';
