import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { ArrowUpRight } from 'lucide-react';
import { PopupOutilPopulaire } from './PopupOutilPopulaire';

interface AIQuickViewProps {
  id: string;
  slug: string;
  name: string;
  description: string;
  image_url?: string;
  website_url?: string;
  category?: {
    name: string;
    slug: string;
  };
  pricing?: {
    name: string;
    price: number | string;
    features: string[];
  }[];
}

export function AIQuickView({
  id,
  slug,
  name,
  description,
  image_url,
  website_url,
  category,
  pricing
}: AIQuickViewProps) {
  const [isPopupOpen, setIsPopupOpen] = useState(false);

  // Fonction sécurisée pour obtenir le prix minimum
  const getMinPrice = () => {
    if (!pricing || !Array.isArray(pricing) || pricing.length === 0) return 'Gratuit';
    
    const prices = pricing.map(plan => {
      if (!plan || typeof plan !== 'object') return Infinity;
      
      const price = plan.price;
      if (price === undefined || price === null) return Infinity;
      
      if (typeof price === 'number') return price;
      
      const priceStr = String(price).toLowerCase();
      if (priceStr === '0' || priceStr === 'gratuit' || priceStr === '') return 0;
      
      const numericPrice = parseFloat(priceStr.replace(/[^0-9.-]+/g, ''));
      return isNaN(numericPrice) ? Infinity : numericPrice;
    });
    
    const minPrice = Math.min(...prices);
    return minPrice === 0 ? 'Gratuit' : 
           minPrice === Infinity ? 'Premium' : 
           `À partir de ${minPrice}€`;
  };

  // Utiliser une image par défaut si aucune image n'est fournie
  const fallbackImage = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIiB2aWV3Qm94PSIwIDAgMTAwIDEwMCI+CiAgPHJlY3Qgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIGZpbGw9IiMxYTFhMWEiLz4KICA8dGV4dCB4PSI1MCIgeT0iNTAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0iIzRhNWJiZiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZHk9Ii4zZW0iPkF1Y3VuZSBpbWFnZTwvdGV4dD4KPC9zdmc+";

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
        className="magic-card bg-gray-900/50 rounded-xl p-6 border border-gray-800 hover:border-blue-500/50 transition-all duration-300 cursor-pointer group"
        onClick={() => setIsPopupOpen(true)}
      >
        <div className="flex items-start gap-4">
          <div className="flex-shrink-0">
            <img
              src={image_url || fallbackImage}
              alt={name}
              className="w-16 h-16 rounded-lg object-cover"
              onError={(e) => {
                e.currentTarget.src = fallbackImage;
              }}
            />
          </div>
          
          <div className="flex-grow min-w-0">
            <div className="flex items-start justify-between gap-2">
              <h3 className="text-lg font-semibold text-white truncate group-hover:text-blue-500 transition-colors">
                {name}
              </h3>
              
              <div className="flex items-center gap-2 flex-shrink-0" onClick={(e) => e.stopPropagation()}>
                {website_url && (
                  <a
                    href={website_url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-blue-500 hover:text-blue-400 transition-colors p-2 rounded-full hover:bg-blue-500/10 group"
                  >
                    <ArrowUpRight className="w-6 h-6 transform transition-transform group-hover:translate-x-0.5 group-hover:-translate-y-0.5" />
                  </a>
                )}
              </div>
            </div>
            
            {category && (
              <div className="mt-1" onClick={(e) => e.stopPropagation()}>
                <Link
                  to={`/categories/${category.slug}`}
                  className="text-sm text-blue-500 hover:text-transparent hover:bg-clip-text hover:bg-gradient-to-r hover:from-purple-400 hover:via-purple-500 hover:to-purple-600 transition-all duration-300"
                >
                  {category.name}
                </Link>
              </div>
            )}
            
            <p className="mt-2 text-sm text-gray-400 line-clamp-2">
              {description}
            </p>
            
            <div className="mt-3 text-sm font-medium text-blue-500">
              {getMinPrice()}
            </div>
          </div>
        </div>
      </div>

      <PopupOutilPopulaire
        isOpen={isPopupOpen}
        onClose={() => setIsPopupOpen(false)}
        name={name}
        description={description}
        image_url={image_url}
        website_url={website_url}
        category={category}
        pricing={pricing}
      />
    </>
  );
}
