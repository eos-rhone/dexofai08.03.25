-- Create base schema for AI tools and categories

-- Drop existing tables if they exist
DROP TABLE IF EXISTS public.ai_tools CASCADE;
DROP TABLE IF EXISTS public.categories CASCADE;

-- Create categories table
CREATE TABLE public.categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    icon VARCHAR(255) NOT NULL DEFAULT 'default-icon',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create index on categories slug
CREATE INDEX categories_slug_idx ON public.categories(slug);

-- Create ai_tools table
CREATE TABLE public.ai_tools (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    website_url TEXT,
    slug VARCHAR(255) UNIQUE,
    category_id UUID REFERENCES public.categories(id),
    image_url VARCHAR(255),
    pricing JSONB,
    is_active BOOLEAN DEFAULT true,
    is_featured BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes
CREATE INDEX ai_tools_slug_idx ON public.ai_tools(slug);
CREATE INDEX ai_tools_category_id_idx ON public.ai_tools(category_id);

-- Create updated_at trigger function
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create triggers for updated_at
DROP TRIGGER IF EXISTS update_categories_updated_at ON public.categories;
CREATE TRIGGER update_categories_updated_at
    BEFORE UPDATE ON public.categories
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

DROP TRIGGER IF EXISTS update_ai_tools_updated_at ON public.ai_tools;
CREATE TRIGGER update_ai_tools_updated_at
    BEFORE UPDATE ON public.ai_tools
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Insert initial categories
INSERT INTO public.categories (name, slug, description, icon)
SELECT 
    d.name,
    LOWER(REGEXP_REPLACE(d.name, '\s+', '-', 'g')),
    d.description,
    d.icon
FROM (
    VALUES 
    ('Agents & Automatisation', 'Outils et frameworks pour créer des agents autonomes et automatiser des tâches', 'Bot'),
    ('Traitement du Langage Naturel', 'Outils pour le traitement et l''analyse du langage naturel', 'MessageSquare'),
    ('Vision par Ordinateur', 'Outils pour le traitement et l''analyse d''images et de vidéos', 'Camera'),
    ('MLOps & Déploiement', 'Outils pour la gestion du cycle de vie des modèles ML et leur déploiement', 'Rocket'),
    ('Frameworks & Bibliothèques', 'Frameworks et bibliothèques fondamentales pour l''IA et le ML', 'Library'),
    ('Données & Préparation', 'Outils pour la préparation, l''annotation et la gestion des données', 'Database'),
    ('Optimisation & Performance', 'Outils pour l''optimisation et l''amélioration des performances des modèles', 'Zap'),
    ('Visualisation & Analyse', 'Outils pour la visualisation et l''analyse des données et des modèles', 'LineChart'),
    ('Assistants & Chatbots', 'Agents conversationnels et assistants virtuels intelligents', 'MessageSquare'),
    ('Génération d''images', 'Créez des images uniques à partir de descriptions textuelles', 'Image'),
    ('Création musicale', 'Composez et générez de la musique avec l''IA', 'Music'),
    ('Analyse de données', 'Outils d''analyse et de visualisation de données', 'LineChart'),
    ('Productivité', 'Outils pour améliorer votre efficacité quotidienne', 'Zap'),
    ('Design', 'Outils de design et de création graphique', 'Layout'),
    ('Développement', 'Assistants de programmation et outils de développement', 'Code'),
    ('Recherche', 'Assistants de recherche et d''analyse scientifique', 'Search'),
    ('Robotique', 'Solutions d''IA pour la robotique et l''automatisation', 'Bot'),
    ('Cybersécurité', 'Outils d''IA pour la sécurité informatique', 'Shield'),
    ('Santé', 'Applications d''IA pour la santé et la médecine', 'Heart'),
    ('Finance', 'Solutions d''IA pour la finance et l''investissement', 'LineChart'),
    ('IoT & Domotique', 'IA pour les objets connectés et la maison intelligente', 'Home'),
    ('Jeux vidéo', 'IA pour le développement et l''expérience de jeu', 'Gamepad'),
    ('Recherche scientifique', 'IA pour la recherche et les découvertes scientifiques', 'Flask'),
    ('Juridique', 'Applications d''IA pour le domaine juridique', 'Scale'),
    ('Réalité augmentée & virtuelle', 'Outils d''IA pour la réalité augmentée et virtuelle', 'Glasses'),
    ('Traduction & Localisation', 'Solutions d''IA pour la traduction et l''adaptation culturelle', 'Languages'),
    ('Automobile & Transport', 'IA pour les véhicules autonomes et la mobilité', 'Car'),
    ('Agriculture & Environnement', 'Applications d''IA pour l''agriculture et l''environnement', 'Leaf'),
    ('Mode & Design', 'IA pour la création de mode et le design textile', 'Shirt'),
    ('Architecture & Construction', 'IA pour la conception architecturale et la construction', 'Building2'),
    ('Ressources humaines', 'Solutions d''IA pour le recrutement et la gestion RH', 'Users'),
    ('Intelligence Artificielle Générale', 'Recherche et développement en IA générale', 'Brain'),
    ('Métavers & Mondes virtuels', 'Solutions IA pour les univers virtuels', 'Globe'),
    ('Art & Créativité', 'IA pour l''expression artistique', 'Palette'),
    ('Science des données', 'Outils d''analyse et visualisation avancée', 'Database'),
    ('Blockchain & Web3', 'IA appliquée à la blockchain et au Web3', 'CircuitBoard'),
    ('Énergie & Climat', 'IA pour l''efficacité énergétique et le climat', 'Leaf'),
    ('Sport & Fitness', 'Applications IA pour le sport et le bien-être', 'Dumbbell'),
    ('Médias & Divertissement', 'IA pour l''industrie du divertissement', 'Film'),
    ('Astronomie & Espace', 'IA pour l''exploration spatiale et l''astronomie', 'Rocket'),
    ('Chimie & Matériaux', 'IA pour la découverte de nouveaux matériaux', 'Flask'),
    ('Océanographie', 'IA pour l''étude et la protection des océans', 'Waves'),
    ('Archéologie', 'IA pour l''exploration et l''analyse archéologique', 'Microscope'),
    ('Musées & Patrimoine', 'IA pour la préservation du patrimoine culturel', 'Building'),
    ('Géologie', 'IA pour l''étude des sols et des minéraux', 'Mountain'),
    ('Biotechnologie', 'IA pour la recherche en biotechnologie', 'FlaskConical'),
    ('Psychologie', 'IA pour la recherche en psychologie', 'Brain'),
    ('Réalité Mixte', 'Solutions IA combinant AR, VR et réalité augmentée', 'Glasses'),
    ('Nanotechnologie', 'IA pour la recherche et le développement en nanotechnologie', 'Microscope'),
    ('Acoustique', 'IA pour l''analyse et le traitement du son', 'Headphones'),
    ('Photographie', 'IA pour l''amélioration et le traitement photo', 'Camera'),
    ('Impression 3D', 'IA pour l''optimisation de l''impression 3D', 'Cube'),
    ('Logistique', 'Solutions IA pour la chaîne d''approvisionnement', 'Truck'),
    ('Télécommunications', 'IA pour les réseaux et communications', 'Radio'),
    ('Industrie 4.0', 'IA pour l''industrie intelligente', 'Factory'),
    ('Génération de Code', 'Outils d''IA pour la génération et l''assistance au développement', 'Code'),
    ('Audio & Voix', 'Outils d''IA pour le traitement audio et la synthèse vocale', 'Speaker'),
    ('Vidéo', 'Outils d''IA pour la création et l''édition vidéo', 'Video'),
    ('Outils de Données', 'Outils d''IA pour la gestion et l''analyse de données', 'Database'),
    ('Recommandation', 'Outils d''IA pour les systèmes de recommandation', 'ThumbsUp'),
    ('Développement d''Agents', 'Outils d''IA pour le développement d''agents autonomes', 'Bot'),
    ('Simulation', 'Outils d''IA pour la simulation et la modélisation', 'Settings'),
    ('Collaboration IA', 'Outils d''IA pour la collaboration et le travail d''équipe', 'Users'),
    ('Gestion des Tâches', 'Outils d''IA pour la gestion et l''automatisation des tâches', 'ListCheck'),
    ('Rédaction & Contenu', 'Génération et optimisation de contenu', 'Pencil'),
    ('Voix & Parole', 'Synthèse et reconnaissance vocale', 'Speaker'),
    ('Business & Marketing', 'Solutions IA pour le marketing et le business', 'Briefcase')
) AS d(name, description, icon)
ON CONFLICT (slug) DO UPDATE 
SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    icon = EXCLUDED.icon;
