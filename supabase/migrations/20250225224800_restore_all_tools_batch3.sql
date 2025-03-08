-- Restauration de tous les outils - Batch 3
DO $$
DECLARE
    gen_images_id uuid;
    video_id uuid;
    nlp_id uuid;
    vision_id uuid;
    education_id uuid;
    redaction_contenu_id uuid;
    productivite_id uuid;
    design_id uuid;
BEGIN
    -- Récupérer les IDs des catégories
    SELECT id INTO gen_images_id FROM public.categories WHERE name = 'Génération d''images';
    SELECT id INTO video_id FROM public.categories WHERE name = 'Vidéo';
    SELECT id INTO nlp_id FROM public.categories WHERE name = 'Traitement du Langage Naturel';
    SELECT id INTO vision_id FROM public.categories WHERE name = 'Vision par Ordinateur';
    SELECT id INTO education_id FROM public.categories WHERE name = 'Éducation';
    SELECT id INTO redaction_contenu_id FROM public.categories WHERE name = 'Rédaction & Contenu';
    SELECT id INTO productivite_id FROM public.categories WHERE name = 'Productivité';
    SELECT id INTO design_id FROM public.categories WHERE name = 'Design';

    -- Batch 3 : Outils de génération et traitement de contenu
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES
    -- Génération d'Images Supplémentaires
    ('Leonardo.ai', 'leonardo-ai', 'Plateforme de génération d''images IA spécialisée dans les assets pour jeux vidéo et design.', 'https://leonardo.ai/', gen_images_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 19}]'::jsonb, true, true),
    ('Runway', 'runway', 'Suite d''outils créatifs IA pour l''édition d''images et de vidéos.', 'https://runwayml.com/', gen_images_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 15}]'::jsonb, true, true),
    ('Stable Diffusion XL', 'stable-diffusion-xl', 'Version améliorée de Stable Diffusion avec une meilleure qualité d''image.', 'https://stability.ai/stable-diffusion', gen_images_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "API", "price": -1}]'::jsonb, true, true),
    ('Canva AI', 'canva-ai', 'Fonctionnalités IA intégrées à Canva pour la création de designs.', 'https://www.canva.com/', gen_images_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 12.99}]'::jsonb, true, true),
    ('Photosonic', 'photosonic', 'Générateur d''images IA par Writesonic avec style artistique personnalisable.', 'https://photosonic.writesonic.com/', gen_images_id, '[{"plan_name": "With Writesonic", "price": 19}]'::jsonb, true, false),

    -- Vidéo Avancée
    ('Runway Gen-2', 'runway-gen2', 'Modèle de génération vidéo text-to-video de nouvelle génération.', 'https://runwayml.com/gen-2/', video_id, '[{"plan_name": "Pro", "price": 15}]'::jsonb, true, true),
    ('Descript Video', 'descript-video', 'Éditeur vidéo basé sur le texte avec fonctionnalités IA avancées.', 'https://www.descript.com/video-editor', video_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 24}]'::jsonb, true, true),
    ('Kapwing', 'kapwing', 'Suite d''outils en ligne pour l''édition vidéo avec fonctionnalités IA.', 'https://www.kapwing.com/', video_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]'::jsonb, true, false),
    ('InVideo AI', 'invideo-ai', 'Plateforme de création vidéo automatisée pour le marketing.', 'https://invideo.io/', video_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Business", "price": 30}]'::jsonb, true, false),
    ('Pictory', 'pictory', 'Outil de création de vidéos courtes à partir de longs contenus.', 'https://pictory.ai/', video_id, '[{"plan_name": "Standard", "price": 19}, {"plan_name": "Premium", "price": 39}]'::jsonb, true, false),

    -- Traitement du Langage Naturel Avancé
    ('Anthropic Claude 2', 'claude-2', 'Assistant IA avancé avec capacités de raisonnement et d''analyse.', 'https://www.anthropic.com/claude', nlp_id, '[{"plan_name": "API", "price": -1}]'::jsonb, true, true),
    ('Cohere Command', 'cohere-command', 'Modèle de langage spécialisé pour les applications business.', 'https://cohere.com/command', nlp_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": -1}]'::jsonb, true, true),
    ('LangChain', 'langchain', 'Framework pour développer des applications basées sur les LLMs.', 'https://langchain.com/', nlp_id, '[{"plan_name": "Open Source", "price": 0}, {"plan_name": "Cloud", "price": -1}]'::jsonb, true, true),
    ('GPT-4 Vision', 'gpt4-vision', 'Version de GPT-4 capable d''analyser et de comprendre les images.', 'https://openai.com/gpt-4', nlp_id, '[{"plan_name": "API", "price": -1}]'::jsonb, true, true),
    ('Llama 2', 'llama-2', 'Modèle de langage open source par Meta.', 'https://ai.meta.com/llama/', nlp_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),

    -- Vision par Ordinateur
    ('Clarifai', 'clarifai', 'Plateforme de vision par ordinateur pour la reconnaissance d''objets et d''images.', 'https://www.clarifai.com/', vision_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Enterprise", "price": -1}]'::jsonb, true, true),
    ('Roboflow', 'roboflow', 'Plateforme pour créer et déployer des modèles de vision par ordinateur.', 'https://roboflow.com/', vision_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 50}]'::jsonb, true, true),
    ('Hasty.ai', 'hasty-ai', 'Plateforme d''annotation d''images assistée par IA.', 'https://hasty.ai/', vision_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Team", "price": 15}]'::jsonb, true, false),
    ('Supervision', 'supervision', 'Bibliothèque Python pour la vision par ordinateur en production.', 'https://supervision.roboflow.com/', vision_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),
    ('Ultralytics YOLOv8', 'yolov8', 'Dernière version de YOLO pour la détection d''objets.', 'https://ultralytics.com/yolov8', vision_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),

    -- Design et UX
    ('Adobe Firefly', 'adobe-firefly', 'Suite d''outils créatifs IA intégrée aux produits Adobe.', 'https://www.adobe.com/products/firefly.html', design_id, '[{"plan_name": "Creative Cloud", "price": 20.99}]'::jsonb, true, true),
    ('Framer AI', 'framer-ai', 'Outils de design IA pour créer des sites web rapidement.', 'https://www.framer.com/', design_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 20}]'::jsonb, true, true),
    ('Remove.bg', 'remove-bg', 'Outil pour supprimer automatiquement l''arrière-plan des images.', 'https://www.remove.bg/', design_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 9}]'::jsonb, true, true),
    ('Uizard', 'uizard', 'Plateforme de design d''interface utilisant l''IA.', 'https://uizard.io/', design_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 39}]'::jsonb, true, false),
    ('Designs.ai', 'designs-ai', 'Suite d''outils de design automatisé pour le branding.', 'https://designs.ai/', design_id, '[{"plan_name": "Basic", "price": 29}]'::jsonb, true, false)

    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

END $$;
