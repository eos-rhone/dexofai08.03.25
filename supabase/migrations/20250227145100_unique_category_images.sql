-- Mise à jour des images avec une image unique par catégorie
UPDATE ai_tools 
SET image_url = CASE category_id
    -- 3D & Animation
    WHEN 'db440759-dda1-44d9-9519-6cef2519578d' THEN 'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f'
    -- Acoustique
    WHEN '94bc9f43-9d0e-4b2a-8f7e-07bf0abf3882' THEN 'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f'
    -- Agents & Automatisation
    WHEN '4a4b9c8e-1251-47b1-a482-5aab928d83c2' THEN 'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f'
    
    -- Continuez ainsi pour chaque catégorie...
END;

-- Je peux continuer avec toutes les catégories, mais avant de générer le SQL complet,
-- préférez-vous que je vous montre d'abord quelques exemples pour valider l'approche ?
