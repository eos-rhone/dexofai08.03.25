import React from 'react';
import { X, ExternalLink } from 'lucide-react';
import './AIModal.css';

interface AIModalProps {
  isOpen: boolean;
  onClose: () => void;
  ai: {
    id: string;
    name: string;
    shortDescription: string;
    features: string[];
    image: string;
    url: string;
    hasPaidPlans: boolean;
  };
}

export function AIModal({ isOpen, onClose, ai }: AIModalProps) {
  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
      <div 
        className="absolute inset-0 bg-black/50 backdrop-blur-sm"
        onClick={onClose}
      ></div>
      
      <div className="relative w-full max-w-4xl bg-white dark:bg-gray-800 rounded-2xl shadow-2xl overflow-hidden">
        {/* Header avec bouton de fermeture */}
        <div className="flex justify-between items-center p-6 border-b border-gray-200 dark:border-gray-700">
          <h2 className="text-2xl font-bold text-gray-900 dark:text-white">{ai.name}</h2>
          <button
            onClick={onClose}
            className="p-2 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-full transition-colors"
          >
            <X className="w-6 h-6 text-gray-500 dark:text-gray-400" />
          </button>
        </div>

        <div className="p-6">
          {/* Image et description */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
            <div>
              <img
                src={ai.image}
                alt={ai.name}
                className="w-full h-64 object-cover rounded-xl shadow-lg"
              />
            </div>
            <div>
              <p className="text-gray-600 dark:text-gray-300 mb-4">
                {ai.shortDescription}
              </p>
              <a
                href={ai.url}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 text-blue-500 hover:text-blue-600 transition-colors"
              >
                Visiter le site <ExternalLink className="w-4 h-4" />
              </a>
            </div>
          </div>

          {/* Fonctionnalités */}
          <div className="mb-8">
            <h3 className="text-xl font-semibold text-gray-900 dark:text-white mb-4">
              Fonctionnalités principales
            </h3>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              {ai.features.map((feature, index) => (
                <div
                  key={index}
                  className="p-4 bg-gray-50 dark:bg-gray-700/50 rounded-lg"
                >
                  <p className="text-gray-700 dark:text-gray-300">{feature}</p>
                </div>
              ))}
            </div>
          </div>

          {/* Section des tarifs */}
          {ai.hasPaidPlans && (
            <div>
              <h3 className="text-xl font-semibold text-gray-900 dark:text-white mb-4">
                Plans et tarifs
              </h3>
              <a
                href={`${ai.url}/pricing`}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-colors"
              >
                Voir les tarifs <ExternalLink className="w-4 h-4 ml-2" />
              </a>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
