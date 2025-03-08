-- 1. Voir les outils sans slug
SELECT id, name, website_url
FROM public.ai_tools
WHERE slug IS NULL;

-- 2. Créer une fonction pour générer un slug unique
CREATE OR REPLACE FUNCTION generate_unique_slug(name_text TEXT)
RETURNS TEXT AS $$
DECLARE
    base_slug TEXT;
    final_slug TEXT;
    counter INTEGER := 1;
BEGIN
    -- Convertir le nom en slug de base (lowercase, remplacer les espaces par des tirets)
    base_slug := LOWER(REGEXP_REPLACE(name_text, '[^a-zA-Z0-9\s]', '', 'g')); -- Enlever les caractères spéciaux
    base_slug := REGEXP_REPLACE(base_slug, '\s+', '-', 'g'); -- Remplacer les espaces par des tirets
    
    -- Essayer le slug de base d'abord
    final_slug := base_slug;
    
    -- Si le slug existe déjà, ajouter un numéro jusqu'à trouver un slug unique
    WHILE EXISTS (SELECT 1 FROM public.ai_tools WHERE slug = final_slug) LOOP
        final_slug := base_slug || '-' || counter;
        counter := counter + 1;
    END LOOP;
    
    RETURN final_slug;
END;
$$ LANGUAGE plpgsql;

-- 3. Mettre à jour les outils sans slug
DO $$
DECLARE
    tool_record RECORD;
BEGIN
    FOR tool_record IN SELECT id, name FROM public.ai_tools WHERE slug IS NULL LOOP
        UPDATE public.ai_tools
        SET 
            slug = generate_unique_slug(tool_record.name),
            updated_at = CURRENT_TIMESTAMP
        WHERE id = tool_record.id;
    END LOOP;
END;
$$;

-- 4. Vérifier qu'il n'y a plus d'outils sans slug
SELECT COUNT(*) as remaining_tools_without_slug
FROM public.ai_tools
WHERE slug IS NULL;

-- 5. Voir les nouveaux slugs générés
SELECT name, slug
FROM public.ai_tools
WHERE updated_at > NOW() - INTERVAL '5 minutes'
ORDER BY name;
