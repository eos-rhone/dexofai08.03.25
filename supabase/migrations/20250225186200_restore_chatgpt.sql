-- Restauration de ChatGPT
INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured)
SELECT 
    d.name,
    d.slug,
    d.description,
    d.website_url,
    c.id,
    d.pricing::jsonb,
    true,
    d.is_featured
FROM (
    VALUES 
    ('ChatGPT', 'chatgpt', 'Assistant conversationnel avancé basé sur GPT-4', 'https://chat.openai.com', 'Assistants & Chatbots', '[{"plan_name": "Free", "price": 0}, {"plan_name": "Plus", "price": 20}]', true)
) AS d(name, slug, description, website_url, category_name, pricing, is_featured)
JOIN public.categories c ON c.name = d.category_name;
