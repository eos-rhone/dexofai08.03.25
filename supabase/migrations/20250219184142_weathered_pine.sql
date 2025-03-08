-- Ajouter de nouvelles catégories
INSERT INTO categories (name, slug, description, icon) VALUES
('Astronomie & Espace', 'astronomie-espace', 'IA pour l''exploration spatiale et l''astronomie', 'Star'),
('Chimie & Matériaux', 'chimie-materiaux', 'IA pour la découverte de nouveaux matériaux', 'Flask'),
('Océanographie', 'oceanographie', 'IA pour l''étude et la protection des océans', 'Waves'),
('Archéologie', 'archeologie', 'IA pour l''exploration et l''analyse archéologique', 'Mountain'),
('Musées & Patrimoine', 'musees-patrimoine', 'IA pour la préservation du patrimoine culturel', 'Landmark'),
('Géologie', 'geologie', 'IA pour l''étude des sols et des minéraux', 'Mountain'),
('Biotechnologie', 'biotechnologie', 'IA pour la recherche en biotechnologie', 'Dna'),
('Psychologie', 'psychologie', 'IA pour la recherche en psychologie', 'Brain')
ON CONFLICT (slug) DO NOTHING;

-- Ajouter des outils pour les nouvelles catégories
DO $$ 
DECLARE
  astro_id uuid;
  chimie_id uuid;
  ocean_id uuid;
  archeo_id uuid;
  musee_id uuid;
  geo_id uuid;
  biotech_id uuid;
  psycho_id uuid;
BEGIN
  -- Récupérer les IDs des nouvelles catégories
  SELECT id INTO astro_id FROM categories WHERE slug = 'astronomie-espace';
  SELECT id INTO chimie_id FROM categories WHERE slug = 'chimie-materiaux';
  SELECT id INTO ocean_id FROM categories WHERE slug = 'oceanographie';
  SELECT id INTO archeo_id FROM categories WHERE slug = 'archeologie';
  SELECT id INTO musee_id FROM categories WHERE slug = 'musees-patrimoine';
  SELECT id INTO geo_id FROM categories WHERE slug = 'geologie';
  SELECT id INTO biotech_id FROM categories WHERE slug = 'biotechnologie';
  SELECT id INTO psycho_id FROM categories WHERE slug = 'psychologie';

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
    -- Astronomie & Espace
    ('SpaceAI', 'space-ai', 'Analyse de données astronomiques par IA', astro_id, 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564', 'https://spaceai.org', true, true, 200000, 400000, 2500, 4.8),
    ('StarNet', 'starnet', 'Détection d''exoplanètes par IA', astro_id, 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564', 'https://starnet.space', true, false, 150000, 300000, 1800, 4.7),
    
    -- Chimie & Matériaux
    ('MoleculeAI', 'molecule-ai', 'Découverte de molécules par IA', chimie_id, 'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69', 'https://molecule.ai', true, true, 180000, 360000, 2200, 4.8),
    ('MaterialsGPT', 'materials-gpt', 'Assistant IA pour la science des matériaux', chimie_id, 'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69', 'https://materialsgpt.com', true, false, 120000, 240000, 1500, 4.7),
    
    -- Océanographie
    ('OceanAI', 'ocean-ai', 'Surveillance des océans par IA', ocean_id, 'https://images.unsplash.com/photo-1439405326854-014607f694d7', 'https://oceanai.org', true, true, 150000, 300000, 1800, 4.8),
    ('MarineInsight', 'marine-insight', 'Analyse des écosystèmes marins', ocean_id, 'https://images.unsplash.com/photo-1439405326854-014607f694d7', 'https://marineinsight.ai', true, false, 100000, 200000, 1200, 4.7),
    
    -- Archéologie
    ('ArcheoVision', 'archeo-vision', 'Vision par ordinateur pour l''archéologie', archeo_id, 'https://images.unsplash.com/photo-1544013765-0d6c8a0a4b01', 'https://archeovision.ai', true, true, 120000, 240000, 1500, 4.8),
    ('ArtifactAI', 'artifact-ai', 'Classification d''artéfacts par IA', archeo_id, 'https://images.unsplash.com/photo-1544013765-0d6c8a0a4b01', 'https://artifactai.com', true, false, 80000, 160000, 1000, 4.7),
    
    -- Musées & Patrimoine
    ('HeritageAI', 'heritage-ai', 'Préservation numérique du patrimoine', musee_id, 'https://images.unsplash.com/photo-1565060169194-19fabf63012c', 'https://heritage.ai', true, true, 200000, 400000, 2500, 4.8),
    ('MuseumLens', 'museum-lens', 'IA pour l''expérience muséale', musee_id, 'https://images.unsplash.com/photo-1565060169194-19fabf63012c', 'https://museumlens.org', true, false, 150000, 300000, 1800, 4.7),
    
    -- Géologie
    ('GeoAI', 'geo-ai', 'Analyse géologique par IA', geo_id, 'https://images.unsplash.com/photo-1508182314998-3bd49473002f', 'https://geoai.science', true, true, 160000, 320000, 2000, 4.8),
    ('MineralAI', 'mineral-ai', 'Identification de minéraux par IA', geo_id, 'https://images.unsplash.com/photo-1508182314998-3bd49473002f', 'https://mineralai.com', true, false, 120000, 240000, 1500, 4.7),
    
    -- Biotechnologie
    ('BioGPT', 'biogpt', 'Assistant IA pour la biotechnologie', biotech_id, 'https://images.unsplash.com/photo-1576086213369-97a306d36557', 'https://biogpt.ai', true, true, 250000, 500000, 3000, 4.8),
    ('CellAI', 'cell-ai', 'Analyse cellulaire par IA', biotech_id, 'https://images.unsplash.com/photo-1576086213369-97a306d36557', 'https://cellai.bio', true, false, 180000, 360000, 2200, 4.7),
    
    -- Psychologie
    ('MindAI', 'mind-ai', 'IA pour la recherche en psychologie', psycho_id, 'https://images.unsplash.com/photo-1507413245164-6160d8298b31', 'https://mindai.org', true, true, 300000, 600000, 3500, 4.8),
    ('BehaviorLab', 'behavior-lab', 'Analyse comportementale par IA', psycho_id, 'https://images.unsplash.com/photo-1507413245164-6160d8298b31', 'https://behaviorlab.ai', true, false, 200000, 400000, 2500, 4.7);

  -- Ajouter les fonctionnalités
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Analyse astronomique', 'Traitement de données spatiales'
  FROM ai_tools WHERE slug = 'space-ai'
  UNION ALL
  SELECT id, 'Découverte moléculaire', 'Prédiction de structures'
  FROM ai_tools WHERE slug = 'molecule-ai'
  UNION ALL
  SELECT id, 'Surveillance marine', 'Suivi des écosystèmes'
  FROM ai_tools WHERE slug = 'ocean-ai'
  UNION ALL
  SELECT id, 'Vision archéologique', 'Analyse d''artéfacts'
  FROM ai_tools WHERE slug = 'archeo-vision'
  UNION ALL
  SELECT id, 'Préservation numérique', 'Conservation du patrimoine'
  FROM ai_tools WHERE slug = 'heritage-ai'
  UNION ALL
  SELECT id, 'Analyse géologique', 'Étude des sols'
  FROM ai_tools WHERE slug = 'geo-ai'
  UNION ALL
  SELECT id, 'Analyse biotechnologique', 'Recherche en biotech'
  FROM ai_tools WHERE slug = 'biogpt'
  UNION ALL
  SELECT id, 'Analyse psychologique', 'Recherche comportementale'
  FROM ai_tools WHERE slug = 'mind-ai';

  -- Ajouter les plans tarifaires
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Research', 499, 'monthly', ARRAY['Analyse avancée', 'Support scientifique']
  FROM ai_tools WHERE slug = 'space-ai'
  UNION ALL
  SELECT id, 'Pro', 299, 'monthly', ARRAY['Découverte illimitée', 'API access']
  FROM ai_tools WHERE slug = 'molecule-ai'
  UNION ALL
  SELECT id, 'Enterprise', 399, 'monthly', ARRAY['Surveillance complète', 'Rapports détaillés']
  FROM ai_tools WHERE slug = 'ocean-ai'
  UNION ALL
  SELECT id, 'Research', 199, 'monthly', ARRAY['Analyse illimitée', 'Export haute résolution']
  FROM ai_tools WHERE slug = 'archeo-vision'
  UNION ALL
  SELECT id, 'Museum', 299, 'monthly', ARRAY['Préservation complète', 'Accès API']
  FROM ai_tools WHERE slug = 'heritage-ai'
  UNION ALL
  SELECT id, 'Pro', 249, 'monthly', ARRAY['Analyse géologique', 'Rapports détaillés']
  FROM ai_tools WHERE slug = 'geo-ai'
  UNION ALL
  SELECT id, 'Lab', 399, 'monthly', ARRAY['Recherche avancée', 'Support dédié']
  FROM ai_tools WHERE slug = 'biogpt'
  UNION ALL
  SELECT id, 'Research', 299, 'monthly', ARRAY['Analyse comportementale', 'Export données']
  FROM ai_tools WHERE slug = 'mind-ai';

END $$;
