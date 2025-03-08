-- Batch 2 : Génération de Code
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
    ('ChatDev', 'Assistant de développement logiciel qui simule une entreprise de développement logiciel avec plusieurs agents IA collaborant sur des projets.', 'https://github.com/OpenBMB/ChatDev', 'Génération de Code', '[{"plan_name": "Free", "price": 0}]'),
    ('GPT Engineer', 'Spécifie ce que vous voulez construire, l''IA pose des questions de clarification et crée le code. Idéal pour le développement rapide de projets.', 'https://gptengineer.app/', 'Génération de Code', '[{"plan_name": "Free", "price": 0}]'),
    ('Aider', 'Assistant de programmation IA qui aide au développement en temps réel avec des suggestions de code contextuelles.', 'https://github.com/paul-gauthier/aider', 'Génération de Code', '[{"plan_name": "Open Source", "price": 0}]')
) AS d(name, description, website_url, category_name, pricing)
JOIN public.categories c ON c.name = d.category_name
ON CONFLICT (slug) DO UPDATE 
SET 
    description = EXCLUDED.description,
    website_url = EXCLUDED.website_url,
    category_id = EXCLUDED.category_id,
    pricing = EXCLUDED.pricing,
    updated_at = CURRENT_TIMESTAMP;
