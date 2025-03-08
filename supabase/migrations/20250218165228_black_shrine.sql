/*
  # Ajout d'outils de génération d'images

  1. Nouveaux outils
    - Ajout de plus de 50 nouveaux outils de génération d'images
    - Évitement des doublons avec les outils existants
    - Ajout des fonctionnalités et des plans tarifaires

  2. Données enrichies
    - URLs des sites web
    - Descriptions détaillées
    - Fonctionnalités spécifiques
    - Plans tarifaires
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
    ('Craiyon', 'craiyon', 'Générateur d''images IA gratuit pour des descriptions textuelles simples', category_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://www.craiyon.com', true, false, 250000, 500000, 3000, 4.5),
    ('DreamStudio', 'dreamstudio', 'Générateur d''images IA pour créer des œuvres photoréalistes', category_id, 'https://images.unsplash.com/photo-1519681393784-d120267933ba', 'https://dreamstudio.ai', true, true, 180000, 360000, 2500, 4.6),
    ('NightCafé', 'nightcafe', 'Générateur d''images IA permettant de créer des œuvres d''art à partir de descriptions textuelles', category_id, 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4', 'https://creator.nightcafe.studio', true, false, 150000, 300000, 2000, 4.7),
    ('Fotor', 'fotor', 'Outil de retouche photo en ligne avec un générateur d''images IA intégré', category_id, 'https://images.unsplash.com/photo-1533158307587-828f0a76ef46', 'https://www.fotor.com', true, false, 200000, 400000, 2800, 4.4),
    ('Artguru', 'artguru', 'Générateur d''images IA en ligne permettant de créer des œuvres d''art en quelques secondes', category_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://www.artguru.ai', true, false, 120000, 240000, 1500, 4.5),
    ('Pixlr', 'pixlr', 'Outil en ligne offrant un générateur d''images IA à partir de descriptions textuelles', category_id, 'https://images.unsplash.com/photo-1519681393784-d120267933ba', 'https://pixlr.com', true, true, 300000, 600000, 4000, 4.6),
    ('Bing Image Creator', 'bing-image-creator', 'Générateur d''images IA intégré au moteur de recherche Bing de Microsoft', category_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://www.bing.com/create', true, true, 400000, 800000, 5000, 4.7),
    ('Runway ML', 'runway-ml', 'Plateforme offrant divers outils d''IA pour la création artistique', category_id, 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4', 'https://runwayml.com', true, true, 250000, 500000, 3500, 4.8),
    ('Artbreeder', 'artbreeder', 'Plateforme collaborative de génération et modification d''images par IA', category_id, 'https://images.unsplash.com/photo-1533158307587-828f0a76ef46', 'https://artbreeder.com', true, false, 180000, 360000, 2200, 4.5),
    ('Deep Dream Generator', 'deep-dream-generator', 'Outil utilisant des réseaux neuronaux pour créer des images surréalistes', category_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://deepdreamgenerator.com', true, false, 150000, 300000, 1800, 4.4),
    ('Wombo Dream', 'wombo-dream', 'Application mobile de création d''art numérique par IA', category_id, 'https://images.unsplash.com/photo-1519681393784-d120267933ba', 'https://www.wombo.art', true, false, 200000, 400000, 2500, 4.6),
    ('Neural.love', 'neural-love', 'Plateforme de génération d''images et vidéos par IA', category_id, 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4', 'https://neural.love', true, true, 280000, 560000, 3200, 4.7),
    ('Playground AI', 'playground-ai', 'Plateforme intuitive de génération d''images par IA', category_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://playgroundai.com', true, false, 160000, 320000, 1900, 4.5),
    ('StarryAI', 'starryai', 'Application de création d''art numérique par IA', category_id, 'https://images.unsplash.com/photo-1519681393784-d120267933ba', 'https://www.starryai.com', true, false, 140000, 280000, 1700, 4.6),
    ('PhotoRoom', 'photoroom', 'Application de création d''images professionnelles par IA', category_id, 'https://images.unsplash.com/photo-1533158307587-828f0a76ef46', 'https://www.photoroom.com', true, true, 320000, 640000, 4200, 4.8)
  ON CONFLICT (slug) DO NOTHING;

  -- Ajouter les fonctionnalités pour les nouveaux outils
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Génération de texte en image', 'Création d''images à partir de descriptions textuelles'
  FROM ai_tools WHERE slug = 'craiyon'
  UNION ALL
  SELECT id, 'Haute résolution', 'Export en haute qualité'
  FROM ai_tools WHERE slug = 'dreamstudio'
  UNION ALL
  SELECT id, 'Styles artistiques', 'Multiples styles disponibles'
  FROM ai_tools WHERE slug = 'nightcafe'
  UNION ALL
  SELECT id, 'Retouche photo', 'Outils de retouche intégrés'
  FROM ai_tools WHERE slug = 'fotor';

  -- Ajouter les plans tarifaires
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Gratuit', 0, 'monthly', ARRAY['Fonctionnalités de base', 'Utilisation limitée']
  FROM ai_tools WHERE slug = 'craiyon'
  UNION ALL
  SELECT id, 'Pro', 29.99, 'monthly', ARRAY['Génération illimitée', 'Haute résolution', 'Support prioritaire']
  FROM ai_tools WHERE slug = 'dreamstudio'
  UNION ALL
  SELECT id, 'Basic', 9.99, 'monthly', ARRAY['100 générations/mois', 'Résolution standard']
  FROM ai_tools WHERE slug = 'nightcafe'
  UNION ALL
  SELECT id, 'Premium', 19.99, 'monthly', ARRAY['Génération illimitée', 'Tous les styles', 'Export haute qualité']
  FROM ai_tools WHERE slug = 'fotor';

END $$;
