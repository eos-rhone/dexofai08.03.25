-- Exemple pour déplacer un outil d'une catégorie à une autre
-- Remplacez les valeurs entre < > par vos propres valeurs

-- 1. D'abord vérifier l'outil et sa catégorie actuelle
SELECT 
    t.name as nom_outil,
    c.name as categorie_actuelle
FROM public.ai_tools t
JOIN public.categories c ON t.category_id = c.id
WHERE t.name = '<nom_outil>';    -- ex: 'ChatGPT'

-- 2. Déplacer l'outil vers la nouvelle catégorie
UPDATE public.ai_tools 
SET category_id = (
    SELECT id FROM public.categories 
    WHERE name = '<nouvelle_categorie>'    -- ex: 'Assistants & Chatbots'
)
WHERE name = '<nom_outil>';               -- ex: 'ChatGPT'

-- 3. Vérifier que le déplacement a bien été effectué
SELECT 
    t.name as nom_outil,
    c.name as nouvelle_categorie
FROM public.ai_tools t
JOIN public.categories c ON t.category_id = c.id
WHERE t.name = '<nom_outil>';    -- ex: 'ChatGPT'

-- Exemple concret :
/*
-- 1. Vérifier avant
SELECT 
    t.name as nom_outil,
    c.name as categorie_actuelle
FROM public.ai_tools t
JOIN public.categories c ON t.category_id = c.id
WHERE t.name = 'ChatGPT';

-- 2. Déplacer
UPDATE public.ai_tools 
SET category_id = (
    SELECT id FROM public.categories 
    WHERE name = 'Assistants & Chatbots'
)
WHERE name = 'ChatGPT';

-- 3. Vérifier après
SELECT 
    t.name as nom_outil,
    c.name as nouvelle_categorie
FROM public.ai_tools t
JOIN public.categories c ON t.category_id = c.id
WHERE t.name = 'ChatGPT';
*/
