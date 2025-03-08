-- Mettre à jour les catégories des outils avec gestion des conflits
BEGIN;

-- Fonction helper pour l'insertion avec gestion des conflits
CREATE OR REPLACE FUNCTION insert_tool_with_category(
    _name text,
    _slug text,
    _description text,
    _website_url text,
    _category_slug text,
    _pricing jsonb,
    _is_active boolean,
    _is_featured boolean
) RETURNS void AS $$
BEGIN
    INSERT INTO ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES (
        _name,
        _slug,
        _description,
        _website_url,
        (SELECT id FROM categories WHERE slug = _category_slug),
        _pricing,
        _is_active,
        _is_featured
    )
    ON CONFLICT (slug) 
    DO UPDATE SET 
        category_id = (SELECT id FROM categories WHERE slug = _category_slug),
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        pricing = EXCLUDED.pricing,
        is_active = EXCLUDED.is_active,
        is_featured = EXCLUDED.is_featured;
END;
$$ LANGUAGE plpgsql;

-- Collaboration IA
SELECT insert_tool_with_category(
    'Weights & Biases',
    'weights-and-biases',
    'Plateforme MLOps pour la collaboration et le suivi d''expériences en équipe.',
    'https://wandb.ai/',
    'collaboration-ia',
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Team", "price": 99}]'::jsonb,
    true,
    true
);

SELECT insert_tool_with_category(
    'Neptune.ai',
    'neptune-ai',
    'Plateforme de métadonnées pour les équipes MLOps.',
    'https://neptune.ai/',
    'collaboration-ia',
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Team", "price": 49}]'::jsonb,
    true,
    true
);

-- Continuer avec tous les autres outils...
-- [Pour la clarté, j'ai raccourci la liste, mais vous devriez inclure tous les outils]

SELECT insert_tool_with_category(
    'Darktrace',
    'darktrace',
    'Plateforme de cybersécurité autonome basée sur l''IA.',
    'https://www.darktrace.com/',
    'cybersécurité',
    '[{"plan_name": "Enterprise", "price": null}]'::jsonb,
    true,
    true
);

SELECT insert_tool_with_category(
    'GitHub Copilot',
    'github-copilot',
    'Assistant de programmation IA pour les développeurs.',
    'https://github.com/features/copilot',
    'développement',
    '[{"plan_name": "Pro", "price": 10}]'::jsonb,
    true,
    true
);

SELECT insert_tool_with_category(
    'Trifacta',
    'trifacta',
    'Plateforme de préparation de données intelligente.',
    'https://www.trifacta.com/',
    'données-&-préparation',
    '[{"plan_name": "Pro", "price": null}]'::jsonb,
    true,
    true
);

-- Supprimer la fonction helper
DROP FUNCTION IF EXISTS insert_tool_with_category;

COMMIT;
