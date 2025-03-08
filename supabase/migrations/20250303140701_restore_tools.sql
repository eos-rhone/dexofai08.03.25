-- Restaurer tous les outils
BEGIN;

-- Sauvegarder les outils existants dans une table temporaire
CREATE TEMP TABLE backup_tools AS
SELECT * FROM ai_tools;

-- Réinitialiser la table ai_tools
TRUNCATE TABLE ai_tools CASCADE;

-- Réinsérer les données à partir des migrations originales
\i '20250225180037_insert_ai_tools_batch1.sql'
\i '20250225180038_insert_ai_tools_batch2.sql'
\i '20250225180039_insert_ai_tools_batch3.sql'
\i '20250225180040_insert_ai_tools_batch4.sql'
\i '20250225180041_insert_ai_tools_batch5.sql'
\i '20250225180042_insert_ai_tools_batch6.sql'
\i '20250225183800_insert_ai_tools_batch7.sql'

-- Vérifier le nombre d'outils après restauration
SELECT COUNT(*) as restored_tools FROM ai_tools;

COMMIT;
