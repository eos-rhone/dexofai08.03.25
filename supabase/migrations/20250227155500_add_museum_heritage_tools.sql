-- Ajout d'outils pour musées et patrimoine
BEGIN;

-- Récupérer l'ID de la catégorie
DO $$
DECLARE
    category_id uuid;
BEGIN
    SELECT id INTO category_id FROM categories WHERE slug = 'musées-&-patrimoine';

    -- Ajouter les outils
    INSERT INTO ai_tools (id, name, description, website_url, image_url, category_id)
    VALUES
    (gen_random_uuid(), 'Smartify', 'Application qui utilise l''IA pour reconnaître les œuvres d''art et fournir des informations détaillées aux visiteurs de musées.', 'https://smartify.org', 'https://images.unsplash.com/photo-1503632235391-aaad5d39c234?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Dexibit', 'Plateforme d''analyse prédictive pour les musées qui utilise l''IA pour optimiser les expositions et l''expérience visiteur.', 'https://dexibit.com', 'https://images.unsplash.com/photo-1566127444979-b3d2b654e3d7?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Artrendex', 'Utilise l''IA pour analyser et authentifier les œuvres d''art, détecter les contrefaçons et étudier les styles artistiques.', 'https://artrendex.com', 'https://images.unsplash.com/photo-1544967082-d9d25d867d66?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'CultureTech', 'Solution de numérisation 3D et de conservation numérique du patrimoine utilisant l''IA pour la préservation.', 'https://culturetech.ai', 'https://images.unsplash.com/photo-1572953109194-a7e0e2452286?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'MuseumView', 'Plateforme de visite virtuelle de musées qui utilise l''IA pour créer des expériences immersives et éducatives.', 'https://museumview.art', 'https://images.unsplash.com/photo-1565060169194-19fabf37c0ce?ixlib=rb-4.0.3', category_id);

END $$;

COMMIT;
