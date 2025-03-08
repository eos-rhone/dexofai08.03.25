-- Ajouter des outils dans différentes catégories
DO $$ 
DECLARE
  assistants_id uuid;
  music_id uuid;
  data_id uuid;
  voice_id uuid;
  business_id uuid;
  education_id uuid;
  video_id uuid;
  redaction_id uuid;
BEGIN
  -- Récupérer les IDs des catégories
  SELECT id INTO assistants_id FROM categories WHERE slug = 'assistants-chatbots';
  SELECT id INTO music_id FROM categories WHERE slug = 'creation-musicale';
  SELECT id INTO data_id FROM categories WHERE slug = 'analyse-donnees';
  SELECT id INTO voice_id FROM categories WHERE slug = 'voix-parole';
  SELECT id INTO business_id FROM categories WHERE slug = 'business-marketing';
  SELECT id INTO education_id FROM categories WHERE slug = 'education';
  SELECT id INTO video_id FROM categories WHERE slug = 'video-animation';
  SELECT id INTO redaction_id FROM categories WHERE slug = 'redaction-contenu';

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
    ('Llama Guard', 'llama-guard', 'Assistant de sécurité IA par Meta', assistants_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://ai.meta.com/llama', true, true, 400000, 800000, 5000, 4.7),
    ('Groq', 'groq', 'Assistant IA ultra-rapide avec LPU', assistants_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://groq.com', true, true, 300000, 600000, 3500, 4.8),
    ('Together AI', 'together-ai', 'Plateforme d''IA open source et collaborative', assistants_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://together.ai', true, false, 200000, 400000, 2500, 4.6);

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
    ('DeepMind MusicLM', 'deepmind-musiclm', 'Modèle de génération musicale par Google DeepMind', music_id, 'https://images.unsplash.com/photo-1511379938547-c1f69419868d', 'https://deepmind.google/discover/blog/musiclm', true, true, 250000, 500000, 3000, 4.8),
    ('Riffusion', 'riffusion', 'Génération de musique basée sur la diffusion stable', music_id, 'https://images.unsplash.com/photo-1507838153414-b4b713384a76', 'https://www.riffusion.com', true, false, 150000, 300000, 2000, 4.6),
    ('OpenVoice', 'openvoice', 'Clonage vocal et synthèse musicale open source', music_id, 'https://images.unsplash.com/photo-1511379938547-c1f69419868d', 'https://github.com/myshell-ai/OpenVoice', true, true, 200000, 400000, 2500, 4.7);

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
    ('Weights & Biases', 'weights-and-biases', 'Plateforme MLOps pour le suivi d''expériences', data_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://wandb.ai', true, true, 300000, 600000, 4000, 4.8),
    ('Neptune.ai', 'neptune-ai', 'Gestion des métadonnées pour le ML', data_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://neptune.ai', true, false, 200000, 400000, 2500, 4.7),
    ('ClearML', 'clearml', 'Plateforme MLOps open source', data_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://clear.ml', true, false, 150000, 300000, 2000, 4.6);

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
    ('Vall-E X', 'vall-e-x', 'Synthèse vocale multilingue par Microsoft', voice_id, 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618', 'https://www.microsoft.com/research', true, true, 400000, 800000, 5000, 4.8),
    ('MyShell', 'myshell', 'Assistant vocal IA personnalisable', voice_id, 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618', 'https://myshell.ai', true, false, 250000, 500000, 3000, 4.7),
    ('Voicebox', 'voicebox', 'Synthèse vocale générative par Meta', voice_id, 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618', 'https://voicebox.metademolab.com', true, true, 300000, 600000, 3500, 4.7);

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
    ('Salesforce Einstein', 'salesforce-einstein', 'IA intégrée à la plateforme Salesforce', business_id, 'https://images.unsplash.com/photo-1460925895917-afdab827c52f', 'https://www.salesforce.com/products/einstein/overview', true, true, 500000, 1000000, 6000, 4.8),
    ('HubSpot AI', 'hubspot-ai', 'Suite marketing automation avec IA', business_id, 'https://images.unsplash.com/photo-1460925895917-afdab827c52f', 'https://www.hubspot.com', true, true, 400000, 800000, 5000, 4.7),
    ('Drift AI', 'drift-ai', 'Plateforme de conversation marketing par IA', business_id, 'https://images.unsplash.com/photo-1460925895917-afdab827c52f', 'https://www.drift.com', true, false, 300000, 600000, 3500, 4.6);

  -- Éducation
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
    ('Pearson AI', 'pearson-ai', 'Solutions d''apprentissage personnalisé par IA', education_id, 'https://images.unsplash.com/photo-1546410531-bb4caa6b424d', 'https://www.pearson.com', true, true, 400000, 800000, 5000, 4.7),
    ('Carnegie Learning', 'carnegie-learning', 'Plateforme d''apprentissage adaptatif des mathématiques', education_id, 'https://images.unsplash.com/photo-1517842645767-c639042777db', 'https://www.carnegielearning.com', true, false, 300000, 600000, 3500, 4.6),
    ('Third Space Learning', 'third-space-learning', 'Tutorat en mathématiques assisté par IA', education_id, 'https://images.unsplash.com/photo-1546410531-bb4caa6b424d', 'https://thirdspacelearning.com', true, false, 200000, 400000, 2500, 4.5);

  -- Vidéo & Animation
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
    ('Stable Video', 'stable-video', 'Génération de vidéos par Stability AI', video_id, 'https://images.unsplash.com/photo-1536240478700-b869070f9279', 'https://stability.ai', true, true, 350000, 700000, 4500, 4.8),
    ('Phenaki', 'phenaki', 'Génération de vidéos longue durée par Google', video_id, 'https://images.unsplash.com/photo-1536240478700-b869070f9279', 'https://google-research.github.io/phenaki', true, false, 250000, 500000, 3000, 4.7),
    ('Wonder Studio', 'wonder-studio', 'Studio virtuel pour la création de vidéos', video_id, 'https://images.unsplash.com/photo-1536240478700-b869070f9279', 'https://wonderdynamics.com', true, true, 300000, 600000, 3500, 4.7);

  -- Rédaction & Contenu
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
    ('Anthropic Claude Pro', 'anthropic-claude-pro', 'Assistant d''écriture professionnel par Anthropic', redaction_id, 'https://images.unsplash.com/photo-1517842645767-c639042777db', 'https://claude.ai', true, true, 400000, 800000, 5000, 4.9),
    ('Grammarly Business', 'grammarly-business', 'Suite d''écriture IA pour entreprises', redaction_id, 'https://images.unsplash.com/photo-1517842645767-c639042777db', 'https://www.grammarly.com/business', true, true, 500000, 1000000, 6000, 4.8),
    ('Wordtune', 'wordtune', 'Assistant de réécriture et d''édition par IA', redaction_id, 'https://images.unsplash.com/photo-1517842645767-c639042777db', 'https://www.wordtune.com', true, false, 300000, 600000, 3500, 4.7);

  -- Ajouter les fonctionnalités
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Sécurité avancée', 'Protection contre les prompts malveillants'
  FROM ai_tools WHERE slug = 'llama-guard'
  UNION ALL
  SELECT id, 'Génération haute fidélité', 'Qualité studio professionnelle'
  FROM ai_tools WHERE slug = 'deepmind-musiclm'
  UNION ALL
  SELECT id, 'Suivi d''expériences', 'Tracking MLOps complet'
  FROM ai_tools WHERE slug = 'weights-and-biases'
  UNION ALL
  SELECT id, 'Synthèse multilingue', 'Support de nombreuses langues'
  FROM ai_tools WHERE slug = 'vall-e-x'
  UNION ALL
  SELECT id, 'Automatisation CRM', 'IA intégrée au CRM'
  FROM ai_tools WHERE slug = 'salesforce-einstein'
  UNION ALL
  SELECT id, 'Apprentissage adaptatif', 'Personnalisation du parcours'
  FROM ai_tools WHERE slug = 'pearson-ai'
  UNION ALL
  SELECT id, 'Génération longue durée', 'Vidéos jusqu''à 5 minutes'
  FROM ai_tools WHERE slug = 'stable-video'
  UNION ALL
  SELECT id, 'Réécriture contextuelle', 'Suggestions intelligentes'
  FROM ai_tools WHERE slug = 'wordtune';

  -- Ajouter les plans tarifaires
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Pro', 29, 'monthly', ARRAY['Protection avancée', 'API access']
  FROM ai_tools WHERE slug = 'llama-guard'
  UNION ALL
  SELECT id, 'Studio', 49, 'monthly', ARRAY['Génération illimitée', 'Export haute qualité']
  FROM ai_tools WHERE slug = 'deepmind-musiclm'
  UNION ALL
  SELECT id, 'Team', 119, 'monthly', ARRAY['Collaboration', 'Support dédié']
  FROM ai_tools WHERE slug = 'weights-and-biases'
  UNION ALL
  SELECT id, 'Enterprise', 499, 'monthly', ARRAY['Déploiement personnalisé', 'SLA garanti']
  FROM ai_tools WHERE slug = 'salesforce-einstein'
  UNION ALL
  SELECT id, 'Education', 299, 'monthly', ARRAY['Licence école', 'Formation']
  FROM ai_tools WHERE slug = 'pearson-ai'
  UNION ALL
  SELECT id, 'Creator', 39, 'monthly', ARRAY['Vidéos illimitées', 'Export 4K']
  FROM ai_tools WHERE slug = 'stable-video'
  UNION ALL
  SELECT id, 'Business', 29, 'monthly', ARRAY['Utilisateurs illimités', 'Style guide']
  FROM ai_tools WHERE slug = 'wordtune';

END $$;
