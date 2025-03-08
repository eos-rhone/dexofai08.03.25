-- Vérifier les outils d'archéologie et d'analyse de données
SELECT 
    t.name as tool_name,
    t.slug as tool_slug,
    c.name as category_name,
    c.slug as category_slug
FROM ai_tools t
LEFT JOIN categories c ON t.category_id = c.id
WHERE t.name IN (
    -- Outils d'archéologie
    'ArchAI',
    'Archaeological Predictor',
    'Ancient Scene',
    'Heritage AI',
    'Stratus',
    'Pottery Scanner',
    'Site Detector',
    'Artifact Analyzer',
    -- Outils d'analyse de données
    'DataRobot',
    'RapidMiner',
    'Knime',
    'Orange',
    'Weka',
    'H2O.ai',
    'DataIku',
    'Alteryx'
);
