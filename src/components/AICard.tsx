import React, { useState } from 'react';
import { ExternalLink } from 'lucide-react';
import { AIQuickView } from './AIQuickView';
import './AICard.css';

interface AICardProps {
  id: string;
  title: string;
  description: string;
  image: string;
  url: string;
  features?: string[];
  hasPaidPlans?: boolean;
}

export function AICard({ id, title, description, image, url, features = [], hasPaidPlans = false }: AICardProps) {
  const [isQuickViewOpen, setIsQuickViewOpen] = useState(false);

  const handleCardClick = (e: React.MouseEvent) => {
    // Si le clic est sur le lien externe, ne pas ouvrir la quickview
    if ((e.target as HTMLElement).closest('.external-link-wrapper')) {
      return;
    }
    setIsQuickViewOpen(true);
  };

  return (
    <>
      <div 
        className="ai-card group relative bg-white dark:bg-gray-800 rounded-xl shadow-lg overflow-hidden cursor-pointer transition-all duration-300 hover:shadow-2xl"
        onClick={handleCardClick}
      >
        <div className="p-6">
          <div className="flex justify-between items-start mb-4">
            <h3 className="text-xl font-semibold text-gray-900 dark:text-white">{title}</h3>
            <a 
              href={url} 
              target="_blank" 
              rel="noopener noreferrer"
              className="external-link-wrapper ml-2 p-2 rounded-full hover:bg-gray-100 dark:hover:bg-gray-700 transition-colors"
              onClick={(e) => e.stopPropagation()}
            >
              <ExternalLink className="w-5 h-5 text-blue-500" />
            </a>
          </div>
          
          <div className="mb-4">
            <img 
              src={image} 
              alt={title} 
              className="w-full h-40 object-cover rounded-lg"
            />
          </div>
          
          <p className="text-gray-600 dark:text-gray-300 text-sm line-clamp-3">
            {description}
          </p>
        </div>
        
        <div className="absolute inset-0 pointer-events-none">
          <div className="absolute inset-0 border-2 border-transparent group-hover:border-blue-500 rounded-xl transition-colors duration-300"></div>
          <div className="absolute inset-0 opacity-0 group-hover:opacity-100 bg-gradient-to-br from-blue-500/10 to-purple-500/10 transition-opacity duration-300"></div>
        </div>
      </div>

      <AIQuickView
        isOpen={isQuickViewOpen}
        onClose={() => setIsQuickViewOpen(false)}
        ai={{
          id,
          name: title,
          description,
          features,
          image,
          url,
          hasPaidPlans
        }}
      />
    </>
  );
}
