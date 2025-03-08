-- Insert AI tools batch 10
DO $$
DECLARE
    babybeeagi_id UUID;
    babycatagi_id UUID;
    babydeeragi_id UUID;
    babyelfagi_id UUID;
    babycommandagi_id UUID;
    babyfoxagi_id UUID;
BEGIN
    -- Insert BabyBeeAGI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'BabyBeeAGI',
        'Extension de BabyAGI pour la gestion des tâches et des fonctionnalités. Version plus avancée du code BabyAGI original, introduisant une invite de gestion des tâches plus complexe pour une analyse et une synthèse plus complètes des informations.',
        'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyBeeAGI.py',
        'babybeeagi'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO babybeeagi_id;

    -- Insert BabyCatAGI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'BabyCatAGI',
        'Modification de BabyBeeAGI en seulement 300 lignes de code. Inclut des fonctionnalités comme l''agent de création de tâches qui s''exécute une fois, l''agent d''exécution qui parcourt les tâches, les dépendances des tâches, et combine les résultats pour créer un rapport de synthèse.',
        'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyCatAGI.py',
        'babycatagi'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO babycatagi_id;

    -- Insert BabyDeerAGI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'BabyDeerAGI',
        'Modification de BabyAGI en environ 350 lignes de code. Caractéristiques : tâches parallèles (plus rapide), utilisation exclusive de GPT-3.5-turbo, outil d''entrée utilisateur, réécriture de requête dans l''outil de recherche web, et sauvegarde des résultats.',
        'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyDeerAGI.py',
        'babydeeragi'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO babydeeragi_id;

    -- Insert BabyElfAGI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'BabyElfAGI',
        'Modification de BabyDeerAGI avec environ 895 lignes de code. Caractéristiques : classe de compétences permettant la création de nouvelles compétences, exemple de "liste de tâches dynamique" avec recherche vectorielle, agent de réflexion bêta, et capacité à lire, écrire et réviser son propre code.',
        'https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyElfAGI/main.py',
        'babyelfagi'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO babyelfagi_id;

    -- Insert BabyCommandAGI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'BabyCommandAGI',
        'Test de combinaison entre CLI et LLM. Un agent conçu pour tester l''interaction entre l''interface en ligne de commande et les modèles de langage. Basé sur BabyAGI, il peut exécuter des commandes shell et réaliser de la programmation automatique.',
        'https://github.com/saten-private/BabyCommandAGI',
        'babycommandagi'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO babycommandagi_id;

    -- Insert BabyFoxAGI
    INSERT INTO ai_tools (name, description, website_url, slug)
    VALUES (
        'BabyFoxAGI',
        'Modification de BabyAGI avec un nouveau panneau d''interface parallèle. Inclut des listes de tâches auto-améliorantes (méthode FOXY), une interface de chat novatrice avec tâches parallèles, et de nouvelles compétences comme DALLE avec assistance de prompt, lecteur de musique Deezer, et recherche Airtable.',
        'https://github.com/yoheinakajima/babyagi/tree/main/classic/babyfoxagi',
        'babyfoxagi'
    )
    ON CONFLICT (slug) DO NOTHING
    RETURNING id INTO babyfoxagi_id;

END $$;
