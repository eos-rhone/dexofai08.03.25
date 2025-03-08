-- Restauration de tous les outils - Batch 2
DO $$
DECLARE
    agents_auto_id uuid;
    gen_code_id uuid;
    gen_images_id uuid;
    audio_voix_id uuid;
    video_id uuid;
    productivite_id uuid;
    design_id uuid;
    outils_donnees_id uuid;
    recommandation_id uuid;
    dev_agents_id uuid;
    gestion_taches_id uuid;
    nlp_id uuid;
    vision_id uuid;
    education_id uuid;
    robotique_id uuid;
    business_id uuid;
    creation_musicale_id uuid;
    analyse_donnees_id uuid;
    redaction_contenu_id uuid;
BEGIN
    -- Récupérer les IDs des catégories
    SELECT id INTO agents_auto_id FROM public.categories WHERE name = 'Agents & Automatisation';
    SELECT id INTO gen_code_id FROM public.categories WHERE name = 'Génération de Code';
    SELECT id INTO gen_images_id FROM public.categories WHERE name = 'Génération d''images';
    SELECT id INTO audio_voix_id FROM public.categories WHERE name = 'Audio & Voix';
    SELECT id INTO video_id FROM public.categories WHERE name = 'Vidéo';
    SELECT id INTO productivite_id FROM public.categories WHERE name = 'Productivité';
    SELECT id INTO design_id FROM public.categories WHERE name = 'Design';
    SELECT id INTO outils_donnees_id FROM public.categories WHERE name = 'Outils de Données';
    SELECT id INTO recommandation_id FROM public.categories WHERE name = 'Recommandation';
    SELECT id INTO dev_agents_id FROM public.categories WHERE name = 'Développement d''Agents';
    SELECT id INTO gestion_taches_id FROM public.categories WHERE name = 'Gestion des Tâches';
    SELECT id INTO nlp_id FROM public.categories WHERE name = 'Traitement du Langage Naturel';
    SELECT id INTO vision_id FROM public.categories WHERE name = 'Vision par Ordinateur';
    SELECT id INTO education_id FROM public.categories WHERE name = 'Éducation';
    SELECT id INTO robotique_id FROM public.categories WHERE name = 'Robotique';
    SELECT id INTO business_id FROM public.categories WHERE name = 'Business & Marketing';
    SELECT id INTO creation_musicale_id FROM public.categories WHERE name = 'Création Musicale';
    SELECT id INTO analyse_donnees_id FROM public.categories WHERE name = 'Analyse de Données';
    SELECT id INTO redaction_contenu_id FROM public.categories WHERE name = 'Rédaction & Contenu';

    -- Batch 2 : Plus d'outils dans différentes catégories
    INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
    VALUES
    -- Création Musicale
    ('Amper', 'amper', 'Plateforme de composition musicale assistée par IA pour créer des musiques personnalisées.', 'https://www.ampermusic.com/', creation_musicale_id, '[{"plan_name": "Pro", "price": 29.99}]'::jsonb, true, true),
    ('AIVA', 'aiva', 'IA compositeur qui crée des musiques émotionnelles pour films, jeux et publicités.', 'https://www.aiva.ai/', creation_musicale_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 19}]'::jsonb, true, true),
    ('Soundraw', 'soundraw', 'Générateur de musique IA qui crée des pistes uniques basées sur vos préférences.', 'https://soundraw.io/', creation_musicale_id, '[{"plan_name": "Basic", "price": 9.99}]'::jsonb, true, false),

    -- Analyse de Données
    ('Tableau AI', 'tableau-ai', 'Fonctionnalités d''IA intégrées à Tableau pour l''analyse et la visualisation de données.', 'https://www.tableau.com/products/ai-analytics', analyse_donnees_id, '[{"plan_name": "Enterprise", "price": -1}]'::jsonb, true, true),
    ('DataRobot', 'datarobot', 'Plateforme d''IA automatisée pour l''analyse prédictive et le machine learning.', 'https://www.datarobot.com/', analyse_donnees_id, '[{"plan_name": "Enterprise", "price": -1}]'::jsonb, true, true),
    ('MindsDB', 'mindsdb', 'Plateforme open source pour ajouter des capacités de prédiction à toute base de données.', 'https://mindsdb.com/', analyse_donnees_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 99}]'::jsonb, true, false),

    -- Rédaction & Contenu
    ('Jasper', 'jasper', 'Assistant d''écriture IA pour créer du contenu marketing de qualité.', 'https://www.jasper.ai/', redaction_contenu_id, '[{"plan_name": "Starter", "price": 39}, {"plan_name": "Pro", "price": 99}]'::jsonb, true, true),
    ('Copy.ai', 'copyai', 'Outil de génération de contenu marketing utilisant GPT-3.', 'https://www.copy.ai/', redaction_contenu_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 49}]'::jsonb, true, true),
    ('Writesonic', 'writesonic', 'Plateforme d''écriture IA pour créer des articles, descriptions et publicités.', 'https://writesonic.com/', redaction_contenu_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 19}]'::jsonb, true, false),

    -- Éducation
    ('Duolingo Max', 'duolingo-max', 'Version avancée de Duolingo avec des fonctionnalités d''IA pour l''apprentissage des langues.', 'https://www.duolingo.com/max', education_id, '[{"plan_name": "Max", "price": 19.99}]'::jsonb, true, true),
    ('Gradescope', 'gradescope', 'Outil d''évaluation assisté par IA pour les enseignants.', 'https://www.gradescope.com/', education_id, '[{"plan_name": "Basic", "price": 0}, {"plan_name": "Institution", "price": -1}]'::jsonb, true, false),
    ('Carnegie Learning', 'carnegie-learning', 'Plateforme d''apprentissage adaptative pour les mathématiques.', 'https://www.carnegielearning.com/', education_id, '[{"plan_name": "School", "price": -1}]'::jsonb, true, false),

    -- Robotique
    ('ROS 2', 'ros2', 'Framework open source pour le développement de robots avec intégration IA.', 'https://docs.ros.org/en/rolling/', robotique_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, true),
    ('Isaac Sim', 'isaac-sim', 'Plateforme de simulation robotique avec capacités d''IA de NVIDIA.', 'https://developer.nvidia.com/isaac-sim', robotique_id, '[{"plan_name": "Free", "price": 0}]'::jsonb, true, true),
    ('Gazebo', 'gazebo', 'Simulateur robotique open source avec support pour l''apprentissage par renforcement.', 'https://gazebosim.org/', robotique_id, '[{"plan_name": "Open Source", "price": 0}]'::jsonb, true, false),

    -- Business & Marketing
    ('HubSpot AI', 'hubspot-ai', 'Suite d''outils IA intégrés à HubSpot pour le marketing et les ventes.', 'https://www.hubspot.com/ai', business_id, '[{"plan_name": "Starter", "price": 45}, {"plan_name": "Pro", "price": 890}]'::jsonb, true, true),
    ('Salesforce Einstein', 'salesforce-einstein', 'IA intégrée à Salesforce pour l''analyse prédictive et l''automatisation.', 'https://www.salesforce.com/products/einstein/overview/', business_id, '[{"plan_name": "Enterprise", "price": -1}]'::jsonb, true, true),
    ('Drift', 'drift', 'Plateforme de conversation marketing avec chatbots IA.', 'https://www.drift.com/', business_id, '[{"plan_name": "Premium", "price": 2500}]'::jsonb, true, false),

    -- Audio & Voix Supplémentaires
    ('Resemble AI', 'resemble-ai', 'Plateforme de clonage vocal et de synthèse vocale.', 'https://www.resemble.ai/', audio_voix_id, '[{"plan_name": "Creator", "price": 30}]'::jsonb, true, true),
    ('Descript', 'descript', 'Éditeur audio et vidéo avec fonctionnalités de transcription et synthèse vocale IA.', 'https://www.descript.com/', audio_voix_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Pro", "price": 24}]'::jsonb, true, true),
    ('Speechify', 'speechify', 'Application de lecture audio avec voix naturelles.', 'https://speechify.com/', audio_voix_id, '[{"plan_name": "Free", "price": 0}, {"plan_name": "Premium", "price": 139}]'::jsonb, true, false)

    ON CONFLICT (slug) DO UPDATE 
    SET 
        description = EXCLUDED.description,
        website_url = EXCLUDED.website_url,
        category_id = EXCLUDED.category_id,
        pricing = EXCLUDED.pricing,
        is_featured = EXCLUDED.is_featured,
        updated_at = CURRENT_TIMESTAMP;

END $$;
