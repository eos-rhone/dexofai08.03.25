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
    ('Perplexity AI', 'perplexity-ai', 'Assistant de recherche IA avec sources vérifiées', assistants_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://www.perplexity.ai', true, true, 800000, 1600000, 12000, 4.8),
    ('Poe', 'poe', 'Plateforme d''accès à différents modèles de langage', assistants_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://poe.com', true, false, 400000, 800000, 6000, 4.6),
    ('YouChat', 'youchat', 'Assistant IA intégré au moteur de recherche You.com', assistants_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://you.com', true, false, 300000, 600000, 4500, 4.5);

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
    ('Stable Audio', 'stable-audio', 'Génération de musique par Stability AI', music_id, 'https://images.unsplash.com/photo-1511379938547-c1f69419868d', 'https://www.stability.ai/stable-audio', true, true, 200000, 400000, 3000, 4.7),
    ('Boomy', 'boomy', 'Création de musique en quelques clics', music_id, 'https://images.unsplash.com/photo-1507838153414-b4b713384a76', 'https://boomy.com', true, false, 150000, 300000, 2200, 4.5),
    ('Beatoven.ai', 'beatoven-ai', 'Musique personnalisée pour les créateurs de contenu', music_id, 'https://images.unsplash.com/photo-1511379938547-c1f69419868d', 'https://www.beatoven.ai', true, false, 100000, 200000, 1500, 4.6);

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
    ('Akkio', 'akkio', 'Plateforme no-code d''IA pour l''analyse prédictive', data_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://www.akkio.com', true, true, 150000, 300000, 2000, 4.7),
    ('Abacus.AI', 'abacus-ai', 'AutoML et déploiement de modèles d''IA', data_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://abacus.ai', true, false, 100000, 200000, 1500, 4.6),
    ('Apteo', 'apteo', 'Prévisions et insights automatisés pour les entreprises', data_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://www.apteo.co', true, false, 80000, 160000, 1200, 4.5);

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
    ('Resemble AI', 'resemble-ai', 'Clonage vocal et synthèse vocale personnalisée', voice_id, 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618', 'https://www.resemble.ai', true, true, 200000, 400000, 3000, 4.8),
    ('Play.ht', 'play-ht', 'Génération de voix-off réalistes pour les créateurs', voice_id, 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618', 'https://play.ht', true, false, 150000, 300000, 2200, 4.6),
    ('Coqui', 'coqui', 'Synthèse vocale open-source de haute qualité', voice_id, 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618', 'https://coqui.ai', true, false, 100000, 200000, 1500, 4.5);

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
    ('Typeform GPT', 'typeform-gpt', 'Création de formulaires intelligents avec l''IA', business_id, 'https://images.unsplash.com/photo-1460925895917-afdab827c52f', 'https://www.typeform.com', true, true, 300000, 600000, 4500, 4.7),
    ('Synthesia', 'synthesia', 'Création de vidéos marketing avec présentateurs virtuels', business_id, 'https://images.unsplash.com/photo-1460925895917-afdab827c52f', 'https://www.synthesia.io', true, true, 250000, 500000, 3800, 4.8),
    ('Lately', 'lately', 'Automatisation du marketing de contenu par IA', business_id, 'https://images.unsplash.com/photo-1460925895917-afdab827c52f', 'https://www.lately.ai', true, false, 150000, 300000, 2200, 4.6);

  -- Ajouter les fonctionnalités
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Recherche en temps réel', 'Recherche avec sources vérifiées'
  FROM ai_tools WHERE slug = 'perplexity-ai'
  UNION ALL
  SELECT id, 'Génération haute fidélité', 'Musique de qualité professionnelle'
  FROM ai_tools WHERE slug = 'stable-audio'
  UNION ALL
  SELECT id, 'AutoML', 'Apprentissage automatique sans code'
  FROM ai_tools WHERE slug = 'akkio'
  UNION ALL
  SELECT id, 'Clonage vocal', 'Reproduction fidèle de voix'
  FROM ai_tools WHERE slug = 'resemble-ai'
  UNION ALL
  SELECT id, 'Vidéos IA', 'Création de vidéos avec avatars virtuels'
  FROM ai_tools WHERE slug = 'synthesia';

  -- Ajouter les plans tarifaires
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Gratuit', 0, 'monthly', ARRAY['5 recherches/jour', 'Fonctionnalités de base']
  FROM ai_tools WHERE slug = 'perplexity-ai'
  UNION ALL
  SELECT id, 'Pro', 20, 'monthly', ARRAY['Recherches illimitées', 'Sources détaillées']
  FROM ai_tools WHERE slug = 'perplexity-ai'
  UNION ALL
  SELECT id, 'Starter', 29, 'monthly', ARRAY['100 minutes/mois', 'Export MP3']
  FROM ai_tools WHERE slug = 'stable-audio'
  UNION ALL
  SELECT id, 'Pro', 99, 'monthly', ARRAY['1000 minutes/mois', 'Haute qualité']
  FROM ai_tools WHERE slug = 'stable-audio'
  UNION ALL
  SELECT id, 'Business', 299, 'monthly', ARRAY['Usage illimité', 'Support prioritaire']
  FROM ai_tools WHERE slug = 'akkio'
  UNION ALL
  SELECT id, 'Starter', 29, 'monthly', ARRAY['100 minutes/mois', 'Voix standard']
  FROM ai_tools WHERE slug = 'resemble-ai'
  UNION ALL
  SELECT id, 'Business', 199, 'monthly', ARRAY['10 vidéos/mois', '30 langues']
  FROM ai_tools WHERE slug = 'synthesia';

END $$;
