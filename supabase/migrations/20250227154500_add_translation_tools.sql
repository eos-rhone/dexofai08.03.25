-- Ajout d'outils de traduction et localisation
BEGIN;

-- Récupérer l'ID de la catégorie
DO $$
DECLARE
    category_id uuid;
BEGIN
    SELECT id INTO category_id FROM categories WHERE slug = 'traduction-&-localisation';

    -- Ajouter les outils
    INSERT INTO ai_tools (id, name, description, website_url, image_url, category_id)
    VALUES
    (gen_random_uuid(), 'DeepL Write', 'Un outil d''IA qui aide à rédiger et reformuler des textes dans différentes langues. Utilise l''IA pour améliorer la qualité et le naturel des textes.', 'https://deepl.com/write', 'https://images.unsplash.com/photo-1455390582262-044cdead277a?ixlib=rb-4.0.3', category_id),

    (gen_random_uuid(), 'Lokalise AI', 'Plateforme de localisation alimentée par l''IA qui automatise la traduction de sites web, d''applications et de documents tout en préservant le contexte.', 'https://lokalise.com', 'https://images.unsplash.com/photo-1516321165247-4aa89a48be28?ixlib=rb-4.0.3', category_id),

    (gen_random_uuid(), 'Lilt', 'Système de traduction adaptatif qui apprend de vos corrections et préférences pour améliorer la qualité des traductions au fil du temps.', 'https://lilt.com', 'https://images.unsplash.com/photo-1523726491678-bf852e717f6a?ixlib=rb-4.0.3', category_id),

    (gen_random_uuid(), 'Smartling', 'Solution de traduction d''entreprise utilisant l''IA pour automatiser le workflow de localisation et maintenir la cohérence des marques.', 'https://smartling.com', 'https://images.unsplash.com/photo-1493612276216-ee3925520721?ixlib=rb-4.0.3', category_id),

    (gen_random_uuid(), 'Unbabel', 'Combine l''IA et des traducteurs humains pour fournir des traductions de haute qualité pour le service client et le contenu marketing.', 'https://unbabel.com', 'https://images.unsplash.com/photo-1509475826633-fed577a2c71b?ixlib=rb-4.0.3', category_id),

    (gen_random_uuid(), 'Phrase', 'Plateforme de localisation tout-en-un avec des fonctionnalités d''IA pour la gestion de projets de traduction et la collaboration d''équipe.', 'https://phrase.com', 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-4.0.3', category_id),

    (gen_random_uuid(), 'XTM Cloud', 'Solution de traduction basée sur le cloud qui utilise l''IA pour la traduction automatique et la gestion de la mémoire de traduction.', 'https://xtm.cloud', 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?ixlib=rb-4.0.3', category_id),

    (gen_random_uuid(), 'Intento', 'Plateforme qui compare et sélectionne les meilleurs moteurs de traduction IA pour chaque paire de langues et type de contenu.', 'https://inten.to', 'https://images.unsplash.com/photo-1504868584819-f8e8b4b6d7e3?ixlib=rb-4.0.3', category_id),

    (gen_random_uuid(), 'Lengoo', 'Combine l''IA et des traducteurs experts pour offrir des traductions de haute qualité, spécialisées par secteur d''activité.', 'https://lengoo.com', 'https://images.unsplash.com/photo-1516321497487-e288fb19713f?ixlib=rb-4.0.3', category_id),

    (gen_random_uuid(), 'ModernMT', 'Moteur de traduction adaptatif qui apprend en temps réel des corrections des utilisateurs et s''adapte au style de l''entreprise.', 'https://modernmt.com', 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-4.0.3', category_id);

    -- Ajouter les informations de prix pour chaque outil
    INSERT INTO ai_tools_pricing (id, tool_id, plan_name, price)
    SELECT 
        gen_random_uuid(),
        t.id,
        'Gratuit',
        0
    FROM ai_tools t
    WHERE t.category_id = category_id
    UNION ALL
    SELECT 
        gen_random_uuid(),
        t.id,
        'Pro',
        29.99
    FROM ai_tools t
    WHERE t.category_id = category_id
    UNION ALL
    SELECT 
        gen_random_uuid(),
        t.id,
        'Entreprise',
        99.99
    FROM ai_tools t
    WHERE t.category_id = category_id;

END $$;

COMMIT;
