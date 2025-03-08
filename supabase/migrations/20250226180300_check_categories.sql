-- Vérifier la structure de la table categories
SELECT 
    column_name, 
    data_type 
FROM information_schema.columns 
WHERE table_name = 'categories';

-- Vérifier le contenu de la table categories
SELECT * FROM categories;
