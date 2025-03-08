import React, { useState, useEffect } from 'react';
import { Icon } from '../components/Icon';
import { 
  Search, 
  Headphones, 
  LineChart, 
  Microscope, 
  Rocket, 
  FlaskConical, 
  CircuitBoard, 
  Briefcase, 
  Leaf, 
  Mountain, 
  Box as Cube, 
  Factory, 
  Truck, 
  Film, 
  Building, 
  Building2,
  Waves, 
  Pencil, 
  Dumbbell, 
  Folder,
  Brain,
  MessageSquare,
  Car,
  Music,
  Shield,
  Layout,
  Code,
  GraduationCap,
  Image,
  Home,
  Gamepad,
  Scale,
  Globe,
  Shirt,
  Camera,
  Zap,
  Glasses,
  Radio,
  Languages,
  Video,
  Mic2,
  Database,
  Heart,
  Bot,
  Users,
  ArrowUpRight,
  Beaker,
  Palette,
  CheckSquare,
  ListTodo,
  Star,
  Coffee,
  ShoppingCart,
  DollarSign,
  Cpu,
  FileText,
  Box,
  Cloud,
  Scissors,
  Settings,
  Speaker,
  Clock,
  PenTool,
  Phone,
  Eye,
  PieChart,
  MessageCircle,
  Link,
  Cog,
  Printer,
  Server,
  Landmark,
  Plane
} from 'lucide-react';
import { Link as RouterLink, useLocation } from 'react-router-dom';
import { getCategories, getTools, fixMissingIcons } from '../lib/supabase';
import { AiBrain } from '../components/icons/AiBrain';
import { Acoustic } from '../components/icons/Acoustic';

interface Category {
  id: string;
  name: string;
  slug: string;
  description: string;
  icon: string;
  tool_count: number;
  popularTools: {
    name: string;
    slug: string;
    website_url: string;
  }[];
}

const iconMap = {
  headphones: Headphones,
  linechart: LineChart,
  microscope: Microscope,
  rocket: Rocket,
  flaskconical: FlaskConical,
  circuitboard: CircuitBoard,
  briefcase: Briefcase,
  leaf: Leaf,
  mountain: Mountain,
  cube: Cube,
  factory: Factory,
  truck: Truck,
  film: Film,
  building: Building,
  building2: Building2,
  waves: Waves,
  search: Search,
  pencil: Pencil,
  dumbbell: Dumbbell,
  folder: Folder,
  brain: Brain,
  messagesquare: MessageSquare,
  car: Car,
  flask: Beaker,
  music: Music,
  shield: Shield,
  layout: Layout,
  code: Code,
  graduationcap: GraduationCap,
  image: Image,
  home: Home,
  gamepad: Gamepad,
  scale: Scale,
  globe: Globe,
  shirt: Shirt,
  camera: Camera,
  zap: Zap,
  glasses: Glasses,
  radio: Radio,
  languages: Languages,
  video: Video,
  mic2: Mic2,
  database: Database,
  heart: Heart,
  bot: Bot,
  users: Users,
  aibrain: Brain,
  acoustic: Music,
  palette: Palette,
  coffee: Coffee,
  shoppingcart: ShoppingCart,
  dollarsign: DollarSign,
  listcheck: CheckSquare,
  cpu: Cpu,
  filetext: FileText,
  box: Box,
  cloud: Cloud,
  scissors: Scissors,
  settings: Settings,
  speaker: Speaker,
  clock: Clock,
  pentool: PenTool,
  phone: Phone,
  eye: Eye,
  piechart: PieChart,
  messagecircle: MessageCircle,
  link: Link,
  cog: Cog,
  printer: Printer,
  server: Server,
  landmark: Landmark,
  plane: Plane,
  star: Star,
  checksquare: CheckSquare,
  listtodo: ListTodo
};

const colorClasses = [
  'bg-blue-500',
  'bg-purple-500',
  'bg-green-500',
  'bg-amber-500',
  'bg-rose-500',
  'bg-indigo-500',
];

export function Categories() {
  const [searchQuery, setSearchQuery] = useState('');
  const [categories, setCategories] = useState<Category[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const location = useLocation();

  useEffect(() => {
    const params = new URLSearchParams(location.search);
    const searchParam = params.get('search');
    if (searchParam) {
      setSearchQuery(searchParam);
    }
  }, [location]);

  useEffect(() => {
    async function loadData() {
      try {
        setIsLoading(true);
        setError(null);

        // Corriger les icônes manquantes avant de charger les catégories
        await fixMissingIcons();
        
        const categoriesData = await getCategories();
        
        if (!categoriesData || categoriesData.length === 0) {
          setError('Aucune catégorie trouvée');
          return;
        }

        const categoriesWithTools = await Promise.all(
          categoriesData.map(async (category) => {
            try {
              // Récupérer seulement les 4 outils populaires
              const popularToolsData = await getTools({ 
                category: category.slug,
                limit: 4
              });
              
              // Mapper les outils populaires avec vérification des doublons
              const seenSlugs = new Set();
              const popularTools = popularToolsData
                .filter(tool => {
                  if (!tool.slug) {
                    console.warn(`Tool without slug found in category ${category.name}`);
                    return false;
                  }
                  if (seenSlugs.has(tool.slug)) {
                    console.warn(`Duplicate tool slug found in category ${category.name}: ${tool.slug}`);
                    return false;
                  }
                  seenSlugs.add(tool.slug);
                  return true;
                })
                .map(tool => ({
                  name: tool.name,
                  slug: tool.slug,
                  website_url: tool.website_url || '#'
                }));
              
              return {
                ...category,
                popularTools
              };
            } catch (error) {
              console.error(`Erreur lors du chargement des outils pour ${category.name}:`, error);
              return {
                ...category,
                popularTools: []
              };
            }
          })
        );
        
        setCategories(categoriesWithTools);
      } catch (error) {
        console.error('Error loading categories:', error);
        setError('Une erreur est survenue lors du chargement des catégories');
      } finally {
        setIsLoading(false);
      }
    }

    loadData();
  }, []);

  const filteredCategories = categories.filter((category) =>
    category.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
    category.description.toLowerCase().includes(searchQuery.toLowerCase())
  );

  if (isLoading) {
    return (
      <div className="flex justify-center items-center min-h-[200px]">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-500"></div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="bg-red-500/10 border border-red-500 rounded-lg p-4 mb-8 text-red-500">
        {error}
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-[#0B0F19] text-white px-6 py-12">
      <div className="max-w-7xl mx-auto">
        {/* Animated Header with Icon */}
        <div className="text-center mb-12">
          <div className="flex justify-center mb-8">
            <div className="relative group">
              {/* Animated background glow */}
              <div className="absolute inset-0 bg-blue-500/20 rounded-full blur-xl group-hover:blur-2xl transition-all duration-500 animate-pulse"></div>
              
              {/* Main icon with rotation and scale animation */}
              <div className="relative dark:bg-gray-900/80 p-8 rounded-full transform group-hover:scale-110 transition-transform duration-500">
                <div className={`w-24 h-24 rounded-2xl flex items-center justify-center`}>
                  <Folder size={48} className="text-blue-500" />
                </div>
                
                {/* Orbiting elements */}
                <div className="absolute inset-0 animate-spin-slow">
                  <Star className="w-8 h-8 text-yellow-500 absolute -top-4 left-1/2 -translate-x-1/2 transform -rotate-12" />
                  <MessageSquare className="w-8 h-8 text-purple-500 absolute -bottom-4 left-1/2 -translate-x-1/2 transform rotate-12" />
                  <Zap className="w-8 h-8 text-green-500 absolute top-1/2 -right-4 -translate-y-1/2" />
                  <Search className="w-8 h-8 text-red-500 absolute top-1/2 -left-4 -translate-y-1/2" />
                </div>
                
                {/* Particle effects */}
                <div className="absolute inset-0">
                  <div className="absolute top-0 left-1/4 w-2 h-2 bg-blue-500 rounded-full animate-float-particle-1"></div>
                  <div className="absolute bottom-0 right-1/4 w-2 h-2 bg-purple-500 rounded-full animate-float-particle-2"></div>
                  <div className="absolute top-1/2 right-0 w-2 h-2 bg-green-500 rounded-full animate-float-particle-3"></div>
                </div>
              </div>
            </div>
          </div>
          <h1 className="text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-blue-500 via-purple-500 to-pink-500 mb-4 animate-fade-in">
            Catégories
          </h1>
          <p className="text-center text-gray-400 mb-12 max-w-3xl mx-auto animate-fade-in">
            Explorez notre catalogue d'outils d'intelligence artificielle par catégorie
          </p>
        </div>

        <div className="max-w-2xl mx-auto mb-16">
          <div className="relative">
            <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
            <input
              type="text"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              placeholder="Rechercher une catégorie..."
              className="w-full pl-12 pr-4 py-4 bg-gray-900/50 border border-gray-800 rounded-lg text-white placeholder-gray-400 focus:outline-none focus:border-blue-500 transition-all duration-300"
            />
          </div>
        </div>

        {filteredCategories.length === 0 ? (
          <div className="text-center text-gray-500">
            Aucune catégorie trouvée
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {filteredCategories.map((category, index) => (
              <div
                key={category.id}
                className="bg-gray-900/50 rounded-xl p-6 border border-gray-800 hover:border-blue-500 transition-all transform hover:scale-105 hover:shadow-xl hover:shadow-blue-500/10"
              >
                <div className={`w-16 h-16 rounded-2xl ${colorClasses[index % colorClasses.length]} flex items-center justify-center mb-4`}>
                  {(() => {
                    let icon = category.icon || '';
                    // Convertir en minuscules et nettoyer le nom de l'icône
                    const iconKey = icon.toLowerCase()
                      .replace('/icons/categories/', '')
                      .replace('.svg', '')
                      .replace(/[^a-z0-9]/g, '');
                    
                    console.log('=== Categories.tsx Debug ===');
                    console.log('Category:', category.name);
                    console.log('Original icon:', icon);
                    console.log('Cleaned icon key:', iconKey);
                    
                    // Trouver l'icône dans l'iconMap
                    const IconComponent = iconMap[iconKey] || iconMap[icon] || iconMap[icon.toLowerCase()] || Folder;
                    
                    // Utiliser directement l'icône de Lucide
                    return <IconComponent size={32} className="text-white" />;
                  })()}
                </div>

                <RouterLink 
                  to={`/categories/${category.slug}`}
                  className="inline-block mb-2 hover:text-blue-500 transition-colors"
                >
                  <h3 className="text-xl font-semibold">{category.name}</h3>
                </RouterLink>

                <p className="text-gray-400 text-sm mb-4 line-clamp-2">
                  {category.description}
                </p>

                <div className="flex flex-wrap gap-2 mb-4">
                  {category.popularTools?.map((tool, toolIndex) => (
                    <a
                      key={`${category.id}-${tool.slug}-${toolIndex}`}
                      href={tool.website_url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="px-3 py-1 bg-gray-800 rounded-full text-sm text-gray-400 hover:bg-blue-500/10 hover:text-blue-500 transition-all duration-300 flex items-center gap-1"
                    >
                      {tool.name}
                      <ArrowUpRight className="w-3 h-3" />
                    </a>
                  ))}
                </div>

                <div className="text-sm text-gray-500">
                  {category.tool_count} outils
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}

export default Categories;
