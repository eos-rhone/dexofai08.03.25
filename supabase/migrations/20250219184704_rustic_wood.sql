-- Add new AI agents from raw file
DO $$ 
DECLARE
  assistants_id uuid;
BEGIN
  -- Get the assistants & chatbots category ID
  SELECT id INTO assistants_id FROM categories WHERE slug = 'assistants-chatbots';

  -- Insert new AI agents
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
    ('LLM Stack', 'llm-stack', 'No-code platform to build LLM Agents, workflows and applications with your data', assistants_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://llmstack.ai', true, true, 250000, 500000, 3000, 4.8),
    ('Promptly', 'promptly', 'Build tailor-made generative AI agents and chatbots without coding', assistants_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://www.trypromptly.com', true, false, 180000, 360000, 2200, 4.7),
    ('GPT Swarm', 'gpt-swarm', 'Language Agents as Optimizable Graphs framework', assistants_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://gptswarm.org', true, true, 300000, 600000, 4000, 4.8),
    ('UFO', 'ufo', 'UI-Focused agent framework for Windows OS by Microsoft', assistants_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://github.com/microsoft/UFO', true, true, 400000, 800000, 5000, 4.9),
    ('Eidolon', 'eidolon', 'Multi Agent SDK with pluggable, modular components', assistants_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://eidolonai.com', true, false, 150000, 300000, 1800, 4.6),
    ('Brain Soup', 'brain-soup', 'Build an AI team that works for you on your PC', assistants_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://www.nurgo-software.com/products/brainsoup', true, true, 280000, 560000, 3500, 4.8),
    ('NexusGPT', 'nexusgpt', 'Build AI agents in minutes without coding', assistants_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://gpt.nexus', true, false, 200000, 400000, 2500, 4.7),
    ('Devon', 'devon', 'Open-source Devin alternative', assistants_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://github.com/entropy-research/Devon', true, true, 350000, 700000, 4500, 4.8);

  -- Add features for the new agents
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'No-code platform', 'Build agents without coding'
  FROM ai_tools WHERE slug = 'llm-stack'
  UNION ALL
  SELECT id, 'Custom workflows', 'Create custom agent workflows'
  FROM ai_tools WHERE slug = 'promptly'
  UNION ALL
  SELECT id, 'Graph optimization', 'Optimize agent interactions'
  FROM ai_tools WHERE slug = 'gpt-swarm'
  UNION ALL
  SELECT id, 'Windows UI control', 'Control Windows applications'
  FROM ai_tools WHERE slug = 'ufo'
  UNION ALL
  SELECT id, 'Modular SDK', 'Pluggable agent components'
  FROM ai_tools WHERE slug = 'eidolon'
  UNION ALL
  SELECT id, 'Local AI team', 'Run AI agents on your PC'
  FROM ai_tools WHERE slug = 'brain-soup'
  UNION ALL
  SELECT id, 'No-code builder', 'Create agents without coding'
  FROM ai_tools WHERE slug = 'nexusgpt'
  UNION ALL
  SELECT id, 'Open source', 'Alternative to Devin'
  FROM ai_tools WHERE slug = 'devon';

  -- Add pricing plans
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Pro', 49.99, 'monthly', ARRAY['Unlimited agents', 'Priority support']
  FROM ai_tools WHERE slug = 'llm-stack'
  UNION ALL
  SELECT id, 'Business', 99.99, 'monthly', ARRAY['Custom deployment', 'API access']
  FROM ai_tools WHERE slug = 'promptly'
  UNION ALL
  SELECT id, 'Enterprise', 299, 'monthly', ARRAY['Advanced optimization', 'Dedicated support']
  FROM ai_tools WHERE slug = 'gpt-swarm'
  UNION ALL
  SELECT id, 'Free', 0, 'monthly', ARRAY['Basic features', 'Community support']
  FROM ai_tools WHERE slug = 'ufo'
  UNION ALL
  SELECT id, 'Developer', 29.99, 'monthly', ARRAY['Full SDK access', 'Developer tools']
  FROM ai_tools WHERE slug = 'eidolon'
  UNION ALL
  SELECT id, 'Team', 79.99, 'monthly', ARRAY['Multiple agents', 'Team collaboration']
  FROM ai_tools WHERE slug = 'brain-soup'
  UNION ALL
  SELECT id, 'Pro', 39.99, 'monthly', ARRAY['Unlimited builds', 'Advanced features']
  FROM ai_tools WHERE slug = 'nexusgpt'
  UNION ALL
  SELECT id, 'Free', 0, 'monthly', ARRAY['Core features', 'Community support']
  FROM ai_tools WHERE slug = 'devon';

END $$;

-- Update timestamps
UPDATE ai_tools
SET updated_at = CURRENT_TIMESTAMP
WHERE slug IN (
  'llm-stack',
  'promptly',
  'gpt-swarm',
  'ufo',
  'eidolon',
  'brain-soup',
  'nexusgpt',
  'devon'
);
