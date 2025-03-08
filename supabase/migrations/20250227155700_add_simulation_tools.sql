-- Ajout d'outils de simulation
BEGIN;

-- Récupérer l'ID de la catégorie
DO $$
DECLARE
    category_id uuid;
BEGIN
    SELECT id INTO category_id FROM categories WHERE slug = 'simulation';

    -- Ajouter les outils
    INSERT INTO ai_tools (id, name, description, website_url, image_url, category_id)
    VALUES
    (gen_random_uuid(), 'AnyLogic AI', 'Plateforme de simulation multi-méthode qui utilise l''IA pour modéliser des systèmes complexes et prédire leur comportement.', 'https://anylogic.com', 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'SimScale', 'Plateforme cloud de simulation numérique qui utilise l''IA pour la simulation de fluides, thermique et mécanique.', 'https://simscale.com', 'https://images.unsplash.com/photo-1527430253228-e93688616381?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'NVIDIA Isaac Sim', 'Plateforme de simulation robotique qui utilise l''IA pour créer des environnements virtuels réalistes pour l''entraînement.', 'https://developer.nvidia.com/isaac-sim', 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Ansys AI', 'Suite de simulation engineering qui intègre l''IA pour optimiser les simulations et accélérer la conception.', 'https://ansys.com/ai', 'https://images.unsplash.com/photo-1581093458791-4b432292cbe9?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Unity Simulation Pro', 'Plateforme de simulation en temps réel qui utilise l''IA pour créer des scénarios complexes et réalistes.', 'https://unity.com/products/simulation-pro', 'https://images.unsplash.com/photo-1478720568477-152d9b164e26?ixlib=rb-4.0.3', category_id);

END $$;

COMMIT;
