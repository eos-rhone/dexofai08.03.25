import React from 'react';
import { X, Star, Users, Eye, MessageSquare, ArrowUpRight, Crown } from 'lucide-react';
import { Link } from 'react-router-dom';

interface PopupRankingProps {
  isOpen: boolean;
  onClose: () => void;
  name: string;
  description: string;
  image_url?: string;
  website_url?: string;
  category?: {
    name: string;
    slug: string;
  };
  ranking: number;
  average_rating: number;
  total_reviews: number;
  total_views: number;
  monthly_users: number;
  pricing?: {
    plan_name: string;
    price: number;
  }[];
}

const PopupRanking: React.FC<PopupRankingProps> = ({
  isOpen,
  onClose,
  name,
  description,
  image_url,
  website_url,
  category,
  ranking,
  average_rating,
  total_reviews,
  total_views,
  monthly_users,
  pricing
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
      
      <div className="relative w-full max-w-4xl bg-[#0B0F19] rounded-2xl shadow-2xl overflow-hidden">
        {/* En-tête avec image */}
        <div className="relative h-64">
          <img
            src={image_url || fallbackImage}
            alt={name}
            className="w-full h-full object-cover"
            onError={(e) => {
              e.currentTarget.src = fallbackImage;
            }}
          />
          
          {/* Badge de classement */}
          <div className="absolute top-4 left-4 bg-yellow-500 text-black px-4 py-2 rounded-full flex items-center gap-2 font-bold">
            <Crown className="w-5 h-5" />
            #{ranking}
          </div>

          {/* Overlay dégradé */}
          <div className="absolute inset-0 bg-gradient-to-t from-[#0B0F19] via-[#0B0F19]/70 to-transparent">
            <div className="absolute bottom-6 left-6 right-6">
              <h2 className="text-3xl font-bold text-white mb-2">{name}</h2>
              {category && (
                <Link
                  to={`/categories/${category.slug}`}
                  onClick={onClose}
                  className="text-blue-400 hover:text-blue-300 transition-colors"
                >
                  {category.name}
                </Link>
              )}
            </div>
          </div>

          {/* Bouton de fermeture */}
          <button
            onClick={onClose}
            className="absolute top-4 right-4 p-2 bg-black/50 hover:bg-black/70 rounded-full transition-colors"
          >
            <X className="w-6 h-6 text-white" />
          </button>

          {/* Bouton visiter le site */}
          {website_url && (
            <a
              href={website_url}
              target="_blank"
              rel="noopener noreferrer"
              className="absolute top-4 right-16 bg-blue-500 text-white px-4 py-2 rounded-full flex items-center gap-2 hover:bg-blue-600 transition-colors"
            >
              Visiter le site
              <ArrowUpRight className="w-5 h-5" />
            </a>
          )}
        </div>

        {/* Contenu */}
        <div className="p-8">
          {/* Stats rapides */}
          <div className="grid grid-cols-4 gap-4 mb-8">
            {/* Classement */}
            <div className="bg-gray-800/30 rounded-xl p-4 border border-gray-700/50">
              <div className="flex items-center gap-3 text-gray-400 mb-2">
                <Crown className="w-5 h-5 text-yellow-500" />
                <span>Classement</span>
              </div>
              <div className="text-2xl font-bold text-white">#{ranking}</div>
            </div>

            {/* Note moyenne */}
            <div className="bg-gray-800/30 rounded-xl p-4 border border-gray-700/50">
              <div className="flex items-center gap-3 text-gray-400 mb-2">
                <Star className="w-5 h-5 text-yellow-500" />
                <span>Note</span>
              </div>
              <div className="text-2xl font-bold text-white">
                {average_rating.toFixed(1)}/5
              </div>
            </div>

            {/* Utilisateurs */}
            <div className="bg-gray-800/30 rounded-xl p-4 border border-gray-700/50">
              <div className="flex items-center gap-3 text-gray-400 mb-2">
                <Users className="w-5 h-5" />
                <span>Utilisateurs</span>
              </div>
              <div className="text-2xl font-bold text-white">
                {formatNumber(monthly_users)}+
              </div>
            </div>

            {/* Vues */}
            <div className="bg-gray-800/30 rounded-xl p-4 border border-gray-700/50">
              <div className="flex items-center gap-3 text-gray-400 mb-2">
                <Eye className="w-5 h-5" />
                <span>Vues totales</span>
              </div>
              <div className="text-2xl font-bold text-white">
                {formatNumber(total_views)}
              </div>
            </div>
          </div>

          {/* Description */}
          <div className="mb-8">
            <h3 className="text-lg font-semibold text-white mb-3">À propos</h3>
            <p className="text-gray-400">{description}</p>
          </div>

          {/* Plans tarifaires */}
          {pricing && pricing.length > 0 && (
            <div>
              <h3 className="text-lg font-semibold text-white mb-4">Plans tarifaires</h3>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                {pricing.map((plan, index) => (
                  <div
                    key={index}
                    className="bg-gradient-to-br from-gray-800/30 to-gray-800/10 rounded-xl p-6 border border-gray-700/50 hover:border-blue-500/50 transition-colors"
                  >
                    <h4 className="text-lg font-medium text-white mb-2">{plan.plan_name}</h4>
                    <div className="text-2xl font-bold text-white mb-4">
                      {plan.price === 0 ? 'Gratuit' : `${plan.price}€`}
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Bouton d'action */}
          {website_url && (
            <div className="flex justify-center mt-8">
              <a
                href={website_url}
                target="_blank"
                rel="noopener noreferrer"
                className="bg-gradient-to-r from-blue-500 to-purple-500 text-white px-8 py-4 rounded-xl flex items-center gap-2 hover:from-blue-600 hover:to-purple-600 transition-all transform hover:scale-105"
              >
                Commencer maintenant
                <ArrowUpRight className="w-6 h-6" />
              </a>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default PopupRanking;
