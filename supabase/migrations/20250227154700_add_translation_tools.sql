-- Ajout d'outils de traduction
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
    (gen_random_uuid(), 'Lokalise AI', 'Plateforme de localisation alimentée par l''IA qui automatise la traduction de sites web, d''applications et de documents.', 'https://lokalise.com', 'https://images.unsplash.com/photo-1516321165247-4aa89a48be28?ixlib=rb-4.0.3', category_id),
    (gen_random_uuid(), 'Lilt', 'Système de traduction adaptatif qui apprend de vos corrections et préférences pour améliorer la qualité des traductions.', 'https://lilt.com', 'https://images.unsplash.com/photo-1523726491678-bf852e717f6a?ixlib=rb-4.0.3', category_id),
    (gen_random_uuid(), 'Smartling', 'Solution de traduction d''entreprise utilisant l''IA pour automatiser le workflow de localisation.', 'https://smartling.com', 'https://images.unsplash.com/photo-1493612276216-ee3925520721?ixlib=rb-4.0.3', category_id),
    (gen_random_uuid(), 'Unbabel', 'Combine l''IA et des traducteurs humains pour fournir des traductions de haute qualité pour le service client.', 'https://unbabel.com', 'https://images.unsplash.com/photo-1509475826633-fed577a2c71b?ixlib=rb-4.0.3', category_id);

END $$;

COMMIT;
