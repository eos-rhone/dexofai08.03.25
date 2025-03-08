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
    ('Anthropic Claude 3', 'anthropic-claude-3', 'Dernière version de l''assistant IA d''Anthropic avec capacités multimodales avancées', assistants_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://claude.ai', true, true, 900000, 1800000, 15000, 4.9),
    ('Mistral Large', 'mistral-large', 'Modèle de langage open source haute performance', assistants_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://mistral.ai', true, true, 500000, 1000000, 7000, 4.8),
    ('Gemini Ultra', 'gemini-ultra', 'Assistant IA multimodal de Google avec compréhension avancée', assistants_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://gemini.google.com', true, true, 800000, 1600000, 12000, 4.8);

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
    ('AudioCraft', 'audiocraft', 'Suite d''outils Meta pour la génération audio et musicale', music_id, 'https://images.unsplash.com/photo-1511379938547-c1f69419868d', 'https://github.com/facebookresearch/audiocraft', true, true, 250000, 500000, 3500, 4.7),
    ('MusicGen', 'musicgen', 'Modèle de génération musicale haute fidélité', music_id, 'https://images.unsplash.com/photo-1507838153414-b4b713384a76', 'https://huggingface.co/facebook/musicgen-large', true, false, 180000, 360000, 2500, 4.6),
    ('Stable Audio XL', 'stable-audio-xl', 'Version améliorée du générateur de musique de Stability AI', music_id, 'https://images.unsplash.com/photo-1511379938547-c1f69419868d', 'https://stability.ai/stable-audio', true, true, 300000, 600000, 4000, 4.8);

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
    ('Vertex AI', 'vertex-ai', 'Plateforme unifiée d''IA/ML de Google Cloud', data_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://cloud.google.com/vertex-ai', true, true, 400000, 800000, 5000, 4.8),
    ('Amazon SageMaker', 'amazon-sagemaker', 'Service ML complet d''AWS', data_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://aws.amazon.com/sagemaker', true, true, 500000, 1000000, 6000, 4.7),
    ('Azure Machine Learning', 'azure-machine-learning', 'Plateforme ML de Microsoft Azure', data_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://azure.microsoft.com/products/machine-learning', true, true, 450000, 900000, 5500, 4.7);

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
    ('Whisper V3', 'whisper-v3', 'Système de reconnaissance vocale multilingue d''OpenAI', voice_id, 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618', 'https://openai.com/research/whisper', true, true, 600000, 1200000, 8000, 4.9),
    ('Coqui XTTS', 'coqui-xtts', 'Synthèse vocale multilingue de haute qualité', voice_id, 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618', 'https://coqui.ai', true, false, 200000, 400000, 3000, 4.7),
    ('Bark', 'bark', 'Générateur de voix et d''effets sonores par Suno', voice_id, 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618', 'https://github.com/suno-ai/bark', true, true, 350000, 700000, 4500, 4.8);

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
    ('Klaviyo AI', 'klaviyo-ai', 'Marketing automation avec IA pour l''e-commerce', business_id, 'https://images.unsplash.com/photo-1460925895917-afdab827c52f', 'https://www.klaviyo.com', true, true, 400000, 800000, 5000, 4.8),
    ('Optimizely', 'optimizely', 'Plateforme d''expérimentation et personnalisation par IA', business_id, 'https://images.unsplash.com/photo-1460925895917-afdab827c52f', 'https://www.optimizely.com', true, true, 350000, 700000, 4500, 4.7),
    ('Mailchimp AI', 'mailchimp-ai', 'Suite marketing avec fonctionnalités IA intégrées', business_id, 'https://images.unsplash.com/photo-1460925895917-afdab827c52f', 'https://mailchimp.com', true, true, 600000, 1200000, 7000, 4.8);

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
    ('Khan Academy GPT', 'khan-academy-gpt', 'Tuteur IA personnalisé pour l''apprentissage', education_id, 'https://images.unsplash.com/photo-1546410531-bb4caa6b424d', 'https://www.khanacademy.org', true, true, 800000, 1600000, 10000, 4.9),
    ('Gradescope', 'gradescope', 'Correction automatisée de copies par IA', education_id, 'https://images.unsplash.com/photo-1517842645767-c639042777db', 'https://www.gradescope.com', true, false, 300000, 600000, 4000, 4.7),
    ('Century Tech', 'century-tech', 'Plateforme d''apprentissage adaptatif par IA', education_id, 'https://images.unsplash.com/photo-1546410531-bb4caa6b424d', 'https://www.century.tech', true, false, 250000, 500000, 3500, 4.6);

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
    ('Runway Gen-2', 'runway-gen-2', 'Génération de vidéos à partir de texte', video_id, 'https://images.unsplash.com/photo-1536240478700-b869070f9279', 'https://runway.ml', true, true, 400000, 800000, 5000, 4.8),
    ('Pika Labs', 'pika-labs', 'Création de vidéos et animations par IA', video_id, 'https://images.unsplash.com/photo-1536240478700-b869070f9279', 'https://pika.art', true, true, 300000, 600000, 4000, 4.7),
    ('D-ID', 'd-id', 'Création d''avatars vidéo photoréalistes', video_id, 'https://images.unsplash.com/photo-1536240478700-b869070f9279', 'https://www.d-id.com', true, false, 250000, 500000, 3500, 4.6);

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
    ('Writer', 'writer', 'Plateforme d''IA pour la création de contenu d''entreprise', redaction_id, 'https://images.unsplash.com/photo-1517842645767-c639042777db', 'https://writer.com', true, true, 350000, 700000, 4500, 4.8),
    ('Writesonic', 'writesonic', 'Assistant d''écriture IA pour le marketing', redaction_id, 'https://images.unsplash.com/photo-1517842645767-c639042777db', 'https://writesonic.com', true, false, 250000, 500000, 3500, 4.7),
    ('Rytr', 'rytr', 'Outil de rédaction IA abordable et polyvalent', redaction_id, 'https://images.unsplash.com/photo-1517842645767-c639042777db', 'https://rytr.me', true, false, 200000, 400000, 3000, 4.6);

  -- Ajouter les fonctionnalités
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Multimodal avancé', 'Traitement de texte, images, audio et code'
  FROM ai_tools WHERE slug = 'anthropic-claude-3'
  UNION ALL
  SELECT id, 'Génération haute fidélité', 'Qualité studio professionnelle'
  FROM ai_tools WHERE slug = 'stable-audio-xl'
  UNION ALL
  SELECT id, 'AutoML', 'ML automatisé de bout en bout'
  FROM ai_tools WHERE slug = 'vertex-ai'
  UNION ALL
  SELECT id, 'Reconnaissance multilingue', 'Support de 100+ langues'
  FROM ai_tools WHERE slug = 'whisper-v3'
  UNION ALL
  SELECT id, 'Personnalisation IA', 'Marketing adaptatif'
  FROM ai_tools WHERE slug = 'klaviyo-ai'
  UNION ALL
  SELECT id, 'Tutorat personnalisé', 'Adaptation au niveau de l''élève'
  FROM ai_tools WHERE slug = 'khan-academy-gpt'
  UNION ALL
  SELECT id, 'Génération de vidéos', 'À partir de descriptions textuelles'
  FROM ai_tools WHERE slug = 'runway-gen-2'
  UNION ALL
  SELECT id, 'Style d''entreprise', 'Respect des guidelines'
  FROM ai_tools WHERE slug = 'writer';

  -- Ajouter les plans tarifaires
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Pro', 20, 'monthly', ARRAY['Accès complet', 'Support prioritaire']
  FROM ai_tools WHERE slug = 'anthropic-claude-3'
  UNION ALL
  SELECT id, 'Studio', 49, 'monthly', ARRAY['Génération illimitée', 'Qualité professionnelle']
  FROM ai_tools WHERE slug = 'stable-audio-xl'
  UNION ALL
  SELECT id, 'Enterprise', 999, 'monthly', ARRAY['Déploiement personnalisé', 'Support dédié']
  FROM ai_tools WHERE slug = 'vertex-ai'
  UNION ALL
  SELECT id, 'Business', 99, 'monthly', ARRAY['API illimitée', 'Support technique']
  FROM ai_tools WHERE slug = 'whisper-v3'
  UNION ALL
  SELECT id, 'Growth', 299, 'monthly', ARRAY['Automatisation avancée', 'Analytics']
  FROM ai_tools WHERE slug = 'klaviyo-ai'
  UNION ALL
  SELECT id, 'School', 499, 'monthly', ARRAY['Licence établissement', 'Formation']
  FROM ai_tools WHERE slug = 'khan-academy-gpt'
  UNION ALL
  SELECT id, 'Creator', 39, 'monthly', ARRAY['Génération illimitée', 'Export 4K']
  FROM ai_tools WHERE slug = 'runway-gen-2'
  UNION ALL
  SELECT id, 'Team', 79, 'monthly', ARRAY['Collaboration', 'Analytics avancés']
  FROM ai_tools WHERE slug = 'writer';

END $$;
