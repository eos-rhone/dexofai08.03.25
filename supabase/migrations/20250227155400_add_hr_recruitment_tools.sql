-- Ajout d'outils RH et recrutement
BEGIN;

-- Récupérer l'ID de la catégorie
DO $$
DECLARE
    category_id uuid;
BEGIN
    SELECT id INTO category_id FROM categories WHERE slug = 'rh-recrutement';

    -- Ajouter les outils
    INSERT INTO ai_tools (id, name, description, website_url, image_url, category_id)
    VALUES
    (gen_random_uuid(), 'HiredScore', 'Plateforme d''IA qui automatise le screening des CV et identifie les meilleurs candidats en fonction des critères de l''entreprise.', 'https://hiredscore.com', 'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Pymetrics', 'Utilise l''IA et les neurosciences pour évaluer les soft skills et matcher les candidats avec les postes appropriés.', 'https://pymetrics.ai', 'https://images.unsplash.com/photo-1552664730-d307ca884978?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'HiredVue', 'Solution d''entretiens vidéo alimentée par l''IA qui analyse le langage, le ton et les expressions faciales.', 'https://hirevue.com', 'https://images.unsplash.com/photo-1516321165247-4aa89a48be28?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Eightfold AI', 'Plateforme de gestion des talents qui utilise l''IA pour le recrutement, la mobilité interne et la rétention.', 'https://eightfold.ai', 'https://images.unsplash.com/photo-1521791136064-7986c2920216?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Ideal', 'Automatise le screening des CV, le sourcing et l''engagement des candidats grâce à l''IA.', 'https://ideal.com', 'https://images.unsplash.com/photo-1600880292203-757bb62b4baf?ixlib=rb-4.0.3', category_id);

END $$;

COMMIT;
