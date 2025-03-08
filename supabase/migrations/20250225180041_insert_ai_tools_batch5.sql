-- Batch 5 : Outils de Développement et Gestion

DO $$
DECLARE
    outils_donnees_id uuid;
    recommandation_id uuid;
    dev_agents_id uuid;
BEGIN
    -- Récupérer les IDs des catégories
    SELECT id INTO outils_donnees_id FROM public.categories WHERE name = 'Outils de Données';
    SELECT id INTO recommandation_id FROM public.categories WHERE name = 'Recommandation';
    SELECT id INTO dev_agents_id FROM public.categories WHERE name = 'Développement d''Agents';

    -- Adala
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Adala',
        'adala',
        'Framework d''annotation de données qui utilise l''IA pour automatiser et améliorer le processus d''étiquetage des données, avec un focus sur la qualité et l''efficacité.',
        'https://github.com/HumanSignal/Adala',
        outils_donnees_id,
        '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) DO NOTHING;

    -- Agent4Rec
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Agent4Rec',
        'agent4rec',
        'Système de recommandation basé sur des agents IA qui personnalise les suggestions en fonction des préférences et du comportement des utilisateurs.',
        'https://github.com/LehengTHU/Agent4Rec',
        recommandation_id,
        '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) DO NOTHING;

    -- AgentForge
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'AgentForge',
        'agentforge',
        'Plateforme de développement d''agents IA qui simplifie la création et le déploiement d''agents autonomes pour diverses tâches.',
        'https://github.com/DataBassGit/AgentForge',
        dev_agents_id,
        '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) DO NOTHING;
END $$;
