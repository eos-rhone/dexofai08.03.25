-- Mise à jour des images pour des outils spécifiques
BEGIN;

-- ChatGPT
UPDATE ai_tools 
SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/ChatGPT_logo.svg/1200px-ChatGPT_logo.svg.png'
WHERE name = 'ChatGPT';

-- Claude
UPDATE ai_tools 
SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Anthropic_logo.svg/1200px-Anthropic_logo.svg.png'
WHERE name = 'Claude';

-- Nvidia Tools
UPDATE ai_tools 
SET image_url = 'https://upload.wikimedia.org/wikipedia/sco/thumb/2/21/Nvidia_logo.svg/1200px-Nvidia_logo.svg.png'
WHERE name IN ('NVIDIA AI', 'NVIDIA GameWorks AI', 'Nvidia Canvas');

-- Vérifier les mises à jour
SELECT name, image_url 
FROM ai_tools 
WHERE name IN ('ChatGPT', 'Claude', 'NVIDIA AI', 'NVIDIA GameWorks AI', 'Nvidia Canvas');

COMMIT;
