-- Mise à jour des catégories pour les outils existants
BEGIN;

-- Mise à jour des outils de Cybersécurité
UPDATE ai_tools 
SET category_id = (SELECT id FROM categories WHERE slug = 'cybersécurité')
WHERE slug IN ('crowdstrike');

-- Mise à jour des outils de Développement
UPDATE ai_tools 
SET category_id = (SELECT id FROM categories WHERE slug = 'développement')
WHERE slug IN ('replit', 'tabnine');

-- Mise à jour des outils de Collaboration IA
UPDATE ai_tools 
SET category_id = (SELECT id FROM categories WHERE slug = 'collaboration-ia')
WHERE slug IN ('polyaxon');

COMMIT;
