-- Insérer les outils avec des IDs explicites
BEGIN;

DO $$ 
DECLARE
    frameworks_id uuid := '1715f3fe-c800-425e-b5d3-ee8af4477a39';
    inserted_id uuid;
BEGIN
    -- TensorFlow
    INSERT INTO ai_tools (
        id,
        name,
        slug,
        description,
        website_url,
        category_id,
        pricing,
        is_active,
        is_featured
    )
    VALUES (
        gen_random_uuid(),
        'TensorFlow',
        'tensorflow',
        'Framework open-source de machine learning développé par Google.',
        'https://www.tensorflow.org/',
        frameworks_id,
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        true
    )
    RETURNING id INTO inserted_id;
    
    RAISE NOTICE 'Inserted TensorFlow with ID: %', inserted_id;

    -- PyTorch
    INSERT INTO ai_tools (
        id,
        name,
        slug,
        description,
        website_url,
        category_id,
        pricing,
        is_active,
        is_featured
    )
    VALUES (
        gen_random_uuid(),
        'PyTorch',
        'pytorch',
        'Framework de deep learning flexible développé par Facebook.',
        'https://pytorch.org/',
        frameworks_id,
        '[{"plan_name": "Gratuit", "price": 0}]'::jsonb,
        true,
        true
    )
    RETURNING id INTO inserted_id;
    
    RAISE NOTICE 'Inserted PyTorch with ID: %', inserted_id;

    -- Vérifier immédiatement les insertions
    RAISE NOTICE 'Checking inserted tools:';
    FOR inserted_id IN
        SELECT id FROM ai_tools WHERE category_id = frameworks_id
    LOOP
        RAISE NOTICE 'Found tool with ID: %', inserted_id;
    END LOOP;

END $$;

-- Vérifier le résultat final
SELECT 
    t.id,
    t.name,
    t.slug,
    t.category_id,
    c.name as category_name
FROM ai_tools t
JOIN categories c ON c.id = t.category_id
WHERE c.id = '1715f3fe-c800-425e-b5d3-ee8af4477a39';

COMMIT;
