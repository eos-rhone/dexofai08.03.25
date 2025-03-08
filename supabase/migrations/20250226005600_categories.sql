-- Gestion centralisée des catégories
BEGIN;

-- Insertion de toutes les catégories uniques
INSERT INTO categories (name, slug, description, icon) VALUES
('Agents & Automatisation', 'agents-automatisation', 'Outils et frameworks pour créer des agents autonomes et automatiser des tâches', 'Bot'),
('Génération de Code', 'generation-code', 'Outils de génération de code par IA', 'Code'),
('Génération d''Images', 'generation-images', 'Outils de création d''images par IA', 'Image'),
('Vidéo', 'video', 'Outils de création et édition vidéo', 'Video'),
('Productivité', 'productivite', 'Outils d''amélioration de la productivité', 'Clock'),
('Design', 'design', 'Outils de design et création graphique', 'Pen'),
('Agriculture & Environnement', 'agriculture-environnement', 'Applications d''IA pour l''agriculture et l''environnement', 'Leaf'),
('Outils de Données', 'outils-donnees', 'Outils de gestion et traitement des données', 'Database')
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    icon = EXCLUDED.icon;

COMMIT;
