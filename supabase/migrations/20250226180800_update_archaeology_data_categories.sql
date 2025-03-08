-- Mettre à jour les catégories des outils d'archéologie et d'analyse de données
BEGIN;

-- Mise à jour des outils d'archéologie
UPDATE ai_tools 
SET category_id = (SELECT id FROM categories WHERE slug = 'archéologie')
WHERE slug IN (
    'archai',
    'archaeological-predictor',
    'ancient-scene',
    'heritage-ai',
    'stratus',
    'pottery-scanner',
    'site-detector',
    'artifact-analyzer'
);

-- Mise à jour des outils d'analyse de données
UPDATE ai_tools 
SET category_id = (SELECT id FROM categories WHERE slug = 'analyse-de-données')
WHERE slug IN (
    'datarobot',
    'rapidminer',
    'knime',
    'orange',
    'weka',
    'h2o-ai',
    'dataiku',
    'alteryx'
);

COMMIT;
