-- Vérifier la structure des tables
SELECT 
    column_name,
    data_type,
    character_maximum_length
FROM information_schema.columns 
WHERE table_name = 'tools'
ORDER BY ordinal_position;

SELECT 
    column_name,
    data_type,
    character_maximum_length
FROM information_schema.columns 
WHERE table_name = 'ai_tools'
ORDER BY ordinal_position;
