-- Ajout d'outils de rédaction et contenu
BEGIN;

-- Récupérer l'ID de la catégorie
DO $$
DECLARE
    category_id uuid;
BEGIN
    SELECT id INTO category_id FROM categories WHERE slug = 'rédaction-&-contenu';

    -- Ajouter les outils
    INSERT INTO ai_tools (id, name, description, website_url, image_url, category_id)
    VALUES
    (gen_random_uuid(), 'Jasper', 'Assistant d''écriture IA qui aide à créer du contenu marketing, des articles de blog et des copies publicitaires de haute qualité.', 'https://jasper.ai', 'https://images.unsplash.com/photo-1455390582262-044cdead277a?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Copy.ai', 'Plateforme d''IA qui génère des textes créatifs pour le marketing, les réseaux sociaux et les descriptions de produits.', 'https://copy.ai', 'https://images.unsplash.com/photo-1516321165247-4aa89a48be28?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Writesonic', 'Outil d''écriture IA qui crée du contenu optimisé pour le SEO, des articles longs et du contenu viral.', 'https://writesonic.com', 'https://images.unsplash.com/photo-1523726491678-bf852e717f6a?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Grammarly', 'Assistant d''écriture IA qui corrige la grammaire, améliore le style et suggère des améliorations pour rendre les textes plus clairs.', 'https://grammarly.com', 'https://images.unsplash.com/photo-1493612276216-ee3925520721?ixlib=rb-4.0.3', category_id),
    
    (gen_random_uuid(), 'Hemingway Editor', 'Éditeur alimenté par l''IA qui aide à rendre l''écriture plus claire, plus concise et plus impactante.', 'https://hemingwayapp.com', 'https://images.unsplash.com/photo-1509475826633-fed577a2c71b?ixlib=rb-4.0.3', category_id);

END $$;

COMMIT;
