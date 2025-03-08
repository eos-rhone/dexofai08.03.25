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

  -- Insérer de nouveaux agents IA
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
    -- Agents de développement
    ('DemoGPT', 'demogpt', 'Générateur de démos d''applications à partir de descriptions textuelles', coding_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://www.demogpt.io', true, true, 280000, 560000, 3500, 4.8),
    ('DevGPT', 'devgpt', 'Équipe virtuelle de développeurs IA', coding_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://github.com/jina-ai/dev-gpt', true, false, 220000, 440000, 2800, 4.7),
    ('Devika', 'devika', 'Agent IA spécialisé en ingénierie logicielle', coding_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://github.com/stitionai/devika', true, true, 350000, 700000, 4200, 4.8),
    
    -- Agents de recherche
    ('English Compiler', 'english-compiler', 'Convertisseur de spécifications markdown en code fonctionnel', research_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://github.com/uilicious/english-compiler', true, true, 400000, 800000, 5000, 4.9),
    ('evo.ninja', 'evo-ninja', 'Agent IA qui adapte sa persona pour accomplir des tâches', research_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://evo.ninja', true, false, 180000, 360000, 2200, 4.7),
    ('FastAgency', 'fastagency', 'Déploiement rapide de workflows multi-agents', research_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://fastagency.ai', true, true, 300000, 600000, 3800, 4.8),
    
    -- Agents de productivité
    ('Flowise', 'flowise', 'Constructeur d''agents low code', productivity_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://flowiseai.com', true, true, 450000, 900000, 5500, 4.9),
    ('Friday', 'friday', 'Assistant IA pour l''édition de code en ligne de commande', productivity_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://github.com/amirrezasalimi/friday', true, false, 250000, 500000, 3000, 4.7),
    ('GeniA', 'genia', 'Membre d''équipe IA pour l''ingénierie de plateforme', productivity_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://github.com/genia-dev/GeniA', true, true, 380000, 760000, 4500, 4.8),
    
    -- Agents business
    ('Godmode', 'godmode', 'Inspiré par AutoGPT et BabyAGI, avec interface utilisateur', business_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://godmode.space', true, true, 320000, 640000, 4000, 4.8),
    ('GPT Discord', 'gpt-discord', 'Intégration ultime d''agents IA pour Discord', business_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://github.com/Kav-K/GPTDiscord', true, false, 280000, 560000, 3500, 4.7),
    ('GPT Engineer', 'gpt-engineer', 'Génère une base de code complète à partir d''une description', business_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://gptengineer.app', true, true, 400000, 800000, 4800, 4.9);

  -- Ajouter les fonctionnalités
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Génération de démos', 'Création d''applications de démonstration'
  FROM ai_tools WHERE slug = 'demogpt'
  UNION ALL
  SELECT id, 'Équipe virtuelle', 'Développeurs IA collaboratifs'
  FROM ai_tools WHERE slug = 'devgpt'
  UNION ALL
  SELECT id, 'Ingénierie IA', 'Développement logiciel autonome'
  FROM ai_tools WHERE slug = 'devika'
  UNION ALL
  SELECT id, 'Compilation naturelle', 'Traduction de texte en code'
  FROM ai_tools WHERE slug = 'english-compiler'
  UNION ALL
  SELECT id, 'Adaptation dynamique', 'Persona adaptative'
  FROM ai_tools WHERE slug = 'evo-ninja'
  UNION ALL
  SELECT id, 'Workflows rapides', 'Déploiement multi-agents'
  FROM ai_tools WHERE slug = 'fastagency'
  UNION ALL
  SELECT id, 'Construction low code', 'Création d''agents simplifiée'
  FROM ai_tools WHERE slug = 'flowise'
  UNION ALL
  SELECT id, 'Édition CLI', 'Assistant en ligne de commande'
  FROM ai_tools WHERE slug = 'friday'
  UNION ALL
  SELECT id, 'Ingénierie plateforme', 'Support d''équipe IA'
  FROM ai_tools WHERE slug = 'genia'
  UNION ALL
  SELECT id, 'Interface intuitive', 'Automatisation avancée'
  FROM ai_tools WHERE slug = 'godmode'
  UNION ALL
  SELECT id, 'Intégration Discord', 'Agents IA pour Discord'
  FROM ai_tools WHERE slug = 'gpt-discord'
  UNION ALL
  SELECT id, 'Génération de code', 'Base de code complète'
  FROM ai_tools WHERE slug = 'gpt-engineer';

  -- Ajouter les plans tarifaires
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Pro', 49.99, 'monthly', ARRAY['Démos illimitées', 'Support prioritaire']
  FROM ai_tools WHERE slug = 'demogpt'
  UNION ALL
  SELECT id, 'Team', 199, 'monthly', ARRAY['Équipe complète', 'Support dédié']
  FROM ai_tools WHERE slug = 'devgpt'
  UNION ALL
  SELECT id, 'Enterprise', 399, 'monthly', ARRAY['Développement personnalisé', 'Support 24/7']
  FROM ai_tools WHERE slug = 'devika'
  UNION ALL
  SELECT id, 'Developer', 29.99, 'monthly', ARRAY['Compilation illimitée', 'Support technique']
  FROM ai_tools WHERE slug = 'english-compiler'
  UNION ALL
  SELECT id, 'Pro', 79.99, 'monthly', ARRAY['Agents avancés', 'Support prioritaire']
  FROM ai_tools WHERE slug = 'evo-ninja'
  UNION ALL
  SELECT id, 'Business', 299, 'monthly', ARRAY['Déploiement entreprise', 'Support dédié']
  FROM ai_tools WHERE slug = 'fastagency'
  UNION ALL
  SELECT id, 'Pro', 49.99, 'monthly', ARRAY['Agents illimités', 'Support technique']
  FROM ai_tools WHERE slug = 'flowise'
  UNION ALL
  SELECT id, 'Developer', 19.99, 'monthly', ARRAY['Fonctionnalités avancées', 'Mises à jour']
  FROM ai_tools WHERE slug = 'friday'
  UNION ALL
  SELECT id, 'Team', 149, 'monthly', ARRAY['Accès équipe', 'Support prioritaire']
  FROM ai_tools WHERE slug = 'genia'
  UNION ALL
  SELECT id, 'Premium', 99, 'monthly', ARRAY['Fonctionnalités complètes', 'Support VIP']
  FROM ai_tools WHERE slug = 'godmode'
  UNION ALL
  SELECT id, 'Server', 199, 'monthly', ARRAY['Serveur dédié', 'Support 24/7']
  FROM ai_tools WHERE slug = 'gpt-discord'
  UNION ALL
  SELECT id, 'Business', 299, 'monthly', ARRAY['Génération illimitée', 'Support entreprise']
  FROM ai_tools WHERE slug = 'gpt-engineer';

END $$;

-- Mettre à jour les timestamps
UPDATE ai_tools
SET updated_at = CURRENT_TIMESTAMP
WHERE slug IN (
  'demogpt',
  'devgpt',
  'devika',
  'english-compiler',
  'evo-ninja',
  'fastagency',
  'flowise',
  'friday',
  'genia',
  'godmode',
  'gpt-discord',
  'gpt-engineer'
);
