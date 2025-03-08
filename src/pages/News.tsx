import React, { useState } from 'react';
import { Globe, ArrowUpRight, Newspaper, Star, Sparkles, Zap, MessageSquare } from 'lucide-react';

interface NewsArticle {
  id: string;
  title: string;
  description: string;
  source: string;
  date: string;
  image: string;
  category: string;
  language: 'FR' | 'EN';
}

export function News() {
  const [selectedLanguage, setSelectedLanguage] = useState<'all' | 'fr' | 'en'>('all');

  const newsArticles: NewsArticle[] = [
    {
      id: '1',
      title: 'ChatGPT révolutionne le monde professionnel',
      description: 'Comment l\'IA transforme les méthodes de travail en 2024',
      source: 'Le Monde',
      date: '15/03/2024',
      image: 'https://images.unsplash.com/photo-1677442136019-21780ecad995',
      category: 'Innovation',
      language: 'FR'
    },
    {
      id: '2',
      title: 'DeepMind annonce une avancée majeure',
      description: 'Une nouvelle approche pour l\'apprentissage automatique',
      source: 'Les Echos',
      date: '14/03/2024',
      image: 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485',
      category: 'Recherche',
      language: 'FR'
    },
    {
      id: '3',
      title: 'L\'IA dans la musique en 2024',
      description: 'État des lieux et perspectives d\'avenir',
      source: 'Le Figaro',
      date: '13/03/2024',
      image: 'https://images.unsplash.com/photo-1519681393784-d120267933ba',
      category: 'Innovation',
      language: 'FR'
    }
  ];

  const filteredArticles = newsArticles.filter(article => {
    if (selectedLanguage === 'all') return true;
    if (selectedLanguage === 'fr') return article.language === 'FR';
    if (selectedLanguage === 'en') return article.language === 'EN';
    return true;
  });

  return (
    <div className="min-h-screen bg-[#0B0F19] text-white px-6 py-12">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-12">
          <div className="flex justify-center mb-8">
            <div className="relative group">
              <div className="absolute inset-0 bg-blue-500/20 rounded-full blur-xl group-hover:blur-2xl transition-all duration-500 animate-pulse"></div>
              
              <div className="relative bg-gray-900/80 p-8 rounded-full transform group-hover:scale-110 transition-transform duration-500">
                <Newspaper className="w-16 h-16 text-blue-500 animate-float" />
                
                <div className="absolute inset-0 animate-spin-slow">
                  <Star className="w-8 h-8 text-yellow-500 absolute -top-4 left-1/2 -translate-x-1/2 transform -rotate-12" />
                  <Sparkles className="w-8 h-8 text-purple-500 absolute -bottom-4 left-1/2 -translate-x-1/2 transform rotate-12" />
                  <Zap className="w-8 h-8 text-green-500 absolute top-1/2 -right-4 -translate-y-1/2" />
                  <MessageSquare className="w-8 h-8 text-red-500 absolute top-1/2 -left-4 -translate-y-1/2" />
                </div>
              </div>
            </div>
          </div>
          <h1 className="text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-blue-500 via-purple-500 to-pink-500 mb-4">
            Actualités
          </h1>
          <p className="text-center text-gray-400 mb-12 max-w-3xl mx-auto">
            Restez informé des dernières avancées en intelligence artificielle
          </p>
        </div>

        <div className="flex items-center justify-center gap-2 mb-12">
          <Globe className="w-5 h-5 text-gray-400" />
          {[
            { code: 'all', label: 'Toutes les langues' },
            { code: 'fr', label: 'Français' },
            { code: 'en', label: 'Anglais' }
          ].map((lang) => (
            <button
              key={lang.code}
              onClick={() => setSelectedLanguage(lang.code as 'all' | 'fr' | 'en')}
              className={`px-4 py-2 rounded-full transition-all duration-300 transform hover:scale-105 ${
                selectedLanguage === lang.code
                  ? 'bg-blue-500 text-white shadow-lg shadow-blue-500/25'
                  : 'text-gray-400 hover:text-blue-500'
              }`}
            >
              {lang.label}
            </button>
          ))}
        </div>

        <div className="space-y-6">
          {filteredArticles.map((article) => (
            <div
              key={article.id}
              className="flex flex-col md:flex-row gap-6 bg-gray-900/50 rounded-xl overflow-hidden border border-gray-800 hover:border-blue-500 transition-all cursor-pointer group transform hover:scale-[1.02] hover:shadow-xl hover:shadow-blue-500/10"
            >
              <div className="md:w-1/3 h-64 md:h-auto relative overflow-hidden">
                <div className="absolute inset-0 bg-gradient-to-t from-black/50 to-transparent z-10"></div>
                <img
                  src={article.image}
                  alt={article.title}
                  className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
                />
                <div className="absolute bottom-4 left-4 z-20">
                  <span className="px-3 py-1 bg-blue-500 text-white text-sm rounded-full">
                    {article.category}
                  </span>
                </div>
              </div>
              <div className="flex-1 p-6 flex flex-col justify-between">
                <div>
                  <div className="flex items-center justify-between mb-4">
                    <div className="flex items-center gap-3">
                      <span className="text-gray-400 flex items-center gap-2">
                        <Newspaper className="w-4 h-4" />
                        {article.source}
                      </span>
                      <span className="text-gray-600">•</span>
                      <span className="text-gray-400 flex items-center gap-2">
                        <Star className="w-4 h-4" />
                        {article.date}
                      </span>
                    </div>
                    <span className="text-xs px-2 py-1 bg-gray-800 rounded-full text-gray-400 group-hover:bg-blue-500/10 group-hover:text-blue-500 transition-all duration-300">
                      {article.language === 'FR' ? '🇫🇷 FR' : '🇬🇧 EN'}
                    </span>
                  </div>
                  <h2 className="text-2xl font-semibold mb-3 group-hover:text-blue-500 transition-colors">
                    {article.title}
                  </h2>
                  <p className="text-gray-400 mb-4 line-clamp-2">
                    {article.description}
                  </p>
                </div>
                <div className="flex items-center justify-between">
                  <button className="text-blue-500 flex items-center gap-2 group/btn hover:text-blue-400 transition-colors">
                    Lire la suite
                    <ArrowUpRight className="w-5 h-5 group-hover/btn:translate-x-1 group-hover/btn:-translate-y-1 transition-transform" />
                  </button>
                  <div className="flex items-center gap-2">
                    <button className="p-2 text-gray-400 hover:text-blue-500 transition-colors">
                      <MessageSquare className="w-5 h-5" />
                    </button>
                    <button className="p-2 text-gray-400 hover:text-blue-500 transition-colors">
                      <Star className="w-5 h-5" />
                    </button>
                    <button className="p-2 text-gray-400 hover:text-blue-500 transition-colors">
                      <Zap className="w-5 h-5" />
                    </button>
                  </div>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
