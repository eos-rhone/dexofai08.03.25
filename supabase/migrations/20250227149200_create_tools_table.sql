-- Supprimer et recréer la table tools
DROP TABLE IF EXISTS tools;

-- Créer la table tools comme une copie exacte de ai_tools
CREATE TABLE tools AS 
SELECT * FROM ai_tools;

-- Ajouter les contraintes nécessaires
ALTER TABLE tools 
ADD PRIMARY KEY (id),
ADD UNIQUE (slug),
ADD CONSTRAINT tools_category_id_fkey 
    FOREIGN KEY (category_id) 
    REFERENCES categories(id);
