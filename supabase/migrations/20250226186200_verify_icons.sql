-- Vérifier l'état final des icônes
SELECT 
    name,
    icon,
    CASE 
        WHEN icon IN (
            'Cube', 'Leaf', 'LineChart', 'Building2', 'Palette', 'Rocket',
            'Music', 'Headphones', 'Car', 'Flask', 'Briefcase', 'FlaskConical',
            'Shield', 'Pencil', 'Code', 'GraduationCap', 'Zap', 'Gamepad',
            'Image', 'Mountain', 'Home', 'Factory', 'Brain', 'CircuitBoard',
            'Film', 'Globe', 'Shirt', 'Waves', 'Camera', 'Glasses', 'Search',
            'Microscope', 'Users', 'Bot', 'Heart', 'Database', 'Dumbbell',
            'Radio', 'Languages', 'MessageSquare', 'Truck', 'Video', 'Mic2',
            'Speaker', 'MessageCircle', 'Coffee', 'Building2', 'Link',
            'ShoppingCart', 'DollarSign', 'ListCheck', 'Cpu', 'FileText',
            'Box', 'Cloud', 'Server', 'Scissors', 'Landmark', 'Clock',
            'PenTool', 'Star', 'Eye', 'PieChart', 'Cog', 'Printer'
        ) THEN true
        ELSE false
    END as has_valid_icon
FROM categories
ORDER BY name;

-- Compter les icônes uniques utilisées
SELECT 
    icon,
    COUNT(*) as usage_count
FROM categories
GROUP BY icon
ORDER BY usage_count DESC, icon;
