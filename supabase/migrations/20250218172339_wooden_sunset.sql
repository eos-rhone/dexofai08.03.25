-- Ajouter de nouvelles catégories
INSERT INTO categories (name, slug, description, icon) VALUES
('Robotique', 'robotique', 'Solutions d''IA pour la robotique et l''automatisation', 'Bot'),
('Cybersécurité', 'cybersecurite', 'Outils d''IA pour la sécurité informatique', 'Shield'),
('Santé', 'sante', 'Applications d''IA pour la santé et la médecine', 'Heart'),
('Finance', 'finance', 'Solutions d''IA pour la finance et l''investissement', 'LineChart'),
('IoT & Domotique', 'iot-domotique', 'IA pour les objets connectés et la maison intelligente', 'Home'),
('Jeux vidéo', 'jeux-video', 'IA pour le développement et l''expérience de jeu', 'Gamepad'),
('Recherche scientifique', 'recherche-scientifique', 'IA pour la recherche et les découvertes scientifiques', 'Flask'),
('Juridique', 'juridique', 'Applications d''IA pour le domaine juridique', 'Scale')
ON CONFLICT (slug) DO NOTHING;

-- Ajouter des outils dans les nouvelles catégories
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
  -- Récupérer les IDs des nouvelles catégories
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
    ('RobotFlow', 'robotflow', 'Plateforme de programmation de robots par IA', robotique_id, 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e', 'https://robotflow.ai', true, true, 200000, 400000, 2500, 4.8),
    ('AutoBot Studio', 'autobot-studio', 'Suite d''outils pour l''automatisation robotique', robotique_id, 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e', 'https://autobots.ai', true, false, 150000, 300000, 1800, 4.7),
    ('RoboMind', 'robomind', 'IA pour le contrôle cognitif des robots', robotique_id, 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e', 'https://robomind.ai', true, false, 100000, 200000, 1200, 4.6);

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
    ('CyberGuard AI', 'cyberguard-ai', 'Protection contre les menaces par IA', cybersecurite_id, 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b', 'https://cyberguard.ai', true, true, 300000, 600000, 3500, 4.8),
    ('ThreatHunter', 'threathunter', 'Détection proactive des menaces par IA', cybersecurite_id, 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b', 'https://threathunter.ai', true, false, 200000, 400000, 2500, 4.7),
    ('SecureFlow', 'secureflow', 'Analyse de sécurité automatisée', cybersecurite_id, 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b', 'https://secureflow.ai', true, false, 150000, 300000, 1800, 4.6);

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
    ('MedAssist AI', 'medassist-ai', 'Assistant diagnostic médical par IA', sante_id, 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d', 'https://medassist.ai', true, true, 400000, 800000, 5000, 4.9),
    ('HealthBot', 'healthbot', 'Chatbot médical intelligent', sante_id, 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d', 'https://healthbot.ai', true, false, 300000, 600000, 3500, 4.7),
    ('BioAnalytics', 'bioanalytics', 'Analyse de données biomédicales', sante_id, 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d', 'https://bioanalytics.ai', true, false, 250000, 500000, 3000, 4.6);

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
    ('TradeMind', 'trademind', 'IA pour le trading algorithmique', finance_id, 'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3', 'https://trademind.ai', true, true, 350000, 700000, 4500, 4.8),
    ('FinPredict', 'finpredict', 'Prévisions financières par IA', finance_id, 'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3', 'https://finpredict.ai', true, false, 250000, 500000, 3000, 4.7),
    ('WealthBot', 'wealthbot', 'Gestion de patrimoine automatisée', finance_id, 'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3', 'https://wealthbot.ai', true, false, 200000, 400000, 2500, 4.6);

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
    ('SmartHome AI', 'smarthome-ai', 'Contrôle domotique intelligent', iot_id, 'https://images.unsplash.com/photo-1558002038-bb4e4994b852', 'https://smarthome.ai', true, true, 300000, 600000, 4000, 4.8),
    ('IoTFlow', 'iotflow', 'Gestion des objets connectés par IA', iot_id, 'https://images.unsplash.com/photo-1558002038-bb4e4994b852', 'https://iotflow.ai', true, false, 200000, 400000, 2500, 4.7),
    ('DeviceGuard', 'deviceguard', 'Sécurité des objets connectés', iot_id, 'https://images.unsplash.com/photo-1558002038-bb4e4994b852', 'https://deviceguard.ai', true, false, 150000, 300000, 1800, 4.6);

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
    ('GameGen AI', 'gamegen-ai', 'Génération de contenu pour jeux', jeux_id, 'https://images.unsplash.com/photo-1550745165-9bc0b252726f', 'https://gamegen.ai', true, true, 250000, 500000, 3000, 4.8),
    ('NPCMind', 'npcmind', 'IA pour personnages non-joueurs', jeux_id, 'https://images.unsplash.com/photo-1550745165-9bc0b252726f', 'https://npcmind.ai', true, false, 180000, 360000, 2200, 4.7),
    ('LevelDesigner', 'leveldesigner', 'Création de niveaux par IA', jeux_id, 'https://images.unsplash.com/photo-1550745165-9bc0b252726f', 'https://leveldesigner.ai', true, false, 150000, 300000, 1800, 4.6);

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
    ('ScienceGPT', 'sciencegpt', 'Assistant de recherche scientifique', recherche_id, 'https://images.unsplash.com/photo-1532094349884-543bc11b234d', 'https://sciencegpt.ai', true, true, 400000, 800000, 5000, 4.9),
    ('LabAssistant', 'labassistant', 'Automatisation des expériences', recherche_id, 'https://images.unsplash.com/photo-1532094349884-543bc11b234d', 'https://labassistant.ai', true, false, 300000, 600000, 3500, 4.7),
    ('ResearchMind', 'researchmind', 'Analyse de publications scientifiques', recherche_id, 'https://images.unsplash.com/photo-1532094349884-543bc11b234d', 'https://researchmind.ai', true, false, 250000, 500000, 3000, 4.6);

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
    ('LegalMind', 'legalmind', 'Assistant juridique intelligent', juridique_id, 'https://images.unsplash.com/photo-1589829545856-d10d557cf95f', 'https://legalmind.ai', true, true, 300000, 600000, 4000, 4.8),
    ('CaseAnalyzer', 'caseanalyzer', 'Analyse de jurisprudence par IA', juridique_id, 'https://images.unsplash.com/photo-1589829545856-d10d557cf95f', 'https://caseanalyzer.ai', true, false, 200000, 400000, 2500, 4.7),
    ('ContractAI', 'contract-ai', 'Rédaction et analyse de contrats', juridique_id, 'https://images.unsplash.com/photo-1589829545856-d10d557cf95f', 'https://contractai.com', true, false, 150000, 300000, 1800, 4.6);

  -- Ajouter les fonctionnalités
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Programmation intuitive', 'Interface visuelle pour robots'
  FROM ai_tools WHERE slug = 'robotflow'
  UNION ALL
  SELECT id, 'Détection temps réel', 'Analyse continue des menaces'
  FROM ai_tools WHERE slug = 'cyberguard-ai'
  UNION ALL
  SELECT id, 'Diagnostic assisté', 'Support aux décisions médicales'
  FROM ai_tools WHERE slug = 'medassist-ai'
  UNION ALL
  SELECT id, 'Trading automatisé', 'Stratégies algorithmiques'
  FROM ai_tools WHERE slug = 'trademind'
  UNION ALL
  SELECT id, 'Automatisation maison', 'Contrôle intelligent'
  FROM ai_tools WHERE slug = 'smarthome-ai'
  UNION ALL
  SELECT id, 'Génération procédurale', 'Création de contenu de jeu'
  FROM ai_tools WHERE slug = 'gamegen-ai'
  UNION ALL
  SELECT id, 'Analyse de publications', 'Revue de littérature'
  FROM ai_tools WHERE slug = 'sciencegpt'
  UNION ALL
  SELECT id, 'Analyse juridique', 'Recherche de jurisprudence'
  FROM ai_tools WHERE slug = 'legalmind';

  -- Ajouter les plans tarifaires
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Pro', 49.99, 'monthly', ARRAY['Robots illimités', 'Support technique']
  FROM ai_tools WHERE slug = 'robotflow'
  UNION ALL
  SELECT id, 'Enterprise', 499, 'monthly', ARRAY['Protection avancée', 'Support 24/7']
  FROM ai_tools WHERE slug = 'cyberguard-ai'
  UNION ALL
  SELECT id, 'Clinic', 299, 'monthly', ARRAY['Multi-utilisateurs', 'Intégration DME']
  FROM ai_tools WHERE slug = 'medassist-ai'
  UNION ALL
  SELECT id, 'Pro Trader', 199, 'monthly', ARRAY['Stratégies avancées', 'Données temps réel']
  FROM ai_tools WHERE slug = 'trademind'
  UNION ALL
  SELECT id, 'Home', 29.99, 'monthly', ARRAY['Contrôle total', 'Automatisations']
  FROM ai_tools WHERE slug = 'smarthome-ai'
  UNION ALL
  SELECT id, 'Studio', 99, 'monthly', ARRAY['Assets illimités', 'Export haute qualité']
  FROM ai_tools WHERE slug = 'gamegen-ai'
  UNION ALL
  SELECT id, 'Research', 199, 'monthly', ARRAY['Accès complet', 'API']
  FROM ai_tools WHERE slug = 'sciencegpt'
  UNION ALL
  SELECT id, 'Law Firm', 399, 'monthly', ARRAY['Multi-utilisateurs', 'Base juridique']
  FROM ai_tools WHERE slug = 'legalmind';

END $$;
