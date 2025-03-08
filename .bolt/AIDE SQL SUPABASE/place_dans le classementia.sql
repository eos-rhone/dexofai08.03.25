-- Première étape : Ajouter la colonne ranking si elle n'existe pas déjà
DO $$ 
BEGIN 
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'tools' AND column_name = 'ranking') 
  THEN
    ALTER TABLE tools ADD COLUMN ranking INTEGER;
  END IF;
END $$;

-- Deuxième étape : Initialiser les rankings basés sur le score de popularité si pas déjà fait
UPDATE tools 
SET ranking = sub.rank 
FROM (
  SELECT 
    id,
    ROW_NUMBER() OVER (
      ORDER BY 
        (COALESCE(monthly_users, 0) * 0.5 + 
         COALESCE(total_views, 0) * 0.3 + 
         COALESCE(average_rating * total_reviews, 0) * 0.2) DESC
    ) as rank
  FROM tools
) sub
WHERE tools.id = sub.id
  AND tools.ranking IS NULL;

-- Fonction pour déplacer un outil à une nouvelle position
CREATE OR REPLACE FUNCTION move_tool_ranking(tool_id UUID, new_position INTEGER)
RETURNS void AS $$
DECLARE
    current_position INTEGER;
    direction INTEGER;
BEGIN
    -- Récupérer la position actuelle de l'outil
    SELECT ranking INTO current_position
    FROM tools
    WHERE id = tool_id;

    -- Déterminer la direction du mouvement
    direction := CASE 
        WHEN new_position > current_position THEN 1
        ELSE -1
    END;

    -- Déplacer les autres outils
    IF direction = 1 THEN
        -- Déplacement vers le bas
        UPDATE tools
        SET ranking = ranking - 1
        WHERE ranking <= new_position
        AND ranking > current_position;
    ELSE
        -- Déplacement vers le haut
        UPDATE tools
        SET ranking = ranking + 1
        WHERE ranking >= new_position
        AND ranking < current_position;
    END IF;

    -- Mettre à jour la position de l'outil ciblé
    UPDATE tools
    SET ranking = new_position
    WHERE id = tool_id;
END;
$$ LANGUAGE plpgsql;

-- Exemple d'utilisation :
-- Pour déplacer un outil à une nouvelle position :
-- SELECT move_tool_ranking('id-de-loutil', nouvelle_position);

-- Exemple pour déplacer Notion AI de la position 11 à la position 9 :
-- SELECT move_tool_ranking(
--   (SELECT id FROM tools WHERE name ILIKE 'Notion AI'),
--   9
-- );

-- Pour voir le classement actuel :
SELECT name, ranking
FROM tools
WHERE ranking <= 20
ORDER BY ranking;
