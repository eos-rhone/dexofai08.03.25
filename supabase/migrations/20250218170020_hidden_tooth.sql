/*
  # Ajout des derniers outils de génération d'images

  1. Nouveaux outils
    - Ajout des derniers outils de la liste
    - Vérification des doublons
    - Données enrichies pour chaque outil

  2. Données
    - URLs des sites web
    - Descriptions détaillées
    - Statistiques d'utilisation
*/

-- Récupérer l'ID de la catégorie "génération d'images"
DO $$ 
DECLARE
  category_id uuid;
BEGIN
  SELECT id INTO category_id FROM categories WHERE slug = 'generation-images';

  -- Insérer les nouveaux outils
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
    ('WebDiffusion', 'webdiffusion', 'Outil explorant le potentiel de l''IA générative pour le Web', category_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://arxiv.org/abs/2310.17370', true, false, 100000, 200000, 1200, 4.5),
    ('Grok', 'grok', 'Chatbot avec capacités de génération d''images par xAI', category_id, 'https://images.unsplash.com/photo-1519681393784-d120267933ba', 'https://x.com', true, true, 500000, 1000000, 6000, 4.7),
    ('Big Sleep', 'big-sleep', 'Outil combinant OpenAI CLIP et BigGAN pour la génération d''images', category_id, 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4', 'https://github.com/lucidrains/big-sleep', true, false, 80000, 160000, 1000, 4.4),
    ('GANPaint Studio', 'ganpaint-studio', 'Plateforme de modification d''images en temps réel avec GAN', category_id, 'https://images.unsplash.com/photo-1533158307587-828f0a76ef46', 'http://ganpaint.io', true, false, 120000, 240000, 1500, 4.6),
    ('Imagine AI Art', 'imagine-ai-art', 'Générateur d''œuvres d''art basé sur l''IA', category_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://www.imagineai.com', true, false, 150000, 300000, 1800, 4.5),
    ('Civitai', 'civitai', 'Plateforme communautaire de modèles et créations IA', category_id, 'https://images.unsplash.com/photo-1519681393784-d120267933ba', 'https://civitai.com', true, true, 400000, 800000, 5000, 4.8),
    ('Picsart', 'picsart', 'Application de retouche photo avec outils IA', category_id, 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4', 'https://picsart.com', true, true, 600000, 1200000, 8000, 4.7)
  ON CONFLICT (slug) DO NOTHING;

  -- Ajouter les fonctionnalités pour les nouveaux outils
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Génération web', 'Optimisé pour le web'
  FROM ai_tools WHERE slug = 'webdiffusion'
  UNION ALL
  SELECT id, 'Modèles communautaires', 'Partage de modèles IA'
  FROM ai_tools WHERE slug = 'civitai'
  UNION ALL
  SELECT id, 'Retouche avancée', 'Outils de retouche professionnels'
  FROM ai_tools WHERE slug = 'picsart'
  UNION ALL
  SELECT id, 'Modification temps réel', 'Édition en temps réel avec GAN'
  FROM ai_tools WHERE slug = 'ganpaint-studio';

  -- Ajouter les plans tarifaires
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Gratuit', 0, 'monthly', ARRAY['Fonctionnalités de base', 'Utilisation limitée']
  FROM ai_tools WHERE slug = 'webdiffusion'
  UNION ALL
  SELECT id, 'Pro', 19.99, 'monthly', ARRAY['Accès illimité', 'Fonctionnalités avancées']
  FROM ai_tools WHERE slug = 'civitai'
  UNION ALL
  SELECT id, 'Premium', 29.99, 'monthly', ARRAY['Outils professionnels', 'Support prioritaire']
  FROM ai_tools WHERE slug = 'picsart'
  UNION ALL
  SELECT id, 'Studio', 39.99, 'monthly', ARRAY['Toutes les fonctionnalités', 'Haute résolution', 'API access']
  FROM ai_tools WHERE slug = 'ganpaint-studio';

END $$;
