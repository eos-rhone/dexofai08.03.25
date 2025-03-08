import React, { useState, useCallback, useEffect } from 'react';
import { Search, Brain, TrendingUp, Bot, Database, Star, ArrowRight, Zap, Sparkles } from 'lucide-react';
import { Link, useNavigate } from 'react-router-dom';
import { getTools, getCategories, getHomeStats } from '../lib/supabase';
import { AIQuickView } from '../components/AIQuickView';
import { supabase } from '../lib/supabase';

export function Home() {
  const [searchValue, setSearchValue] = useState('');
  const [searchResults, setSearchResults] = useState<any[]>([]);
  const [isSearching, setIsSearching] = useState(false);
  const [popularTools, setPopularTools] = useState<any[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [stats, setStats] = useState({
    toolCount: 0,
    categoryCount: 0,
    monthlyUsers: 0,
    averageRating: 0
  });
  const navigate = useNavigate();

  // Charger les statistiques et configurer les souscriptions realtime
  useEffect(() => {
    // Fonction pour charger les stats
    async function loadStats() {
      try {
        const stats = await getHomeStats();
        setStats(stats);
      } catch (error) {
        console.error('Erreur lors du chargement des statistiques:', error);
      }
    }

    // Charger les stats initiales
    loadStats();

    // Souscrire aux changements des outils
    const toolsSubscription = supabase
      .channel('ai_tools_changes')
      .on('postgres_changes', 
        { 
          event: '*', 
          schema: 'public', 
          table: 'ai_tools' 
        }, 
        () => {
          loadStats(); // Recharger les stats quand un outil est modifié
        }
      )
      .subscribe();

    // Souscrire aux changements des catégories
    const categoriesSubscription = supabase
      .channel('categories_changes')
      .on('postgres_changes', 
        { 
          event: '*', 
          schema: 'public', 
          table: 'categories' 
        }, 
        () => {
          loadStats(); // Recharger les stats quand une catégorie est modifiée
        }
      )
      .subscribe();

    // Nettoyer les souscriptions
    return () => {
      toolsSubscription.unsubscribe();
      categoriesSubscription.unsubscribe();
    };
  }, []);

  // Charger les outils populaires au montage du composant
  useEffect(() => {
    async function loadData() {
      setIsLoading(true);
      setError(null);
      try {
        // Récupérer les outils populaires
        const tools = await getTools({ featured: true });

        // Trier les outils par nombre d'utilisateurs mensuels
        if (Array.isArray(tools)) {
          const sortedTools = [...tools]
            .filter(tool => tool && typeof tool === 'object')
            .sort((a, b) => (b.monthly_users || 0) - (a.monthly_users || 0));
          
          setPopularTools(sortedTools); // Prendre tous les outils marqués comme featured
        }
      } catch (error) {
        console.error('Erreur lors du chargement des données:', error);
        setError('Une erreur est survenue lors du chargement des données. Veuillez réessayer plus tard.');
      } finally {
        setIsLoading(false);
      }
    }

    loadData();
  }, []);

  const handleSearch = useCallback(async () => {
    if (!searchValue.trim()) return;

    setIsSearching(true);
    try {
      const results = await getTools({ search: searchValue });
      setSearchResults(results);
      
      if (results.length > 0) {
        navigate(`/categories?search=${encodeURIComponent(searchValue)}`);
      }
    } catch (error) {
      console.error('Erreur lors de la recherche:', error);
      setError('Erreur lors de la recherche. Veuillez réessayer plus tard.');
    } finally {
      setIsSearching(false);
    }
  }, [searchValue, navigate]);

  const handleKeyPress = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter') {
      handleSearch();
    }
  };

  return (
    <div className="min-h-screen bg-[#0B0F19] text-white">
      {/* <GlowingShapes /> */}
      <div className="max-w-7xl mx-auto px-6 pt-24 pb-16">
        <div className="flex justify-center mb-4 animate-fade-in">
          <div className="bg-blue-500/10 px-6 py-3 rounded-full transform group hover:scale-105 transition-all duration-300">
            <div className="relative">
              <div className="absolute inset-0 bg-blue-500/20 rounded-full blur-xl group-hover:blur-2xl transition-all duration-500 animate-pulse"></div>
              
              <div className="relative flex items-center gap-2">
                <div className="relative transform group-hover:scale-110 transition-transform duration-500">
                  <Brain className="w-5 h-5 text-blue-500 animate-float" />
                  
                  <div className="absolute inset-0 animate-spin-slow opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                    <Zap className="w-3 h-3 text-yellow-500 absolute -top-2 left-1/2 -translate-x-1/2 transform -rotate-12" />
                    <Star className="w-3 h-3 text-purple-500 absolute -bottom-2 left-1/2 -translate-x-1/2 transform rotate-12" />
                    <Sparkles className="w-3 h-3 text-green-500 absolute top-1/2 -right-2 -translate-y-1/2" />
                    <Brain className="w-3 h-3 text-red-500 absolute top-1/2 -left-2 -translate-y-1/2" />
                  </div>
                </div>
                <span className="text-blue-500 relative z-10">The Ultimate AI Finder</span>
              </div>
            </div>
          </div>
        </div>

        <h1 className="text-center text-7xl font-bold mb-6 animate-fade-in group" style={{ animationDelay: '0.2s' }}>
          <div className="relative inline-block">
            <div className="absolute inset-0 bg-blue-500/20 rounded-lg blur-xl group-hover:blur-2xl transition-all duration-500 animate-pulse"></div>
            <div className="relative">
              <span className="bg-gradient-to-r from-blue-500 via-purple-500 to-pink-500 text-transparent bg-clip-text group-hover:scale-105 transition-transform duration-500 inline-block">
                Trouvez l'IA parfaite
              </span>
              <div className="absolute inset-0 animate-spin-slow opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                <Zap className="w-6 h-6 text-yellow-500 absolute -top-4 left-1/2 -translate-x-1/2 transform -rotate-12" />
                <Star className="w-6 h-6 text-purple-500 absolute -bottom-4 left-1/2 -translate-x-1/2 transform rotate-12" />
                <Sparkles className="w-6 h-6 text-green-500 absolute top-1/2 -right-4 -translate-y-1/2" />
                <Brain className="w-6 h-6 text-red-500 absolute top-1/2 -left-4 -translate-y-1/2" />
              </div>
            </div>
          </div>
          <br />
          <div className="relative inline-block">
            <div className="absolute inset-0 bg-blue-500/20 rounded-lg blur-xl group-hover:blur-2xl transition-all duration-500 animate-pulse"></div>
            <div className="relative">
              <span className="text-white group-hover:scale-105 transition-transform duration-500 inline-block">
                pour vos besoins
              </span>
              <div className="absolute inset-0 animate-spin-slow opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                <Zap className="w-6 h-6 text-yellow-500 absolute -top-4 left-1/2 -translate-x-1/2 transform -rotate-12" />
                <Star className="w-6 h-6 text-purple-500 absolute -bottom-4 left-1/2 -translate-x-1/2 transform rotate-12" />
                <Sparkles className="w-6 h-6 text-green-500 absolute top-1/2 -right-4 -translate-y-1/2" />
                <Brain className="w-6 h-6 text-red-500 absolute top-1/2 -left-4 -translate-y-1/2" />
              </div>
            </div>
          </div>
        </h1>

        <p className="text-center text-gray-400 text-xl max-w-3xl mx-auto mb-12 leading-relaxed animate-fade-in" style={{ animationDelay: '0.4s' }}>
          Explorez notre catalogue d'outils d'intelligence artificielle et trouvez
          celui qui correspond exactement à vos besoins
        </p>

        <div className="max-w-2xl mx-auto relative animate-fade-in" style={{ animationDelay: '0.6s' }}>
          <div className="relative group">
            <div className="absolute -inset-1 bg-gradient-to-r from-blue-500 to-purple-500 rounded-lg blur opacity-30 group-hover:opacity-100 transition duration-1000 group-hover:duration-200"></div>
            <div className="relative">
              <input
                type="text"
                value={searchValue}
                onChange={(e) => setSearchValue(e.target.value)}
                onKeyPress={handleKeyPress}
                placeholder="Ex: Je veux créer de la musique avec l'IA..."
                className="w-full px-6 py-4 bg-gray-900/50 border border-gray-800 rounded-lg text-white placeholder-gray-500 focus:outline-none focus:border-blue-500 transition-all duration-300"
              />
              <button 
                onClick={handleSearch}
                disabled={isSearching}
                className="absolute right-2 top-1/2 -translate-y-1/2 px-6 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-all duration-300 flex items-center gap-2 group disabled:opacity-50 disabled:cursor-not-allowed"
              >
                {isSearching ? (
                  <div className="animate-spin rounded-full h-5 w-5 border-2 border-white border-t-transparent"></div>
                ) : (
                  <>
                    Rechercher
                    <Search className="w-4 h-4 group-hover:translate-x-1 transition-transform" />
                  </>
                )}
              </button>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-6 pb-32">
        <div className="grid grid-cols-3 gap-6">
          {[
            {
              icon: Search,
              title: "Recherche Intelligente",
              description: "Trouvez rapidement l'outil d'IA idéal en décrivant simplement votre besoin.",
              path: '/categories'
            },
            {
              icon: TrendingUp,
              title: "Classements & Tendances",
              description: "Découvrez les outils d'IA les plus populaires et les mieux notés.",
              path: '/classement'
            },
            {
              icon: Bot,
              title: "Assistant IA",
              description: "Laissez notre chatbot vous guider vers les meilleures solutions d'IA.",
              path: '/assistant'
            }
          ].map((feature, index) => (
            <Link
              key={feature.title}
              to={feature.path}
              className="bg-black/40 rounded-xl p-6 border border-gray-800 hover:border-blue-500/50 transition-all duration-300 transform hover:scale-105 hover:shadow-xl hover:shadow-blue-500/10 group animate-fade-in"
              style={{ animationDelay: `${0.2 * index}s` }}
            >
              <div className="w-12 h-12 bg-blue-500/10 rounded-xl flex items-center justify-center mb-4 group-hover:scale-110 transition-transform duration-300">
                <feature.icon className="w-6 h-6 text-blue-500" />
              </div>
              <h3 className="text-xl font-semibold mb-3 group-hover:text-blue-500 transition-colors">
                {feature.title}
              </h3>
              <p className="text-gray-400 mb-4">
                {feature.description}
              </p>
              <div className="flex items-center text-blue-500 opacity-0 group-hover:opacity-100 transition-opacity">
                En savoir plus <ArrowRight className="w-4 h-4 ml-2 group-hover:translate-x-1 transition-transform" />
              </div>
            </Link>
          ))}
        </div>
      </div>

      <div className="bg-black/20 py-24 relative">
        <div className="absolute inset-0 bg-gradient-to-b from-transparent to-blue-500/5"></div>
        <div className="max-w-7xl mx-auto px-6 relative">
          <h2 className="text-3xl font-bold text-center text-blue-500 mb-2 animate-fade-in">
            DexofAI en chiffres
          </h2>
          <p className="text-center text-gray-400 mb-12 animate-fade-in">
            La plus grande collection d'outils d'IA
          </p>

          <div className="grid grid-cols-4 gap-6">
            {[
              { 
                icon: Database, 
                value: stats?.toolCount || 0, 
                label: 'Outils IA',
                color: 'text-blue-500'
              },
              { 
                icon: Brain, 
                value: stats?.categoryCount || 0, 
                label: 'Catégories',
                color: 'text-purple-500'
              },
              { 
                icon: TrendingUp, 
                value: ((stats?.monthlyUsers || 0) / 1000).toFixed(1) + 'K+',
                label: 'Utilisateurs/mois',
                color: 'text-pink-500'
              },
              { 
                icon: Star, 
                value: (stats?.averageRating || 0).toFixed(1),
                label: 'Note moyenne',
                color: 'text-green-500'
              }
            ].map((stat, index) => (
              <div
                key={stat.label}
                className="bg-gray-900/80 p-6 rounded-xl border border-gray-800 hover:border-blue-500 hover:shadow-lg hover:shadow-blue-500/20 transition-all duration-300 text-center group"
              >
                <div className={`rounded-lg p-3 ${stat.color} bg-gray-900/80 inline-block mb-4 group-hover:scale-110 transition-transform duration-300`}>
                  <stat.icon className="w-8 h-8" />
                </div>
                <div className={`text-2xl font-bold ${stat.color} mb-2 group-hover:scale-105 transition-transform duration-300`}>
                  {stat.value}
                </div>
                <div className="text-gray-400 text-sm group-hover:text-gray-300 transition-colors duration-300">
                  {stat.label}
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>

      <section className="py-16">
        <div className="max-w-7xl mx-auto px-6">
          <h2 className="text-3xl font-bold mb-8 text-blue-500">Outils populaires</h2>
          
          {isLoading ? (
            <div className="flex justify-center items-center h-64">
              <div className="animate-spin rounded-full h-12 w-12 border-4 border-blue-500 border-t-transparent"></div>
            </div>
          ) : error ? (
            <div className="text-center text-red-500 p-4 bg-red-500/10 rounded-lg">
              {error}
            </div>
          ) : popularTools.length === 0 ? (
            <div className="text-center text-gray-400 p-4">
              Aucun outil disponible pour le moment.
            </div>
          ) : (
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {popularTools.map((tool) => (
                <div key={tool.id} className="tool-card bg-gray-900/50 p-6 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300 text-center">
                  <AIQuickView
                    id={tool.id}
                    slug={tool.slug}
                    name={tool.name}
                    description={tool.description}
                    image_url={tool.image_url}
                    website_url={tool.website_url}
                    category={tool.category}
                    pricing={tool.pricing}
                  />
                </div>
              ))}
            </div>
          )}
        </div>
      </section>

      {/* Footer avec cœur animé */}
      <footer className="py-6 mt-16 border-t border-gray-800">
        <div className="max-w-7xl mx-auto px-6 flex justify-between items-center">
          <p className="flex items-center gap-2 text-gray-400">
            &copy; 2025 DexofAI with love 
            <span className="inline-block animate-heartbeat transform hover:scale-125 transition-transform duration-300">
              <svg 
                className="w-6 h-6 text-red-500 fill-current" 
                viewBox="0 0 24 24"
              >
                <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/>
              </svg>
            </span>
          </p>
          <div className="text-gray-400 space-x-4">
            <Link to="/mentions-legales" className="hover:text-blue-500 transition-colors">
              Mentions légales
            </Link>
            <span>-</span>
            <Link to="/politique-confidentialite" className="hover:text-blue-500 transition-colors">
              Politique de confidentialité
            </Link>
            <span>-</span>
            <Link to="/cgv" className="hover:text-blue-500 transition-colors">
              CGV
            </Link>
          </div>
        </div>
      </footer>

      <style>{`
        @keyframes shimmer {
          0% {
            transform: translateX(-100%);
          }
          100% {
            transform: translateX(100%);
          }
        }

        @keyframes heartbeat {
          0%, 100% { transform: scale(1); }
          50% { transform: scale(1.5); }
        }

        .animate-heartbeat {
          animation: heartbeat 1s infinite;
        }

        .tool-card {
          position: relative;
          overflow: hidden;
        }

        .tool-card::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background: linear-gradient(
            90deg,
            transparent,
            rgba(255, 255, 255, 0.2),
            transparent
          );
          transform: translateX(-100%);
          animation: shimmer 3s infinite;
          pointer-events: none;
          z-index: 1;
        }

        .tool-card:hover::before {
          animation: shimmer 1.5s infinite;
          background: linear-gradient(
            90deg,
            transparent,
            rgba(255, 255, 255, 0.3),
            transparent
          );
        }
      `}</style>
    </div>
  );
}

export default Home;
