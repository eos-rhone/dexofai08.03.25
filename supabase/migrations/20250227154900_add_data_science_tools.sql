-- Ajout d'outils de science des données
BEGIN;

-- Récupérer l'ID de la catégorie
DO $$
DECLARE
    category_id uuid;
BEGIN
    SELECT id INTO category_id FROM categories WHERE slug = 'science-des-données';

    -- Ajouter les outils
    INSERT INTO ai_tools (id, name, description, website_url, image_url, category_id)
    VALUES
    (gen_random_uuid(), 'DataRobot', 'Plateforme d''AutoML qui automatise le processus de création de modèles prédictifs et d''apprentissage automatique.', 'https://datarobot.com', 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'RapidMiner', 'Plateforme complète d''analyse prédictive et de data mining avec des capacités d''IA avancées.', 'https://rapidminer.com', 'https://images.unsplash.com/photo-1518186285589-2f7649de83e0?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'H2O.ai', 'Plateforme open-source d''apprentissage automatique et d''IA qui simplifie l''analyse de données à grande échelle.', 'https://h2o.ai', 'https://images.unsplash.com/photo-1504868584819-f8e8b4b6d7e3?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Dataiku', 'Plateforme de Data Science qui permet aux équipes de collaborer pour créer et déployer des solutions d''IA.', 'https://dataiku.com', 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Knime', 'Plateforme d''analyse de données visuelle qui combine data mining, machine learning et IA sans code.', 'https://knime.com', 'https://images.unsplash.com/photo-1509475826633-fed577a2c71b?ixlib=rb-4.0.3', category_id);

END $$;

COMMIT;
