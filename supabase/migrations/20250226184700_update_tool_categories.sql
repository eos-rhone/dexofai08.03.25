-- Mettre à jour les catégories des outils existants
BEGIN;

DO $$ 
DECLARE
    frameworks_id uuid := '1715f3fe-c800-425e-b5d3-ee8af4477a39';
BEGIN
    -- 1. Vérifier où sont actuellement les outils
    RAISE NOTICE 'État actuel des outils :';
    FOR r IN (
        SELECT name, slug, category_id 
        FROM ai_tools 
        WHERE slug IN (
            'tensorflow', 'pytorch', 'scikit-learn', 'keras', 'hugging-face',
            'fastai', 'jax', 'xgboost', 'lightgbm', 'catboost'
        )
    ) LOOP
        RAISE NOTICE 'Outil % (%) est dans la catégorie %', r.name, r.slug, r.category_id;
    END LOOP;

    -- 2. Mettre à jour la catégorie pour tous les outils
    UPDATE ai_tools
    SET category_id = frameworks_id
    WHERE slug IN (
        'tensorflow', 'pytorch', 'scikit-learn', 'keras', 'hugging-face',
        'fastai', 'jax', 'xgboost', 'lightgbm', 'catboost'
    );

    -- 3. Vérifier le résultat
    RAISE NOTICE 'Après mise à jour :';
    FOR r IN (
        SELECT name, slug, category_id 
        FROM ai_tools 
        WHERE category_id = frameworks_id
    ) LOOP
        RAISE NOTICE 'Outil % (%) est maintenant dans la catégorie Frameworks', r.name, r.slug;
    END LOOP;

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
