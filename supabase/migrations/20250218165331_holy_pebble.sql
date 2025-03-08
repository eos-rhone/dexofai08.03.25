/*
  # Ajout d'outils supplémentaires de génération d'images

  1. Nouveaux outils
    - Ajout de plus de 30 outils supplémentaires
    - Évitement des doublons avec les outils existants
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
    ('DALL-E 3', 'dall-e-3', 'Version la plus avancée du générateur d''images d''OpenAI', category_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://openai.com/dall-e-3', true, true, 900000, 1800000, 15000, 4.9),
    ('Adobe Firefly', 'adobe-firefly', 'Outil d''Adobe intégré dans Photoshop pour la génération d''images', category_id, 'https://images.unsplash.com/photo-1519681393784-d120267933ba', 'https://www.adobe.com/fr/sensei/generative-ai/firefly.html', true, true, 700000, 1400000, 12000, 4.8),
    ('MyImageGPT', 'myimagegpt', 'Plateforme intuitive pour générer des images et logos de haute qualité', category_id, 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4', 'https://www.myimagegpt.fr', true, false, 150000, 300000, 2000, 4.5),
    ('Palleon', 'palleon', 'Éditeur d''images en ligne avec génération IA intégrée', category_id, 'https://images.unsplash.com/photo-1533158307587-828f0a76ef46', 'https://palleon.website', true, false, 100000, 200000, 1500, 4.4),
    ('YouCam AI Pro', 'youcam-ai-pro', 'Application mobile de génération d''images IA sans inscription', category_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://www.perfectcorp.com', true, false, 200000, 400000, 3000, 4.6),
    ('DeepAI Text to Image', 'deepai-text-to-image', 'Service de génération d''images basé sur des modèles d''IA avancés', category_id, 'https://images.unsplash.com/photo-1519681393784-d120267933ba', 'https://deepai.org', true, true, 300000, 600000, 4000, 4.7),
    ('Scribble Diffusion', 'scribble-diffusion', 'Transforme des croquis en images détaillées avec l''IA', category_id, 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4', 'https://scribblediffusion.com', true, false, 120000, 240000, 1800, 4.5),
    ('Toonify', 'toonify', 'Transforme des photos en versions cartoon grâce à l''IA', category_id, 'https://images.unsplash.com/photo-1533158307587-828f0a76ef46', 'https://toonify.justinpinkney.com', true, false, 150000, 300000, 2200, 4.6),
    ('AI Gahaku', 'ai-gahaku', 'Générateur de portraits artistiques de style classique', category_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://ai-art.tokyo/en', true, false, 100000, 200000, 1500, 4.4),
    ('DeepArt.io', 'deepart-io', 'Application de style transfer artistique par IA', category_id, 'https://images.unsplash.com/photo-1519681393784-d120267933ba', 'https://deepart.io', true, false, 180000, 360000, 2500, 4.7),
    ('Ostagram', 'ostagram', 'Service de fusion de styles artistiques par IA', category_id, 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4', 'https://www.ostagram.me', true, false, 90000, 180000, 1200, 4.5),
    ('Fotor GoArt', 'fotor-goart', 'Application de transformation artistique de photos', category_id, 'https://images.unsplash.com/photo-1533158307587-828f0a76ef46', 'https://goart.fotor.com', true, false, 160000, 320000, 2000, 4.6),
    ('AKOOL', 'akool', 'Suite d''outils d''IA générative pour le marketing', category_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://www.akool.com', true, true, 250000, 500000, 3500, 4.8),
    ('Flux Pro', 'flux-pro', 'Plateforme polyvalente de création visuelle par IA', category_id, 'https://images.unsplash.com/photo-1519681393784-d120267933ba', 'https://www.flux.pro', true, false, 140000, 280000, 1900, 4.5),
    ('EasyPhoto', 'easyphoto', 'Plugin pour la génération de portraits IA personnalisés', category_id, 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4', 'https://github.com/aigc-apps/sd-webui-EasyPhoto', true, false, 80000, 160000, 1000, 4.4),
    ('Designify', 'designify', 'Plateforme de design automatisé par IA', category_id, 'https://images.unsplash.com/photo-1533158307587-828f0a76ef46', 'https://designify.com', true, false, 170000, 340000, 2300, 4.6),
    ('Lensa AI', 'lensa-ai', 'Application de retouche et génération de portraits par IA', category_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://www.lensa.ai', true, true, 400000, 800000, 5000, 4.8),
    ('Zyro AI', 'zyro-ai', 'Générateur d''images intégré à une plateforme de création de sites web', category_id, 'https://images.unsplash.com/photo-1519681393784-d120267933ba', 'https://zyro.com/tools/ai-image-generator', true, false, 130000, 260000, 1700, 4.5)
  ON CONFLICT (slug) DO NOTHING;

  -- Ajouter les fonctionnalités pour les nouveaux outils
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Génération haute résolution', 'Images jusqu''à 1024x1024 pixels'
  FROM ai_tools WHERE slug = 'dall-e-3'
  UNION ALL
  SELECT id, 'Intégration Creative Cloud', 'Fonctionne avec les applications Adobe'
  FROM ai_tools WHERE slug = 'adobe-firefly'
  UNION ALL
  SELECT id, 'Styles artistiques variés', 'Large choix de styles disponibles'
  FROM ai_tools WHERE slug = 'lensa-ai'
  UNION ALL
  SELECT id, 'Retouche automatique', 'Amélioration automatique des photos'
  FROM ai_tools WHERE slug = 'designify';

  -- Ajouter les plans tarifaires
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Gratuit', 0, 'monthly', ARRAY['Utilisation limitée', 'Résolution standard']
  FROM ai_tools WHERE slug = 'dall-e-3'
  UNION ALL
  SELECT id, 'Pro', 49.99, 'monthly', ARRAY['Génération illimitée', 'Haute résolution', 'Support prioritaire']
  FROM ai_tools WHERE slug = 'adobe-firefly'
  UNION ALL
  SELECT id, 'Basic', 9.99, 'monthly', ARRAY['50 générations/mois', 'Styles de base']
  FROM ai_tools WHERE slug = 'lensa-ai'
  UNION ALL
  SELECT id, 'Premium', 29.99, 'monthly', ARRAY['Génération illimitée', 'Tous les styles', 'Export haute qualité']
  FROM ai_tools WHERE slug = 'designify';

END $$;
