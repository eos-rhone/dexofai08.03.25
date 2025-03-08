-- Ajout d'outils pour le métavers et les mondes virtuels
BEGIN;

-- Récupérer l'ID de la catégorie
DO $$
DECLARE
    category_id uuid;
BEGIN
    SELECT id INTO category_id FROM categories WHERE slug = 'métavers-&-mondes-virtuels';

    -- Ajouter les outils
    INSERT INTO ai_tools (id, name, description, website_url, image_url, category_id)
    VALUES
    (gen_random_uuid(), 'Ready Player Me', 'Plateforme de création d''avatars 3D cross-platform propulsée par l''IA pour le métavers.', 'https://readyplayer.me', 'https://images.unsplash.com/photo-1614729939124-032d1e5c9bc5?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Nvidia Omniverse', 'Plateforme de simulation et de collaboration 3D en temps réel utilisant l''IA pour créer des mondes virtuels.', 'https://nvidia.com/omniverse', 'https://images.unsplash.com/photo-1578632292335-df3abbb0d586?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Spatial', 'Plateforme de collaboration en réalité augmentée qui utilise l''IA pour créer des espaces de travail virtuels.', 'https://spatial.io', 'https://images.unsplash.com/photo-1593508512255-86ab42a8e620?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Roblox Studio', 'Plateforme de création de jeux et d''expériences virtuelles avec des outils d''IA intégrés.', 'https://roblox.com/create', 'https://images.unsplash.com/photo-1624953587687-daf255b6b80a?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Decentraland', 'Plateforme de métavers décentralisée qui utilise l''IA pour la création de contenu et l''interaction sociale.', 'https://decentraland.org', 'https://images.unsplash.com/photo-1620641788421-7a1c342ea42e?ixlib=rb-4.0.3', category_id);

END $$;

COMMIT;
