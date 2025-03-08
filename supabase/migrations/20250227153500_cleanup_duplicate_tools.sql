-- Nettoyage des données en double
BEGIN;

-- Supprimer les doublons dans ai_tools en gardant la première entrée
WITH duplicates AS (
    SELECT id,
           ROW_NUMBER() OVER (PARTITION BY slug, category_id ORDER BY created_at) as rn
    FROM ai_tools
)
DELETE FROM ai_tools
WHERE id IN (
    SELECT id 
    FROM duplicates 
    WHERE rn > 1
);

-- Supprimer les doublons dans tools en gardant la première entrée
WITH duplicates AS (
    SELECT id,
           ROW_NUMBER() OVER (PARTITION BY slug, category_id ORDER BY created_at) as rn
    FROM tools
)
DELETE FROM tools
WHERE id IN (
    SELECT id 
    FROM duplicates 
    WHERE rn > 1
);

-- Supprimer les outils inactifs
DELETE FROM tools 
WHERE is_active = false;

DELETE FROM ai_tools 
WHERE is_active = false;

COMMIT;

-- Optimiser les tables (hors transaction)
VACUUM ANALYZE tools;
VACUUM ANALYZE ai_tools;
