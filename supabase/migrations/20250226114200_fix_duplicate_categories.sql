-- Fix duplicate categories and merge their tools
DO $$
DECLARE
    duplicate_category RECORD;
    main_category_id UUID;
BEGIN
    -- Find duplicate categories based on similar names
    FOR duplicate_category IN (
        SELECT LOWER(name) as lower_name, 
               array_agg(id) as category_ids,
               array_agg(name) as category_names
        FROM categories 
        GROUP BY LOWER(name)
        HAVING COUNT(*) > 1
    ) LOOP
        -- Select the first category ID as the main one
        main_category_id := (duplicate_category.category_ids)[1];
        
        -- Move all tools from duplicate categories to the main category
        UPDATE ai_tools
        SET category_id = main_category_id
        WHERE category_id = ANY(duplicate_category.category_ids[2:]);
        
        -- Delete the duplicate categories
        DELETE FROM categories 
        WHERE id = ANY(duplicate_category.category_ids[2:]);
        
        RAISE NOTICE 'Merged duplicate categories: %', duplicate_category.category_names;
    END LOOP;
END;
$$;
