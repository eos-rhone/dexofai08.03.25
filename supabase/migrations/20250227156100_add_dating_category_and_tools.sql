-- Ajout de la catégorie rencontres et ses outils
BEGIN;

-- Créer la nouvelle catégorie
INSERT INTO categories (id, name, slug, description)
VALUES (
    gen_random_uuid(),
    'Rencontres & Relations',
    'rencontres-relations',
    'Applications et outils d''IA pour les rencontres amoureuses, l''amitié et les relations sociales'
);

-- Ajouter les outils
DO $$
DECLARE
    category_id uuid;
BEGIN
    SELECT id INTO category_id FROM categories WHERE slug = 'rencontres-relations';

    INSERT INTO ai_tools (id, name, description, website_url, image_url, category_id)
    VALUES
    (gen_random_uuid(), 'Iris Dating', 'Application de rencontres qui utilise l''IA pour créer des matchs plus pertinents basés sur la personnalité et les valeurs communes.', 'https://irisdating.ai', 'https://images.unsplash.com/photo-1517292987719-0369a794ec0f?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Relate AI', 'Assistant relationnel qui analyse vos conversations et donne des conseils pour améliorer votre communication avec votre partenaire.', 'https://relate.ai', 'https://images.unsplash.com/photo-1516589178581-6cd7ef18b4d1?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Lovebot', 'Chatbot qui aide à améliorer les relations de couple en suggérant des activités et en donnant des conseils personnalisés.', 'https://lovebot.app', 'https://images.unsplash.com/photo-1518199266791-5375a83190b7?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Friend Match', 'Plateforme qui utilise l''IA pour connecter des personnes ayant des intérêts communs et faciliter les amitiés authentiques.', 'https://friendmatch.ai', 'https://images.unsplash.com/photo-1529156069898-49953e39b3ac?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Duo Analyzer', 'Outil d''analyse de compatibilité qui utilise l''IA pour évaluer la dynamique des relations et suggérer des pistes d''amélioration.', 'https://duoanalyzer.com', 'https://images.unsplash.com/photo-1516589091380-5d8e21be2dce?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Social Circle', 'Application qui aide à maintenir et enrichir ses relations sociales grâce à des suggestions d''interactions personnalisées par IA.', 'https://socialcircle.ai', 'https://images.unsplash.com/photo-1521543832500-49e69fb2bea2?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Love Language AI', 'Assistant qui analyse votre langage de l''amour et vous aide à mieux comprendre et communiquer avec votre partenaire.', 'https://lovelanguage.ai', 'https://images.unsplash.com/photo-1518199266791-5375a83190b7?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Bonding Time', 'Planificateur intelligent de rendez-vous qui suggère des activités personnalisées pour couples basées sur vos préférences.', 'https://bondingtime.app', 'https://images.unsplash.com/photo-1522098635833-216c03d81fbe?ixlib=rb-4.0.3', category_id);

END $$;

COMMIT;
