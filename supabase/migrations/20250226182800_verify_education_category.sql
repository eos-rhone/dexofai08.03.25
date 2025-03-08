-- Vérifier la catégorie Éducation et son slug exact
SELECT id, name, slug 
FROM categories 
WHERE name ILIKE '%educ%' OR name ILIKE '%éduc%';
