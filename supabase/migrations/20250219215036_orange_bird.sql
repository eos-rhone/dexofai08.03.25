-- Ajouter de nouveaux outils IA
DO $$ 
DECLARE
  assistants_id uuid;
  coding_id uuid;
  research_id uuid;
  productivity_id uuid;
  business_id uuid;
BEGIN
  -- Récupérer les IDs des catégories
  SELECT id INTO assistants_id FROM categories WHERE slug = 'assistants-chatbots';
  SELECT id INTO coding_id FROM categories WHERE slug = 'developpement';
  SELECT id INTO research_id FROM categories WHERE slug = 'recherche-scientifique';
  SELECT id INTO productivity_id FROM categories WHERE slug = 'productivite';
  SELECT id INTO business_id FROM categories WHERE slug = 'business-marketing';

  -- Insérer de nouveaux agents IA s'ils n'existent pas déjà
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
  )
  SELECT * FROM (VALUES
    ('Claude 3 Haiku', 'claude-3-haiku', 'Version rapide et économique de Claude 3', assistants_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://claude.ai', true, true, 350000, 700000, 4200, 4.7),
    ('Claude 3 Sonnet', 'claude-3-sonnet', 'Version intermédiaire de Claude 3', assistants_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://claude.ai', true, true, 450000, 900000, 5500, 4.8),
    ('Mistral Medium', 'mistral-medium', 'Modèle de langage équilibré par Mistral AI', assistants_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://mistral.ai', true, false, 300000, 600000, 3500, 4.6),
    
    ('Replit AI', 'replit-ai', 'Assistant de code intégré à Replit', coding_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://replit.com', true, true, 400000, 800000, 4800, 4.8),
    ('Cursor AI', 'cursor-ai', 'Éditeur de code avec IA intégrée', coding_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://cursor.sh', true, false, 250000, 500000, 3000, 4.7),
    ('Mutable AI', 'mutable-ai', 'Assistant de développement intelligent', coding_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://mutable.ai', true, false, 200000, 400000, 2500, 4.6),
    
    ('Semantic Scholar', 'semantic-scholar', 'Moteur de recherche académique par IA', research_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://semanticscholar.org', true, true, 500000, 1000000, 6000, 4.8),
    ('Iris AI', 'iris-ai', 'Assistant de recherche scientifique', research_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://iris.ai', true, false, 300000, 600000, 3500, 4.7),
    ('Research Rabbit', 'research-rabbit', 'Découverte de littérature scientifique', research_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://researchrabbit.ai', true, false, 250000, 500000, 3000, 4.6),
    
    ('Taskade AI', 'taskade-ai', 'Gestion de projet augmentée par l''IA', productivity_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://taskade.com', true, true, 400000, 800000, 4800, 4.8),
    ('Todoist AI', 'todoist-ai', 'Gestionnaire de tâches intelligent', productivity_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://todoist.com', true, false, 350000, 700000, 4000, 4.7),
    ('ClickUp AI', 'clickup-ai', 'Suite de productivité avec IA intégrée', productivity_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://clickup.com', true, true, 450000, 900000, 5500, 4.8),
    
    ('Intercom AI', 'intercom-ai', 'Service client automatisé par IA', business_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://intercom.com', true, true, 500000, 1000000, 6000, 4.9),
    ('Drift AI', 'drift-ai', 'Plateforme de conversation marketing', business_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://drift.com', true, false, 400000, 800000, 4800, 4.8),
    ('Front AI', 'front-ai', 'Gestion de la relation client par IA', business_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://front.com', true, false, 350000, 700000, 4200, 4.7)
  ) AS v(name, slug, description, category_id, image_url, website_url, is_verified, is_featured, monthly_users, total_views, total_reviews, average_rating)
  WHERE NOT EXISTS (
    SELECT 1 FROM ai_tools WHERE slug = v.slug
  );

  -- Ajouter les fonctionnalités pour les nouveaux outils
  INSERT INTO tool_features (tool_id, name, description)
  SELECT a.id, f.name, f.description
  FROM ai_tools a
  CROSS JOIN (VALUES
    ('Modèle rapide', 'Version optimisée pour la vitesse'),
    ('Développement IA', 'Assistant de code intelligent'),
    ('Recherche académique', 'Analyse de publications'),
    ('Gestion de projet', 'Organisation intelligente'),
    ('Service client', 'Support automatisé')
  ) AS f(name, description)
  WHERE a.slug IN (
    'claude-3-haiku',
    'replit-ai',
    'semantic-scholar',
    'taskade-ai',
    'intercom-ai'
  );

  -- Ajouter les plans tarifaires pour les nouveaux outils
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT a.id, p.plan_name, p.price, p.billing_period, p.features
  FROM ai_tools a
  CROSS JOIN (VALUES
    ('Pro', 20, 'monthly', ARRAY['Accès illimité', 'Support prioritaire']),
    ('Team', 49, 'monthly', ARRAY['Collaboration', 'API access']),
    ('Enterprise', 199, 'monthly', ARRAY['Déploiement personnalisé', 'Support 24/7']),
    ('Business', 99, 'monthly', ARRAY['Fonctionnalités avancées', 'Intégrations']),
    ('Premium', 29, 'monthly', ARRAY['Fonctionnalités premium', 'Support technique'])
  ) AS p(plan_name, price, billing_period, features)
  WHERE a.slug IN (
    'claude-3-haiku',
    'replit-ai',
    'semantic-scholar',
    'taskade-ai',
    'intercom-ai'
  );

END $$;

-- Mettre à jour les timestamps
UPDATE ai_tools
SET updated_at = CURRENT_TIMESTAMP
WHERE created_at = updated_at;
