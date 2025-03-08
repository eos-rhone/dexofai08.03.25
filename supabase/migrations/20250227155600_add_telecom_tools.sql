-- Ajout d'outils pour les télécommunications
BEGIN;

-- Récupérer l'ID de la catégorie
DO $$
DECLARE
    category_id uuid;
BEGIN
    SELECT id INTO category_id FROM categories WHERE slug = 'télécommunications';

    -- Ajouter les outils
    INSERT INTO ai_tools (id, name, description, website_url, image_url, category_id)
    VALUES
    (gen_random_uuid(), 'Nokia AVA', 'Plateforme d''IA pour l''optimisation des réseaux télécoms, la maintenance prédictive et l''automatisation des opérations.', 'https://nokia.com/networks/services/nokia-ava', 'https://images.unsplash.com/photo-1544197150-b99a580bb7a8?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Ericsson AI Operations', 'Solution d''IA pour la gestion autonome des réseaux, l''optimisation des performances et la réduction des coûts opérationnels.', 'https://ericsson.com/ai-operations', 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Huawei iMaster', 'Plateforme intelligente de gestion de réseau qui utilise l''IA pour l''automatisation et l''optimisation des réseaux 5G.', 'https://huawei.com/imaster', 'https://images.unsplash.com/photo-1478720568477-152d9b164e26?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Amdocs aia', 'Solution d''IA pour l''expérience client dans les télécoms, incluant le support client et la personnalisation des services.', 'https://amdocs.com/aia', 'https://images.unsplash.com/photo-1516321165247-4aa89a48be28?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'ZTE AI Platform', 'Plateforme d''intelligence artificielle pour l''optimisation des réseaux, la planification et la maintenance prédictive.', 'https://zte.com/ai-platform', 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-4.0.3', category_id);

END $$;

COMMIT;
