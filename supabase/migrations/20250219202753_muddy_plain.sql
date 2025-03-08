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
    ('Mistral Large v2', 'mistral-large-v2', 'Nouveau modèle de langage open source par Mistral AI', assistants_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://mistral.ai', true, true, 450000, 900000, 5500, 4.8),
    ('Llama 3', 'llama-3', 'Dernière version du modèle open source de Meta', assistants_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://ai.meta.com/llama', true, true, 400000, 800000, 4800, 4.7),
    ('Grok-1.5', 'grok-1-5', 'Modèle de langage avancé par xAI', assistants_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://x.ai', true, false, 350000, 700000, 4200, 4.6),
    
    ('VSCode AI', 'vscode-ai', 'Extension IA avancée pour Visual Studio Code', coding_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://marketplace.visualstudio.com', true, true, 600000, 1200000, 7500, 4.8),
    ('JetBrains AI', 'jetbrains-ai', 'Assistant IA intégré aux IDEs JetBrains', coding_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://www.jetbrains.com/ai', true, false, 400000, 800000, 5000, 4.7),
    ('Eclipse CodeGPT', 'eclipse-codegpt', 'Assistant de code pour Eclipse IDE', coding_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://marketplace.eclipse.org', true, false, 300000, 600000, 3500, 4.6),
    
    ('Obsidian AI', 'obsidian-ai', 'Assistant IA pour la prise de notes', productivity_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://obsidian.md', true, true, 500000, 1000000, 6000, 4.8),
    ('Logseq GPT', 'logseq-gpt', 'IA intégrée pour Logseq', productivity_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://logseq.com', true, false, 300000, 600000, 3500, 4.7),
    ('Mem AI Pro', 'mem-ai-pro', 'Prise de notes augmentée par l''IA', productivity_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://mem.ai', true, false, 250000, 500000, 3000, 4.6),
    
    ('Elicit Pro', 'elicit-pro', 'Assistant de recherche scientifique', research_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://elicit.org', true, true, 400000, 800000, 5000, 4.8),
    ('Consensus AI', 'consensus-ai', 'Moteur de recherche pour articles scientifiques', research_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://consensus.app', true, false, 300000, 600000, 3500, 4.7),
    ('ResearchGPT Pro', 'researchgpt-pro', 'Assistant de recherche académique', research_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://researchgpt.ai', true, false, 250000, 500000, 3000, 4.6)
  ) AS v(name, slug, description, category_id, image_url, website_url, is_verified, is_featured, monthly_users, total_views, total_reviews, average_rating)
  WHERE NOT EXISTS (
    SELECT 1 FROM ai_tools WHERE slug = v.slug
  );

  -- Ajouter les fonctionnalités pour les nouveaux outils
  INSERT INTO tool_features (tool_id, name, description)
  SELECT a.id, f.name, f.description
  FROM ai_tools a
  CROSS JOIN (VALUES
    ('Modèle open source', 'Accès au code source complet'),
    ('Performances améliorées', 'Vitesse et précision accrues'),
    ('Extension IDE', 'Intégration développement'),
    ('Prise de notes IA', 'Organisation intelligente'),
    ('Recherche scientifique', 'Analyse d''articles')
  ) AS f(name, description)
  WHERE a.slug IN (
    'mistral-large-v2',
    'llama-3',
    'grok-1-5',
    'vscode-ai',
    'jetbrains-ai',
    'eclipse-codegpt',
    'obsidian-ai',
    'logseq-gpt',
    'mem-ai-pro',
    'elicit-pro',
    'consensus-ai',
    'researchgpt-pro'
  );

  -- Ajouter les plans tarifaires pour les nouveaux outils
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT a.id, p.plan_name, p.price, p.billing_period, p.features
  FROM ai_tools a
  CROSS JOIN (VALUES
    ('Pro', 49.99, 'monthly', ARRAY['Accès complet', 'Support prioritaire']),
    ('Enterprise', 199.99, 'monthly', ARRAY['Déploiement privé', 'Support dédié']),
    ('Developer', 29.99, 'monthly', ARRAY['Extensions pro', 'Mises à jour']),
    ('Team', 99.99, 'monthly', ARRAY['Collaboration', 'Administration']),
    ('Research', 79.99, 'monthly', ARRAY['Accès illimité', 'Export avancé'])
  ) AS p(plan_name, price, billing_period, features)
  WHERE a.slug IN (
    'mistral-large-v2',
    'llama-3',
    'grok-1-5',
    'vscode-ai',
    'jetbrains-ai',
    'eclipse-codegpt',
    'obsidian-ai',
    'logseq-gpt',
    'mem-ai-pro',
    'elicit-pro',
    'consensus-ai',
    'researchgpt-pro'
  );

END $$;

-- Mettre à jour les timestamps
UPDATE ai_tools
SET updated_at = CURRENT_TIMESTAMP
WHERE slug IN (
  'mistral-large-v2',
  'llama-3',
  'grok-1-5',
  'vscode-ai',
  'jetbrains-ai',
  'eclipse-codegpt',
  'obsidian-ai',
  'logseq-gpt',
  'mem-ai-pro',
  'elicit-pro',
  'consensus-ai',
  'researchgpt-pro'
);
