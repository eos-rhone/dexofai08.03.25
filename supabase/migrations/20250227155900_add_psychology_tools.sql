-- Ajout d'outils de psychologie
BEGIN;

-- Récupérer l'ID de la catégorie
DO $$
DECLARE
    category_id uuid;
BEGIN
    SELECT id INTO category_id FROM categories WHERE slug = 'psychologie';

    -- Ajouter les outils
    INSERT INTO ai_tools (id, name, description, website_url, image_url, category_id)
    VALUES
    (gen_random_uuid(), 'Woebot', 'Chatbot thérapeutique qui utilise l''IA et la TCC pour aider les gens à gérer leur santé mentale.', 'https://woebot.io', 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Wysa', 'Assistant IA de bien-être émotionnel qui combine intelligence artificielle et techniques de psychologie.', 'https://wysa.io', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Mindstrong', 'Plateforme qui utilise l''IA pour détecter les changements de santé mentale à travers l''utilisation du smartphone.', 'https://mindstrong.com', 'https://images.unsplash.com/photo-1471107340929-a87cd0f5b5f3?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Youper', 'Assistant émotionnel alimenté par l''IA qui aide à suivre et améliorer la santé mentale.', 'https://youper.ai', 'https://images.unsplash.com/photo-1526377337555-424af01f4285?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Moodkit', 'Application basée sur l''IA qui utilise les principes de la TCC pour améliorer l''humeur et le bien-être.', 'https://thriveport.com/products/moodkit', 'https://images.unsplash.com/photo-1493836512294-502baa1986e2?ixlib=rb-4.0.3', category_id);

END $$;

COMMIT;
