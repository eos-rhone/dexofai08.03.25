import React, { useEffect } from 'react';
import { Link } from 'react-router-dom';
import { X, ArrowUpRight, Star, Users, Eye, Check, ChevronRight, Crown } from 'lucide-react';

interface PopupOutilPopulaireProps {
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
  ranking?: number;  // Ajout du prop ranking optionnel
  pricing?: {
    name: string;
    price: number | string;
    features: string[];
  }[];
}

export function PopupOutilPopulaire({ 
  isOpen, 
  onClose,
  name,
  description,
  image_url,
  website_url,
  category,
  ranking,  // Ajout du prop ranking
  pricing
}: PopupOutilPopulaireProps) {
  // Empêcher le scroll du body quand le popup est ouvert
  useEffect(() => {
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

  const fallbackImage = "/images/placeholder.png";

  return (
    <div 
      className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/80 backdrop-blur-sm animate-fade-in"
      onClick={onClose}
    >
      <div 
        className="relative w-full max-w-2xl bg-[#0B0F19] rounded-2xl shadow-2xl overflow-hidden max-h-[90vh] flex flex-col"
        onClick={e => e.stopPropagation()}
      >
        {/* En-tête avec image - reste fixe */}
        <div className="relative h-48 flex-shrink-0">
          <img
            src={image_url || fallbackImage}
            alt={name}
            className="w-full h-full object-cover"
            onError={(e) => {
              e.currentTarget.src = fallbackImage;
            }}
          />
          
          {/* Overlay dégradé */}
          <div className="absolute inset-0 bg-gradient-to-t from-[#0B0F19] via-[#0B0F19]/70 to-transparent">
            <div className="absolute bottom-4 left-4 right-4">
              <h2 className="text-2xl font-bold text-white mb-1">{name}</h2>
              {category && (
                <Link
                  to={`/categories/${category.slug}`}
                  onClick={onClose}
                  className="text-blue-400 hover:text-blue-300 transition-colors text-sm"
                >
                  {category.name}
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
          {website_url && (
            <a
              href={website_url}
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

          {/* Description */}
          <div className="mb-6">
            <h3 className="text-base font-semibold text-white mb-2">À propos</h3>
            <p className="text-gray-400 text-sm">{description}</p>
          </div>

          {/* Plans tarifaires */}
          {pricing && pricing.length > 0 && (
            <div>
              <h3 className="text-base font-semibold text-white mb-3">Plans tarifaires</h3>
              <div className="grid grid-cols-2 gap-3">
                {pricing.map((plan, index) => (
                  <div
                    key={index}
                    className="bg-gradient-to-br from-gray-800/30 to-gray-800/10 rounded-lg p-4 border border-gray-700/50 hover:border-blue-500/50 transition-colors"
                  >
                    <h4 className="text-base font-medium text-white mb-1">{plan.name}</h4>
                    <div className="text-lg font-bold text-white">
                      {plan.price === 0 ? 'Gratuit' : `${plan.price}€`}
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Bouton d'action */}
          {website_url && (
            <div className="flex justify-center mt-6">
              <a
                href={website_url}
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
}
