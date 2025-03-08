-- Liste toutes les tables de la base de données
SELECT tablename 
FROM pg_tables 
WHERE schemaname = 'public';
