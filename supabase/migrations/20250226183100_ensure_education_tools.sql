-- S'assurer que tous les outils d'éducation sont présents
BEGIN;

DO $$ 
DECLARE
    education_category_id uuid;
BEGIN
    -- Récupérer l'ID de la catégorie Éducation
    SELECT id INTO education_category_id FROM categories WHERE slug = 'education';

    -- Mettre à jour les outils existants pour s'assurer qu'ils sont dans la bonne catégorie
    UPDATE ai_tools 
    SET category_id = education_category_id
    WHERE slug IN (
        'century-tech',
        'carnegie-learning',
        'third-space-learning',
        'querium',
        'content-technologies',
        'knewton',
        'cognii',
        'gradescope',
        'thinkster-math',
        'duolingo'
    );

    -- Ajouter ou mettre à jour Century Tech
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Century Tech',
        'century-tech',
        'Plateforme d''apprentissage adaptatif utilisant l''IA pour personnaliser l''éducation.',
        'https://www.century.tech/',
        education_category_id,
        '[{"plan_name": "École", "price": null}, {"plan_name": "Institution", "price": null}]'::jsonb,
        true,
        true
    )
    ON CONFLICT (slug) 
    DO UPDATE SET 
        category_id = EXCLUDED.category_id,
        description = EXCLUDED.description,
        pricing = EXCLUDED.pricing,
        is_active = EXCLUDED.is_active,
        is_featured = EXCLUDED.is_featured;

    -- Ajouter ou mettre à jour Cognii
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Cognii',
        'cognii',
        'Assistant virtuel pour l''évaluation et le feedback en éducation.',
        'https://www.cognii.com/',
        education_category_id,
        '[{"plan_name": "Institution", "price": null}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) 
    DO UPDATE SET 
        category_id = EXCLUDED.category_id,
        description = EXCLUDED.description,
        pricing = EXCLUDED.pricing,
        is_active = EXCLUDED.is_active,
        is_featured = EXCLUDED.is_featured;

    -- Ajouter ou mettre à jour Content Technologies
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Content Technologies',
        'content-technologies',
        'Création de contenu éducatif personnalisé par IA.',
        'https://contenttechnologies.com/',
        education_category_id,
        '[{"plan_name": "Pro", "price": null}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) 
    DO UPDATE SET 
        category_id = EXCLUDED.category_id,
        description = EXCLUDED.description,
        pricing = EXCLUDED.pricing,
        is_active = EXCLUDED.is_active,
        is_featured = EXCLUDED.is_featured;

    -- Ajouter ou mettre à jour Gradescope
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Gradescope',
        'gradescope',
        'Évaluation automatisée des travaux avec IA.',
        'https://www.gradescope.com/',
        education_category_id,
        '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Institution", "price": null}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) 
    DO UPDATE SET 
        category_id = EXCLUDED.category_id,
        description = EXCLUDED.description,
        pricing = EXCLUDED.pricing,
        is_active = EXCLUDED.is_active,
        is_featured = EXCLUDED.is_featured;

    -- Ajouter ou mettre à jour Knewton
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Knewton',
        'knewton',
        'Plateforme d''apprentissage adaptatif pour l''enseignement supérieur.',
        'https://www.knewton.com/',
        education_category_id,
        '[{"plan_name": "Base", "price": 0}, {"plan_name": "Premium", "price": 79}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) 
    DO UPDATE SET 
        category_id = EXCLUDED.category_id,
        description = EXCLUDED.description,
        pricing = EXCLUDED.pricing,
        is_active = EXCLUDED.is_active,
        is_featured = EXCLUDED.is_featured;

    -- Ajouter ou mettre à jour Querium
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Querium',
        'querium',
        'Tutorat STEM personnalisé avec intelligence artificielle.',
        'https://www.querium.com/',
        education_category_id,
        '[{"plan_name": "Étudiant", "price": 29}, {"plan_name": "Institution", "price": null}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) 
    DO UPDATE SET 
        category_id = EXCLUDED.category_id,
        description = EXCLUDED.description,
        pricing = EXCLUDED.pricing,
        is_active = EXCLUDED.is_active,
        is_featured = EXCLUDED.is_featured;

    -- Ajouter ou mettre à jour Thinkster Math
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Thinkster Math',
        'thinkster-math',
        'Tutorat en mathématiques avec analyse IA du travail des élèves.',
        'https://hellothinkster.com/',
        education_category_id,
        '[{"plan_name": "Mensuel", "price": 39}, {"plan_name": "Annuel", "price": 360}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) 
    DO UPDATE SET 
        category_id = EXCLUDED.category_id,
        description = EXCLUDED.description,
        pricing = EXCLUDED.pricing,
        is_active = EXCLUDED.is_active,
        is_featured = EXCLUDED.is_featured;

    -- Ajouter ou mettre à jour Third Space Learning
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        'Third Space Learning',
        'third-space-learning',
        'Tutorat en mathématiques personnalisé avec IA.',
        'https://thirdspacelearning.com/',
        education_category_id,
        '[{"plan_name": "Basic", "price": 49}, {"plan_name": "Premium", "price": 99}]'::jsonb,
        true,
        false
    )
    ON CONFLICT (slug) 
    DO UPDATE SET 
        category_id = EXCLUDED.category_id,
        description = EXCLUDED.description,
        pricing = EXCLUDED.pricing,
        is_active = EXCLUDED.is_active,
        is_featured = EXCLUDED.is_featured;

END $$;

COMMIT;
