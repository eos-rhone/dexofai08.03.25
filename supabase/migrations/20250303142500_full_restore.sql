-- Restauration complète de tous les outils
BEGIN;

-- Réinitialiser les tables
TRUNCATE TABLE tool_pricing CASCADE;
TRUNCATE TABLE ai_tools CASCADE;

-- Restaurer depuis les sauvegardes
\i '20250225224300_restore_all_tools.sql'
\i '20250225224700_restore_all_tools_batch2.sql'
\i '20250225224800_restore_all_tools_batch3.sql'
\i '20250225225600_restore_all_tools_complete.sql'
\i '20250225225700_restore_all_tools_final.sql'

-- Vérifier le nombre d'outils
DO $$
DECLARE
    tool_count integer;
BEGIN
    SELECT COUNT(*) INTO tool_count FROM ai_tools;
    RAISE NOTICE 'Nombre total d''outils restaurés: %', tool_count;
    
    IF tool_count < 700 THEN
        RAISE EXCEPTION 'Erreur: Seulement % outils restaurés sur 704 attendus', tool_count;
    END IF;
END $$;

COMMIT;
