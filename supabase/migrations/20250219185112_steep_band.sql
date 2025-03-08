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
    ('L2MAC', 'l2mac', 'Framework d''agents capable de produire des bases de code complexes et des livres entiers', coding_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://github.com/samholt/l2mac', true, true, 280000, 560000, 3500, 4.8),
    ('Maige', 'maige', 'Agent IA pour l''automatisation des workflows GitHub', coding_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://maige.app', true, false, 220000, 440000, 2800, 4.7),
    ('Magick', 'magick', 'Plateforme pour créer, déployer et monétiser des agents IA', coding_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://www.magickml.com', true, true, 350000, 700000, 4200, 4.8),
    
    -- Agents de recherche
    ('MemFree', 'memfree', 'Moteur de recherche hybride IA open source', research_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://www.memfree.me', true, true, 400000, 800000, 5000, 4.9),
    ('MemGPT', 'memgpt', 'Système de gestion de mémoire pour les modèles de langage', research_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://github.com/cpacker/MemGPT', true, false, 180000, 360000, 2200, 4.7),
    ('NLSOM', 'nlsom', 'Sociétés d''agents basées sur le langage naturel', research_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://github.com/mczhuge/NLSOM', true, true, 300000, 600000, 3800, 4.8),
    
    -- Agents de productivité
    ('OpenAgents', 'openagents', 'Plateforme multi-agents polyvalente', productivity_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://github.com/xlang-ai/OpenAgents', true, true, 450000, 900000, 5500, 4.9),
    ('OpenAGI', 'openagi', 'Plateforme R&D pour agents IA', productivity_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://github.com/agiresearch/OpenAGI', true, false, 250000, 500000, 3000, 4.7),
    ('OpenDevin', 'opendevin', 'Alternative open source à Devin pour le développement logiciel', productivity_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://github.com/OpenDevin/OpenDevin', true, true, 380000, 760000, 4500, 4.8),
    
    -- Agents business
    ('Pezzo', 'pezzo', 'Boîte à outils pour la gestion des prompts et l''observabilité', business_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://www.pezzo.ai', true, true, 320000, 640000, 4000, 4.8),
    ('Private GPT', 'private-gpt', 'Outil d''interaction privée avec vos documents sans connexion internet', business_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://www.privategpt.io', true, false, 280000, 560000, 3500, 4.7),
    ('PromethAI', 'prometh-ai', 'Assistant IA pour la nutrition et autres objectifs personnels', business_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://prometh.ai', true, true, 400000, 800000, 4800, 4.9);

  -- Ajouter les fonctionnalités
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Génération de code', 'Création de bases de code complètes'
  FROM ai_tools WHERE slug = 'l2mac'
  UNION ALL
  SELECT id, 'Automatisation GitHub', 'Gestion automatisée des workflows'
  FROM ai_tools WHERE slug = 'maige'
  UNION ALL
  SELECT id, 'Déploiement d''agents', 'Plateforme complète de gestion d''agents'
  FROM ai_tools WHERE slug = 'magick'
  UNION ALL
  SELECT id, 'Recherche hybride', 'Moteur de recherche IA avancé'
  FROM ai_tools WHERE slug = 'memfree'
  UNION ALL
  SELECT id, 'Gestion mémoire', 'Optimisation de la mémoire des LLMs'
  FROM ai_tools WHERE slug = 'memgpt'
  UNION ALL
  SELECT id, 'Agents sociaux', 'Simulation de sociétés d''agents'
  FROM ai_tools WHERE slug = 'nlsom'
  UNION ALL
  SELECT id, 'Multi-agents', 'Plateforme polyvalente'
  FROM ai_tools WHERE slug = 'openagents'
  UNION ALL
  SELECT id, 'R&D agents', 'Plateforme de recherche'
  FROM ai_tools WHERE slug = 'openagi'
  UNION ALL
  SELECT id, 'Développement IA', 'Alternative à Devin'
  FROM ai_tools WHERE slug = 'opendevin'
  UNION ALL
  SELECT id, 'Gestion prompts', 'Outils de développement IA'
  FROM ai_tools WHERE slug = 'pezzo'
  UNION ALL
  SELECT id, 'Confidentialité', 'Traitement local des documents'
  FROM ai_tools WHERE slug = 'private-gpt'
  UNION ALL
  SELECT id, 'Assistant personnel', 'Coaching et nutrition'
  FROM ai_tools WHERE slug = 'prometh-ai';

  -- Ajouter les plans tarifaires
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Pro', 199, 'monthly', ARRAY['Génération illimitée', 'Support technique']
  FROM ai_tools WHERE slug = 'l2mac'
  UNION ALL
  SELECT id, 'Team', 149, 'monthly', ARRAY['Collaboration équipe', 'Intégration GitHub']
  FROM ai_tools WHERE slug = 'maige'
  UNION ALL
  SELECT id, 'Enterprise', 499, 'monthly', ARRAY['Déploiement personnalisé', 'Support dédié']
  FROM ai_tools WHERE slug = 'magick'
  UNION ALL
  SELECT id, 'Business', 99, 'monthly', ARRAY['Recherche avancée', 'API illimitée']
  FROM ai_tools WHERE slug = 'memfree'
  UNION ALL
  SELECT id, 'Pro', 49, 'monthly', ARRAY['Gestion mémoire avancée', 'Support']
  FROM ai_tools WHERE slug = 'memgpt'
  UNION ALL
  SELECT id, 'Research', 299, 'monthly', ARRAY['Simulation complète', 'Support recherche']
  FROM ai_tools WHERE slug = 'nlsom'
  UNION ALL
  SELECT id, 'Enterprise', 399, 'monthly', ARRAY['Agents illimités', 'Support 24/7']
  FROM ai_tools WHERE slug = 'openagents'
  UNION ALL
  SELECT id, 'Research', 249, 'monthly', ARRAY['Accès complet', 'Support recherche']
  FROM ai_tools WHERE slug = 'openagi'
  UNION ALL
  SELECT id, 'Free', 0, 'monthly', ARRAY['Fonctionnalités de base', 'Support communautaire']
  FROM ai_tools WHERE slug = 'opendevin'
  UNION ALL
  SELECT id, 'Pro', 79, 'monthly', ARRAY['Outils avancés', 'Support prioritaire']
  FROM ai_tools WHERE slug = 'pezzo'
  UNION ALL
  SELECT id, 'Enterprise', 299, 'monthly', ARRAY['Déploiement privé', 'Support dédié']
  FROM ai_tools WHERE slug = 'private-gpt'
  UNION ALL
  SELECT id, 'Premium', 29.99, 'monthly', ARRAY['Coaching personnalisé', 'Suivi avancé']
  FROM ai_tools WHERE slug = 'prometh-ai';

END $$;

-- Mettre à jour les descriptions en français pour les agents existants
UPDATE ai_tools
SET description = CASE slug
  WHEN 'adala' THEN 'Framework pour l''étiquetage autonome des données avec agents IA'
  WHEN 'agent4rec' THEN 'Simulateur de système de recommandation avec 1000 agents'
  WHEN 'agentforge' THEN 'Plateforme indépendante du LLM pour la construction et le test d''agents'
  WHEN 'agentgpt' THEN 'Version no-code d''AutoGPT accessible via navigateur'
  WHEN 'ailice' THEN 'Création d''arbres d''appels d''agents pour l''exécution de tâches'
  WHEN 'agents' THEN 'Bibliothèque pour la construction d''agents de langage'
  WHEN 'agentverse' THEN 'Plateforme pour la résolution de tâches et la simulation d''agents'
  WHEN 'ai-legion' THEN 'Plateforme multi-agents en TypeScript, similaire à AutoGPT'
  WHEN 'aider' THEN 'Utilisation de la ligne de commande pour éditer le code dans votre dépôt local'
  WHEN 'autogen' THEN 'Framework multi-agents avec une diversité d''agents'
  WHEN 'autogpt' THEN 'Tentative expérimentale de rendre GPT4 totalement autonome'
  WHEN 'automata' THEN 'Génération de code basée sur le contexte de votre projet'
  WHEN 'autopr' THEN 'Agent générant des pull requests IA qui corrige les problèmes'
  WHEN 'babyagi' THEN 'Framework simple pour la gestion des tâches utilisant l''IA'
  WHEN 'camel' THEN 'Architecture pour l''exploration de l''esprit des agents'
  WHEN 'chatdev' THEN 'Agents communicatifs pour le développement logiciel'
  WHEN 'chemcrow' THEN 'Agent LangChain pour les tâches liées à la chimie'
  WHEN 'crewai' THEN 'Framework pour l''orchestration d''agents jouant des rôles'
  WHEN 'databerry' THEN 'Plateforme no-code pour la création de chatbots'
  ELSE description
END
WHERE slug IN (
  'adala',
  'agent4rec',
  'agentforge',
  'agentgpt',
  'ailice',
  'agents',
  'agentverse',
  'ai-legion',
  'aider',
  'autogen',
  'autogpt',
  'automata',
  'autopr',
  'babyagi',
  'camel',
  'chatdev',
  'chemcrow',
  'crewai',
  'databerry'
);

-- Mettre à jour les timestamps
UPDATE ai_tools
SET updated_at = CURRENT_TIMESTAMP
WHERE slug IN (
  'l2mac',
  'maige',
  'magick',
  'memfree',
  'memgpt',
  'nlsom',
  'openagents',
  'openagi',
  'opendevin',
  'pezzo',
  'private-gpt',
  'prometh-ai'
);
