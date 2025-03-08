-- Batch 4 : Productivité et Design

DO $$
DECLARE
    productivite_id uuid;
    design_id uuid;
BEGIN
    -- Récupérer les IDs des catégories
    SELECT id INTO productivite_id FROM public.categories WHERE name = 'Productivité';
    SELECT id INTO design_id FROM public.categories WHERE name = 'Design';

    -- Notion AI
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Notion AI',
        'notion-ai-assistant',
        'Assistant d''écriture et d''organisation intégré à Notion, aidant à la rédaction, au résumé et à l''analyse de contenu.',
        'https://www.notion.so/product/ai',
        productivite_id,
        '[{"plan_name": "With Notion", "price": 10}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) DO NOTHING;

    -- Figma AI
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Figma AI',
        'figma-ai-design',
        'Ensemble d''outils IA intégrés à Figma pour améliorer le processus de design, incluant la génération de variantes et l''aide à la mise en page.',
        'https://www.figma.com/ai',
        design_id,
        '[{"plan_name": "Included", "price": 0}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) DO NOTHING;

    -- AIlice
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'AIlice',
        'ailice-task-planner',
        'Agent sous forme de chatbot qui planifie indépendamment les tâches données en langage naturel et crée dynamiquement un arbre d''appels d''agents pour les exécuter.',
        'https://github.com/myshell-ai/AIlice',
        productivite_id,
        '[{"plan_name": "Open Source", "price": 0}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) DO NOTHING;
END $$;
