-- Correction des URLs des sites web
BEGIN;

-- Vérifier et mettre à jour les URLs des outils
UPDATE ai_tools
SET website_url = CASE 
    WHEN website_url IS NULL THEN NULL
    WHEN website_url LIKE 'http://%' THEN website_url
    WHEN website_url LIKE 'https://%' THEN website_url
    ELSE 'https://' || website_url
END;

UPDATE tools
SET website_url = CASE 
    WHEN website_url IS NULL THEN NULL
    WHEN website_url LIKE 'http://%' THEN website_url
    WHEN website_url LIKE 'https://%' THEN website_url
    ELSE 'https://' || website_url
END;

-- Vérifier qu'il n'y a pas d'URLs invalides
DELETE FROM ai_tools 
WHERE website_url = 'https://';

DELETE FROM tools 
WHERE website_url = 'https://';

COMMIT;
