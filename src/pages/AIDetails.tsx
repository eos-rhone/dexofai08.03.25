import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { ArrowLeft, ExternalLink, Star, Users, Clock, Zap, Shield, Check, Globe, MessageSquare } from 'lucide-react';
import { getToolDetails } from '../lib/supabase';
import './AIDetails.css';

interface AIDetails {
  id: string;
  slug: string;
  name: string;
  description: string;
  website_url: string;
  image_url: string;
  monthly_users?: number;
  rating?: number;
  response_time?: string;
  languages?: string[];
  security_features?: string[];
  features?: string[];
  use_cases?: string[];
  pricing: {
    name: string;
    price: string;
    features: string[];
  }[];
  category: {
    id: string;
    name: string;
    slug: string;
    icon: string;
  };
}

export function AIDetails() {
  const { slug } = useParams<{ slug: string }>();
  const navigate = useNavigate();
  const [ai, setAi] = useState<AIDetails | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [activeTab, setActiveTab] = useState('about');

  useEffect(() => {
    async function loadAIDetails() {
      if (!slug) {
        setError('Aucun identifiant fourni');
        setLoading(false);
        return;
      }
      
      try {
        setLoading(true);
        setError(null);
        const data = await getToolDetails(slug);
        
        if (data) {
          setAi(data);
        } else {
          setError('IA non trouvée');
        }
      } catch (err) {
        console.error('Error loading AI details:', err);
        setError('Erreur lors du chargement des détails');
      } finally {
        setLoading(false);
      }
    }

    loadAIDetails();
  }, [slug]);

  if (loading) {
    return (
      <div className="min-h-screen bg-[#0B0F19] flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-16 w-16 border-b-2 border-blue-500 mb-4"></div>
          <p className="text-gray-400">Chargement des détails...</p>
        </div>
      </div>
    );
  }

  if (error || !ai) {
    return (
      <div className="min-h-screen bg-[#0B0F19] flex items-center justify-center">
        <div className="text-center">
          <h2 className="text-2xl font-bold text-red-500 mb-4">{error || 'IA non trouvée'}</h2>
          <button 
            onClick={() => navigate(-1)} 
            className="inline-flex items-center px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-colors"
          >
            <ArrowLeft className="w-4 h-4 mr-2" />
            <span>Retour</span>
          </button>
        </div>
      </div>
    );
  }

  const tabs = [
    { id: 'about', label: 'À propos' },
    { id: 'features', label: 'Fonctionnalités' },
    { id: 'pricing', label: 'Tarifs' },
    { id: 'use-cases', label: 'Cas d\'utilisation' },
  ];

  return (
    <div className="min-h-screen bg-[#0B0F19]">
      {/* Hero Section */}
      <div className="relative overflow-hidden bg-gradient-to-b from-blue-500/10 to-transparent pt-8 pb-16">
        <div className="absolute inset-0">
          <div className="absolute inset-0 bg-grid-white/[0.02] bg-[size:32px]" />
        </div>
        
        <div className="container mx-auto px-4 relative">
          <button 
            onClick={() => navigate(-1)} 
            className="mb-8 inline-flex items-center text-gray-400 hover:text-white transition-colors"
          >
            <ArrowLeft className="w-4 h-4 mr-2" />
            <span>Retour</span>
          </button>

          <div className="flex items-start gap-8 mb-8">
            {ai.image_url && (
              <img 
                src={ai.image_url} 
                alt={ai.name} 
                className="w-24 h-24 object-cover rounded-xl bg-gray-800 p-2"
              />
            )}
            
            <div className="flex-1">
              <div className="flex items-center gap-4 mb-2">
                <h1 className="text-4xl font-bold">{ai.name}</h1>
                {ai.category && (
                  <span className="px-3 py-1 bg-blue-500/10 text-blue-500 rounded-full text-sm">
                    {ai.category.name}
                  </span>
                )}
              </div>
              
              <p className="text-gray-400 text-lg mb-4">{ai.description}</p>
              
              <div className="flex items-center gap-6">
                {ai.rating && (
                  <div className="flex items-center gap-2">
                    <Star className="w-5 h-5 text-yellow-500" />
                    <span>{ai.rating.toFixed(1)}/5</span>
                  </div>
                )}
                
                {ai.monthly_users && (
                  <div className="flex items-center gap-2">
                    <Users className="w-5 h-5 text-blue-500" />
                    <span>{new Intl.NumberFormat('fr-FR').format(ai.monthly_users)} utilisateurs</span>
                  </div>
                )}
                
                {ai.response_time && (
                  <div className="flex items-center gap-2">
                    <Clock className="w-5 h-5 text-green-500" />
                    <span>{ai.response_time}</span>
                  </div>
                )}
              </div>
            </div>

            {ai.website_url && (
              <a 
                href={ai.website_url}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center px-6 py-3 bg-blue-500 text-white rounded-xl hover:bg-blue-600 transition-colors"
              >
                <span>Visiter le site</span>
                <ExternalLink className="w-4 h-4 ml-2" />
              </a>
            )}
          </div>

          {/* Tabs */}
          <div className="flex items-center gap-2 border-b border-gray-800">
            {tabs.map(tab => (
              <button
                key={tab.id}
                onClick={() => setActiveTab(tab.id)}
                className={`px-6 py-3 text-sm font-medium transition-colors ${
                  activeTab === tab.id 
                    ? 'text-blue-500 border-b-2 border-blue-500' 
                    : 'text-gray-400 hover:text-white'
                }`}
              >
                {tab.label}
              </button>
            ))}
          </div>
        </div>
      </div>

      {/* Content Section */}
      <div className="container mx-auto px-4 py-12">
        {/* About Tab */}
        {activeTab === 'about' && (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {/* Key Features */}
            <div className="bg-gray-900/50 rounded-xl p-6 border border-gray-800">
              <h2 className="text-xl font-semibold mb-6">Points clés</h2>
              <div className="space-y-4">
                {ai.languages && (
                  <div className="flex items-start gap-3">
                    <Globe className="w-5 h-5 text-blue-500 mt-1" />
                    <div>
                      <h3 className="font-medium mb-1">Langues supportées</h3>
                      <div className="flex flex-wrap gap-2">
                        {ai.languages.map(lang => (
                          <span key={lang} className="px-2 py-1 bg-gray-800 rounded-lg text-sm">
                            {lang}
                          </span>
                        ))}
                      </div>
                    </div>
                  </div>
                )}
                
                {ai.security_features && (
                  <div className="flex items-start gap-3">
                    <Shield className="w-5 h-5 text-green-500 mt-1" />
                    <div>
                      <h3 className="font-medium mb-1">Sécurité</h3>
                      <div className="space-y-1">
                        {ai.security_features.map(feature => (
                          <div key={feature} className="flex items-center gap-2 text-sm text-gray-400">
                            <Check className="w-4 h-4 text-green-500" />
                            {feature}
                          </div>
                        ))}
                      </div>
                    </div>
                  </div>
                )}
              </div>
            </div>

            {/* Integration & Support */}
            <div className="bg-gray-900/50 rounded-xl p-6 border border-gray-800">
              <h2 className="text-xl font-semibold mb-6">Intégration & Support</h2>
              <div className="space-y-4">
                <div className="flex items-start gap-3">
                  <Zap className="w-5 h-5 text-yellow-500 mt-1" />
                  <div>
                    <h3 className="font-medium mb-1">Temps de réponse</h3>
                    <p className="text-gray-400">{ai.response_time || 'Non spécifié'}</p>
                  </div>
                </div>
                
                <div className="flex items-start gap-3">
                  <MessageSquare className="w-5 h-5 text-purple-500 mt-1" />
                  <div>
                    <h3 className="font-medium mb-1">Support client</h3>
                    <p className="text-gray-400">24/7 via chat et email</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        )}

        {/* Features Tab */}
        {activeTab === 'features' && (
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {ai.features?.map((feature, index) => (
              <div 
                key={index}
                className="bg-gray-900/50 rounded-xl p-6 border border-gray-800"
              >
                <h3 className="font-medium mb-2">{feature}</h3>
              </div>
            ))}
          </div>
        )}

        {/* Pricing Tab */}
        {activeTab === 'pricing' && (
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {ai.pricing?.map((plan, index) => (
              <div 
                key={index}
                className="bg-gray-900/50 rounded-xl p-6 border border-gray-800"
              >
                <h3 className="text-xl font-semibold mb-2">{plan.name}</h3>
                <div className="text-3xl font-bold mb-6">
                  {plan.price === '0' ? 'Gratuit' : `${plan.price}€`}
                </div>
                {plan.features && (
                  <ul className="space-y-3">
                    {plan.features.map((feature, i) => (
                      <li key={i} className="flex items-center gap-2 text-gray-400">
                        <Check className="w-4 h-4 text-green-500" />
                        {feature}
                      </li>
                    ))}
                  </ul>
                )}
              </div>
            ))}
          </div>
        )}

        {/* Use Cases Tab */}
        {activeTab === 'use-cases' && (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {ai.use_cases?.map((useCase, index) => (
              <div 
                key={index}
                className="bg-gray-900/50 rounded-xl p-6 border border-gray-800"
              >
                <h3 className="font-medium mb-2">{useCase}</h3>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
