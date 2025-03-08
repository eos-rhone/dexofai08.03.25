-- Ajouter une colonne featured si elle n'existe pas déjà
DO $$ 
BEGIN 
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'ai_tools' AND column_name = 'featured') 
  THEN
    ALTER TABLE ai_tools ADD COLUMN featured BOOLEAN DEFAULT false;
  END IF;
END $$;

-- Fonction pour remplacer un outil en vedette par un autre
CREATE OR REPLACE FUNCTION replace_featured_tool(old_tool_name TEXT, new_tool_name TEXT)
RETURNS void AS $$
BEGIN
    -- Mettre à false l'ancien outil
    UPDATE ai_tools
    SET featured = false
    WHERE name ILIKE old_tool_name;

    -- Mettre à true le nouvel outil
    UPDATE ai_tools
    SET featured = true
    WHERE name ILIKE new_tool_name;
END;
$$ LANGUAGE plpgsql;

-- Exemple d'utilisation :
-- SELECT replace_featured_tool('ChatGPT', 'Notion AI');

-- Pour voir les outils en vedette actuels :
SELECT name, featured, monthly_users
FROM ai_tools
WHERE featured = true
ORDER BY monthly_users DESC;

-- Pour définir manuellement les 6 outils en vedette :
UPDATE ai_tools SET featured = false;
UPDATE ai_tools 
SET featured = true
WHERE name IN (
    'ChatGPT',
    'Midjourney',
    'DALL-E',
    'Claude',
    'Notion AI',
    'Stable Diffusion'
);

-- Pour ajouter un nouvel outil en vedette :
UPDATE ai_tools 
SET featured = true
WHERE name ILIKE 'nom_de_loutil';

-- Pour retirer un outil des vedettes :
UPDATE ai_tools 
SET featured = false
WHERE name ILIKE 'nom_de_loutil';
