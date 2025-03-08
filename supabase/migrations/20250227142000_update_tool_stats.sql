-- Update tool statistics with random data
BEGIN;

-- Update tool statistics with random values
UPDATE ai_tools
SET 
    average_rating = (random() * 2 + 3)::numeric(2,1), -- Note entre 3.0 et 5.0
    total_reviews = floor(random() * 200 + 50)::int, -- Entre 50 et 250 avis
    monthly_users = floor(random() * 5000 + 1000)::int, -- Entre 1000 et 6000 utilisateurs mensuels
    total_views = floor(random() * 20000 + 5000)::int -- Entre 5000 et 25000 vues
WHERE total_reviews = 0;

COMMIT;
