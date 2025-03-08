-- Ajouter de nouvelles catégories
INSERT INTO categories (name, slug, description, icon) VALUES
('Réalité Mixte', 'realite-mixte', 'Solutions IA combinant AR, VR et réalité augmentée', 'Glasses'),
('Nanotechnologie', 'nanotechnologie', 'IA pour la recherche et le développement en nanotechnologie', 'Microscope'),
('Acoustique', 'acoustique', 'IA pour l''analyse et le traitement du son', 'Speaker'),
('Photographie', 'photographie', 'IA pour l''amélioration et le traitement photo', 'Camera'),
('Impression 3D', 'impression-3d', 'IA pour l''optimisation de l''impression 3D', 'Printer'),
('Logistique', 'logistique', 'Solutions IA pour la chaîne d''approvisionnement', 'Truck'),
('Télécommunications', 'telecommunications', 'IA pour les réseaux et communications', 'Radio'),
('Industrie 4.0', 'industrie-4-0', 'IA pour l''industrie intelligente', 'Factory')
ON CONFLICT (slug) DO NOTHING;

-- Ajouter des outils pour les nouvelles catégories
DO $$ 
DECLARE
  mixte_id uuid;
  nano_id uuid;
  acoustique_id uuid;
  photo_id uuid;
  print3d_id uuid;
  logistique_id uuid;
  telecom_id uuid;
  industrie_id uuid;
BEGIN
  -- Récupérer les IDs des nouvelles catégories
  SELECT id INTO mixte_id FROM categories WHERE slug = 'realite-mixte';
  SELECT id INTO nano_id FROM categories WHERE slug = 'nanotechnologie';
  SELECT id INTO acoustique_id FROM categories WHERE slug = 'acoustique';
  SELECT id INTO photo_id FROM categories WHERE slug = 'photographie';
  SELECT id INTO print3d_id FROM categories WHERE slug = 'impression-3d';
  SELECT id INTO logistique_id FROM categories WHERE slug = 'logistique';
  SELECT id INTO telecom_id FROM categories WHERE slug = 'telecommunications';
  SELECT id INTO industrie_id FROM categories WHERE slug = 'industrie-4-0';

  -- Insérer des outils pour chaque nouvelle catégorie
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
    -- Réalité Mixte
    ('HoloAI', 'holoai', 'Plateforme de développement pour la réalité mixte', mixte_id, 'https://images.unsplash.com/photo-1535223289827-42f1e9919769', 'https://holoai.dev', true, true, 300000, 600000, 4000, 4.8),
    ('MixedLab', 'mixedlab', 'Outils de création pour la réalité mixte', mixte_id, 'https://images.unsplash.com/photo-1535223289827-42f1e9919769', 'https://mixedlab.io', true, false, 200000, 400000, 2500, 4.7),
    
    -- Nanotechnologie
    ('NanoGPT', 'nanogpt', 'IA pour la conception de nanostructures', nano_id, 'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69', 'https://nanogpt.ai', true, true, 150000, 300000, 2000, 4.8),
    ('AtomicAI', 'atomic-ai', 'Simulation atomique par IA', nano_id, 'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69', 'https://atomicai.science', true, false, 100000, 200000, 1500, 4.7),
    
    -- Acoustique
    ('SoundAI Pro', 'soundai-pro', 'Traitement acoustique avancé par IA', acoustique_id, 'https://images.unsplash.com/photo-1511379938547-c1f69419868d', 'https://soundai.pro', true, true, 250000, 500000, 3000, 4.8),
    ('AcousticLab', 'acousticlab', 'Analyse acoustique intelligente', acoustique_id, 'https://images.unsplash.com/photo-1511379938547-c1f69419868d', 'https://acousticlab.ai', true, false, 180000, 360000, 2200, 4.7),
    
    -- Photographie
    ('PhotoGenius', 'photogenius', 'Amélioration automatique de photos', photo_id, 'https://images.unsplash.com/photo-1516035069371-29a1b244cc32', 'https://photogenius.ai', true, true, 400000, 800000, 5000, 4.9),
    ('LensAI', 'lensai', 'Assistant photographe intelligent', photo_id, 'https://images.unsplash.com/photo-1516035069371-29a1b244cc32', 'https://lensai.app', true, false, 300000, 600000, 3500, 4.8),
    
    -- Impression 3D
    ('Print3D AI', 'print3d-ai', 'Optimisation de l''impression 3D par IA', print3d_id, 'https://images.unsplash.com/photo-1631558556213-1c3c3f5f0b31', 'https://print3d.ai', true, true, 200000, 400000, 2500, 4.8),
    ('SlicerGPT', 'slicergpt', 'Slicer intelligent pour impression 3D', print3d_id, 'https://images.unsplash.com/photo-1631558556213-1c3c3f5f0b31', 'https://slicergpt.io', true, false, 150000, 300000, 1800, 4.7),
    
    -- Logistique
    ('LogisticsMind', 'logisticsmind', 'Optimisation de la chaîne logistique', logistique_id, 'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d', 'https://logisticsmind.ai', true, true, 300000, 600000, 4000, 4.8),
    ('SupplyAI', 'supply-ai', 'Gestion prédictive des stocks', logistique_id, 'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d', 'https://supplyai.com', true, false, 250000, 500000, 3000, 4.7),
    
    -- Télécommunications
    ('TelecomAI', 'telecom-ai', 'IA pour l''optimisation des réseaux', telecom_id, 'https://images.unsplash.com/photo-1544197150-b99a580bb7a8', 'https://telecomai.net', true, true, 350000, 700000, 4500, 4.8),
    ('NetworkGPT', 'network-gpt', 'Assistant réseau intelligent', telecom_id, 'https://images.unsplash.com/photo-1544197150-b99a580bb7a8', 'https://networkgpt.ai', true, false, 250000, 500000, 3000, 4.7),
    
    -- Industrie 4.0
    ('SmartFactory', 'smart-factory', 'Plateforme d''industrie intelligente', industrie_id, 'https://images.unsplash.com/photo-1581091226825-c6a89e7e4801', 'https://smartfactory.ai', true, true, 400000, 800000, 5000, 4.8),
    ('IndustryMind', 'industry-mind', 'IA pour l''automatisation industrielle', industrie_id, 'https://images.unsplash.com/photo-1581091226825-c6a89e7e4801', 'https://industrymind.ai', true, false, 300000, 600000, 3500, 4.7);

  -- Ajouter les fonctionnalités
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Développement MR', 'Création d''expériences mixtes'
  FROM ai_tools WHERE slug = 'holoai'
  UNION ALL
  SELECT id, 'Conception nano', 'Design de nanostructures'
  FROM ai_tools WHERE slug = 'nanogpt'
  UNION ALL
  SELECT id, 'Traitement son', 'Analyse acoustique avancée'
  FROM ai_tools WHERE slug = 'soundai-pro'
  UNION ALL
  SELECT id, 'Retouche auto', 'Amélioration automatique'
  FROM ai_tools WHERE slug = 'photogenius'
  UNION ALL
  SELECT id, 'Optimisation 3D', 'Impression optimisée'
  FROM ai_tools WHERE slug = 'print3d-ai'
  UNION ALL
  SELECT id, 'Logistique IA', 'Gestion de chaîne logistique'
  FROM ai_tools WHERE slug = 'logisticsmind'
  UNION ALL
  SELECT id, 'Réseaux IA', 'Optimisation réseau'
  FROM ai_tools WHERE slug = 'telecom-ai'
  UNION ALL
  SELECT id, 'Industrie smart', 'Automatisation industrielle'
  FROM ai_tools WHERE slug = 'smart-factory';

  -- Ajouter les plans tarifaires
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Pro', 199, 'monthly', ARRAY['Développement illimité', 'Support technique']
  FROM ai_tools WHERE slug = 'holoai'
  UNION ALL
  SELECT id, 'Research', 499, 'monthly', ARRAY['Simulation avancée', 'Support scientifique']
  FROM ai_tools WHERE slug = 'nanogpt'
  UNION ALL
  SELECT id, 'Studio', 99, 'monthly', ARRAY['Traitement illimité', 'Export haute qualité']
  FROM ai_tools WHERE slug = 'soundai-pro'
  UNION ALL
  SELECT id, 'Pro', 29.99, 'monthly', ARRAY['Retouche illimitée', 'Export RAW']
  FROM ai_tools WHERE slug = 'photogenius'
  UNION ALL
  SELECT id, 'Business', 199, 'monthly', ARRAY['Optimisation avancée', 'Support 24/7']
  FROM ai_tools WHERE slug = 'print3d-ai'
  UNION ALL
  SELECT id, 'Enterprise', 499, 'monthly', ARRAY['Gestion complète', 'Intégration ERP']
  FROM ai_tools WHERE slug = 'logisticsmind'
  UNION ALL
  SELECT id, 'Business', 399, 'monthly', ARRAY['Optimisation réseau', 'Support dédié']
  FROM ai_tools WHERE slug = 'telecom-ai'
  UNION ALL
  SELECT id, 'Factory', 999, 'monthly', ARRAY['Automatisation complète', 'Support sur site']
  FROM ai_tools WHERE slug = 'smart-factory';

END $$;
