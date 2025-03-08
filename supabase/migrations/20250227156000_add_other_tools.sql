-- Ajout d'outils divers
BEGIN;

-- Récupérer l'ID de la catégorie
DO $$
DECLARE
    category_id uuid;
BEGIN
    SELECT id INTO category_id FROM categories WHERE slug = 'autre';

    -- Ajouter les outils
    INSERT INTO ai_tools (id, name, description, website_url, image_url, category_id)
    VALUES
    (gen_random_uuid(), 'Replika', 'Compagnon IA personnel qui évolue en apprenant de vos conversations et interactions.', 'https://replika.ai', 'https://images.unsplash.com/photo-1531746790731-6bf607ccff6f?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'RunwayML', 'Plateforme créative qui permet d''expérimenter avec l''IA pour créer des projets innovants.', 'https://runwayml.com', 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Synthesia', 'Plateforme qui crée des vidéos personnalisées avec des avatars IA parlant plusieurs langues.', 'https://synthesia.io', 'https://images.unsplash.com/photo-1485846234645-a62644f84728?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Lobe', 'Outil visuel de Microsoft qui permet d''entraîner des modèles d''IA sans code.', 'https://lobe.ai', 'https://images.unsplash.com/photo-1534972195531-d756b9bfa9f2?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Roam Research', 'Outil de prise de notes qui utilise l''IA pour créer des connexions entre les idées.', 'https://roamresearch.com', 'https://images.unsplash.com/photo-1512314889357-e157c22f938d?ixlib=rb-4.0.3', category_id);

END $$;

COMMIT;
