-- Insert missing categories
BEGIN;

INSERT INTO public.categories (name, slug, description)
VALUES 
    ('Acoustique', 'acoustic', 'Outils d''IA pour le traitement et l''analyse audio'),
    ('3D et Animation', '3d', 'Outils d''IA pour la création 3D et l''animation'),
    ('Analyse de Données', 'data-analysis', 'Outils d''IA pour l''analyse et la visualisation de données'),
    ('Archéologie', 'archaeology', 'Outils d''IA pour la recherche et l''analyse archéologique')
ON CONFLICT (slug) 
DO UPDATE SET 
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    updated_at = CURRENT_TIMESTAMP;

COMMIT;
