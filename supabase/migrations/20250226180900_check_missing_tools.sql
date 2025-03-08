-- Rechercher les outils manquants avec une recherche flexible
SELECT 
    t.name as tool_name,
    t.slug as tool_slug,
    c.name as category_name,
    c.slug as category_slug
FROM ai_tools t
LEFT JOIN categories c ON t.category_id = c.id
WHERE 
    -- Recherche flexible pour les outils d'analyse de données
    LOWER(t.name) LIKE LOWER('%Orange%')
    OR LOWER(t.name) LIKE LOWER('%Weka%')
    OR LOWER(t.name) LIKE LOWER('%DataIku%')
    OR LOWER(t.name) LIKE LOWER('%Dataiku%')
    -- Recherche flexible pour les outils d'archéologie
    OR LOWER(t.name) LIKE LOWER('%Ancient%Scene%')
    OR LOWER(t.name) LIKE LOWER('%Stratus%')
    OR LOWER(t.name) LIKE LOWER('%Pottery%')
    OR LOWER(t.name) LIKE LOWER('%Site%Detect%')
    OR LOWER(t.name) LIKE LOWER('%Artifact%Analyz%');

-- Voir aussi tous les outils dans ces catégories
SELECT 
    c.name as category_name,
    c.slug as category_slug,
    COUNT(t.id) as tool_count,
    STRING_AGG(t.name, ', ') as tools
FROM categories c
LEFT JOIN ai_tools t ON c.id = t.category_id
WHERE c.slug IN ('analyse-de-données', 'archéologie')
GROUP BY c.name, c.slug;
