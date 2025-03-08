-- Ajouter et mettre à jour les icônes des catégories
BEGIN;

-- Ajouter la colonne icon si elle n'existe pas
ALTER TABLE categories
ADD COLUMN IF NOT EXISTS icon varchar(50);

-- Mettre à jour les icônes pour toutes les catégories
UPDATE categories SET icon = CASE name
    WHEN 'Frameworks & Bibliothèques' THEN 'Library'
    WHEN 'Médias & Divertissement' THEN 'Film'
    WHEN 'Agroalimentaire' THEN 'Coffee'
    WHEN 'Audio & Voix' THEN 'Speaker'
    WHEN 'Aviation' THEN 'Plane'
    WHEN 'Construction' THEN 'Tool'
    WHEN 'Design' THEN 'Pen'
    WHEN 'E-commerce' THEN 'ShoppingCart'
    WHEN 'Finance' THEN 'DollarSign'
    WHEN 'Gestion des Tâches' THEN 'ListCheck'
    WHEN 'IoT & Robotique' THEN 'Cpu'
    WHEN 'Juridique' THEN 'FileText'
    WHEN 'Logistique' THEN 'Box'
    WHEN 'Météo' THEN 'Cloud'
    WHEN 'Mode & Style' THEN 'Scissors'
    WHEN 'Recommandation' THEN 'Star'
    WHEN 'Simulation' THEN 'Settings'
    WHEN 'Voix & Parole' THEN 'Speaker'
    ELSE 'Circle' -- Icône par défaut pour les autres catégories
END;

-- Vérifier les mises à jour
SELECT name, icon
FROM categories
ORDER BY name;

COMMIT;
