-- Create tool_pricing table
BEGIN;

-- Create the table
CREATE TABLE IF NOT EXISTS tool_pricing (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    tool_id uuid REFERENCES ai_tools(id) ON DELETE CASCADE,
    name text NOT NULL,
    price numeric,
    features text[],
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Add some sample pricing data for robotics tools
DO $$
DECLARE
    tool_id uuid;
BEGIN
    -- RobotStudio
    SELECT id INTO tool_id FROM ai_tools WHERE name = 'RobotStudio';
    IF FOUND THEN
        INSERT INTO tool_pricing (tool_id, name, price, features)
        VALUES
        (tool_id, 'Gratuit', 0, ARRAY['Version de base', 'Simulation limitée', 'Support communautaire']),
        (tool_id, 'Pro', 199, ARRAY['Simulation complète', 'Support premium', 'Fonctionnalités avancées']);
    END IF;

    -- Wandelbots
    SELECT id INTO tool_id FROM ai_tools WHERE name = 'Wandelbots';
    IF FOUND THEN
        INSERT INTO tool_pricing (tool_id, name, price, features)
        VALUES
        (tool_id, 'Starter', 499, ARRAY['1 robot', 'Formation de base', 'Support email']),
        (tool_id, 'Business', 999, ARRAY['Robots illimités', 'Formation avancée', 'Support 24/7']);
    END IF;

    -- Autres outils...
END $$;

-- Create indexes
CREATE INDEX IF NOT EXISTS tool_pricing_tool_id_idx ON tool_pricing(tool_id);

COMMIT;
