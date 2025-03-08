-- Exemple de suppression d'un outil
-- Remplacez les valeurs entre < > par vos propres valeurs

-- 1. Voir l'outil avant de le supprimer (sécurité)
SELECT * FROM public.ai_tools 
WHERE name = '<nom_outil>'      -- ex: 'ChatGPT'
   OR slug = '<slug_outil>';    -- ex: 'chatgpt'

-- 2. Supprimer l'outil
DELETE FROM public.ai_tools 
WHERE name = '<nom_outil>'      -- ex: 'ChatGPT'
   OR slug = '<slug_outil>';    -- ex: 'chatgpt'

-- Exemple concret :
/*
-- D'abord vérifier
SELECT * FROM public.ai_tools WHERE name = 'ChatGPT';

-- Puis supprimer
DELETE FROM public.ai_tools WHERE name = 'ChatGPT';
*/
