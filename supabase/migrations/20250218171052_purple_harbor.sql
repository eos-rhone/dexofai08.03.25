-- Ajouter des outils dans différentes catégories
DO $$ 
DECLARE
  assistants_id uuid;
  music_id uuid;
  data_id uuid;
  voice_id uuid;
  business_id uuid;
BEGIN
  -- Récupérer les IDs des catégories
  SELECT id INTO assistants_id FROM categories WHERE slug = 'assistants-chatbots';
  SELECT id INTO music_id FROM categories WHERE slug = 'creation-musicale';
  SELECT id INTO data_id FROM categories WHERE slug = 'analyse-donnees';
  SELECT id INTO voice_id FROM categories WHERE slug = 'voix-parole';
  SELECT id INTO business_id FROM categories WHERE slug = 'business-marketing';

  -- Assistants & Chatbots
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
    ('Inflection Pi', 'inflection-pi', 'Assistant IA empathique avec compréhension contextuelle avancée', assistants_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://inflection.ai', true, true, 600000, 1200000, 8000, 4.8),
    ('Cohere', 'cohere', 'Plateforme d''IA conversationnelle pour les entreprises', assistants_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://cohere.ai', true, false, 300000, 600000, 4000, 4.7),
    ('Forefront', 'forefront', 'Accès à de multiples modèles de langage en un seul endroit', assistants_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://forefront.ai', true, false, 200000, 400000, 2500, 4.6);

  -- Création musicale
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
    ('Splash Pro', 'splash-pro', 'Création de musique personnalisée pour les jeux vidéo', music_id, 'https://images.unsplash.com/photo-1511379938547-c1f69419868d', 'https://www.splashmusic.com', true, true, 180000, 360000, 2500, 4.7),
    ('Amper Score', 'amper-score', 'Composition musicale assistée par IA pour les médias', music_id, 'https://images.unsplash.com/photo-1507838153414-b4b713384a76', 'https://www.ampermusic.com', true, false, 120000, 240000, 1800, 4.6),
    ('Musenet', 'musenet', 'Génération de musique multi-instrumentale par OpenAI', music_id, 'https://images.unsplash.com/photo-1511379938547-c1f69419868d', 'https://openai.com/research/musenet', true, false, 90000, 180000, 1200, 4.5);

  -- Analyse de données
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
    ('Knime', 'knime', 'Plateforme open-source d''analyse de données et d''IA', data_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://www.knime.com', true, true, 200000, 400000, 2800, 4.7),
    ('Alteryx', 'alteryx', 'Solution d''analyse et d''automatisation des données', data_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://www.alteryx.com', true, false, 150000, 300000, 2000, 4.6),
    ('BigML', 'bigml', 'Plateforme de machine learning complète', data_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://bigml.com', true, false, 100000, 200000, 1500, 4.5);

  -- Voix & Parole
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
    ('Descript', 'descript', 'Édition audio et vidéo avec clonage vocal', voice_id, 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618', 'https://www.descript.com', true, true, 250000, 500000, 3500, 4.8),
    ('Speechify', 'speechify', 'Conversion de texte en voix naturelle', voice_id, 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618', 'https://speechify.com', true, false, 180000, 360000, 2400, 4.7),
    ('Voicemod', 'voicemod', 'Modification de voix en temps réel', voice_id, 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618', 'https://www.voicemod.net', true, false, 150000, 300000, 2000, 4.6);

  -- Business & Marketing
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
    ('Persado', 'persado', 'Optimisation du marketing par l''IA cognitive', business_id, 'https://images.unsplash.com/photo-1460925895917-afdab827c52f', 'https://www.persado.com', true, true, 200000, 400000, 2800, 4.7),
    ('Albert', 'albert', 'Marketing automation autonome par IA', business_id, 'https://images.unsplash.com/photo-1460925895917-afdab827c52f', 'https://albert.ai', true, false, 150000, 300000, 2000, 4.6),
    ('Phrasee', 'phrasee', 'Génération de textes marketing optimisés', business_id, 'https://images.unsplash.com/photo-1460925895917-afdab827c52f', 'https://phrasee.co', true, false, 120000, 240000, 1600, 4.5);

  -- Ajouter les fonctionnalités
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Compréhension contextuelle', 'Analyse approfondie du contexte'
  FROM ai_tools WHERE slug = 'inflection-pi'
  UNION ALL
  SELECT id, 'Composition multi-instruments', 'Création musicale complexe'
  FROM ai_tools WHERE slug = 'splash-pro'
  UNION ALL
  SELECT id, 'Analyse prédictive', 'Prévisions basées sur les données'
  FROM ai_tools WHERE slug = 'knime'
  UNION ALL
  SELECT id, 'Clonage vocal avancé', 'Reproduction fidèle des voix'
  FROM ai_tools WHERE slug = 'descript'
  UNION ALL
  SELECT id, 'Optimisation cognitive', 'Marketing optimisé par l''IA'
  FROM ai_tools WHERE slug = 'persado';

  -- Ajouter les plans tarifaires
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Gratuit', 0, 'monthly', ARRAY['Utilisation limitée', 'Fonctionnalités de base']
  FROM ai_tools WHERE slug = 'inflection-pi'
  UNION ALL
  SELECT id, 'Pro', 49, 'monthly', ARRAY['Utilisation illimitée', 'Support prioritaire']
  FROM ai_tools WHERE slug = 'splash-pro'
  UNION ALL
  SELECT id, 'Enterprise', 299, 'monthly', ARRAY['Déploiement personnalisé', 'Support dédié']
  FROM ai_tools WHERE slug = 'knime'
  UNION ALL
  SELECT id, 'Creator', 29, 'monthly', ARRAY['3 heures d''édition', 'Export HD']
  FROM ai_tools WHERE slug = 'descript'
  UNION ALL
  SELECT id, 'Business', 499, 'monthly', ARRAY['Analyse avancée', 'API access']
  FROM ai_tools WHERE slug = 'persado';

END $$;
