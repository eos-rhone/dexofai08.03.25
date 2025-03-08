/*
  # Ajout des derniers outils de génération d'images

  1. Nouveaux outils
    - Ajout des outils restants de la liste
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
    ('PaintsChainer', 'paintschainer', 'Outil de colorisation automatique de dessins en noir et blanc', category_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://paintschainer.preferred.tech', true, false, 120000, 240000, 1500, 4.5),
    ('AI Picasso', 'ai-picasso', 'Générateur d''art numérique basé sur l''IA', category_id, 'https://images.unsplash.com/photo-1519681393784-d120267933ba', 'https://aipicasso.com', true, false, 150000, 300000, 2000, 4.6),
    ('VQGAN+CLIP', 'vqgan-clip', 'Outil avancé de génération d''images combinant VQGAN et CLIP', category_id, 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4', 'https://colab.research.google.com/drive/1-2XZt5SHx3wDp4i-Jm3yyCz7IN9pgt84', true, true, 200000, 400000, 2500, 4.7),
    ('Artflow', 'artflow', 'Plateforme de création artistique assistée par IA', category_id, 'https://images.unsplash.com/photo-1533158307587-828f0a76ef46', 'https://www.artflow.ai', true, false, 180000, 360000, 2200, 4.6),
    ('This Person Does Not Exist', 'this-person-does-not-exist', 'Générateur de visages humains réalistes par IA', category_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://thispersondoesnotexist.com', true, true, 300000, 600000, 4000, 4.8),
    ('Photopea', 'photopea', 'Éditeur photo en ligne avec fonctionnalités IA', category_id, 'https://images.unsplash.com/photo-1519681393784-d120267933ba', 'https://www.photopea.com', true, false, 250000, 500000, 3000, 4.7),
    ('123RF AI', '123rf-ai', 'Générateur d''images IA intégré à la banque d''images', category_id, 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4', 'https://www.123rf.com', true, false, 160000, 320000, 1800, 4.5),
    ('Monica', 'monica', 'Générateur de portraits réalistes par IA', category_id, 'https://images.unsplash.com/photo-1533158307587-828f0a76ef46', 'https://monica.im', true, false, 140000, 280000, 1600, 4.6),
    ('Lexica', 'lexica', 'Moteur de recherche et générateur d''images IA', category_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://lexica.art', true, true, 220000, 440000, 2800, 4.7),
    ('VEED.IO', 'veed-io', 'Plateforme de création vidéo avec génération d''images IA', category_id, 'https://images.unsplash.com/photo-1519681393784-d120267933ba', 'https://www.veed.io', true, false, 190000, 380000, 2400, 4.6),
    ('PowerDirector', 'powerdirector', 'Logiciel de montage vidéo avec outils de création d''images IA', category_id, 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4', 'https://www.cyberlink.com/products/powerdirector', true, false, 170000, 340000, 2100, 4.5),
    ('PhotoDirector', 'photodirector', 'Logiciel de retouche photo avec génération d''images IA', category_id, 'https://images.unsplash.com/photo-1533158307587-828f0a76ef46', 'https://www.cyberlink.com/products/photodirector', true, false, 150000, 300000, 1900, 4.6),
    ('Vivid AI', 'vivid-ai', 'Application de création d''images artistiques par IA', category_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://vivid-ai.com', true, false, 130000, 260000, 1700, 4.5),
    ('Freepik AI', 'freepik-ai', 'Générateur d''images IA intégré à la plateforme Freepik', category_id, 'https://images.unsplash.com/photo-1519681393784-d120267933ba', 'https://www.freepik.com', true, true, 280000, 560000, 3500, 4.7),
    ('BgRem', 'bgrem', 'Outil de suppression et génération d''arrière-plans par IA', category_id, 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4', 'https://www.bgrem.com', true, false, 140000, 280000, 1800, 4.5)
  ON CONFLICT (slug) DO NOTHING;

  -- Ajouter les fonctionnalités pour les nouveaux outils
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Colorisation automatique', 'Coloration intelligente de dessins'
  FROM ai_tools WHERE slug = 'paintschainer'
  UNION ALL
  SELECT id, 'Génération de visages', 'Création de visages photoréalistes'
  FROM ai_tools WHERE slug = 'this-person-does-not-exist'
  UNION ALL
  SELECT id, 'Recherche visuelle', 'Recherche d''images similaires'
  FROM ai_tools WHERE slug = 'lexica'
  UNION ALL
  SELECT id, 'Suppression d''arrière-plan', 'Détection et suppression automatique'
  FROM ai_tools WHERE slug = 'bgrem';

  -- Ajouter les plans tarifaires
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Gratuit', 0, 'monthly', ARRAY['Utilisation de base', 'Qualité standard']
  FROM ai_tools WHERE slug = 'paintschainer'
  UNION ALL
  SELECT id, 'Pro', 19.99, 'monthly', ARRAY['Génération illimitée', 'Export haute qualité']
  FROM ai_tools WHERE slug = 'ai-picasso'
  UNION ALL
  SELECT id, 'Basic', 9.99, 'monthly', ARRAY['100 générations/mois', 'Résolution standard']
  FROM ai_tools WHERE slug = 'lexica'
  UNION ALL
  SELECT id, 'Premium', 29.99, 'monthly', ARRAY['Utilisation illimitée', 'Tous les outils', 'Support prioritaire']
  FROM ai_tools WHERE slug = 'bgrem';

END $$;
