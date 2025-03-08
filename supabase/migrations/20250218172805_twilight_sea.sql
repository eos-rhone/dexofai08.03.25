-- Ajouter des outils dans différentes catégories
DO $$ 
DECLARE
  robotique_id uuid;
  cybersecurite_id uuid;
  sante_id uuid;
  finance_id uuid;
  iot_id uuid;
  jeux_id uuid;
  recherche_id uuid;
  juridique_id uuid;
BEGIN
  -- Récupérer les IDs des catégories
  SELECT id INTO robotique_id FROM categories WHERE slug = 'robotique';
  SELECT id INTO cybersecurite_id FROM categories WHERE slug = 'cybersecurite';
  SELECT id INTO sante_id FROM categories WHERE slug = 'sante';
  SELECT id INTO finance_id FROM categories WHERE slug = 'finance';
  SELECT id INTO iot_id FROM categories WHERE slug = 'iot-domotique';
  SELECT id INTO jeux_id FROM categories WHERE slug = 'jeux-video';
  SELECT id INTO recherche_id FROM categories WHERE slug = 'recherche-scientifique';
  SELECT id INTO juridique_id FROM categories WHERE slug = 'juridique';

  -- Robotique
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
    ('RoboFlow Pro', 'roboflow-pro', 'Vision par ordinateur pour la robotique industrielle', robotique_id, 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e', 'https://roboflow.pro', true, true, 250000, 500000, 3500, 4.8),
    ('CoBot AI', 'cobot-ai', 'Collaboration homme-robot intelligente', robotique_id, 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e', 'https://cobot.ai', true, false, 180000, 360000, 2200, 4.7),
    ('DroneControl', 'dronecontrol', 'Contrôle autonome de drones par IA', robotique_id, 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e', 'https://dronecontrol.ai', true, true, 220000, 440000, 2800, 4.7);

  -- Cybersécurité
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
    ('AIDefender', 'aidefender', 'Protection contre les attaques IA avancées', cybersecurite_id, 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b', 'https://aidefender.com', true, true, 350000, 700000, 4500, 4.8),
    ('SecureAI', 'secureai', 'Sécurité prédictive par apprentissage profond', cybersecurite_id, 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b', 'https://secureai.tech', true, false, 280000, 560000, 3200, 4.7),
    ('CyberShield', 'cybershield', 'Protection temps réel des infrastructures critiques', cybersecurite_id, 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b', 'https://cybershield.ai', true, true, 320000, 640000, 3800, 4.8);

  -- Santé
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
    ('DiagnosticAI', 'diagnostic-ai', 'Diagnostic médical assisté par deep learning', sante_id, 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d', 'https://diagnostic.ai', true, true, 450000, 900000, 5500, 4.9),
    ('MedicalVision', 'medical-vision', 'Analyse d''imagerie médicale par IA', sante_id, 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d', 'https://medicalvision.ai', true, true, 380000, 760000, 4200, 4.8),
    ('HealthPredict', 'health-predict', 'Prédiction de risques de santé par IA', sante_id, 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d', 'https://healthpredict.ai', true, false, 320000, 640000, 3800, 4.7);

  -- Finance
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
    ('InvestAI', 'investai', 'Gestion de portefeuille automatisée', finance_id, 'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3', 'https://investai.com', true, true, 400000, 800000, 5000, 4.8),
    ('RiskAnalyzer', 'risk-analyzer', 'Analyse de risques financiers par IA', finance_id, 'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3', 'https://riskanalyzer.ai', true, false, 350000, 700000, 4200, 4.7),
    ('CryptoPredict', 'crypto-predict', 'Prédiction de marchés crypto par IA', finance_id, 'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3', 'https://cryptopredict.ai', true, true, 380000, 760000, 4500, 4.8);

  -- IoT & Domotique
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
    ('HomeGenius', 'home-genius', 'Optimisation énergétique par IA', iot_id, 'https://images.unsplash.com/photo-1558002038-bb4e4994b852', 'https://homegenius.ai', true, true, 350000, 700000, 4200, 4.8),
    ('SmartSense', 'smart-sense', 'Capteurs intelligents avec IA embarquée', iot_id, 'https://images.unsplash.com/photo-1558002038-bb4e4994b852', 'https://smartsense.io', true, false, 280000, 560000, 3500, 4.7),
    ('AutoHome', 'auto-home', 'Automatisation domestique prédictive', iot_id, 'https://images.unsplash.com/photo-1558002038-bb4e4994b852', 'https://autohome.ai', true, true, 320000, 640000, 3800, 4.8);

  -- Jeux vidéo
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
    ('GameAI Studio', 'game-ai-studio', 'Suite d''outils IA pour développeurs de jeux', jeux_id, 'https://images.unsplash.com/photo-1550745165-9bc0b252726f', 'https://gameaistudio.com', true, true, 300000, 600000, 3800, 4.8),
    ('NPCCreator', 'npc-creator', 'Création de personnages non-joueurs intelligents', jeux_id, 'https://images.unsplash.com/photo-1550745165-9bc0b252726f', 'https://npccreator.ai', true, false, 250000, 500000, 3000, 4.7),
    ('GameWorld', 'game-world', 'Génération procédurale de mondes de jeu', jeux_id, 'https://images.unsplash.com/photo-1550745165-9bc0b252726f', 'https://gameworld.ai', true, true, 280000, 560000, 3500, 4.8);

  -- Recherche scientifique
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
    ('ResearchGPT', 'research-gpt', 'Assistant de recherche scientifique avancé', recherche_id, 'https://images.unsplash.com/photo-1532094349884-543bc11b234d', 'https://researchgpt.ai', true, true, 450000, 900000, 5500, 4.9),
    ('DataScientist', 'data-scientist', 'Analyse automatisée de données scientifiques', recherche_id, 'https://images.unsplash.com/photo-1532094349884-543bc11b234d', 'https://datascientist.ai', true, true, 380000, 760000, 4500, 4.8),
    ('LabFlow', 'lab-flow', 'Gestion intelligente de laboratoire', recherche_id, 'https://images.unsplash.com/photo-1532094349884-543bc11b234d', 'https://labflow.ai', true, false, 320000, 640000, 3800, 4.7);

  -- Juridique
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
    ('LawGPT', 'law-gpt', 'Assistant juridique basé sur GPT', juridique_id, 'https://images.unsplash.com/photo-1589829545856-d10d557cf95f', 'https://lawgpt.ai', true, true, 400000, 800000, 5000, 4.9),
    ('ContractGenius', 'contract-genius', 'Analyse et rédaction de contrats par IA', juridique_id, 'https://images.unsplash.com/photo-1589829545856-d10d557cf95f', 'https://contractgenius.com', true, true, 350000, 700000, 4200, 4.8),
    ('LegalResearch', 'legal-research', 'Recherche juridique automatisée', juridique_id, 'https://images.unsplash.com/photo-1589829545856-d10d557cf95f', 'https://legalresearch.ai', true, false, 300000, 600000, 3500, 4.7);

  -- Ajouter les fonctionnalités
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Vision industrielle', 'Analyse d''images en temps réel'
  FROM ai_tools WHERE slug = 'roboflow-pro'
  UNION ALL
  SELECT id, 'Protection IA', 'Défense contre les attaques avancées'
  FROM ai_tools WHERE slug = 'aidefender'
  UNION ALL
  SELECT id, 'Diagnostic précis', 'Analyse médicale approfondie'
  FROM ai_tools WHERE slug = 'diagnostic-ai'
  UNION ALL
  SELECT id, 'Gestion automatisée', 'Optimisation de portefeuille'
  FROM ai_tools WHERE slug = 'investai'
  UNION ALL
  SELECT id, 'Économie d''énergie', 'Optimisation intelligente'
  FROM ai_tools WHERE slug = 'home-genius'
  UNION ALL
  SELECT id, 'NPCs avancés', 'Personnages intelligents'
  FROM ai_tools WHERE slug = 'game-ai-studio'
  UNION ALL
  SELECT id, 'Analyse scientifique', 'Traitement de données complexes'
  FROM ai_tools WHERE slug = 'research-gpt'
  UNION ALL
  SELECT id, 'Assistance juridique', 'Support légal intelligent'
  FROM ai_tools WHERE slug = 'law-gpt';

  -- Ajouter les plans tarifaires
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Enterprise', 499, 'monthly', ARRAY['Vision industrielle', 'Support 24/7']
  FROM ai_tools WHERE slug = 'roboflow-pro'
  UNION ALL
  SELECT id, 'Security', 999, 'monthly', ARRAY['Protection avancée', 'Analyse temps réel']
  FROM ai_tools WHERE slug = 'aidefender'
  UNION ALL
  SELECT id, 'Hospital', 1499, 'monthly', ARRAY['Diagnostic illimité', 'Support médical']
  FROM ai_tools WHERE slug = 'diagnostic-ai'
  UNION ALL
  SELECT id, 'Pro Trader', 299, 'monthly', ARRAY['Trading automatisé', 'Analyses avancées']
  FROM ai_tools WHERE slug = 'investai'
  UNION ALL
  SELECT id, 'Smart Home', 49.99, 'monthly', ARRAY['Contrôle total', 'Économies d''énergie']
  FROM ai_tools WHERE slug = 'home-genius'
  UNION ALL
  SELECT id, 'Studio', 199, 'monthly', ARRAY['NPCs illimités', 'Support technique']
  FROM ai_tools WHERE slug = 'game-ai-studio'
  UNION ALL
  SELECT id, 'Research', 299, 'monthly', ARRAY['Analyse illimitée', 'API access']
  FROM ai_tools WHERE slug = 'research-gpt'
  UNION ALL
  SELECT id, 'Law Firm', 499, 'monthly', ARRAY['Assistance complète', 'Base juridique']
  FROM ai_tools WHERE slug = 'law-gpt';

END $$;
