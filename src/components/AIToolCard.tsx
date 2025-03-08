import React, { useState } from 'react';
import { Star, Users, Eye, ArrowUpRight } from 'lucide-react';
import { AIQuickView } from './AIQuickView';
import './AIToolCard.css';

interface AIToolCardProps {
  tool: {
    id: string;
    name: string;
    description: string;
    image_url: string;
    website_url: string;
    average_rating: number;
    total_reviews: number;
    total_views: number;
    monthly_users: number;
    is_verified: boolean;
    pricing?: Array<{
      plan_name: string;
      price: number;
    }>;
  };
  index?: number;
  showRank?: boolean;
}

export function AIToolCard({ tool, index, showRank = false }: AIToolCardProps) {
  const [isQuickViewOpen, setIsQuickViewOpen] = useState(false);

  const handleCardClick = (e: React.MouseEvent) => {
    if ((e.target as HTMLElement).closest('.external-link-wrapper')) {
      return;
    }
    setIsQuickViewOpen(true);
  };

  const formatNumber = (num: number) => {
    if (num >= 1000000) {
      return `${(num / 1000000).toFixed(1)}M`;
    }
    if (num >= 1000) {
      return `${(num / 1000).toFixed(1)}K`;
    }
    return num.toString();
  };

  return (
    <>
      <div 
        className="ai-tool-card group"
        onClick={handleCardClick}
      >
        {showRank && index !== undefined && (
          <div className="rank-badge">
            #{index + 1}
          </div>
        )}
        
        <div className="card-image-container">
          <img
            src={tool.image_url}
            alt={tool.name}
            className="card-image"
          />
        </div>

        <div className="card-content">
          <div className="card-header">
            <h3>{tool.name}</h3>
            <a 
              href={tool.website_url}
              target="_blank"
              rel="noopener noreferrer"
              className="external-link-wrapper"
              onClick={(e) => e.stopPropagation()}
            >
              <ArrowUpRight className="w-5 h-5" />
            </a>
          </div>

          <p className="card-description">{tool.description}</p>

          <div className="card-stats">
            <div className="stat-item">
              <Star className="stat-icon" />
              <span>{tool.average_rating.toFixed(1)}</span>
              <span className="stat-label">({formatNumber(tool.total_reviews)})</span>
            </div>
            <div className="stat-item">
              <Users className="stat-icon" />
              <span>{formatNumber(tool.monthly_users)}</span>
            </div>
            <div className="stat-item">
              <Eye className="stat-icon" />
              <span>{formatNumber(tool.total_views)}</span>
            </div>
          </div>
        </div>
      </div>

      <AIQuickView
        isOpen={isQuickViewOpen}
        onClose={() => setIsQuickViewOpen(false)}
        ai={{
          id: tool.id,
          name: tool.name,
          description: tool.description,
          features: [], // À remplir avec les vraies fonctionnalités
          image: tool.image_url,
          url: tool.website_url,
          hasPaidPlans: tool.pricing ? tool.pricing.length > 0 : false
        }}
      />
    </>
  );
}
