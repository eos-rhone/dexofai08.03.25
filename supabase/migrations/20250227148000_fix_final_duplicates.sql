-- Correction des derniers doublons
UPDATE categories SET image_url = CASE name
    -- Business & Marketing vs Optimisation & Performance
    WHEN 'Business & Marketing' THEN 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?q=80&w=2000'
    WHEN 'Optimisation & Performance' THEN 'https://images.unsplash.com/photo-1533750349088-cd871a92f312?q=80&w=2000'

    -- Outils de Données vs Analyse de données
    WHEN 'Outils de Données' THEN 'https://images.unsplash.com/photo-1504868584819-f8e8b4b6d7e3?q=80&w=2000'
    WHEN 'Analyse de données' THEN 'https://images.unsplash.com/photo-1543286386-2e659306cd6c?q=80&w=2000'
END
WHERE name IN (
    'Business & Marketing', 'Optimisation & Performance',
    'Outils de Données', 'Analyse de données'
);

-- Vérification finale des duplicatas
SELECT image_url, COUNT(*) as usage_count, STRING_AGG(name, ', ') as categories
FROM categories
GROUP BY image_url
HAVING COUNT(*) > 1
ORDER BY usage_count DESC;
