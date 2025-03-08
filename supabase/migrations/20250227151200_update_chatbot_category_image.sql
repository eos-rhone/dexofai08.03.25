-- Mettre à jour l'image pour la catégorie Assistants & Chatbots
BEGIN;

-- Image HD représentant bien un assistant/chatbot AI
UPDATE tools t
SET image_url = 'https://images.unsplash.com/photo-1534723452862-4c874018d66d?q=80&w=2000',
    updated_at = CURRENT_TIMESTAMP
FROM categories c
WHERE t.category_id = c.id
AND c.name = 'Assistants & Chatbots';

-- Faire la même mise à jour dans ai_tools pour la cohérence
UPDATE ai_tools t
SET image_url = 'https://images.unsplash.com/photo-1534723452862-4c874018d66d?q=80&w=2000',
    updated_at = CURRENT_TIMESTAMP
FROM categories c
WHERE t.category_id = c.id
AND c.name = 'Assistants & Chatbots';

-- Vérifier le résultat
SELECT 
    c.name as category_name,
    COUNT(DISTINCT t.image_url) as unique_images,
    COUNT(*) as total_tools,
    MAX(t.image_url) as image_used
FROM categories c
JOIN tools t ON t.category_id = c.id
WHERE c.name = 'Assistants & Chatbots'
GROUP BY c.name;

COMMIT;
