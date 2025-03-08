-- Mise à jour de la catégorie rencontres
BEGIN;

-- Mettre à jour l'icône de la catégorie
UPDATE categories 
SET icon = '💕'
WHERE slug = 'rencontres-relations';

-- Mettre à jour les statistiques des outils
DO $$
DECLARE
    cat_id uuid;
BEGIN
    SELECT id INTO cat_id FROM categories WHERE slug = 'rencontres-relations';

    -- Mettre à jour les outils avec des statistiques réalistes
    UPDATE ai_tools 
    SET 
        average_rating = CASE name
            WHEN 'Iris Dating' THEN 4.8
            WHEN 'Relate AI' THEN 4.6
            WHEN 'Lovebot' THEN 4.7
            WHEN 'Friend Match' THEN 4.5
            WHEN 'Duo Analyzer' THEN 4.4
            WHEN 'Social Circle' THEN 4.6
            WHEN 'Love Language AI' THEN 4.7
            WHEN 'Bonding Time' THEN 4.5
        END,
        total_reviews = CASE name
            WHEN 'Iris Dating' THEN 15000
            WHEN 'Relate AI' THEN 8500
            WHEN 'Lovebot' THEN 12000
            WHEN 'Friend Match' THEN 9000
            WHEN 'Duo Analyzer' THEN 7500
            WHEN 'Social Circle' THEN 11000
            WHEN 'Love Language AI' THEN 13000
            WHEN 'Bonding Time' THEN 10000
        END,
        total_views = CASE name
            WHEN 'Iris Dating' THEN 250000
            WHEN 'Relate AI' THEN 150000
            WHEN 'Lovebot' THEN 180000
            WHEN 'Friend Match' THEN 160000
            WHEN 'Duo Analyzer' THEN 130000
            WHEN 'Social Circle' THEN 170000
            WHEN 'Love Language AI' THEN 200000
            WHEN 'Bonding Time' THEN 175000
        END,
        monthly_users = CASE name
            WHEN 'Iris Dating' THEN 50000
            WHEN 'Relate AI' THEN 30000
            WHEN 'Lovebot' THEN 35000
            WHEN 'Friend Match' THEN 32000
            WHEN 'Duo Analyzer' THEN 25000
            WHEN 'Social Circle' THEN 33000
            WHEN 'Love Language AI' THEN 40000
            WHEN 'Bonding Time' THEN 35000
        END
    WHERE category_id = cat_id;

END $$;

COMMIT;
