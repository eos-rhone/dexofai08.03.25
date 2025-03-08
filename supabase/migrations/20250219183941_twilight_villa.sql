-- Ajouter de nouvelles catégories
INSERT INTO categories (name, slug, description, icon) VALUES
('Intelligence Artificielle Générale', 'agi', 'Recherche et développement en IA générale', 'Brain'),
('Métavers & Mondes virtuels', 'metaverse', 'Solutions IA pour les univers virtuels', 'Globe'),
('Art & Créativité', 'art-creativite', 'IA pour l''expression artistique', 'Palette'),
('Science des données', 'data-science', 'Outils d''analyse et visualisation avancée', 'Database'),
('Blockchain & Web3', 'blockchain-web3', 'IA appliquée à la blockchain et au Web3', 'Link'),
('Énergie & Climat', 'energie-climat', 'IA pour l''efficacité énergétique et le climat', 'Sun'),
('Sport & Fitness', 'sport-fitness', 'Applications IA pour le sport et le bien-être', 'Activity'),
('Médias & Divertissement', 'medias-divertissement', 'IA pour l''industrie du divertissement', 'Film')
ON CONFLICT (slug) DO NOTHING;

-- Ajouter des outils pour les nouvelles catégories
DO $$ 
DECLARE
  agi_id uuid;
  metaverse_id uuid;
  art_id uuid;
  data_science_id uuid;
  blockchain_id uuid;
  energie_id uuid;
  sport_id uuid;
  medias_id uuid;
BEGIN
  -- Récupérer les IDs des nouvelles catégories
  SELECT id INTO agi_id FROM categories WHERE slug = 'agi';
  SELECT id INTO metaverse_id FROM categories WHERE slug = 'metaverse';
  SELECT id INTO art_id FROM categories WHERE slug = 'art-creativite';
  SELECT id INTO data_science_id FROM categories WHERE slug = 'data-science';
  SELECT id INTO blockchain_id FROM categories WHERE slug = 'blockchain-web3';
  SELECT id INTO energie_id FROM categories WHERE slug = 'energie-climat';
  SELECT id INTO sport_id FROM categories WHERE slug = 'sport-fitness';
  SELECT id INTO medias_id FROM categories WHERE slug = 'medias-divertissement';

  -- Insérer des outils pour chaque nouvelle catégorie
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
    -- AGI
    ('DeepMind AGI', 'deepmind-agi', 'Recherche en intelligence artificielle générale', agi_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://deepmind.com', true, true, 800000, 1600000, 12000, 4.9),
    ('Anthropic Constitutional AI', 'anthropic-constitutional-ai', 'IA alignée sur les valeurs humaines', agi_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://anthropic.com', true, true, 600000, 1200000, 8000, 4.8),
    
    -- Métavers
    ('Meta Horizon', 'meta-horizon', 'Plateforme de métavers avec IA intégrée', metaverse_id, 'https://images.unsplash.com/photo-1535223289827-42f1e9919769', 'https://horizon.meta.com', true, true, 700000, 1400000, 9000, 4.8),
    ('Nvidia Omniverse', 'nvidia-omniverse', 'Plateforme de simulation et collaboration 3D', metaverse_id, 'https://images.unsplash.com/photo-1535223289827-42f1e9919769', 'https://nvidia.com/omniverse', true, true, 500000, 1000000, 6000, 4.7),
    
    -- Art & Créativité
    ('ArtBreeder Pro', 'artbreeder-pro', 'Création artistique collaborative par IA', art_id, 'https://images.unsplash.com/photo-1558769132-cb1aea458c5e', 'https://artbreeder.com', true, true, 400000, 800000, 5000, 4.8),
    ('CreativeAI Studio', 'creative-ai-studio', 'Suite d''outils créatifs propulsés par l''IA', art_id, 'https://images.unsplash.com/photo-1558769132-cb1aea458c5e', 'https://creative.ai', true, false, 300000, 600000, 3500, 4.7),
    
    -- Science des données
    ('DataRobot X', 'datarobot-x', 'Plateforme avancée d''AutoML', data_science_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://datarobot.com', true, true, 500000, 1000000, 6000, 4.8),
    ('H2O.ai Enterprise', 'h2o-ai-enterprise', 'Solutions d''IA pour l''entreprise', data_science_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://h2o.ai', true, true, 400000, 800000, 4500, 4.7),
    
    -- Blockchain & Web3
    ('ChainGPT', 'chaingpt', 'IA pour l''analyse de smart contracts', blockchain_id, 'https://images.unsplash.com/photo-1639762681485-074b7f938ba0', 'https://chaingpt.org', true, true, 300000, 600000, 3500, 4.8),
    ('Web3 AI', 'web3-ai', 'Assistant IA pour le développement Web3', blockchain_id, 'https://images.unsplash.com/photo-1639762681485-074b7f938ba0', 'https://web3.ai', true, false, 200000, 400000, 2500, 4.7),
    
    -- Énergie & Climat
    ('ClimateAI', 'climate-ai', 'Prévisions climatiques par IA', energie_id, 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e', 'https://climate.ai', true, true, 250000, 500000, 3000, 4.8),
    ('EnergyOptimize', 'energy-optimize', 'Optimisation énergétique intelligente', energie_id, 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e', 'https://energyoptimize.ai', true, false, 180000, 360000, 2200, 4.7),
    
    -- Sport & Fitness
    ('AI Coach', 'ai-coach', 'Coach sportif personnel par IA', sport_id, 'https://images.unsplash.com/photo-1517963879433-6ad2b056d712', 'https://aicoach.fitness', true, true, 400000, 800000, 5000, 4.8),
    ('SportAnalytics Pro', 'sport-analytics-pro', 'Analyse de performances sportives', sport_id, 'https://images.unsplash.com/photo-1517963879433-6ad2b056d712', 'https://sportanalytics.pro', true, false, 300000, 600000, 3500, 4.7),
    
    -- Médias & Divertissement
    ('ContentForge AI', 'contentforge-ai', 'Création de contenu multimédia par IA', medias_id, 'https://images.unsplash.com/photo-1536240478700-b869070f9279', 'https://contentforge.ai', true, true, 450000, 900000, 5500, 4.8),
    ('MediaSynth', 'media-synth', 'Synthèse de médias par IA', medias_id, 'https://images.unsplash.com/photo-1536240478700-b869070f9279', 'https://mediasynth.ai', true, false, 350000, 700000, 4000, 4.7);

  -- Ajouter les fonctionnalités
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Recherche AGI', 'Développement d''IA générale'
  FROM ai_tools WHERE slug = 'deepmind-agi'
  UNION ALL
  SELECT id, 'Métavers IA', 'Environnements virtuels intelligents'
  FROM ai_tools WHERE slug = 'meta-horizon'
  UNION ALL
  SELECT id, 'Création artistique', 'Génération d''art par IA'
  FROM ai_tools WHERE slug = 'artbreeder-pro'
  UNION ALL
  SELECT id, 'AutoML avancé', 'Apprentissage automatique automatisé'
  FROM ai_tools WHERE slug = 'datarobot-x'
  UNION ALL
  SELECT id, 'Smart Contracts', 'Analyse de contrats intelligents'
  FROM ai_tools WHERE slug = 'chaingpt'
  UNION ALL
  SELECT id, 'Prévisions climat', 'Modélisation climatique'
  FROM ai_tools WHERE slug = 'climate-ai'
  UNION ALL
  SELECT id, 'Coaching IA', 'Entraînement personnalisé'
  FROM ai_tools WHERE slug = 'ai-coach'
  UNION ALL
  SELECT id, 'Création contenu', 'Production multimédia automatisée'
  FROM ai_tools WHERE slug = 'contentforge-ai';

  -- Ajouter les plans tarifaires
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Research', 999, 'monthly', ARRAY['Accès AGI', 'Support dédié']
  FROM ai_tools WHERE slug = 'deepmind-agi'
  UNION ALL
  SELECT id, 'Enterprise', 499, 'monthly', ARRAY['Métavers privé', 'Support 24/7']
  FROM ai_tools WHERE slug = 'meta-horizon'
  UNION ALL
  SELECT id, 'Creator', 49, 'monthly', ARRAY['Création illimitée', 'Styles avancés']
  FROM ai_tools WHERE slug = 'artbreeder-pro'
  UNION ALL
  SELECT id, 'Enterprise', 999, 'monthly', ARRAY['AutoML illimité', 'Support dédié']
  FROM ai_tools WHERE slug = 'datarobot-x'
  UNION ALL
  SELECT id, 'Pro', 199, 'monthly', ARRAY['Analyse complète', 'API access']
  FROM ai_tools WHERE slug = 'chaingpt'
  UNION ALL
  SELECT id, 'Business', 299, 'monthly', ARRAY['Prévisions avancées', 'Rapports détaillés']
  FROM ai_tools WHERE slug = 'climate-ai'
  UNION ALL
  SELECT id, 'Pro', 29.99, 'monthly', ARRAY['Coaching illimité', 'Plans personnalisés']
  FROM ai_tools WHERE slug = 'ai-coach'
  UNION ALL
  SELECT id, 'Studio', 199, 'monthly', ARRAY['Production illimitée', 'Export 4K']
  FROM ai_tools WHERE slug = 'contentforge-ai';

END $$;
