-- Ajouter de nouveaux outils IA avec vérification des doublons
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
  SELECT id INTO research_id FROM categories WHERE slug = 'recherche';
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
    ('Devin', 'devin-ai', 'Assistant de développement logiciel autonome par Cognition Labs', coding_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://cognition.dev', true, true, 500000, 1000000, 7000, 4.9),
    ('Claude 3 Opus', 'claude-3-opus-ai', 'Version la plus avancée de Claude avec capacités multimodales', assistants_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://claude.ai', true, true, 800000, 1600000, 12000, 4.9),
    ('Gemini 1.5', 'gemini-1-5', 'Nouveau modèle de Google avec contexte étendu', assistants_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://gemini.google.com', true, true, 700000, 1400000, 9000, 4.8),
    
    ('Copilot Pro', 'copilot-pro-ai', 'Assistant IA personnel de Microsoft pour la productivité', productivity_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://copilot.microsoft.com', true, true, 600000, 1200000, 8000, 4.8),
    ('Notion AI Plus', 'notion-ai-plus-2', 'Assistant d''écriture et d''organisation avancé', productivity_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://notion.ai', true, true, 500000, 1000000, 6000, 4.7),
    ('Raycast AI', 'raycast-ai-pro', 'Assistant productivité avec commandes rapides', productivity_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://raycast.com', true, false, 300000, 600000, 4000, 4.7),
    
    ('Perplexity Pro', 'perplexity-pro-2', 'Moteur de recherche IA avec sources vérifiées', research_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://perplexity.ai', true, true, 400000, 800000, 5000, 4.8),
    ('You.com GPT', 'you-com-gpt-2', 'Moteur de recherche conversationnel avec IA', research_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://you.com', true, false, 250000, 500000, 3000, 4.7),
    ('Kagi AI', 'kagi-ai-2', 'Recherche privée augmentée par l''IA', research_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://kagi.com', true, false, 200000, 400000, 2500, 4.6),
    
    ('Salesforce Einstein GPT', 'salesforce-einstein-gpt-2', 'IA générative pour CRM et ventes', business_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://salesforce.com/einstein', true, true, 450000, 900000, 5500, 4.8),
    ('HubSpot AI Suite', 'hubspot-ai-suite-2', 'Suite marketing et ventes propulsée par l''IA', business_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://hubspot.com/ai', true, true, 400000, 800000, 4800, 4.7),
    ('Zendesk AI Pro', 'zendesk-ai-pro', 'Support client automatisé par IA', business_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://zendesk.com/ai', true, false, 350000, 700000, 4200, 4.6)
  ) AS v(name, slug, description, category_id, image_url, website_url, is_verified, is_featured, monthly_users, total_views, total_reviews, average_rating)
  WHERE NOT EXISTS (
    SELECT 1 FROM ai_tools WHERE slug = v.slug
  );

  -- Ajouter les fonctionnalités pour les nouveaux outils
  INSERT INTO tool_features (tool_id, name, description)
  SELECT a.id, f.name, f.description
  FROM ai_tools a
  CROSS JOIN (VALUES
    ('Développement autonome', 'Création complète d''applications'),
    ('Vision multimodale', 'Analyse d''images et de documents'),
    ('Contexte étendu', 'Mémoire de conversation améliorée'),
    ('Assistant personnel', 'Productivité augmentée'),
    ('Organisation IA', 'Gestion de contenu intelligente'),
    ('Commandes rapides', 'Automatisation du workflow'),
    ('Recherche avancée', 'Sources vérifiées'),
    ('Chat recherche', 'Conversation naturelle'),
    ('Recherche privée', 'Protection des données'),
    ('CRM intelligent', 'Automatisation des ventes'),
    ('Marketing IA', 'Automatisation marketing'),
    ('Support automatisé', 'Réponses intelligentes')
  ) AS f(name, description)
  WHERE a.slug IN (
    'devin-ai',
    'claude-3-opus-ai',
    'gemini-1-5',
    'copilot-pro-ai',
    'notion-ai-plus-2',
    'raycast-ai-pro',
    'perplexity-pro-2',
    'you-com-gpt-2',
    'kagi-ai-2',
    'salesforce-einstein-gpt-2',
    'hubspot-ai-suite-2',
    'zendesk-ai-pro'
  );

  -- Ajouter les plans tarifaires pour les nouveaux outils
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT a.id, p.plan_name, p.price, p.billing_period, p.features
  FROM ai_tools a
  CROSS JOIN (VALUES
    ('Pro', 99.99, 'monthly', ARRAY['Développement illimité', 'Support prioritaire']),
    ('Enterprise', 199.99, 'monthly', ARRAY['Capacités complètes', 'Support dédié']),
    ('Pro', 29.99, 'monthly', ARRAY['Accès complet', 'API illimitée']),
    ('Pro', 20, 'monthly', ARRAY['Fonctionnalités avancées', 'Support prioritaire']),
    ('Plus', 15, 'monthly', ARRAY['IA illimitée', 'Fonctionnalités avancées']),
    ('Pro', 10, 'monthly', ARRAY['Commandes illimitées', 'Plugins pro']),
    ('Pro', 20, 'monthly', ARRAY['Recherche illimitée', 'Sources premium']),
    ('Pro', 15, 'monthly', ARRAY['Chat illimité', 'Pas de publicité']),
    ('Pro', 10, 'monthly', ARRAY['Recherche privée', 'Fonctionnalités avancées']),
    ('Enterprise', 150, 'monthly', ARRAY['CRM complet', 'Support dédié']),
    ('Professional', 89, 'monthly', ARRAY['Marketing complet', 'Support prioritaire']),
    ('Enterprise', 99, 'monthly', ARRAY['Support illimité', 'Intégrations avancées'])
  ) AS p(plan_name, price, billing_period, features)
  WHERE a.slug IN (
    'devin-ai',
    'claude-3-opus-ai',
    'gemini-1-5',
    'copilot-pro-ai',
    'notion-ai-plus-2',
    'raycast-ai-pro',
    'perplexity-pro-2',
    'you-com-gpt-2',
    'kagi-ai-2',
    'salesforce-einstein-gpt-2',
    'hubspot-ai-suite-2',
    'zendesk-ai-pro'
  );

END $$;

-- Mettre à jour les timestamps
UPDATE ai_tools
SET updated_at = CURRENT_TIMESTAMP
WHERE slug IN (
  'devin-ai',
  'claude-3-opus-ai',
  'gemini-1-5',
  'copilot-pro-ai',
  'notion-ai-plus-2',
  'raycast-ai-pro',
  'perplexity-pro-2',
  'you-com-gpt-2',
  'kagi-ai-2',
  'salesforce-einstein-gpt-2',
  'hubspot-ai-suite-2',
  'zendesk-ai-pro'
);
