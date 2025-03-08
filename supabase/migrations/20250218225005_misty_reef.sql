/*
  # Ajout de nouvelles catégories

  1. Nouvelles catégories
    - Traitement du langage naturel (NLP)
    - Réalité augmentée & virtuelle
    - Traduction & Localisation
    - Automobile & Transport
    - Agriculture & Environnement
    - Mode & Design
    - Architecture & Construction
    - Ressources humaines
*/

-- Ajouter les nouvelles catégories
INSERT INTO categories (name, slug, description, icon) VALUES
('Traitement du langage naturel', 'nlp', 'Solutions d''IA pour le traitement et l''analyse du langage naturel', 'MessageSquare'),
('Réalité augmentée & virtuelle', 'ar-vr', 'Outils d''IA pour la réalité augmentée et virtuelle', 'Glasses'),
('Traduction & Localisation', 'traduction-localisation', 'Solutions d''IA pour la traduction et l''adaptation culturelle', 'Languages'),
('Automobile & Transport', 'automobile-transport', 'IA pour les véhicules autonomes et la mobilité', 'Car'),
('Agriculture & Environnement', 'agriculture-environnement', 'Applications d''IA pour l''agriculture et l''environnement', 'Leaf'),
('Mode & Design', 'mode-design', 'IA pour la création de mode et le design textile', 'Shirt'),
('Architecture & Construction', 'architecture-construction', 'IA pour la conception architecturale et la construction', 'Building2'),
('Ressources humaines', 'ressources-humaines', 'Solutions d''IA pour le recrutement et la gestion RH', 'Users')
ON CONFLICT (slug) DO NOTHING;

-- Ajouter des outils d'exemple pour chaque nouvelle catégorie
DO $$ 
DECLARE
  nlp_id uuid;
  ar_vr_id uuid;
  traduction_id uuid;
  auto_id uuid;
  agri_id uuid;
  mode_id uuid;
  archi_id uuid;
  rh_id uuid;
BEGIN
  -- Récupérer les IDs des nouvelles catégories
  SELECT id INTO nlp_id FROM categories WHERE slug = 'nlp';
  SELECT id INTO ar_vr_id FROM categories WHERE slug = 'ar-vr';
  SELECT id INTO traduction_id FROM categories WHERE slug = 'traduction-localisation';
  SELECT id INTO auto_id FROM categories WHERE slug = 'automobile-transport';
  SELECT id INTO agri_id FROM categories WHERE slug = 'agriculture-environnement';
  SELECT id INTO mode_id FROM categories WHERE slug = 'mode-design';
  SELECT id INTO archi_id FROM categories WHERE slug = 'architecture-construction';
  SELECT id INTO rh_id FROM categories WHERE slug = 'ressources-humaines';

  -- Insérer des outils pour chaque catégorie
  INSERT INTO ai_tools (
    name,
    slug,
    description,
    category_id,
    image_url,
    website_url,
    is_verified,
    is_featured,
    monthly_users,
    total_views,
    total_reviews,
    average_rating
  ) VALUES
    -- NLP
    ('LangChain', 'langchain', 'Framework pour créer des applications NLP', nlp_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://langchain.com', true, true, 400000, 800000, 5000, 4.8),
    ('Spacy', 'spacy', 'Bibliothèque de traitement du langage naturel', nlp_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://spacy.io', true, false, 300000, 600000, 3500, 4.7),
    
    -- AR/VR
    ('Unity AI', 'unity-ai', 'Suite d''outils IA pour Unity', ar_vr_id, 'https://images.unsplash.com/photo-1535223289827-42f1e9919769', 'https://unity.com/ai', true, true, 350000, 700000, 4000, 4.8),
    ('Unreal Engine AI', 'unreal-engine-ai', 'Outils IA pour Unreal Engine', ar_vr_id, 'https://images.unsplash.com/photo-1535223289827-42f1e9919769', 'https://unrealengine.com', true, false, 280000, 560000, 3200, 4.7),
    
    -- Traduction
    ('DeepL Pro', 'deepl-pro', 'Service de traduction IA professionnel', traduction_id, 'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8', 'https://deepl.com', true, true, 500000, 1000000, 6000, 4.9),
    ('Lokalise AI', 'lokalise-ai', 'Plateforme de localisation avec IA', traduction_id, 'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8', 'https://lokalise.com', true, false, 200000, 400000, 2500, 4.6),
    
    -- Automobile
    ('Tesla Autopilot', 'tesla-autopilot', 'Système de conduite autonome', auto_id, 'https://images.unsplash.com/photo-1536700503339-1e4b06520771', 'https://tesla.com/autopilot', true, true, 800000, 1600000, 10000, 4.8),
    ('Waymo Driver', 'waymo-driver', 'Technologie de conduite autonome', auto_id, 'https://images.unsplash.com/photo-1536700503339-1e4b06520771', 'https://waymo.com', true, true, 600000, 1200000, 7000, 4.7),
    
    -- Agriculture
    ('FarmGPT', 'farmgpt', 'Assistant IA pour l''agriculture de précision', agri_id, 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449', 'https://farmgpt.ai', true, true, 250000, 500000, 3000, 4.8),
    ('AgroAI', 'agroai', 'Analyse de sols et cultures par IA', agri_id, 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449', 'https://agroai.com', true, false, 180000, 360000, 2200, 4.7),
    
    -- Mode
    ('Fashion AI', 'fashion-ai', 'Création de mode assistée par IA', mode_id, 'https://images.unsplash.com/photo-1558769132-cb1aea458c5e', 'https://fashionai.design', true, true, 300000, 600000, 3500, 4.8),
    ('StyleGAN Pro', 'stylegan-pro', 'Génération de designs de mode', mode_id, 'https://images.unsplash.com/photo-1558769132-cb1aea458c5e', 'https://stylegan.ai', true, false, 200000, 400000, 2500, 4.7),
    
    -- Architecture
    ('ArchiAI', 'archiai', 'Conception architecturale par IA', archi_id, 'https://images.unsplash.com/photo-1487958449943-2429e8be8625', 'https://archiai.com', true, true, 350000, 700000, 4000, 4.8),
    ('BIMGenius', 'bimgenius', 'IA pour la modélisation BIM', archi_id, 'https://images.unsplash.com/photo-1487958449943-2429e8be8625', 'https://bimgenius.ai', true, false, 250000, 500000, 3000, 4.7),
    
    -- RH
    ('HireFlow AI', 'hireflow-ai', 'Recrutement intelligent par IA', rh_id, 'https://images.unsplash.com/photo-1521791136064-7986c2920216', 'https://hireflow.ai', true, true, 400000, 800000, 5000, 4.8),
    ('TalentAI', 'talentai', 'Gestion des talents assistée par IA', rh_id, 'https://images.unsplash.com/photo-1521791136064-7986c2920216', 'https://talentai.com', true, false, 300000, 600000, 3500, 4.7);

  -- Ajouter les fonctionnalités pour les nouveaux outils
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Traitement multilingue', 'Support de nombreuses langues'
  FROM ai_tools WHERE slug = 'langchain'
  UNION ALL
  SELECT id, 'Réalité mixte', 'Fusion AR/VR'
  FROM ai_tools WHERE slug = 'unity-ai'
  UNION ALL
  SELECT id, 'Traduction neuronale', 'Traduction de haute qualité'
  FROM ai_tools WHERE slug = 'deepl-pro'
  UNION ALL
  SELECT id, 'Conduite autonome', 'Navigation autonome'
  FROM ai_tools WHERE slug = 'tesla-autopilot'
  UNION ALL
  SELECT id, 'Agriculture de précision', 'Optimisation des cultures'
  FROM ai_tools WHERE slug = 'farmgpt'
  UNION ALL
  SELECT id, 'Design génératif', 'Création de mode par IA'
  FROM ai_tools WHERE slug = 'fashion-ai'
  UNION ALL
  SELECT id, 'Conception 3D', 'Modélisation architecturale'
  FROM ai_tools WHERE slug = 'archiai'
  UNION ALL
  SELECT id, 'Matching IA', 'Correspondance candidats-postes'
  FROM ai_tools WHERE slug = 'hireflow-ai';

  -- Ajouter les plans tarifaires
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Pro', 49.99, 'monthly', ARRAY['API illimitée', 'Support prioritaire']
  FROM ai_tools WHERE slug = 'langchain'
  UNION ALL
  SELECT id, 'Enterprise', 199, 'monthly', ARRAY['Licence complète', 'Support dédié']
  FROM ai_tools WHERE slug = 'unity-ai'
  UNION ALL
  SELECT id, 'Business', 29.99, 'monthly', ARRAY['Traduction illimitée', 'API access']
  FROM ai_tools WHERE slug = 'deepl-pro'
  UNION ALL
  SELECT id, 'Premium', 199, 'monthly', ARRAY['Fonctionnalités avancées', 'Support 24/7']
  FROM ai_tools WHERE slug = 'tesla-autopilot'
  UNION ALL
  SELECT id, 'Pro', 99, 'monthly', ARRAY['Analyse complète', 'Rapports détaillés']
  FROM ai_tools WHERE slug = 'farmgpt'
  UNION ALL
  SELECT id, 'Studio', 149, 'monthly', ARRAY['Designs illimités', 'Export haute qualité']
  FROM ai_tools WHERE slug = 'fashion-ai'
  UNION ALL
  SELECT id, 'Professional', 199, 'monthly', ARRAY['Projets illimités', 'Rendu 4K']
  FROM ai_tools WHERE slug = 'archiai'
  UNION ALL
  SELECT id, 'Enterprise', 299, 'monthly', ARRAY['Recrutement illimité', 'ATS integration']
  FROM ai_tools WHERE slug = 'hireflow-ai';

END $$;
