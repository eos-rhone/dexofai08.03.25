-- Batch 1 : Agents & Automatisation
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
SELECT 
    d.name,
    LOWER(REGEXP_REPLACE(d.name, '\s+', '-', 'g')),
    d.description,
    d.website_url,
    c.id,
    d.pricing::jsonb,
    true,
    false
FROM (
    VALUES 
    ('AgentGPT', 'Plateforme no-code basée sur le navigateur permettant de créer et déployer des agents IA autonomes. Utilise les fonctions OpenAI et prend en charge GPT-3.5-16k avec des bases de données Pinecone et pg_vector.', 'https://agentgpt.reworkd.ai/', 'Agents & Automatisation', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]'),
    ('AutoGen', 'Framework Microsoft pour développer des agents LLM qui peuvent collaborer entre eux pour résoudre des tâches. Permet une conversation multi-agents avec différents rôles et capacités.', 'https://github.com/microsoft/autogen', 'Agents & Automatisation', '[{"plan_name": "Free", "price": 0}]'),
    ('AutoGPT', 'Agent IA autonome qui peut accomplir des tâches complexes en les décomposant en sous-tâches et en les exécutant de manière itérative. Utilise GPT-4 pour la planification et l''exécution.', 'https://agpt.co', 'Agents & Automatisation', '[{"plan_name": "Open Source", "price": 0}, {"plan_name": "Cloud", "price": 20}]')
) AS d(name, description, website_url, category_name, pricing)
JOIN public.categories c ON c.name = d.category_name
ON CONFLICT (slug) DO UPDATE 
SET 
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;
