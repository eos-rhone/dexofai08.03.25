-- Vérifier les outils existants
SELECT name, slug FROM public.ai_tools 
WHERE slug IN (
    'notion-ai-assistant',
    'figma-ai-design',
    'ailice-task-planner',
    'agentgpt',
    'autogen',
    'chatdev',
    'gpt-engineer',
    'midjourney',
    'dall-e',
    'synthesia',
    'adala',
    'agent4rec',
    'agentforge',
    'babyagi',
    'babybeeagi',
    'babycatagi',
    'babydeeragi',
    'babyelfagi'
);
