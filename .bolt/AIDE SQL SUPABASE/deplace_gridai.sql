-- 1. Vérifier l'outil et sa catégorie actuelle
SELECT 
    t.name as nom_outil,
    c.name as categorie_actuelle
FROM public.ai_tools t
JOIN public.categories c ON t.category_id = c.id
WHERE t.name = 'GridAi';

-- 2. Déplacer l'outil vers la nouvelle catégorie
UPDATE public.ai_tools 
SET category_id = (
    SELECT id FROM public.categories 
    WHERE name = 'Énergie & Climat'
)
WHERE name = 'GridAi';

-- 3. Vérifier que le déplacement a bien été effectué
SELECT 
    t.name as nom_outil,
    c.name as nouvelle_categorie
FROM public.ai_tools t
JOIN public.categories c ON t.category_id = c.id
WHERE t.name = 'GridAi';
