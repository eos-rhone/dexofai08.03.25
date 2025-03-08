-- Vérifier les outils problématiques dans les deux tables
SELECT 
    'tools' as source,
    name,
    slug,
    image_url
FROM tools 
WHERE name IN ('ChatGPT', 'Claude', 'Jasper', 'Meta AI', 'privateGPT')
UNION ALL
SELECT 
    'ai_tools' as source,
    name,
    slug,
    image_url
FROM ai_tools
WHERE name IN ('ChatGPT', 'Claude', 'Jasper', 'Meta AI', 'privateGPT')
ORDER BY name, source;
