-- Create categories table
CREATE TABLE IF NOT EXISTS public.categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create index on slug
CREATE INDEX IF NOT EXISTS categories_slug_idx ON public.categories(slug);

-- Create trigger function for updated_at
CREATE OR REPLACE FUNCTION update_categories_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create trigger for updated_at
DROP TRIGGER IF EXISTS update_categories_updated_at ON public.categories;
CREATE TRIGGER update_categories_updated_at
    BEFORE UPDATE ON public.categories
    FOR EACH ROW
    EXECUTE FUNCTION update_categories_updated_at();

-- Add foreign key to ai_tools table
ALTER TABLE public.ai_tools
    ADD COLUMN IF NOT EXISTS category_id UUID REFERENCES public.categories(id);

-- Create validation function
CREATE OR REPLACE FUNCTION validate_tool_category()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.category_id IS NULL THEN
        RAISE EXCEPTION 'La catégorie est requise pour les outils AI';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM categories WHERE id = NEW.category_id) THEN
        RAISE EXCEPTION 'La catégorie avec l''ID % n''existe pas', NEW.category_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger for category validation
DROP TRIGGER IF EXISTS validate_tool_category_trigger ON public.ai_tools;
CREATE TRIGGER validate_tool_category_trigger
    BEFORE INSERT OR UPDATE ON public.ai_tools
    FOR EACH ROW
    EXECUTE FUNCTION validate_tool_category();

-- Insert initial categories
INSERT INTO public.categories (name, slug, description)
VALUES
    ('Agents & Automatisation', 'agents-automatisation', 'Outils et frameworks pour créer des agents autonomes et automatiser des tâches'),
    ('Traitement du Langage Naturel', 'nlp', 'Outils pour le traitement et l''analyse du langage naturel'),
    ('Vision par Ordinateur', 'vision', 'Outils pour le traitement et l''analyse d''images et de vidéos'),
    ('MLOps & Déploiement', 'mlops', 'Outils pour la gestion du cycle de vie des modèles ML et leur déploiement'),
    ('Frameworks & Bibliothèques', 'frameworks', 'Frameworks et bibliothèques fondamentales pour l''IA et le ML'),
    ('Données & Préparation', 'data', 'Outils pour la préparation, l''annotation et la gestion des données'),
    ('Optimisation & Performance', 'optimisation', 'Outils pour l''optimisation et l''amélioration des performances des modèles'),
    ('Visualisation & Analyse', 'visualisation', 'Outils pour la visualisation et l''analyse des données et des modèles')
ON CONFLICT (slug) DO UPDATE
SET name = EXCLUDED.name,
    description = EXCLUDED.description;
