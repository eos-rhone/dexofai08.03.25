-- Restauration d'urgence de tous les outils
BEGIN;

-- Réinitialiser la table ai_tools
TRUNCATE TABLE ai_tools CASCADE;

-- Copier la sauvegarde du 25 février
\i '20250225225700_restore_all_tools_final.sql'

COMMIT;
