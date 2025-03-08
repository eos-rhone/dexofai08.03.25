-- Restauration de l'état précédent
BEGIN;

-- Annuler les modifications des contraintes
ALTER TABLE ai_tools
ALTER COLUMN category_id DROP NOT NULL;

ALTER TABLE tools
ALTER COLUMN category_id DROP NOT NULL;

-- Supprimer les index si nécessaire
DROP INDEX IF EXISTS idx_ai_tools_category_id;
DROP INDEX IF EXISTS idx_tools_category_id;

COMMIT;
