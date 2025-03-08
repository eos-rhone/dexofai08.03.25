-- Vérifier les outils et leurs catégories
SELECT 
    t.name as tool_name,
    t.slug as tool_slug,
    c.name as category_name,
    c.slug as category_slug
FROM ai_tools t
LEFT JOIN categories c ON t.category_id = c.id
WHERE t.name IN (
    'AudioLabs',
    'Cleanvoice',
    'Voicemod',
    'Adobe Enhanced Speech',
    'Accusonus',
    'iZotope RX',
    'Audionamix',
    'Sonible',
    'Sound Theory',
    'Accentize'
);
