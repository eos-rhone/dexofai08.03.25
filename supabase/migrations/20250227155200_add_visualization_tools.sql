-- Ajout d'outils de visualisation et analyse
BEGIN;

-- Récupérer l'ID de la catégorie
DO $$
DECLARE
    category_id uuid;
BEGIN
    SELECT id INTO category_id FROM categories WHERE slug = 'visualisation-&-analyse';

    -- Ajouter les outils
    INSERT INTO ai_tools (id, name, description, website_url, image_url, category_id)
    VALUES
    (gen_random_uuid(), 'Tableau AI', 'Plateforme de visualisation de données qui intègre l''IA pour créer automatiquement des insights et des visualisations pertinentes.', 'https://tableau.com/ai', 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Power BI', 'Solution Microsoft de business intelligence avec des capacités d''IA pour l''analyse prédictive et la visualisation automatique.', 'https://powerbi.microsoft.com', 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'ThoughtSpot', 'Plateforme d''analyse augmentée par l''IA qui permet de rechercher et visualiser des données en langage naturel.', 'https://thoughtspot.com', 'https://images.unsplash.com/photo-1504868584819-f8e8b4b6d7e3?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Looker', 'Plateforme d''analyse de données de Google Cloud avec des fonctionnalités d''IA pour la découverte d''insights.', 'https://looker.com', 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Qlik Sense', 'Solution d''analyse visuelle qui utilise l''IA pour suggérer des visualisations et découvrir des patterns cachés.', 'https://qlik.com/sense', 'https://images.unsplash.com/photo-1504868584819-f8e8b4b6d7e3?ixlib=rb-4.0.3', category_id);

END $$;

COMMIT;
