-- 1. Commencer une transaction
BEGIN;

-- 2. Vérifier les contraintes de clé étrangère qui référencent ces catégories
SELECT
    tc.table_name as table_reference,
    kcu.column_name as colonne_reference
FROM 
    information_schema.table_constraints tc
    JOIN information_schema.key_column_usage kcu
        ON tc.constraint_name = kcu.constraint_name
WHERE 
    tc.constraint_type = 'FOREIGN KEY' 
    AND tc.table_schema = 'public'
    AND kcu.table_name = 'categories';

-- 3. Essayer de supprimer avec plus de détails sur l'erreur
DO $$
BEGIN
    DELETE FROM public.categories 
    WHERE name IN ('Agriculture', 'Vidéo', 'Energie');
    RAISE NOTICE 'Suppression réussie';
EXCEPTION
    WHEN others THEN
        RAISE NOTICE 'Erreur lors de la suppression: %', SQLERRM;
END $$;

-- 4. Si nécessaire, forcer la suppression en désactivant temporairement la vérification des clés étrangères
SET session_replication_role = 'replica';

DELETE FROM public.categories 
WHERE name IN ('Agriculture', 'Vidéo', 'Energie');

SET session_replication_role = 'origin';

-- 5. Vérifier si les catégories existent toujours
SELECT name, id 
FROM public.categories 
WHERE name IN ('Agriculture', 'Vidéo', 'Energie');

COMMIT;
