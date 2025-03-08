-- Add test data
BEGIN;

-- Insert some test tools with pricing
DO $$
DECLARE
    tool_id uuid;
BEGIN
    -- Insert a test tool
    INSERT INTO ai_tools (
        id,
        name,
        description,
        website_url,
        image_url,
        monthly_users,
        total_views,
        average_rating,
        total_reviews,
        is_verified,
        is_featured
    ) VALUES (
        gen_random_uuid(),
        'Test AI Tool',
        'A powerful AI tool for testing',
        'https://example.com',
        'https://images.unsplash.com/photo-1485827404703-89b55fcc595e',
        50000,
        1000,
        4.5,
        100,
        true,
        true
    ) RETURNING id INTO tool_id;

    -- Insert pricing for the test tool
    INSERT INTO tool_pricing (tool_id, name, price, features)
    VALUES
    (tool_id, 'Gratuit', 0, ARRAY['Fonctionnalités de base', 'Utilisation limitée']),
    (tool_id, 'Pro', 29.99, ARRAY['Toutes les fonctionnalités', 'Support premium']);

    -- Insert another test tool
    INSERT INTO ai_tools (
        id,
        name,
        description,
        website_url,
        image_url,
        monthly_users,
        total_views,
        average_rating,
        total_reviews,
        is_verified,
        is_featured
    ) VALUES (
        gen_random_uuid(),
        'Premium AI Tool',
        'Un outil AI premium avec des fonctionnalités avancées',
        'https://premium-example.com',
        'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158',
        100000,
        2000,
        4.8,
        200,
        true,
        true
    ) RETURNING id INTO tool_id;

    -- Insert pricing for the premium tool
    INSERT INTO tool_pricing (tool_id, name, price, features)
    VALUES
    (tool_id, 'Pro', 99.99, ARRAY['Fonctionnalités avancées', 'Support 24/7']),
    (tool_id, 'Enterprise', 299.99, ARRAY['Solution sur mesure', 'Support dédié']);

END $$;

COMMIT;
