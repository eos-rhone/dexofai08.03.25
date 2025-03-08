-- Exporter toutes les informations de référence
SELECT json_build_object(
    'categories', (
        SELECT json_agg(
            json_build_object(
                'id', id,
                'name', name,
                'slug', slug,
                'tool_count', (
                    SELECT COUNT(*) 
                    FROM ai_tools 
                    WHERE category_id = c.id
                )
            )
        )
        FROM categories c
        ORDER BY name
    ),
    'tools', (
        SELECT json_agg(
            json_build_object(
                'id', t.id,
                'name', t.name,
                'slug', t.slug,
                'category_name', c.name,
                'category_id', c.id,
                'category_slug', c.slug
            )
        )
        FROM ai_tools t
        JOIN categories c ON c.id = t.category_id
        ORDER BY t.name
    )
) as reference_data;
