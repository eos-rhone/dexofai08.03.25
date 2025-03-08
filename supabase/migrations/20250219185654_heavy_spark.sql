-- Ajouter plus d'agents IA avec descriptions en français
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
    ('GPT Migrate', 'gpt-migrate-2', 'Migration automatique de code entre frameworks et langages', coding_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://gpt-migrate.com', true, true, 280000, 560000, 3500, 4.8),
    ('GPT Pilot', 'gpt-pilot-2', 'Développement d''applications complètes avec supervision humaine', coding_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://github.com/Pythagora-io/gpt-pilot', true, false, 220000, 440000, 2800, 4.7),
    ('GPT Researcher', 'gpt-researcher-2', 'Agent autonome de recherche en ligne sur n''importe quel sujet', research_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://github.com/assafelovic/gpt-researcher', true, true, 350000, 700000, 4200, 4.8),
    ('GPT Runner', 'gpt-runner-2', 'Agent conversationnel pour vos fichiers sans embedding', research_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://github.com/nicepkg/gpt-runner', true, true, 400000, 800000, 5000, 4.9),
    ('IX Pro', 'ix-pro', 'Plateforme pour créer, déboguer et déployer des agents', research_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://github.com/kreneskyp/ix', true, true, 300000, 600000, 3800, 4.8),
    ('JARVIS Plus', 'jarvis-plus', 'Système connectant les LLMs avec la communauté ML', productivity_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://github.com/microsoft/JARVIS', true, true, 450000, 900000, 5500, 4.9),
    ('Langroid Pro', 'langroid-pro', 'Framework multi-agents pour applications LLM', productivity_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://github.com/langroid/langroid', true, false, 250000, 500000, 3000, 4.7),
    ('Lemon Agent Plus', 'lemon-agent-plus', 'Agent Plan-Validate-Solve pour l''automatisation des workflows', productivity_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://github.com/felixbrock/lemon-agent', true, true, 380000, 760000, 4500, 4.8),
    ('LLM Agents Pro', 'llm-agents-pro', 'Bibliothèque pour créer des agents, utiliser des outils et planifier', business_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://github.com/mpaepper/llm_agents', true, true, 320000, 640000, 4000, 4.8),
    ('Local GPT Plus', 'local-gpt-plus', 'Discussion avec vos documents en local sans compromettre la confidentialité', business_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://github.com/PromtEngineer/localGPT', true, false, 280000, 560000, 3500, 4.7),
    ('Loop GPT Pro', 'loop-gpt-pro', 'Réimplémentation d''AutoGPT en tant que package Python', business_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://github.com/farizrahman4u/loopgpt', true, true, 400000, 800000, 4800, 4.9)
  ) AS v(name, slug, description, category_id, image_url, website_url, is_verified, is_featured, monthly_users, total_views, total_reviews, average_rating)
  WHERE NOT EXISTS (
    SELECT 1 FROM ai_tools WHERE slug = v.slug
  );

  -- Ajouter les fonctionnalités pour les nouveaux agents
  INSERT INTO tool_features (tool_id, name, description)
  SELECT a.id, f.name, f.description
  FROM ai_tools a
  CROSS JOIN (VALUES
    ('Migration de code', 'Migration entre frameworks'),
    ('Développement supervisé', 'Création d''applications complètes'),
    ('Recherche autonome', 'Recherche en ligne complète'),
    ('Chat fichiers', 'Conversation avec fichiers'),
    ('Déploiement d''agents', 'Plateforme complète'),
    ('Intégration ML', 'Connexion avec modèles'),
    ('Framework multi-agents', 'Applications LLM'),
    ('Automatisation workflow', 'Plan-Validate-Solve'),
    ('Création d''agents', 'Bibliothèque complète'),
    ('Confidentialité', 'Traitement local'),
    ('Package Python', 'Version AutoGPT')
  ) AS f(name, description)
  WHERE a.slug IN (
    'gpt-migrate-2',
    'gpt-pilot-2',
    'gpt-researcher-2',
    'gpt-runner-2',
    'ix-pro',
    'jarvis-plus',
    'langroid-pro',
    'lemon-agent-plus',
    'llm-agents-pro',
    'local-gpt-plus',
    'loop-gpt-pro'
  );

  -- Ajouter les plans tarifaires pour les nouveaux agents
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT a.id, p.plan_name, p.price, p.billing_period, p.features
  FROM ai_tools a
  CROSS JOIN (VALUES
    ('Pro', 49.99, 'monthly', ARRAY['Migration illimitée', 'Support prioritaire']),
    ('Team', 199, 'monthly', ARRAY['Développement équipe', 'Support dédié']),
    ('Enterprise', 399, 'monthly', ARRAY['Recherche avancée', 'Support 24/7']),
    ('Developer', 29.99, 'monthly', ARRAY['Chat illimité', 'Support technique']),
    ('Business', 299, 'monthly', ARRAY['Déploiement entreprise', 'Support dédié']),
    ('Pro Plus', 49.99, 'monthly', ARRAY['Intégration complète', 'Support technique']),
    ('Developer Pro', 19.99, 'monthly', ARRAY['Framework complet', 'Mises à jour']),
    ('Team Plus', 149, 'monthly', ARRAY['Automatisation avancée', 'Support prioritaire']),
    ('Premium', 99, 'monthly', ARRAY['Agents illimités', 'Support VIP']),
    ('Enterprise Plus', 199, 'monthly', ARRAY['Déploiement privé', 'Support 24/7']),
    ('Business Pro', 299, 'monthly', ARRAY['Fonctionnalités complètes', 'Support entreprise'])
  ) AS p(plan_name, price, billing_period, features)
  WHERE a.slug IN (
    'gpt-migrate-2',
    'gpt-pilot-2',
    'gpt-researcher-2',
    'gpt-runner-2',
    'ix-pro',
    'jarvis-plus',
    'langroid-pro',
    'lemon-agent-plus',
    'llm-agents-pro',
    'local-gpt-plus',
    'loop-gpt-pro'
  );

END $$;

-- Mettre à jour les timestamps
UPDATE ai_tools
SET updated_at = CURRENT_TIMESTAMP
WHERE slug IN (
  'gpt-migrate-2',
  'gpt-pilot-2',
  'gpt-researcher-2',
  'gpt-runner-2',
  'ix-pro',
  'jarvis-plus',
  'langroid-pro',
  'lemon-agent-plus',
  'llm-agents-pro',
  'local-gpt-plus',
  'loop-gpt-pro'
);
