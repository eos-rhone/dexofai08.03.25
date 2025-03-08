-- Mettre à jour la catégorie des outils audio
BEGIN;

UPDATE ai_tools 
SET category_id = (SELECT id FROM categories WHERE slug = 'acoustique')
WHERE slug IN (
    'audiolabs',
    'cleanvoice',
    'voicemod',
    'adobe-enhanced-speech',
    'accusonus',
    'izotope-rx',
    'audionamix',
    'sonible',
    'sound-theory',
    'accentize'
);

COMMIT;
