-- Ajouter les colonnes manquantes à la table ai_tools
ALTER TABLE public.ai_tools 
    ADD COLUMN IF NOT EXISTS slug VARCHAR(255),
    ADD COLUMN IF NOT EXISTS image_url VARCHAR(255),
    ADD COLUMN IF NOT EXISTS pricing JSONB,
    ADD COLUMN IF NOT EXISTS is_active BOOLEAN DEFAULT true,
    ADD COLUMN IF NOT EXISTS is_featured BOOLEAN DEFAULT false,
    ADD COLUMN IF NOT EXISTS created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP;

-- Mettre à jour les slugs existants
UPDATE public.ai_tools 
SET slug = LOWER(REGEXP_REPLACE(name, '\s+', '-', 'g'))
WHERE slug IS NULL;

-- Supprimer la contrainte si elle existe déjà
DO $$ 
BEGIN
    IF EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'ai_tools_slug_unique'
    ) THEN
        ALTER TABLE public.ai_tools DROP CONSTRAINT ai_tools_slug_unique;
    END IF;
END $$;

-- Ajouter la contrainte UNIQUE sur slug
ALTER TABLE public.ai_tools
    ADD CONSTRAINT ai_tools_slug_unique UNIQUE (slug);

-- Création des index
CREATE INDEX IF NOT EXISTS ai_tools_slug_idx ON public.ai_tools(slug);
CREATE INDEX IF NOT EXISTS ai_tools_category_id_idx ON public.ai_tools(category_id);

-- Création de la fonction pour le trigger updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Création du trigger pour updated_at
DROP TRIGGER IF EXISTS update_ai_tools_updated_at ON public.ai_tools;
CREATE TRIGGER update_ai_tools_updated_at
    BEFORE UPDATE ON public.ai_tools
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Configuration des politiques RLS
ALTER TABLE public.ai_tools ENABLE ROW LEVEL SECURITY;

-- Politique pour permettre la lecture publique
DROP POLICY IF EXISTS "Allow public read access" ON public.ai_tools;
CREATE POLICY "Allow public read access"
    ON public.ai_tools
    FOR SELECT
    USING (true);

-- Politique pour permettre l'insertion/mise à jour par les utilisateurs authentifiés
DROP POLICY IF EXISTS "Allow authenticated users to modify" ON public.ai_tools;
CREATE POLICY "Allow authenticated users to modify"
    ON public.ai_tools
    FOR ALL
    USING (auth.role() = 'authenticated');
