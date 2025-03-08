-- 1. Créer une table temporaire de mapping des catégories
CREATE TEMP TABLE category_mapping (
    old_slug VARCHAR(255),
    new_slug VARCHAR(255)
);

-- 2. Définir les fusions de catégories
INSERT INTO category_mapping (old_slug, new_slug) VALUES
    ('automatisation', 'agents-automatisation'),
    ('design', 'mode-design'),
    ('traduction', 'traduction-localisation'),
    ('iot-robotique', 'iot-domotique'),
    ('analyse-donnees', 'outils-donnees'),
    ('science-donnees', 'outils-donnees'),
    ('gaming', 'jeux-video'),
    ('audio-musique', 'audio-voix'),
    ('transport', 'automobile-transport'),
    ('creation-musicale', 'audio-voix'),
    ('voix-parole', 'audio-voix');

-- 3. Mettre à jour les outils pour utiliser les nouvelles catégories
UPDATE public.ai_tools t
SET category_id = c_new.id
FROM public.ai_tools t_old
JOIN public.categories c_old ON t_old.category_id = c_old.id
JOIN category_mapping m ON c_old.slug = m.old_slug
JOIN public.categories c_new ON c_new.slug = m.new_slug
WHERE t.id = t_old.id;

-- 4. Supprimer les catégories vides
DELETE FROM public.categories
WHERE id NOT IN (
    SELECT DISTINCT category_id 
    FROM public.ai_tools 
    WHERE category_id IS NOT NULL
);

-- 5. Vérifier les résultats
SELECT 
    c.name as category_name,
    COUNT(t.id) as tool_count
FROM public.categories c
LEFT JOIN public.ai_tools t ON c.id = t.category_id
GROUP BY c.name
ORDER BY tool_count DESC;
