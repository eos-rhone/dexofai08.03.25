-- Add more AI agents from raw file
DO $$ 
DECLARE
  assistants_id uuid;
  coding_id uuid;
  research_id uuid;
  productivity_id uuid;
  business_id uuid;
BEGIN
  -- Get category IDs
  SELECT id INTO assistants_id FROM categories WHERE slug = 'assistants-chatbots';
  SELECT id INTO coding_id FROM categories WHERE slug = 'developpement';
  SELECT id INTO research_id FROM categories WHERE slug = 'recherche';
  SELECT id INTO productivity_id FROM categories WHERE slug = 'productivite';
  SELECT id INTO business_id FROM categories WHERE slug = 'business-marketing';

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
    -- Coding Agents
    ('Adala', 'adala', 'Autonomous Data Labeling Agent framework', coding_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://github.com/HumanSignal/Adala', true, true, 200000, 400000, 2500, 4.8),
    ('Agent4Rec', 'agent4rec', 'Recommender system simulator with 1,000 agents', research_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://github.com/LehengTHU/Agent4Rec', true, false, 150000, 300000, 1800, 4.7),
    ('AgentForge', 'agentforge', 'LLM-agnostic platform for agent building & testing', assistants_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://www.agentforge.net', true, true, 300000, 600000, 3500, 4.8),
    ('AgentGPT', 'agentgpt', 'Browser-based no-code version of AutoGPT', assistants_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://agentgpt.reworkd.ai', true, true, 400000, 800000, 5000, 4.9),
    ('AIlice', 'ailice', 'Create agents-calling tree to execute your tasks', productivity_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://github.com/myshell-ai/AIlice', true, false, 180000, 360000, 2200, 4.7),
    ('Agents', 'agents', 'Library/framework for building language agents', coding_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://github.com/aiwaves-cn/agents', true, true, 250000, 500000, 3000, 4.8),
    ('AgentVerse', 'agentverse', 'Platform for task-solving & simulation agents', assistants_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://github.com/OpenBMB/AgentVerse', true, false, 200000, 400000, 2500, 4.7),
    ('AI Legion', 'ai-legion', 'Multi-agent TS platform, similar to AutoGPT', assistants_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://github.com/eumemic/ai-legion', true, true, 350000, 700000, 4000, 4.8),
    ('Aider', 'aider', 'Use command line to edit code in your local repo', coding_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://aider.chat', true, false, 280000, 560000, 3200, 4.7),
    ('AutoGen', 'autogen', 'Multi-agent framework with diversity of agents', assistants_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://github.com/microsoft/autogen', true, true, 450000, 900000, 5500, 4.9),
    ('AutoGPT', 'autogpt', 'Experimental attempt to make GPT4 fully autonomous', assistants_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://agpt.co', true, true, 500000, 1000000, 6000, 4.8),
    ('Automata', 'automata', 'Generate code based on your project context', coding_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://github.com/emrgnt-cmplxty/automata', true, false, 220000, 440000, 2800, 4.7),
    ('AutoPR', 'autopr', 'AI-generated pull requests agent that fixes issues', coding_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://github.com/irgolic/AutoPR', true, true, 300000, 600000, 3500, 4.8),
    ('BabyAGI', 'babyagi', 'A simple framework for managing tasks using AI', assistants_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://github.com/yoheinakajima/babyagi', true, true, 400000, 800000, 4800, 4.9),
    ('CAMEL', 'camel', 'Architecture for "Mind" Exploration of agents', research_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://www.camel-ai.org', true, true, 350000, 700000, 4200, 4.8),
    ('ChatDev', 'chatdev', 'Communicative agents for software development', coding_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://github.com/OpenBMB/ChatDev', true, false, 280000, 560000, 3300, 4.7),
    ('ChemCrow', 'chemcrow', 'LangChain agent for chemistry-related tasks', research_id, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485', 'https://github.com/ur-whitelab/chemcrow-public', true, true, 200000, 400000, 2500, 4.8),
    ('CrewAI', 'crewai', 'Framework for orchestrating role-playing agents', assistants_id, 'https://images.unsplash.com/photo-1633419461186-7d40a38105ec', 'https://github.com/joaomdmoura/crewai', true, true, 380000, 760000, 4500, 4.9),
    ('Databerry', 'databerry', 'No-code chatbot building platform', business_id, 'https://images.unsplash.com/photo-1677442136019-21780ecad995', 'https://www.databerry.ai', true, false, 250000, 500000, 3000, 4.7);

  -- Add features for the new agents
  INSERT INTO tool_features (tool_id, name, description)
  SELECT id, 'Data labeling', 'Autonomous data labeling'
  FROM ai_tools WHERE slug = 'adala'
  UNION ALL
  SELECT id, 'Recommendation', 'Advanced recommender system'
  FROM ai_tools WHERE slug = 'agent4rec'
  UNION ALL
  SELECT id, 'Agent building', 'LLM-agnostic platform'
  FROM ai_tools WHERE slug = 'agentforge'
  UNION ALL
  SELECT id, 'Browser automation', 'No-code automation'
  FROM ai_tools WHERE slug = 'agentgpt'
  UNION ALL
  SELECT id, 'Task execution', 'Agent calling tree'
  FROM ai_tools WHERE slug = 'ailice'
  UNION ALL
  SELECT id, 'Language agents', 'Agent building framework'
  FROM ai_tools WHERE slug = 'agents'
  UNION ALL
  SELECT id, 'Task simulation', 'Multi-agent platform'
  FROM ai_tools WHERE slug = 'agentverse'
  UNION ALL
  SELECT id, 'TypeScript agents', 'Multi-agent system'
  FROM ai_tools WHERE slug = 'ai-legion'
  UNION ALL
  SELECT id, 'Code editing', 'Command line interface'
  FROM ai_tools WHERE slug = 'aider'
  UNION ALL
  SELECT id, 'Multi-agent system', 'Diverse agent framework'
  FROM ai_tools WHERE slug = 'autogen'
  UNION ALL
  SELECT id, 'Autonomous GPT', 'Experimental AI'
  FROM ai_tools WHERE slug = 'autogpt'
  UNION ALL
  SELECT id, 'Code generation', 'Project-aware coding'
  FROM ai_tools WHERE slug = 'automata'
  UNION ALL
  SELECT id, 'Pull requests', 'Automated PR generation'
  FROM ai_tools WHERE slug = 'autopr'
  UNION ALL
  SELECT id, 'Task management', 'AI task framework'
  FROM ai_tools WHERE slug = 'babyagi'
  UNION ALL
  SELECT id, 'Mind exploration', 'Agent architecture'
  FROM ai_tools WHERE slug = 'camel'
  UNION ALL
  SELECT id, 'Software development', 'Dev team simulation'
  FROM ai_tools WHERE slug = 'chatdev'
  UNION ALL
  SELECT id, 'Chemistry research', 'Specialized agent'
  FROM ai_tools WHERE slug = 'chemcrow'
  UNION ALL
  SELECT id, 'Role-playing agents', 'Agent orchestration'
  FROM ai_tools WHERE slug = 'crewai'
  UNION ALL
  SELECT id, 'Chatbot building', 'No-code platform'
  FROM ai_tools WHERE slug = 'databerry';

  -- Add pricing plans
  INSERT INTO tool_pricing (tool_id, plan_name, price, billing_period, features)
  SELECT id, 'Enterprise', 499, 'monthly', ARRAY['Full access', 'Custom support']
  FROM ai_tools WHERE slug = 'adala'
  UNION ALL
  SELECT id, 'Research', 299, 'monthly', ARRAY['Advanced simulation', 'API access']
  FROM ai_tools WHERE slug = 'agent4rec'
  UNION ALL
  SELECT id, 'Pro', 99, 'monthly', ARRAY['Unlimited agents', 'Priority support']
  FROM ai_tools WHERE slug = 'agentforge'
  UNION ALL
  SELECT id, 'Business', 199, 'monthly', ARRAY['Custom automation', 'Team access']
  FROM ai_tools WHERE slug = 'agentgpt'
  UNION ALL
  SELECT id, 'Developer', 49, 'monthly', ARRAY['Advanced features', 'API access']
  FROM ai_tools WHERE slug = 'ailice'
  UNION ALL
  SELECT id, 'Enterprise', 399, 'monthly', ARRAY['Custom deployment', 'Support']
  FROM ai_tools WHERE slug = 'agents'
  UNION ALL
  SELECT id, 'Team', 149, 'monthly', ARRAY['Multi-agent system', 'Collaboration']
  FROM ai_tools WHERE slug = 'agentverse'
  UNION ALL
  SELECT id, 'Pro', 79, 'monthly', ARRAY['Advanced agents', 'Support']
  FROM ai_tools WHERE slug = 'ai-legion'
  UNION ALL
  SELECT id, 'Developer', 29, 'monthly', ARRAY['Full features', 'Updates']
  FROM ai_tools WHERE slug = 'aider'
  UNION ALL
  SELECT id, 'Enterprise', 599, 'monthly', ARRAY['Custom agents', 'Support']
  FROM ai_tools WHERE slug = 'autogen'
  UNION ALL
  SELECT id, 'Pro', 99, 'monthly', ARRAY['Full autonomy', 'API access']
  FROM ai_tools WHERE slug = 'autogpt'
  UNION ALL
  SELECT id, 'Business', 199, 'monthly', ARRAY['Advanced features', 'Support']
  FROM ai_tools WHERE slug = 'automata'
  UNION ALL
  SELECT id, 'Team', 149, 'monthly', ARRAY['Unlimited PRs', 'Priority support']
  FROM ai_tools WHERE slug = 'autopr'
  UNION ALL
  SELECT id, 'Pro', 49, 'monthly', ARRAY['Advanced tasks', 'Support']
  FROM ai_tools WHERE slug = 'babyagi'
  UNION ALL
  SELECT id, 'Research', 299, 'monthly', ARRAY['Full access', 'Support']
  FROM ai_tools WHERE slug = 'camel'
  UNION ALL
  SELECT id, 'Team', 199, 'monthly', ARRAY['Team access', 'Support']
  FROM ai_tools WHERE slug = 'chatdev'
  UNION ALL
  SELECT id, 'Lab', 399, 'monthly', ARRAY['Research features', 'Support']
  FROM ai_tools WHERE slug = 'chemcrow'
  UNION ALL
  SELECT id, 'Business', 299, 'monthly', ARRAY['Advanced agents', 'Support']
  FROM ai_tools WHERE slug = 'crewai'
  UNION ALL
  SELECT id, 'Pro', 79, 'monthly', ARRAY['Advanced features', 'Support']
  FROM ai_tools WHERE slug = 'databerry';

END $$;

-- Update timestamps
UPDATE ai_tools
SET updated_at = CURRENT_TIMESTAMP
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
