import React, { useState, useCallback, useEffect, useMemo, useRef } from 'react';
import { TrendingUp, Star, Users, Eye, MessageSquare, ArrowUpRight, Search, Trophy, Sparkles, Zap, Crown, ChevronDown, Flame, Clock, ThumbsUp } from 'lucide-react';
import { getTools, getCategories } from '../lib/supabase';
import PopupTopRanking from '../components/PopupTopRanking';

interface Tool {
  id: string;
  name: string;
  description: string;
  category: {
    name: string;
    slug: string;
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
  popularityScore?: number;
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

const FeaturedToolCard = React.memo(({ tool, isTrending, isSponsored }: { 
  tool: Tool; 
  isTrending?: boolean;
  isSponsored?: boolean;
}) => {
  return (
    <div className="featured-card relative group">
      <div className="card-inner bg-gray-900/70 backdrop-blur-md rounded-xl overflow-hidden border border-gray-800 hover:border-indigo-500 transition-all duration-500 transform group-hover:scale-[1.03] group-hover:shadow-xl group-hover:shadow-indigo-500/20 h-full flex flex-col">
        <div className="relative h-32 overflow-hidden">
          <img
            src={tool.image_url}
            alt={tool.name}
            className="w-full h-full object-cover transform group-hover:scale-110 transition-transform duration-700"
            loading="lazy"
          />
          {isTrending && (
            <div className="absolute top-2 left-2 px-2 py-0.5 bg-gradient-to-r from-orange-500 to-red-500 text-white text-xs font-bold rounded-full flex items-center gap-1">
              <Flame className="w-3 h-3" />
              Tendance
            </div>
          )}
          {isSponsored && (
            <div className="absolute top-2 left-2 px-2 py-0.5 bg-gradient-to-r from-purple-500 to-indigo-500 text-white text-xs font-bold rounded-full flex items-center gap-1">
              <Star className="w-3 h-3" />
              Sponsorisé
            </div>
          )}
        </div>
        <div className="p-4 flex flex-col flex-grow">
          <h3 className="text-base font-semibold mb-2 group-hover:text-indigo-400 transition-colors">
            {tool.name}
          </h3>
          <p className="text-gray-400 text-sm mb-4 line-clamp-2 flex-grow">
            {tool.description}
          </p>
          <div className="flex items-center justify-between mt-auto">
            <div className="flex items-center gap-1">
              <Star className="w-3 h-3 text-yellow-500" />
              <span className="text-xs font-medium">{tool.average_rating.toFixed(1)}</span>
            </div>
            <a
              href={tool.website_url}
              target="_blank"
              rel="noopener noreferrer"
              className="px-3 py-1 bg-gradient-to-r from-indigo-500 to-purple-500 hover:from-indigo-600 hover:to-purple-600 text-white text-xs font-medium rounded-full transition-all duration-300 transform group-hover:scale-105 flex items-center gap-1"
              onClick={(e) => e.stopPropagation()}
            >
              Découvrir
              <ArrowUpRight className="w-3 h-3 group-hover:rotate-45 transition-transform" />
            </a>
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
  const [featuredFilter, setFeaturedFilter] = useState('populaires');
  const featuredScrollRef = useRef<HTMLDivElement>(null);

  const fetchTools = async () => {
    try {
      const data = await getTools({
        category: selectedCategory === 'all' ? undefined : selectedCategory,
        search: searchQuery
      });
      
      // S'assurer que chaque outil a une propriété slug dans category
      return data.map((tool: any) => ({
        ...tool,
        category: {
          ...tool.category,
          slug: tool.category.slug || tool.category.name?.toLowerCase().replace(/\s+/g, '-') || 'uncategorized'
        }
      }));
    } catch (error) {
      console.error('Error fetching tools:', error);
      return [];
    }
  };

  const fetchCategories = async () => {
    try {
      const data = await getCategories();
      return data;
    } catch (error) {
      console.error('Error fetching categories:', error);
      return [];
    }
  };

  useEffect(() => {
    async function loadData() {
      try {
        setIsLoading(true);
        setError(null);

        const [toolsData, categoriesData] = await Promise.all([
          fetchTools(),
          fetchCategories()
        ]);

        const toolsWithScores = toolsData.map((tool: Tool) => ({
          ...tool,
          popularityScore: calculatePopularityScore(tool)
        }));

        const sortedTools = toolsWithScores.sort(
          (a: Tool & { popularityScore: number }, b: Tool & { popularityScore: number }) => 
            b.popularityScore - a.popularityScore
        );

        setTools(sortedTools);
        setCategories(categoriesData);
      } catch (error) {
        console.error('Error loading data:', error);
        setError(
          'Une erreur est survenue lors du chargement des données. Veuillez réessayer.'
        );
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
    
    const hasFree = tool.pricing.some((p) => p.price === 0);
    const hasPaid = tool.pricing.some((p) => p.price > 0);
    
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

  const featuredTools = useMemo(() => {
    let filtered = [...tools];
    
    if (featuredFilter === 'populaires') {
      return filtered
        .filter((tool) => tool.monthly_users > 100000)
        .sort((a, b) => b.monthly_users - a.monthly_users)
        .slice(0, 12);
    } else if (featuredFilter === 'nouveaux') {
      return filtered
        .sort(() => Math.random() - 0.5)
        .slice(0, 12);
    } else if (featuredFilter === 'recommandés') {
      return filtered
        .filter((tool) => tool.average_rating > 4.5)
        .sort((a, b) => b.average_rating - a.average_rating)
        .slice(0, 12);
    }
    
    return filtered.slice(0, 12);
  }, [tools, featuredFilter]);

  const top10Tools = useMemo(() => tools.slice(0, 10), [tools]);

  useEffect(() => {
    const scrollContainer = featuredScrollRef.current;
    if (!scrollContainer) return;

    let scrollAmount = 0;
    let isHovering = false;

    const handleMouseEnter = () => {
      isHovering = true;
    };

    const handleMouseLeave = () => {
      isHovering = false;
    };

    const scroll = () => {
      if (scrollContainer && !isHovering) {
        scrollAmount += 0.5;
        if (scrollAmount >= scrollContainer.scrollWidth / 2) {
          scrollAmount = 0;
        }
        scrollContainer.scrollLeft = scrollAmount;
      }
      requestAnimationFrame(scroll);
    };

    scrollContainer.addEventListener('mouseenter', handleMouseEnter);
    scrollContainer.addEventListener('mouseleave', handleMouseLeave);
    
    const animationId = requestAnimationFrame(scroll);

    return () => {
      scrollContainer.removeEventListener('mouseenter', handleMouseEnter);
      scrollContainer.removeEventListener('mouseleave', handleMouseLeave);
      cancelAnimationFrame(animationId);
    };
  }, [featuredTools]);

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
          <p className="text-center text-gray-400 mb-8 max-w-3xl mx-auto">
            Découvrez les outils d'IA les plus populaires et les mieux notés
          </p>
        </div>

        <div className="mb-12 relative overflow-hidden featured-section">
          <div className="absolute inset-0 bg-gradient-to-r from-blue-500/5 via-purple-500/5 to-indigo-500/5 rounded-xl"></div>
          
          <div className="relative z-10">
            <h2 className="text-2xl font-bold mb-6 flex items-center gap-3">
              <Sparkles className="w-6 h-6 text-purple-500" />
              <span className="bg-gradient-to-r from-purple-500 to-indigo-400 text-transparent bg-clip-text">
                En vedette
              </span>
            </h2>
            
            <div className="flex items-center gap-4 mb-6">
              <button 
                onClick={() => setFeaturedFilter('populaires')}
                className={`px-4 py-2 rounded-full text-sm font-medium transition-all duration-300 ${
                  featuredFilter === 'populaires' 
                    ? 'bg-gradient-to-r from-purple-600 to-indigo-600 text-white shadow-lg shadow-purple-500/20' 
                    : 'bg-gray-800/50 text-gray-300 hover:bg-gray-700/50'
                }`}
              >
                <div className="flex items-center gap-2">
                  <Flame className="w-4 h-4" />
                  Populaires
                </div>
              </button>
              
              <button 
                onClick={() => setFeaturedFilter('nouveaux')}
                className={`px-4 py-2 rounded-full text-sm font-medium transition-all duration-300 ${
                  featuredFilter === 'nouveaux' 
                    ? 'bg-gradient-to-r from-blue-600 to-cyan-600 text-white shadow-lg shadow-blue-500/20' 
                    : 'bg-gray-800/50 text-gray-300 hover:bg-gray-700/50'
                }`}
              >
                <div className="flex items-center gap-2">
                  <Clock className="w-4 h-4" />
                  Nouveaux
                </div>
              </button>
              
              <button 
                onClick={() => setFeaturedFilter('recommandés')}
                className={`px-4 py-2 rounded-full text-sm font-medium transition-all duration-300 ${
                  featuredFilter === 'recommandés' 
                    ? 'bg-gradient-to-r from-green-600 to-emerald-600 text-white shadow-lg shadow-green-500/20' 
                    : 'bg-gray-800/50 text-gray-300 hover:bg-gray-700/50'
                }`}
              >
                <div className="flex items-center gap-2">
                  <ThumbsUp className="w-4 h-4" />
                  Recommandés
                </div>
              </button>
            </div>
            
            <div 
              ref={featuredScrollRef}
              className="featured-scroll-container overflow-x-auto pb-6 -mx-4 px-4 hide-scrollbar"
            >
              <div className="featured-scroll-content inline-flex gap-6 min-w-max">
                {featuredTools.map((tool, index) => (
                  <div key={tool.id} className="w-64 flex-shrink-0">
                    <FeaturedToolCard 
                      tool={tool} 
                      isTrending={index < 3 && featuredFilter === 'populaires'} 
                      isSponsored={index < 2 && featuredFilter === 'recommandés'} 
                    />
                  </div>
                ))}
                {featuredTools.slice(0, 4).map((tool, index) => (
                  <div key={`duplicate-${tool.id}`} className="w-64 flex-shrink-0">
                    <FeaturedToolCard 
                      tool={tool} 
                      isTrending={index < 3 && featuredFilter === 'populaires'} 
                      isSponsored={index < 2 && featuredFilter === 'recommandés'} 
                    />
                  </div>
                ))}
              </div>
            </div>
          </div>
          
          <div className="absolute inset-0 pointer-events-none overflow-hidden">
            <div className="particle particle-1"></div>
            <div className="particle particle-2"></div>
            <div className="particle particle-3"></div>
            <div className="particle particle-4"></div>
          </div>
          
          <div className="absolute top-0 bottom-0 left-0 w-16 bg-gradient-to-r from-[#0B0F19] to-transparent z-20 pointer-events-none"></div>
          <div className="absolute top-0 bottom-0 right-0 w-16 bg-gradient-to-l from-[#0B0F19] to-transparent z-20 pointer-events-none"></div>
          
          <style>{`
            .featured-section {
              position: relative;
              padding: 2rem;
              border-radius: 1rem;
              background: rgba(13, 18, 30, 0.7);
              backdrop-filter: blur(10px);
              border: 1px solid rgba(78, 78, 231, 0.2);
              box-shadow: 0 10px 30px -5px rgba(2, 12, 27, 0.7);
            }
            
            .featured-card {
              perspective: 1000px;
            }
            
            .card-inner {
              transform-style: preserve-3d;
              transition: transform 0.5s;
            }
            
            .featured-scroll-container {
              -ms-overflow-style: none;
              scrollbar-width: none;
            }
            
            .featured-scroll-container::-webkit-scrollbar {
              display: none;
            }
            
            .hide-scrollbar {
              -ms-overflow-style: none;
              scrollbar-width: none;
            }
            
            .hide-scrollbar::-webkit-scrollbar {
              display: none;
            }
            
            @keyframes float-particle {
              0%, 100% { transform: translateY(0) translateX(0); }
              25% { transform: translateY(-20px) translateX(10px); }
              50% { transform: translateY(-10px) translateX(20px); }
              75% { transform: translateY(-30px) translateX(-10px); }
            }
            
            .particle {
              position: absolute;
              border-radius: 50%;
              opacity: 0.3;
              filter: blur(8px);
              animation: float-particle 15s infinite ease-in-out;
            }
            
            .particle-1 {
              width: 100px;
              height: 100px;
              background: radial-gradient(circle, rgba(147, 51, 234, 0.7) 0%, rgba(79, 70, 229, 0) 70%);
              top: 10%;
              left: 20%;
              animation-delay: 0s;
            }
            
            .particle-2 {
              width: 150px;
              height: 150px;
              background: radial-gradient(circle, rgba(59, 130, 246, 0.7) 0%, rgba(59, 130, 246, 0) 70%);
              top: 50%;
              right: 15%;
              animation-delay: -5s;
            }
            
            .particle-3 {
              width: 80px;
              height: 80px;
              background: radial-gradient(circle, rgba(236, 72, 153, 0.7) 0%, rgba(236, 72, 153, 0) 70%);
              bottom: 20%;
              left: 30%;
              animation-delay: -2s;
            }
            
            .particle-4 {
              width: 120px;
              height: 120px;
              background: radial-gradient(circle, rgba(16, 185, 129, 0.7) 0%, rgba(16, 185, 129, 0) 70%);
              top: 30%;
              right: 30%;
              animation-delay: -8s;
            }
          `}</style>
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
