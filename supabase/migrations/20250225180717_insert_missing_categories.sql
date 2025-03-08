-- Insertion des catégories manquantes
INSERT INTO public.categories (name, slug, description, icon)
SELECT 
    d.name,
    LOWER(REGEXP_REPLACE(d.name, '\s+', '-', 'g')),
    d.description,
    'default-icon'
FROM (
    VALUES 
    ('Chatbots & Assistants', 'Outils d''IA pour les chatbots et assistants virtuels'),
    ('Génération de Code', 'Outils d''IA pour la génération et l''assistance au développement'),
    ('Génération d''Images', 'Outils d''IA pour la création et l''édition d''images'),
    ('Audio & Voix', 'Outils d''IA pour le traitement audio et la synthèse vocale'),
    ('Vidéo', 'Outils d''IA pour la création et l''édition vidéo'),
    ('Productivité', 'Outils d''IA pour améliorer la productivité et l''organisation'),
    ('Design', 'Outils d''IA pour le design et la création graphique'),
    ('Outils de Données', 'Outils d''IA pour la gestion et l''analyse de données'),
    ('Recommandation', 'Outils d''IA pour les systèmes de recommandation'),
    ('Développement d''Agents', 'Outils d''IA pour le développement d''agents autonomes'),
    ('Simulation', 'Outils d''IA pour la simulation et la modélisation'),
    ('Collaboration IA', 'Outils d''IA pour la collaboration et le travail d''équipe'),
    ('Développement', 'Outils d''IA pour le développement logiciel'),
    ('Gestion des Tâches', 'Outils d''IA pour la gestion et l''automatisation des tâches')
) AS d(name, description)
ON CONFLICT (slug) DO UPDATE 
SET description = EXCLUDED.description;
