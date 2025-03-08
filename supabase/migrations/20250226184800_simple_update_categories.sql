-- Mettre à jour les catégories des outils existants
BEGIN;

DO $$ 
DECLARE
    frameworks_id uuid := '1715f3fe-c800-425e-b5d3-ee8af4477a39';
BEGIN
    -- 1. Vérifier l'état actuel
    RAISE NOTICE 'État actuel des outils :';
    
    -- Afficher les outils et leurs catégories actuelles
    RAISE NOTICE '%', (
        SELECT string_agg(name || ' (' || slug || '): ' || category_id, E'\n')
        FROM ai_tools 
        WHERE slug IN (
            'tensorflow', 'pytorch', 'scikit-learn', 'keras', 'hugging-face',
            'fastai', 'jax', 'xgboost', 'lightgbm', 'catboost'
        )
    );

    -- 2. Mettre à jour la catégorie pour tous les outils
    UPDATE ai_tools
    SET category_id = frameworks_id
    WHERE slug IN (
        'tensorflow', 'pytorch', 'scikit-learn', 'keras', 'hugging-face',
        'fastai', 'jax', 'xgboost', 'lightgbm', 'catboost'
    );

    -- 3. Vérifier le résultat
    RAISE NOTICE 'Après mise à jour :';
    RAISE NOTICE '%', (
        SELECT string_agg(name || ' (' || slug || ')', ', ')
        FROM ai_tools 
        WHERE category_id = frameworks_id
    );

END $$;

-- Afficher le résultat final
SELECT 
    c.name as category_name,
    COUNT(t.id) as tool_count,
    array_agg(t.name) as tool_names
FROM categories c
LEFT JOIN ai_tools t ON c.id = t.category_id
WHERE c.id = '1715f3fe-c800-425e-b5d3-ee8af4477a39'
GROUP BY c.name;

COMMIT;
