-- Vérifier le nom exact de l'outil
SELECT name, slug
FROM public.ai_tools
WHERE LOWER(name) LIKE LOWER('%grid%');
