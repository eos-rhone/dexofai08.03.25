-- Ajout d'outils de robotique
BEGIN;

-- Récupérer l'ID de la catégorie
DO $$
DECLARE
    category_id uuid;
BEGIN
    SELECT id INTO category_id FROM categories WHERE slug = 'robotique';

    -- Ajouter les outils
    INSERT INTO ai_tools (id, name, description, website_url, image_url, category_id)
    VALUES
    (gen_random_uuid(), 'RobotStudio', 'Plateforme d''ABB qui utilise l''IA pour la programmation, simulation et optimisation des robots industriels.', 'https://new.abb.com/products/robotics/robotstudio', 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Wandelbots', 'Solution no-code qui permet d''entraîner des robots industriels par démonstration en utilisant l''IA.', 'https://wandelbots.com', 'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Vicarious', 'Plateforme d''IA qui permet aux robots d''apprendre et de s''adapter à de nouvelles tâches comme les humains.', 'https://vicarious.com', 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Berkshire Grey', 'Solutions robotiques intelligentes pour l''automatisation des entrepôts et de la logistique.', 'https://berkshiregrey.com', 'https://images.unsplash.com/photo-1581093458791-4b432292cbe9?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Robust.AI', 'Plateforme cognitive pour robots qui combine IA et robotique pour des interactions plus naturelles.', 'https://robust.ai', 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-4.0.3', category_id);

END $$;

COMMIT;
