-- 1. Vérifier les outils dans ces catégories
SELECT 
    c.name as categorie,
    COUNT(t.id) as nombre_outils
FROM public.categories c
LEFT JOIN public.ai_tools t ON t.category_id = c.id
WHERE c.name IN ('agriculture', 'energie', 'video')
GROUP BY c.name;

-- 2. Si ces catégories ont des outils, les déplacer vers d'autres catégories
UPDATE public.ai_tools 
SET category_id = (
    SELECT id FROM public.categories 
    WHERE name = 'Agriculture & Environnement'
)
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name = 'agriculture'
);

UPDATE public.ai_tools 
SET category_id = (
    SELECT id FROM public.categories 
    WHERE name = 'Énergie & Climat'
)
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name = 'energie'
);

UPDATE public.ai_tools 
SET category_id = (
    SELECT id FROM public.categories 
    WHERE name = 'Vidéo & Animation'
)
WHERE category_id IN (
    SELECT id FROM public.categories 
    WHERE name = 'video'
);

-- 3. Maintenant supprimer les catégories
DELETE FROM public.categories 
WHERE name = 'agriculture'
   OR name = 'energie'
   OR name = 'video';

-- 4. Vérifier que les catégories ont bien été supprimées
SELECT name 
FROM public.categories 
WHERE name IN ('agriculture', 'energie', 'video');
