import React from 'react';
import { X, Star, Users, Eye, MessageSquare, ArrowUpRight, Crown } from 'lucide-react';
import { Link } from 'react-router-dom';

interface PopupTopRankingProps {
  isOpen: boolean;
  onClose: () => void;
  tool: {
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
  };
  ranking: number;
}

const PopupTopRanking: React.FC<PopupTopRankingProps> = ({
  isOpen,
  onClose,
  tool,
  ranking
}) => {
  const fallbackImage = "/images/placeholder.png";

  React.useEffect(() => {
    if (isOpen) {
      document.body.style.overflow = 'hidden';
    } else {
      document.body.style.overflow = 'unset';
    }
    return () => {
      document.body.style.overflow = 'unset';
    };
  }, [isOpen]);

  if (!isOpen) return null;

  const formatNumber = (num: number): string => {
    if (num >= 1000000) return `${(num / 1000000).toFixed(1)}M`;
    if (num >= 1000) return `${(num / 1000).toFixed(1)}k`;
    return num.toString();
  };

  return (
    <div className="fixed inset-0 flex items-center justify-center z-50 px-4 py-6">
      <div className="absolute inset-0 bg-black/80 backdrop-blur-sm" onClick={onClose} />
      
      <div className="relative w-full max-w-2xl bg-[#0B0F19] rounded-2xl shadow-2xl overflow-hidden max-h-[90vh] flex flex-col">
        {/* En-tête avec image */}
        <div className="relative h-48 flex-shrink-0">
          <img
            src={tool.image_url || fallbackImage}
            alt={tool.name}
            className="w-full h-full object-cover"
            onError={(e) => {
              e.currentTarget.src = fallbackImage;
            }}
          />
          
          {/* Badge de classement */}
          <div className="absolute top-3 left-3 bg-yellow-500 text-black px-3 py-1.5 rounded-full flex items-center gap-1.5 font-bold text-sm">
            <Crown className="w-4 h-4" />
            #{ranking}
          </div>

          {/* Overlay dégradé */}
          <div className="absolute inset-0 bg-gradient-to-t from-[#0B0F19] via-[#0B0F19]/70 to-transparent">
            <div className="absolute bottom-4 left-4 right-4">
              <h2 className="text-2xl font-bold text-white mb-1">{tool.name}</h2>
              {tool.category && (
                <Link
                  to={`/categories/${tool.category.slug}`}
                  onClick={onClose}
                  className="text-blue-400 hover:text-blue-300 transition-colors text-sm"
                >
                  {tool.category.name}
                </Link>
              )}
            </div>
          </div>

          {/* Bouton de fermeture */}
          <button
            onClick={onClose}
            className="absolute top-3 right-3 p-1.5 bg-black/50 hover:bg-black/70 rounded-full transition-colors"
          >
            <X className="w-5 h-5 text-white" />
          </button>

          {/* Bouton visiter le site */}
          {tool.website_url && (
            <a
              href={tool.website_url}
              target="_blank"
              rel="noopener noreferrer"
              className="absolute top-3 right-12 bg-blue-500 text-white px-3 py-1.5 rounded-full flex items-center gap-1.5 hover:bg-blue-600 transition-colors text-sm"
            >
              Visiter
              <ArrowUpRight className="w-4 h-4" />
            </a>
          )}
        </div>

        {/* Contenu scrollable */}
        <div className="p-6 overflow-y-auto custom-scrollbar">
          <style>{`
            .custom-scrollbar::-webkit-scrollbar {
              width: 8px;
            }
            .custom-scrollbar::-webkit-scrollbar-track {
              background: rgba(255, 255, 255, 0.1);
              border-radius: 4px;
            }
            .custom-scrollbar::-webkit-scrollbar-thumb {
              background: rgba(255, 255, 255, 0.2);
              border-radius: 4px;
            }
            .custom-scrollbar::-webkit-scrollbar-thumb:hover {
              background: rgba(255, 255, 255, 0.3);
            }
          `}</style>

          {/* Stats rapides */}
          <div className="grid grid-cols-4 gap-3 mb-6">
            {/* Classement */}
            <div className="bg-gray-800/30 rounded-lg p-3 border border-gray-700/50">
              <div className="flex items-center gap-2 text-gray-400 mb-1.5 text-sm">
                <Crown className="w-4 h-4 text-yellow-500" />
                <span>Rang</span>
              </div>
              <div className="text-xl font-bold text-white">#{ranking}</div>
            </div>

            {/* Note moyenne */}
            <div className="bg-gray-800/30 rounded-lg p-3 border border-gray-700/50">
              <div className="flex items-center gap-2 text-gray-400 mb-1.5 text-sm">
                <Star className="w-4 h-4 text-yellow-500" />
                <span>Note</span>
              </div>
              <div className="text-xl font-bold text-white">
                {tool.average_rating.toFixed(1)}
              </div>
            </div>

            {/* Utilisateurs */}
            <div className="bg-gray-800/30 rounded-lg p-3 border border-gray-700/50">
              <div className="flex items-center gap-2 text-gray-400 mb-1.5 text-sm">
                <Users className="w-4 h-4" />
                <span>Users</span>
              </div>
              <div className="text-xl font-bold text-white">
                {formatNumber(tool.monthly_users)}
              </div>
            </div>

            {/* Vues */}
            <div className="bg-gray-800/30 rounded-lg p-3 border border-gray-700/50">
              <div className="flex items-center gap-2 text-gray-400 mb-1.5 text-sm">
                <Eye className="w-4 h-4" />
                <span>Vues</span>
              </div>
              <div className="text-xl font-bold text-white">
                {formatNumber(tool.total_views)}
              </div>
            </div>
          </div>

          {/* Description */}
          <div className="mb-6">
            <h3 className="text-base font-semibold text-white mb-2">À propos</h3>
            <p className="text-gray-400 text-sm">{tool.description}</p>
          </div>

          {/* Score de popularité */}
          <div className="mb-6">
            <h3 className="text-base font-semibold text-white mb-2">Score de popularité</h3>
            <div className="bg-gray-800/30 rounded-lg p-4 border border-gray-700/50">
              <div className="grid grid-cols-3 gap-4">
                <div>
                  <div className="text-gray-400 mb-1.5 text-sm">Users (50%)</div>
                  <div className="h-1.5 bg-gray-700 rounded-full overflow-hidden">
                    <div 
                      className="h-full bg-blue-500" 
                      style={{ 
                        width: `${(Math.log10(tool.monthly_users + 1) / 6) * 100}%` 
                      }} 
                    />
                  </div>
                </div>
                <div>
                  <div className="text-gray-400 mb-1.5 text-sm">Vues (30%)</div>
                  <div className="h-1.5 bg-gray-700 rounded-full overflow-hidden">
                    <div 
                      className="h-full bg-purple-500" 
                      style={{ 
                        width: `${(Math.log10(tool.total_views + 1) / 6) * 100}%` 
                      }} 
                    />
                  </div>
                </div>
                <div>
                  <div className="text-gray-400 mb-1.5 text-sm">Note (20%)</div>
                  <div className="h-1.5 bg-gray-700 rounded-full overflow-hidden">
                    <div 
                      className="h-full bg-yellow-500" 
                      style={{ 
                        width: `${(tool.average_rating * tool.total_reviews / 50000) * 100}%` 
                      }} 
                    />
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* Plans tarifaires */}
          {tool.pricing && tool.pricing.length > 0 && (
            <div>
              <h3 className="text-base font-semibold text-white mb-3">Plans tarifaires</h3>
              <div className="grid grid-cols-2 gap-3">
                {tool.pricing.map((plan, index) => (
                  <div
                    key={index}
                    className="bg-gradient-to-br from-gray-800/30 to-gray-800/10 rounded-lg p-4 border border-gray-700/50 hover:border-blue-500/50 transition-colors"
                  >
                    <h4 className="text-base font-medium text-white mb-1">{plan.plan_name}</h4>
                    <div className="text-lg font-bold text-white">
                      {plan.price === 0 ? 'Gratuit' : `${plan.price}€`}
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Bouton d'action */}
          {tool.website_url && (
            <div className="flex justify-center mt-6">
              <a
                href={tool.website_url}
                target="_blank"
                rel="noopener noreferrer"
                className="bg-gradient-to-r from-blue-500 to-purple-500 text-white px-6 py-2.5 rounded-lg flex items-center gap-2 hover:from-blue-600 hover:to-purple-600 transition-all transform hover:scale-105 text-sm"
              >
                Explorer l'outil
                <ArrowUpRight className="w-5 h-5" />
              </a>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default PopupTopRanking;
