-- Ajout d'outils d'optimisation et performance
BEGIN;

-- Récupérer l'ID de la catégorie
DO $$
DECLARE
    category_id uuid;
BEGIN
    SELECT id INTO category_id FROM categories WHERE slug = 'optimisation-&-performance';

    -- Ajouter les outils
    INSERT INTO ai_tools (id, name, description, website_url, image_url, category_id)
    VALUES
    (gen_random_uuid(), 'Optimizely', 'Plateforme d''expérimentation et d''optimisation qui utilise l''IA pour maximiser les conversions et la performance.', 'https://optimizely.com', 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Dynatrace', 'Solution de monitoring et d''optimisation des performances qui utilise l''IA pour détecter et résoudre les problèmes.', 'https://dynatrace.com', 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'DataDog', 'Plateforme de surveillance et d''analyse des performances avec IA pour l''identification proactive des problèmes.', 'https://datadoghq.com', 'https://images.unsplash.com/photo-1504868584819-f8e8b4b6d7e3?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'New Relic', 'Outil d''observabilité et de performance qui utilise l''IA pour l''analyse prédictive et l''optimisation.', 'https://newrelic.com', 'https://images.unsplash.com/photo-1518186285589-2f7649de83e0?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'AppDynamics', 'Solution de monitoring des applications qui utilise l''IA pour optimiser les performances et l''expérience utilisateur.', 'https://appdynamics.com', 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-4.0.3', category_id);

END $$;

COMMIT;
