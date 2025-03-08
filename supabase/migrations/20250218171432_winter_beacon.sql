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
    ('Mixtral 8x7B', 'mixtral-8x7b', 'Modèle de langage open source par Mistral AI', assistants_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://mistral.ai', true, true, 700000, 1400000, 9000, 4.8),
    ('Falcon 180B', 'falcon-180b', 'LLM open source par TII', assistants_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://falconllm.tii.ae', true, false, 400000, 800000, 5000, 4.7),
    ('Yi 34B', 'yi-34b', 'Modèle de langage multilingue par 01.AI', assistants_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://01.ai', true, false, 300000, 600000, 4000, 4.6);

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
    ('Deinfluencer', 'deinfluencer', 'Création de musique par IA sans droits d''auteur', music_id, 'https://images.unsplash.com/photo-1511379938547-c1f69419868d', 'https://www.deinfluencer.ai', true, true, 200000, 400000, 2500, 4.7),
    ('Moises Pro', 'moises-pro', 'Séparation de pistes et remixage par IA', music_id, 'https://images.unsplash.com/photo-1507838153414-b4b713384a76', 'https://moises.ai', true, false, 150000, 300000, 2000, 4.6),
    ('AudioShake', 'audioshake', 'Séparation de stems pour l''industrie musicale', music_id, 'https://images.unsplash.com/photo-1511379938547-c1f69419868d', 'https://www.audioshake.ai', true, true, 180000, 360000, 2200, 4.7);

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
    ('Deepnote', 'deepnote', 'Notebooks collaboratifs avec IA intégrée', data_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://deepnote.com', true, true, 250000, 500000, 3000, 4.8),
    ('Hex', 'hex', 'Plateforme d''analyse de données avec IA', data_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://hex.tech', true, false, 180000, 360000, 2200, 4.7),
    ('Modal', 'modal', 'Infrastructure cloud pour le ML et l''IA', data_id, 'https://images.unsplash.com/photo-1551288049-bebda4e38f71', 'https://modal.com', true, true, 200000, 400000, 2500, 4.8);

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
    ('Coqui Direct', 'coqui-direct', 'Synthèse vocale en temps réel', voice_id, 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618', 'https://coqui.ai', true, true, 300000, 600000, 4000, 4.8),
    ('Respeecher', 'respeecher', 'Clonage vocal pour l''industrie du cinéma', voice_id, 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618', 'https://respeecher.com', true, false, 150000, 300000, 2000, 4.7),
    ('Uberduck', 'uberduck', 'Plateforme de voix synthétique pour créateurs', voice_id, 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618', 'https://uberduck.ai', true, false, 120000, 240000, 1500, 4.6);

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
    ('Intercom AI', 'intercom-ai', 'Service client automatisé par IA', business_id, 'https://images.unsplash.com/photo-1460925895917-afdab827c52f', 'https://www.intercom.com', true, true, 400000, 800000, 5000, 4.8),
    ('Zendesk AI', 'zendesk-ai', 'Support client intelligent', business_id, 'https://images.unsplash.com/photo-1460925895917-afdab827c52f', 'https://www.zendesk.com', true, true, 350000, 700000, 4500, 4.7),
    ('Front AI', 'front-ai', 'Gestion de la relation client par IA', business_id, 'https://images.unsplash.com/photo-1460925895917-afdab827c52f', 'https://front.com', true, false, 200000, 400000, 2500, 4.6);

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
    ('Knowunity', 'knowunity', 'Plateforme d''apprentissage social avec IA', education_id, 'https://images.unsplash.com/photo-1546410531-bb4caa6b424d', 'https://www.knowunity.de', true, true, 300000, 600000, 4000, 4.7),
    ('Querium', 'querium', 'Tutorat personnalisé en STEM', education_id, 'https://images.unsplash.com/photo-1517842645767-c639042777db', 'https://querium.com', true, false, 150000, 300000, 2000, 4.6),
    ('Knewton', 'knewton', 'Apprentissage adaptatif pour l''enseignement supérieur', education_id, 'https://images.unsplash.com/photo-1546410531-bb4caa6b424d', 'https://www.knewton.com', true, false, 180000, 360000, 2200, 4.5);

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
    ('Lumiere', 'lumiere', 'Génération de vidéos par Google DeepMind', video_id, 'https://images.unsplash.com/photo-1536240478700-b869070f9279', 'https://deepmind.google/technologies/lumiere', true, true, 400000, 800000, 5000, 4.9),
    ('Gen-2', 'gen-2', 'Création de vidéos à partir de texte par Runway', video_id, 'https://images.unsplash.com/photo-1536240478700-b869070f9279', 'https://research.runwayml.com/gen2', true, true, 350000, 700000, 4500, 4.8),
    ('Stability Video', 'stability-video', 'Génération de vidéos par Stability AI', video_id, 'https://images.unsplash.com/photo-1536240478700-b869070f9279', 'https://stability.ai', true, false, 250000, 500000, 3000, 4.7);

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
    ('Typeface', 'typeface', 'Plateforme de création de contenu pour les marques', redaction_id, 'https://images.unsplash.com/photo-1517842645767-c639042777db', 'https://typeface.ai', true, true, 300000, 600000, 4000, 4.8),
    ('Tome', 'tome', 'Création de présentations par IA', redaction_id, 'https://images.unsplash.com/photo-1517842645767-c639042777db', 'https://tome.app', true, true, 250000, 500000, 3500, 4.7),
    ('Gamma', 'gamma', 'Présentations et documents générés par IA', redaction_id, 'https://images.unsplash.com/photo-1517842645767-c639042777db', 'https://gamma.app', true, false, 200000, 400000, 2500, 4.6);

  -- Ajouter les fonctionnalités
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Modèle multilingue', 'Support de plus de 100 langues'
  FROM ai_tools WHERE slug = 'mixtral-8x7b'
  UNION ALL
  SELECT id, 'Séparation de stems', 'Isolation des instruments'
  FROM ai_tools WHERE slug = 'moises-pro'
  UNION ALL
  SELECT id, 'Notebooks collaboratifs', 'Travail d''équipe en temps réel'
  FROM ai_tools WHERE slug = 'deepnote'
  UNION ALL
  SELECT id, 'Synthèse temps réel', 'Génération vocale instantanée'
  FROM ai_tools WHERE slug = 'coqui-direct'
  UNION ALL
  SELECT id, 'Support automatisé', 'Réponses IA 24/7'
  FROM ai_tools WHERE slug = 'intercom-ai'
  UNION ALL
  SELECT id, 'Apprentissage social', 'Collaboration entre étudiants'
  FROM ai_tools WHERE slug = 'knowunity'
  UNION ALL
  SELECT id, 'Génération 4K', 'Vidéos haute résolution'
  FROM ai_tools WHERE slug = 'lumiere'
  UNION ALL
  SELECT id, 'Marque cohérente', 'Respect des guidelines'
  FROM ai_tools WHERE slug = 'typeface';

  -- Ajouter les plans tarifaires
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Pro', 29.99, 'monthly', ARRAY['API illimitée', 'Support prioritaire']
  FROM ai_tools WHERE slug = 'mixtral-8x7b'
  UNION ALL
  SELECT id, 'Studio', 19.99, 'monthly', ARRAY['Séparation illimitée', 'Export haute qualité']
  FROM ai_tools WHERE slug = 'moises-pro'
  UNION ALL
  SELECT id, 'Team', 49, 'monthly', ARRAY['Collaboration illimitée', 'Intégrations avancées']
  FROM ai_tools WHERE slug = 'deepnote'
  UNION ALL
  SELECT id, 'Business', 99, 'monthly', ARRAY['Voix personnalisées', 'API access']
  FROM ai_tools WHERE slug = 'coqui-direct'
  UNION ALL
  SELECT id, 'Growth', 499, 'monthly', ARRAY['Agents illimités', 'Analytics avancés']
  FROM ai_tools WHERE slug = 'intercom-ai'
  UNION ALL
  SELECT id, 'School', 299, 'monthly', ARRAY['Licence établissement', 'Support dédié']
  FROM ai_tools WHERE slug = 'knowunity'
  UNION ALL
  SELECT id, 'Creator', 39, 'monthly', ARRAY['Génération illimitée', 'Export 4K']
  FROM ai_tools WHERE slug = 'lumiere'
  UNION ALL
  SELECT id, 'Enterprise', 499, 'monthly', ARRAY['Marque personnalisée', 'Workflows avancés']
  FROM ai_tools WHERE slug = 'typeface';

END $$;
