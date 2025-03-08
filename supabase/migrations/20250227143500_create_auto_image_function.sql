-- Créer une fonction pour gérer automatiquement les images des outils IA
BEGIN;

-- Créer une table de correspondance pour les images des outils
CREATE TABLE IF NOT EXISTS tool_image_mappings (
    pattern TEXT PRIMARY KEY,
    image_url TEXT NOT NULL,
    priority INTEGER DEFAULT 1
);

-- Insérer les correspondances d'images
INSERT INTO tool_image_mappings (pattern, image_url, priority) VALUES
    -- Chatbots & Assistants IA
    ('chatgpt', 'https://static.vecteezy.com/system/resources/previews/021/608/790/original/chatgpt-logo-chat-gpt-icon-on-black-background-free-vector.jpg', 100),
    ('claude', 'https://static.vecteezy.com/system/resources/thumbnails/027/388/677/small/anthropic-claude-ai-logo-free-vector.jpg', 100),
    ('bard', 'https://static.vecteezy.com/system/resources/previews/024/109/794/non_2x/google-bard-logo-artificial-intelligence-chatbot-free-vector.jpg', 100),
    ('bing chat', 'https://www.bing.com/th?id=OIP.4mQC-4U_hGYK3KtPrD3DmQHaHa', 100),
    
    -- Image Generation
    ('dall-e', 'https://static.vecteezy.com/system/resources/previews/021/059/827/non_2x/chatgpt-logo-chat-gpt-icon-on-white-background-free-vector.jpg', 100),
    ('midjourney', 'https://cdn.worldvectorlogo.com/logos/midjourney-1.svg', 100),
    ('stable diffusion', 'https://static.vecteezy.com/system/resources/previews/024/811/536/non_2x/stability-ai-logo-free-vector.jpg', 100),
    ('leonardo ai', 'https://framerusercontent.com/images/nXLdc1l95LRr0YIGqnJmKPIzgnw.png', 100),
    
    -- Design & Creative
    ('canva', 'https://static.vecteezy.com/system/resources/previews/022/100/816/non_2x/canva-logo-canva-app-icon-free-vector.jpg', 100),
    ('nvidia canvas', 'https://static.vecteezy.com/system/resources/previews/022/101/069/non_2x/nvidia-logo-nvidia-icon-free-vector.jpg', 100),
    
    -- Code & Development
    ('copilot', 'https://static.vecteezy.com/system/resources/previews/022/100/873/non_2x/github-logo-git-hub-icon-with-text-on-white-background-free-vector.jpg', 100),
    ('codewhisperer', 'https://static.vecteezy.com/system/resources/previews/013/948/549/non_2x/aws-amazon-web-services-logo-editorial-free-vector.jpg', 100),
    
    -- Writing & Content
    ('jasper', 'https://static.vecteezy.com/system/resources/previews/024/811/536/non_2x/stability-ai-logo-free-vector.jpg', 100),
    ('grammarly', 'https://static.vecteezy.com/system/resources/previews/024/090/570/non_2x/grammarly-logo-grammarly-icon-free-vector.jpg', 100),
    
    -- Music & Audio
    ('mubert', 'https://images.unsplash.com/photo-1511379938547-c1f69419868d', 90),
    ('soundraw', 'https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae', 90),
    
    -- Productivity
    ('notion', 'https://static.vecteezy.com/system/resources/previews/024/090/580/non_2x/notion-logo-notion-icon-free-vector.jpg', 100),
    
    -- Education
    ('duolingo', 'https://static.vecteezy.com/system/resources/previews/024/090/561/non_2x/duolingo-logo-duolingo-icon-free-vector.jpg', 100)
ON CONFLICT (pattern) DO UPDATE 
SET image_url = EXCLUDED.image_url,
    priority = EXCLUDED.priority;

-- Créer une fonction pour attribuer automatiquement les images
CREATE OR REPLACE FUNCTION auto_assign_tool_image()
RETURNS TRIGGER AS $$
DECLARE
    matching_image TEXT;
    category_image TEXT;
BEGIN
    -- Chercher une correspondance directe dans les mappings
    SELECT image_url INTO matching_image
    FROM tool_image_mappings
    WHERE NEW.name ILIKE '%' || pattern || '%'
    ORDER BY priority DESC, length(pattern) DESC
    LIMIT 1;

    -- Si une correspondance est trouvée, utiliser cette image
    IF matching_image IS NOT NULL THEN
        NEW.image_url := matching_image;
    ELSE
        -- Sinon, utiliser l'image de la catégorie
        SELECT image_url INTO category_image
        FROM categories
        WHERE id = NEW.category_id;
        
        IF category_image IS NOT NULL THEN
            NEW.image_url := category_image;
        ELSE
            -- Image par défaut si aucune autre n'est trouvée
            NEW.image_url := 'https://images.unsplash.com/photo-1677442136019-21780ecad995';
        END IF;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Créer le trigger pour les nouveaux outils
DROP TRIGGER IF EXISTS assign_tool_image_trigger ON ai_tools;
CREATE TRIGGER assign_tool_image_trigger
    BEFORE INSERT OR UPDATE OF name ON ai_tools
    FOR EACH ROW
    WHEN (NEW.image_url IS NULL OR NEW.image_url = '')
    EXECUTE FUNCTION auto_assign_tool_image();

-- Mettre à jour les images manquantes pour les outils existants
UPDATE ai_tools
SET image_url = NULL
WHERE image_url IS NULL OR image_url = '';

COMMIT;
