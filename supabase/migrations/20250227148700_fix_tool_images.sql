-- Mise à jour des images des outils populaires
UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Assistants & Chatbots'),
    image_url = 'https://images.unsplash.com/photo-1675557009875-436f7a7fbcb3?q=80&w=2000'
WHERE name = 'ChatGPT';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Assistants & Chatbots'),
    image_url = 'https://images.unsplash.com/photo-1675557014929-ddd27347e4dc?q=80&w=2000'
WHERE name = 'Claude';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Écriture & Rédaction'),
    image_url = 'https://images.unsplash.com/photo-1502951682449-e5b93545d46e?q=80&w=2000'
WHERE name = 'Grammarly';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Génération d''Images'),
    image_url = 'https://images.unsplash.com/photo-1579547944212-c4f4961a8dd8?q=80&w=2000'
WHERE name = 'Stable Diffusion';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Assistants & Chatbots'),
    image_url = 'https://images.unsplash.com/photo-1676299081847-5c62cf6fe817?q=80&w=2000'
WHERE name = 'Jasper';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Développement'),
    image_url = 'https://images.unsplash.com/photo-1542831371-32f555c86880?q=80&w=2000'
WHERE name = 'Codeium';

-- Correction des images par défaut
UPDATE ai_tools SET 
    image_url = 'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?q=80&w=2000'
WHERE name = 'Writesonic';

UPDATE ai_tools SET 
    image_url = 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000'
WHERE name = 'Qlik';

UPDATE ai_tools SET 
    image_url = 'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?q=80&w=2000'
WHERE name = 'ClickUp AI';

UPDATE ai_tools SET 
    image_url = 'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?q=80&w=2000'
WHERE name = 'Clearscope';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Traduction'),
    image_url = 'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?q=80&w=2000'
WHERE name = 'DeepL';

UPDATE ai_tools SET 
    image_url = 'https://images.unsplash.com/photo-1542744094-3a31f272c490?q=80&w=2000'
WHERE name = 'Marketmuse';

UPDATE ai_tools SET 
    image_url = 'https://images.unsplash.com/photo-1518432031352-d6fc5c10da5a?q=80&w=2000'
WHERE name = 'Auto-GPT';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Assistants & Chatbots'),
    image_url = 'https://images.unsplash.com/photo-1675557014937-b415f773d22d?q=80&w=2000'
WHERE name = 'Meta AI';

UPDATE ai_tools SET 
    image_url = 'https://images.unsplash.com/photo-1552664730-d307ca884978?q=80&w=2000'
WHERE name = 'Gamma';

UPDATE ai_tools SET 
    category_id = (SELECT id FROM categories WHERE name = 'Assistants & Chatbots'),
    image_url = 'https://images.unsplash.com/photo-1675557014937-b415f773d22d?q=80&w=2000'
WHERE name = 'privateGPT';

UPDATE ai_tools SET 
    image_url = 'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?q=80&w=2000'
WHERE name = 'Taskade AI';

-- Vérification après mise à jour
SELECT 
    t.name as tool_name,
    t.image_url as tool_image,
    c.name as category_name
FROM ai_tools t
LEFT JOIN categories c ON t.category_id = c.id
WHERE t.monthly_users > 0
ORDER BY t.monthly_users DESC;
