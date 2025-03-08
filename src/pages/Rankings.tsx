import React, { useState, useCallback, useEffect, useMemo, useRef } from 'react';
import { TrendingUp, Star, Users, Eye, MessageSquare, ArrowUpRight, Search, Trophy, Sparkles, Zap, Crown, ChevronDown } from 'lucide-react';
import { getTools, getCategories } from '../lib/supabase';
import PopupTopRanking from '../components/PopupTopRanking';

interface Tool {
  id: string;
  name: string;
  description: string;
  category: {
    name: string;
  };
  average_rating: number;
  total_reviews: number;
  total_views: number;
  monthly_users: number;
  image_url: string;
  website_url: string;
  is_verified: boolean;
  is_featured: boolean;
  pricing: {
    plan_name: string;
    price: number;
  }[];
}

interface Category {
  id: string;
  name: string;
  slug: string;
}

const calculatePopularityScore = (tool: Tool) => {
  const monthlyUsersScore = Math.log10(tool.monthly_users + 1) / 6;
  const viewsScore = Math.log10(tool.total_views + 1) / 6;
  const reviewScore = (tool.average_rating * tool.total_reviews) / 50000;
  
  return monthlyUsersScore * 0.5 + viewsScore * 0.3 + reviewScore * 0.2;
};

const TopToolCard = React.memo(({ tool, index }: { tool: Tool; index: number }) => {
  const [isPopupOpen, setIsPopupOpen] = useState(false);

  return (
    <>
      <style>{`
        @keyframes shimmer {
          0% {
            transform: translateX(-100%);
          }
          100% {
            transform: translateX(100%);
          }
        }

        .magic-card {
          position: relative;
          overflow: hidden;
        }

        .magic-card::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          width: 200%;
          height: 100%;
          background: linear-gradient(
            90deg,
            transparent 0%,
            rgba(78, 169, 255, 0.1) 45%,
            rgba(78, 169, 255, 0.2) 50%,
            rgba(78, 169, 255, 0.1) 55%,
            transparent 100%
          );
          transform: translateX(-100%);
          animation: shimmer 4s infinite linear;
          pointer-events: none;
          z-index: 1;
        }

        .magic-card:hover::before {
          animation: shimmer 2s infinite linear;
          background: linear-gradient(
            90deg,
            transparent 0%,
            rgba(78, 169, 255, 0.2) 45%,
            rgba(78, 169, 255, 0.3) 50%,
            rgba(78, 169, 255, 0.2) 55%,
            transparent 100%
          );
        }
      `}</style>
      <div 
        className="magic-card bg-gray-900/50 rounded-lg overflow-hidden border border-gray-800 hover:border-blue-500 transition-all transform hover:scale-[1.02] hover:shadow-xl hover:shadow-blue-500/10 group cursor-pointer"
        onClick={() => setIsPopupOpen(true)}
      >
        <div className="relative">
          <img
            src={tool.image_url}
            alt={tool.name}
            className="w-full h-32 object-cover transform group-hover:scale-110 transition-transform duration-700"
            loading="lazy"
          />
          <div className="absolute top-2 left-2 px-2 py-0.5 bg-yellow-500 text-black text-sm font-bold rounded-full flex items-center gap-1">
            <Crown className="w-3 h-3" />
            #{index + 1}
          </div>
        </div>
        <div className="p-3">
          <h3 className="text-sm font-semibold mb-1 truncate group-hover:text-blue-500 transition-colors">
            {tool.name}
          </h3>
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-1">
              <Star className="w-3 h-3 text-yellow-500" />
              <span className="text-xs font-medium">{tool.average_rating.toFixed(1)}</span>
            </div>
            <a
              href={tool.website_url}
              target="_blank"
              rel="noopener noreferrer"
              className="p-1 bg-blue-500/10 rounded text-blue-500 hover:bg-blue-500 hover:text-white transition-colors group/btn"
              onClick={(e) => e.stopPropagation()}
            >
              <ArrowUpRight className="w-4 h-4 group-hover/btn:rotate-45 transition-transform" />
            </a>
          </div>
        </div>
      </div>

      <PopupTopRanking
        isOpen={isPopupOpen}
        onClose={() => setIsPopupOpen(false)}
        tool={tool}
        ranking={index + 1}
      />
    </>
  );
});

const ToolListCard = React.memo(({ tool, index, formatNumber, formatPrice, getBadges }: { 
  tool: Tool; 
  index: number;
  formatNumber: (num: number) => string;
  formatPrice: (tool: Tool) => string;
  getBadges: (tool: Tool) => string[];
}) => {
  return (
    <div className="bg-gray-900/50 rounded-xl overflow-hidden border border-gray-800 hover:border-blue-500 transition-all transform hover:scale-[1.02] hover:shadow-xl hover:shadow-blue-500/10 group">
      <div className="p-6 flex gap-6">
        <div className="flex flex-col items-center justify-center w-16">
          <div className={`text-3xl font-bold ${
            index < 3 ? 'text-yellow-500' : 'text-blue-500'
          }`}>#{index + 1}</div>
        </div>

        <div className="relative w-24 h-24 rounded-xl overflow-hidden flex-shrink-0">
          <img
            src={tool.image_url}
            alt={tool.name}
            className="w-full h-full object-cover transform group-hover:scale-110 transition-transform duration-700"
            loading="lazy"
          />
        </div>

        <div className="flex-1">
          <div className="flex items-start justify-between mb-2">
            <div>
              <div className="flex items-center gap-2 mb-1">
                {getBadges(tool).map((badge) => (
                  <span
                    key={badge}
                    className={`px-2 py-1 text-xs rounded-full ${
                      badge === 'Vérifié'
                        ? 'bg-blue-500 text-white'
                        : badge === 'Populaire'
                        ? 'bg-purple-500 text-white'
                        : badge === 'Utilisateurs'
                        ? 'bg-green-500 text-white'
                        : badge === 'Note'
                        ? 'bg-yellow-500 text-white'
                        : 'bg-gray-500 text-white'
                    }`}
                  >
                    {badge}
                  </span>
                ))}
              </div>
              <h3 className="text-xl font-semibold group-hover:text-blue-500 transition-colors">
                {tool.name}
              </h3>
            </div>
            <div className="flex items-center gap-4">
              <div className="text-right">
                <div className="text-sm text-gray-400">Prix</div>
                <div className="font-medium">{formatPrice(tool)}</div>
              </div>
              <a
                href={tool.website_url}
                target="_blank"
                rel="noopener noreferrer"
                className="p-2 bg-blue-500/10 rounded-lg text-blue-500 hover:bg-blue-500 hover:text-white transition-colors group/btn"
                title={`Visiter ${tool.name}`}
              >
                <ArrowUpRight className="w-5 h-5 group-hover/btn:rotate-45 transition-transform" />
              </a>
            </div>
          </div>
          <p className="text-gray-400 mb-4">{tool.description}</p>
          <div className="flex items-center gap-6 text-sm text-gray-400">
            <div className="flex items-center gap-2">
              <Star className="w-4 h-4 text-yellow-500" />
              <span className="font-medium text-white">{tool.average_rating.toFixed(1)}</span>
              <span>({formatNumber(tool.total_reviews)} avis)</span>
            </div>
            <div className="flex items-center gap-2">
              <Users className="w-4 h-4" />
              {formatNumber(tool.monthly_users)} utilisateurs
            </div>
            <div className="flex items-center gap-2">
              <Eye className="w-4 h-4" />
              {formatNumber(tool.total_views)} vues
            </div>
            <div className="flex items-center gap-2">
              <MessageSquare className="w-4 h-4" />
              {formatNumber(tool.total_reviews)} commentaires
            </div>
          </div>
        </div>
      </div>
    </div>
  );
});

export default function Rankings() {
  const [tools, setTools] = useState<Tool[]>([]);
  const [categories, setCategories] = useState<Category[]>([]);
  const [selectedCategory, setSelectedCategory] = useState('all');
  const [searchQuery, setSearchQuery] = useState('');
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);
  const dropdownRef = useRef<HTMLDivElement>(null);

  // Fermer le dropdown quand on clique ailleurs
  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target as Node)) {
        setIsDropdownOpen(false);
      }
    }

    document.addEventListener('mousedown', handleClickOutside);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, []);

  useEffect(() => {
    async function loadData() {
      try {
        setIsLoading(true);
        setError(null);

        const [toolsData, categoriesData] = await Promise.all([
          getTools({
            category: selectedCategory === 'all' ? undefined : selectedCategory,
            search: searchQuery
          }),
          getCategories()
        ]);

        const toolsWithScores = toolsData.map(tool => ({
          ...tool,
          popularityScore: calculatePopularityScore(tool)
        }));

        const sortedTools = toolsWithScores.sort((a, b) => b.popularityScore - a.popularityScore);

        setTools(sortedTools);
        setCategories(categoriesData);
      } catch (error) {
        console.error('Error loading data:', error);
        setError('Une erreur est survenue lors du chargement des données. Veuillez réessayer.');
      } finally {
        setIsLoading(false);
      }
    }

    loadData();
  }, [selectedCategory, searchQuery]);

  const getBadges = useCallback((tool: Tool) => {
    const badges = [];
    if (tool.is_verified) badges.push('Vérifié');
    if (tool.is_featured) badges.push('Populaire');
    
    if (tool.monthly_users > 500000) badges.push('Utilisateurs');
    if (tool.average_rating >= 4.8 && tool.total_reviews > 1000) badges.push('Note');
    
    return badges;
  }, []);

  const formatPrice = useCallback((tool: Tool) => {
    if (!tool.pricing?.length) return 'Gratuit';
    
    const hasFree = tool.pricing.some(p => p.price === 0);
    const hasPaid = tool.pricing.some(p => p.price > 0);
    
    if (hasFree && hasPaid) return 'Gratuit / Premium';
    if (hasFree) return 'Gratuit';
    return 'Premium';
  }, []);

  const formatNumber = useCallback((num: number) => {
    if (num >= 1000000) {
      return (num / 1000000).toFixed(1) + 'M';
    }
    if (num >= 1000) {
      return (num / 1000).toFixed(1) + 'K';
    }
    return num.toString();
  }, []);

  const top10Tools = useMemo(() => tools.slice(0, 10), [tools]);

  return (
    <div className="min-h-screen bg-[#0B0F19] text-white px-6 py-12">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-12">
          <div className="flex justify-center mb-8">
            <div className="relative group">
              <div className="absolute inset-0 bg-blue-500/20 rounded-full blur-xl group-hover:blur-2xl transition-all duration-500 animate-pulse"></div>
              
              <div className="relative bg-gray-900/80 p-8 rounded-full transform group-hover:scale-110 transition-transform duration-500">
                <Trophy className="w-16 h-16 text-blue-500 animate-float" />
                
                <div className="absolute inset-0 animate-spin-slow">
                  <Star className="w-8 h-8 text-yellow-500 absolute -top-4 left-1/2 -translate-x-1/2 transform -rotate-12" />
                  <Sparkles className="w-8 h-8 text-purple-500 absolute -bottom-4 left-1/2 -translate-x-1/2 transform rotate-12" />
                  <Zap className="w-8 h-8 text-green-500 absolute top-1/2 -right-4 -translate-y-1/2" />
                  <TrendingUp className="w-8 h-8 text-red-500 absolute top-1/2 -left-4 -translate-y-1/2" />
                </div>
              </div>
            </div>
          </div>
          <h1 className="text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-blue-500 via-purple-500 to-pink-500 mb-4">
            Classement des outils IA
          </h1>
          <p className="text-center text-gray-400 mb-12 max-w-3xl mx-auto">
            Découvrez les outils d'IA les plus populaires et les mieux notés
          </p>
        </div>

        <div className="mb-8 space-y-6">
          <div className="flex gap-4">
            <div className="flex-1 relative">
              <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                placeholder="Rechercher un outil..."
                className="w-full pl-12 pr-4 py-3 bg-gray-900/50 border border-gray-800 rounded-lg text-white placeholder-gray-400 focus:outline-none focus:border-blue-500 transition-all duration-300"
              />
            </div>
            <div className="relative dropdown-container" ref={dropdownRef}>
              <div 
                className="custom-dropdown w-full pl-4 pr-10 py-3 bg-transparent border border-gray-800 rounded-lg text-blue-400 flex items-center justify-between cursor-pointer"
                onClick={() => setIsDropdownOpen(!isDropdownOpen)}
              >
                <span>
                  {selectedCategory === 'all' 
                    ? 'Toutes les catégories' 
                    : categories.find(cat => cat.slug === selectedCategory)?.name || 'Toutes les catégories'}
                </span>
                <ChevronDown className="w-5 h-5 text-blue-500" />
              </div>
              
              {isDropdownOpen && (
                <div className="dropdown-menu absolute z-10 w-full mt-1 py-1 bg-transparent border border-gray-800 rounded-lg shadow-lg">
                  <div 
                    className={`dropdown-item py-2 px-4 cursor-pointer hover:bg-blue-500/10 ${selectedCategory === 'all' ? 'text-blue-500' : 'text-blue-400'}`}
                    onClick={() => {
                      setSelectedCategory('all');
                      setIsDropdownOpen(false);
                    }}
                  >
                    Toutes les catégories
                  </div>
                  {categories.map((category) => (
                    <div 
                      key={category.id} 
                      className={`dropdown-item py-2 px-4 cursor-pointer hover:bg-blue-500/10 ${selectedCategory === category.slug ? 'text-blue-500' : 'text-blue-400'}`}
                      onClick={() => {
                        setSelectedCategory(category.slug);
                        setIsDropdownOpen(false);
                      }}
                    >
                      {category.name}
                    </div>
                  ))}
                </div>
              )}
            </div>
          </div>

          <style>
            {`
            .dropdown-container {
              min-width: 220px;
              position: relative;
            }
            
            .custom-dropdown {
              transition: all 0.3s ease;
            }
            
            .custom-dropdown:focus,
            .custom-dropdown:hover {
              border-color: #3b82f6;
              box-shadow: 0 0 0 2px rgba(59, 130, 246, 0.25);
              outline: none;
            }
            
            .dropdown-menu {
              max-height: 300px;
              overflow-y: auto;
              backdrop-filter: blur(5px);
            }
            
            /* Style de la barre de défilement */
            .dropdown-menu::-webkit-scrollbar {
              width: 5px;
            }
            
            .dropdown-menu::-webkit-scrollbar-track {
              background: rgba(17, 24, 39, 0.2);
              border-radius: 10px;
            }
            
            .dropdown-menu::-webkit-scrollbar-thumb {
              background: #3b82f6;
              border-radius: 10px;
            }
            
            .dropdown-menu::-webkit-scrollbar-thumb:hover {
              background: #60a5fa;
            }
            `}
          </style>
        </div>

        {error && (
          <div className="bg-red-500/10 border border-red-500 rounded-lg p-4 mb-8 text-red-500">
            {error}
          </div>
        )}

        <div className="mb-12">
          <h2 className="text-2xl font-bold mb-6 flex items-center gap-3 animate-fade-in">
            <Crown className="w-6 h-6 text-yellow-500" />
            <span className="bg-gradient-to-r from-yellow-500 to-yellow-300 text-transparent bg-clip-text">
              Top 10 des outils IA
            </span>
          </h2>

          <style>{`
            @keyframes shimmer {
              0% {
                transform: translateX(-100%);
              }
              100% {
                transform: translateX(100%);
              }
            }

            .magic-grid {
              position: relative;
              overflow: hidden;
              padding: 2px;
              border-radius: 1rem;
            }

            .magic-grid::before {
              content: '';
              position: absolute;
              top: 0;
              left: 0;
              width: 200%;
              height: 100%;
              background: linear-gradient(
                90deg,
                transparent 0%,
                rgba(78, 169, 255, 0.1) 45%,
                rgba(78, 169, 255, 0.2) 50%,
                rgba(78, 169, 255, 0.1) 55%,
                transparent 100%
              );
              transform: translateX(-100%);
              animation: shimmer 6s infinite linear;
              pointer-events: none;
              z-index: 1;
            }

            .magic-grid:hover::before {
              animation: shimmer 3s infinite linear;
              background: linear-gradient(
                90deg,
                transparent 0%,
                rgba(78, 169, 255, 0.2) 45%,
                rgba(78, 169, 255, 0.3) 50%,
                rgba(78, 169, 255, 0.2) 55%,
                transparent 100%
              );
            }
          `}</style>

          <div className="magic-grid bg-gray-900/30 p-6 rounded-xl">
            <div className="grid grid-cols-5 gap-4">
              {top10Tools.map((tool, index) => (
                <TopToolCard key={tool.id} tool={tool} index={index} />
              ))}
            </div>
          </div>
        </div>

        {isLoading && (
          <div className="flex items-center justify-center py-12">
            <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-blue-500"></div>
          </div>
        )}

        {!isLoading && !error && (
          <div className="space-y-6">
            {tools.map((tool, index) => (
              <ToolListCard
                key={tool.id}
                tool={tool}
                index={index}
                formatNumber={formatNumber}
                formatPrice={formatPrice}
                getBadges={getBadges}
              />
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
