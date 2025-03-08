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
    ('DeepSeek', 'deepseek', 'Assistant IA spécialisé en code et recherche', assistants_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://deepseek.ai', true, true, 500000, 1000000, 6000, 4.8),
    ('Qwen', 'qwen', 'Assistant IA multilingue par Alibaba', assistants_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://qwen.aliyun.com', true, false, 300000, 600000, 4000, 4.7),
    ('Vicuna', 'vicuna', 'Assistant open source par LMSYS', assistants_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://lmsys.org/vicuna', true, false, 200000, 400000, 2500, 4.6);

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
    ('Harmonai Dance', 'harmonai-dance', 'Génération de musique électronique par IA', music_id, 'https://images.unsplash.com/photo-1511379938547-c1f69419868d', 'https://harmonai.org', true, true, 250000, 500000, 3000, 4.8),
    ('Songsmith', 'songsmith', 'Composition de chansons assistée par IA', music_id, 'https://images.unsplash.com/photo-1507838153414-b4b713384a76', 'https://songsmith.ai', true, false, 180000, 360000, 2200, 4.7),
    ('BeatBot', 'beatbot', 'Création de beats et rythmes par IA', music_id, 'https://images.unsplash.com/photo-1511379938547-c1f69419868d', 'https://beatbot.ai', true, false, 150000, 300000, 1800, 4.6);

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
    ('Gradient', 'gradient', 'Plateforme MLOps tout-en-un', data_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://gradient.ai', true, true, 300000, 600000, 4000, 4.8),
    ('Domino', 'domino', 'Enterprise MLOps et gouvernance', data_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://dominodatalab.com', true, false, 250000, 500000, 3000, 4.7),
    ('Valohai', 'valohai', 'MLOps pour équipes distribuées', data_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://valohai.com', true, false, 200000, 400000, 2500, 4.6);

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
    ('Xtreme Speech', 'xtreme-speech', 'Synthèse vocale multilingue avancée', voice_id, 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618', 'https://xtremespeech.ai', true, true, 350000, 700000, 4500, 4.8),
    ('VoxScript', 'voxscript', 'Création de voix-off pour vidéos', voice_id, 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618', 'https://voxscript.ai', true, false, 200000, 400000, 2500, 4.7),
    ('SpeakAI', 'speakai', 'Assistant vocal pour présentations', voice_id, 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618', 'https://speakai.com', true, false, 150000, 300000, 1800, 4.6);

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
    ('MarketMind', 'marketmind', 'Analyse de marché par IA', business_id, 'https://images.unsplash.com/photo-1460925895917-afdab827c52f', 'https://marketmind.ai', true, true, 400000, 800000, 5000, 4.8),
    ('AdGenius', 'adgenius', 'Optimisation de campagnes publicitaires', business_id, 'https://images.unsplash.com/photo-1460925895917-afdab827c52f', 'https://adgenius.ai', true, false, 300000, 600000, 3500, 4.7),
    ('SalesBot Pro', 'salesbot-pro', 'Assistant commercial automatisé', business_id, 'https://images.unsplash.com/photo-1460925895917-afdab827c52f', 'https://salesbot.pro', true, false, 250000, 500000, 3000, 4.6);

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
    ('EduMind', 'edumind', 'Tutorat personnalisé par IA', education_id, 'https://images.unsplash.com/photo-1546410531-bb4caa6b424d', 'https://edumind.ai', true, true, 350000, 700000, 4500, 4.8),
    ('LearningLab', 'learninglab', 'Laboratoire virtuel d''apprentissage', education_id, 'https://images.unsplash.com/photo-1517842645767-c639042777db', 'https://learninglab.ai', true, false, 250000, 500000, 3000, 4.7),
    ('StudyBot', 'studybot', 'Assistant d''études intelligent', education_id, 'https://images.unsplash.com/photo-1546410531-bb4caa6b424d', 'https://studybot.ai', true, false, 200000, 400000, 2500, 4.6);

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
    ('AnimateAI', 'animate-ai', 'Animation de personnages par IA', video_id, 'https://images.unsplash.com/photo-1536240478700-b869070f9279', 'https://animate.ai', true, true, 300000, 600000, 4000, 4.8),
    ('MotionLab', 'motionlab', 'Création de motion design', video_id, 'https://images.unsplash.com/photo-1536240478700-b869070f9279', 'https://motionlab.ai', true, false, 250000, 500000, 3000, 4.7),
    ('VideoGenius', 'videogenius', 'Montage vidéo automatisé', video_id, 'https://images.unsplash.com/photo-1536240478700-b869070f9279', 'https://videogenius.ai', true, false, 200000, 400000, 2500, 4.6);

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
    ('ContentForge', 'contentforge', 'Création de contenu multiformat', redaction_id, 'https://images.unsplash.com/photo-1517842645767-c639042777db', 'https://contentforge.ai', true, true, 350000, 700000, 4500, 4.8),
    ('BlogMaster', 'blogmaster', 'Assistant de rédaction de blogs', redaction_id, 'https://images.unsplash.com/photo-1517842645767-c639042777db', 'https://blogmaster.ai', true, false, 250000, 500000, 3000, 4.7),
    ('CopyPro', 'copypro', 'Rédaction publicitaire par IA', redaction_id, 'https://images.unsplash.com/photo-1517842645767-c639042777db', 'https://copypro.ai', true, false, 200000, 400000, 2500, 4.6);

  -- Ajouter les fonctionnalités
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Spécialisation code', 'Optimisé pour le développement'
  FROM ai_tools WHERE slug = 'deepseek'
  UNION ALL
  SELECT id, 'Génération EDM', 'Musique électronique'
  FROM ai_tools WHERE slug = 'harmonai-dance'
  UNION ALL
  SELECT id, 'MLOps complet', 'Gestion du cycle ML'
  FROM ai_tools WHERE slug = 'gradient'
  UNION ALL
  SELECT id, 'Voix multilingue', 'Support de nombreuses langues'
  FROM ai_tools WHERE slug = 'xtreme-speech'
  UNION ALL
  SELECT id, 'Analyse prédictive', 'Prévisions de marché'
  FROM ai_tools WHERE slug = 'marketmind'
  UNION ALL
  SELECT id, 'Tutorat adaptatif', 'Apprentissage personnalisé'
  FROM ai_tools WHERE slug = 'edumind'
  UNION ALL
  SELECT id, 'Animation 3D', 'Personnages et objets'
  FROM ai_tools WHERE slug = 'animate-ai'
  UNION ALL
  SELECT id, 'Contenu multiformat', 'Articles, posts, emails'
  FROM ai_tools WHERE slug = 'contentforge';

  -- Ajouter les plans tarifaires
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Pro', 29.99, 'monthly', ARRAY['Accès complet', 'Support prioritaire']
  FROM ai_tools WHERE slug = 'deepseek'
  UNION ALL
  SELECT id, 'Studio', 49.99, 'monthly', ARRAY['Génération illimitée', 'Export haute qualité']
  FROM ai_tools WHERE slug = 'harmonai-dance'
  UNION ALL
  SELECT id, 'Enterprise', 999, 'monthly', ARRAY['Déploiement personnalisé', 'Support dédié']
  FROM ai_tools WHERE slug = 'gradient'
  UNION ALL
  SELECT id, 'Business', 79.99, 'monthly', ARRAY['Voix illimitées', 'API access']
  FROM ai_tools WHERE slug = 'xtreme-speech'
  UNION ALL
  SELECT id, 'Growth', 199, 'monthly', ARRAY['Analyses avancées', 'Rapports personnalisés']
  FROM ai_tools WHERE slug = 'marketmind'
  UNION ALL
  SELECT id, 'School', 299, 'monthly', ARRAY['Licence établissement', 'Formation']
  FROM ai_tools WHERE slug = 'edumind'
  UNION ALL
  SELECT id, 'Creator', 39.99, 'monthly', ARRAY['Animation illimitée', 'Export 4K']
  FROM ai_tools WHERE slug = 'animate-ai'
  UNION ALL
  SELECT id, 'Agency', 149, 'monthly', ARRAY['Contenu illimité', 'Marque blanche']
  FROM ai_tools WHERE slug = 'contentforge';

END $$;
