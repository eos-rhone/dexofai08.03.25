-- Essayer différentes images pour la catégorie Assistants & Chatbots
BEGIN;

-- Option 1: Interface futuriste avec hologramme bleu
UPDATE tools t
SET image_url = 'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=2000',
    updated_at = CURRENT_TIMESTAMP
FROM categories c
WHERE t.category_id = c.id
AND c.name = 'Assistants & Chatbots';

UPDATE ai_tools t
SET image_url = 'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=2000',
    updated_at = CURRENT_TIMESTAMP
FROM categories c
WHERE t.category_id = c.id
AND c.name = 'Assistants & Chatbots';

-- Pour revenir en arrière et essayer une autre image, commentez le code ci-dessus et décommentez une des options suivantes:

/*
-- Option 2: Robot moderne avec écran interactif
UPDATE tools t
SET image_url = 'https://images.unsplash.com/photo-1531746790731-6c087fecd65a?q=80&w=2000',
    updated_at = CURRENT_TIMESTAMP
FROM categories c
WHERE t.category_id = c.id
AND c.name = 'Assistants & Chatbots';

UPDATE ai_tools t
SET image_url = 'https://images.unsplash.com/photo-1531746790731-6c087fecd65a?q=80&w=2000',
    updated_at = CURRENT_TIMESTAMP
FROM categories c
WHERE t.category_id = c.id
AND c.name = 'Assistants & Chatbots';
*/

/*
-- Option 3: Interface de chat minimaliste et moderne
UPDATE tools t
SET image_url = 'https://images.unsplash.com/photo-1700155839573-be4e8ba99021?q=80&w=2000',
    updated_at = CURRENT_TIMESTAMP
FROM categories c
WHERE t.category_id = c.id
AND c.name = 'Assistants & Chatbots';

UPDATE ai_tools t
SET image_url = 'https://images.unsplash.com/photo-1700155839573-be4e8ba99021?q=80&w=2000',
    updated_at = CURRENT_TIMESTAMP
FROM categories c
WHERE t.category_id = c.id
AND c.name = 'Assistants & Chatbots';
*/

/*
-- Option 4: Circuit imprimé avec lueur bleue
UPDATE tools t
SET image_url = 'https://images.unsplash.com/photo-1676575549814-ff23e2c24d2b?q=80&w=2000',
    updated_at = CURRENT_TIMESTAMP
FROM categories c
WHERE t.category_id = c.id
AND c.name = 'Assistants & Chatbots';

UPDATE ai_tools t
SET image_url = 'https://images.unsplash.com/photo-1676575549814-ff23e2c24d2b?q=80&w=2000',
    updated_at = CURRENT_TIMESTAMP
FROM categories c
WHERE t.category_id = c.id
AND c.name = 'Assistants & Chatbots';
*/

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
