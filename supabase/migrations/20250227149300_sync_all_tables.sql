-- Synchronisation simple de ai_tools vers tools
BEGIN;

-- Supprimer tous les enregistrements de tools
TRUNCATE TABLE tools;

-- Copier tous les enregistrements de ai_tools vers tools
INSERT INTO tools 
SELECT * FROM ai_tools;

-- Vérifier que tout est synchronisé
DO $$
DECLARE
    tools_count INTEGER;
    ai_tools_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO tools_count FROM tools;
    SELECT COUNT(*) INTO ai_tools_count FROM ai_tools;
    
    IF tools_count = ai_tools_count THEN
        RAISE NOTICE 'Synchronisation réussie! % outils dans chaque table', tools_count;
    ELSE
        RAISE NOTICE 'ERREUR: Différence dans le nombre d''outils (tools: %, ai_tools: %)', 
            tools_count, ai_tools_count;
    END IF;
END $$;

COMMIT;
