-- Add reviews and user count to ai_tools table
BEGIN;

-- Add reviews column (storing as JSONB for flexibility)
ALTER TABLE ai_tools
ADD COLUMN IF NOT EXISTS reviews JSONB DEFAULT '[]'::jsonb,
ADD COLUMN IF NOT EXISTS user_count INTEGER DEFAULT 0;

-- Add an index on user_count for better performance when sorting
CREATE INDEX IF NOT EXISTS ai_tools_user_count_idx ON ai_tools(user_count);

-- Update some example tools with sample data
UPDATE ai_tools
SET 
    reviews = jsonb_build_array(
        jsonb_build_object(
            'rating', floor(random() * 3 + 3)::int, -- Ratings between 3-5
            'comment', 'Très utile pour mon travail quotidien',
            'user_name', 'Utilisateur' || floor(random() * 1000)::text,
            'date', NOW() - (random() * interval '90 days')
        ),
        jsonb_build_object(
            'rating', floor(random() * 3 + 3)::int,
            'comment', 'Excellent outil, je recommande',
            'user_name', 'Utilisateur' || floor(random() * 1000)::text,
            'date', NOW() - (random() * interval '90 days')
        )
    ),
    user_count = floor(random() * 900 + 100)::int -- Between 100-1000 users
WHERE user_count = 0;

COMMIT;
