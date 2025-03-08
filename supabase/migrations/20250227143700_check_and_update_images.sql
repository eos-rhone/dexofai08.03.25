-- Vérifier et mettre à jour les images manquantes
BEGIN;

-- D'abord, voyons les outils sans images
SELECT name, image_url, category_id 
FROM ai_tools 
WHERE image_url IS NULL OR image_url = '';

-- Mettre à jour quelques outils spécifiques
UPDATE ai_tools 
SET image_url = 'https://static.vecteezy.com/system/resources/previews/021/608/790/original/chatgpt-logo-chat-gpt-icon-on-black-background-free-vector.jpg'
WHERE name ILIKE '%chatgpt%' AND (image_url IS NULL OR image_url = '');

UPDATE ai_tools 
SET image_url = 'https://static.vecteezy.com/system/resources/thumbnails/027/388/677/small/anthropic-claude-ai-logo-free-vector.jpg'
WHERE name ILIKE '%claude%' AND (image_url IS NULL OR image_url = '');

UPDATE ai_tools 
SET image_url = 'https://static.vecteezy.com/system/resources/previews/022/101/069/non_2x/nvidia-logo-nvidia-icon-free-vector.jpg'
WHERE name ILIKE '%nvidia%' AND (image_url IS NULL OR image_url = '');

-- Vérifier les mises à jour
SELECT name, image_url 
FROM ai_tools 
WHERE name ILIKE ANY(ARRAY['%chatgpt%', '%claude%', '%nvidia%']);

COMMIT;
