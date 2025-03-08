-- Supprimer la catégorie Agriculture
DELETE FROM public.categories 
WHERE name = 'Agriculture';

-- Vérifier que la suppression a bien été effectuée
SELECT name FROM public.categories WHERE name = 'Agriculture';
