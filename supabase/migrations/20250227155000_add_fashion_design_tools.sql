-- Ajout d'outils de mode et design
BEGIN;

-- Récupérer l'ID de la catégorie
DO $$
DECLARE
    category_id uuid;
BEGIN
    SELECT id INTO category_id FROM categories WHERE slug = 'mode-&-design';

    -- Ajouter les outils
    INSERT INTO ai_tools (id, name, description, website_url, image_url, category_id)
    VALUES
    (gen_random_uuid(), 'Vue.ai', 'Plateforme d''IA qui crée des mannequins virtuels et personnalise l''expérience shopping pour la mode en ligne.', 'https://vue.ai', 'https://images.unsplash.com/photo-1445205170230-053b83016050?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Stylumia', 'Utilise l''IA pour prédire les tendances de la mode et aider les marques à prendre des décisions basées sur les données.', 'https://stylumia.ai', 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Designomatic', 'Outil de design automatisé qui crée des designs personnalisés pour la mode et les accessoires.', 'https://designomatic.ai', 'https://images.unsplash.com/photo-1558769132-cb1aea458c5e?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Fashion DNA', 'Analyse les tendances de la mode et génère des suggestions de design basées sur l''IA.', 'https://fashiondna.ai', 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Stitch Fix', 'Utilise l''IA pour personnaliser les recommandations de style et créer des collections sur mesure.', 'https://stitchfix.com', 'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?ixlib=rb-4.0.3', category_id);

END $$;

COMMIT;
