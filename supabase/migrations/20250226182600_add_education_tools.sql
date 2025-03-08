-- Ajouter des outils pour la catégorie Éducation
BEGIN;

DO $$ 
DECLARE
    education_category_id uuid;
BEGIN
    SELECT id INTO education_category_id FROM categories WHERE slug = 'éducation';

    -- Century Tech
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'century-tech') THEN
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
        );
    END IF;

    -- Carnegie Learning
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'carnegie-learning') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Carnegie Learning',
            'carnegie-learning',
            'Solutions d''apprentissage des mathématiques basées sur l''IA.',
            'https://www.carnegielearning.com/',
            education_category_id,
            '[{"plan_name": "Scolaire", "price": null}, {"plan_name": "Universitaire", "price": null}]'::jsonb,
            true,
            true
        );
    END IF;

    -- Third Space Learning
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'third-space-learning') THEN
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
        );
    END IF;

    -- Querium
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'querium') THEN
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
        );
    END IF;

    -- Content Technologies
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'content-technologies') THEN
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
        );
    END IF;

    -- Knewton
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'knewton') THEN
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
        );
    END IF;

    -- Cognii
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'cognii') THEN
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
        );
    END IF;

    -- Gradescope
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'gradescope') THEN
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
        );
    END IF;

    -- Thinkster Math
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'thinkster-math') THEN
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
        );
    END IF;

    -- Duolingo
    IF NOT EXISTS (SELECT 1 FROM ai_tools WHERE slug = 'duolingo') THEN
        INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
        VALUES (
            'Duolingo',
            'duolingo',
            'Apprentissage des langues adaptatif avec IA.',
            'https://www.duolingo.com/',
            education_category_id,
            '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Plus", "price": 6.99}]'::jsonb,
            true,
            true
        );
    END IF;

END $$;

COMMIT;
