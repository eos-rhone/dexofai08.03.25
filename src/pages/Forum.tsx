import React from 'react';
import { Search, MessageSquare, Eye, Clock, Filter } from 'lucide-react';

interface ForumPost {
  id: string;
  title: string;
  author: string;
  date: string;
  tags: string[];
  responses: number;
  views: number;
  isPinned?: boolean;
  isPopular?: boolean;
  authorAvatar: string;
}

const forumPosts: ForumPost[] = [
  {
    id: '1',
    title: 'Comment débuter avec ChatGPT pour le développement ?',
    author: 'Thomas Martin',
    date: '15/03/2024',
    tags: ['ChatGPT', 'Développement', 'IA', 'Tutoriel'],
    responses: 23,
    views: 456,
    isPinned: true,
    authorAvatar: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e'
  },
  {
    id: '2',
    title: 'Stable Diffusion vs Midjourney : Comparaison détaillée',
    author: 'Sophie Petit',
    date: '14/03/2024',
    tags: ['Stable Diffusion', 'Midjourney', 'Comparaison'],
    responses: 45,
    views: 892,
    isPopular: true,
    authorAvatar: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80'
  },
  {
    id: '3',
    title: "L'IA dans la musique : État de l'art en 2024",
    author: 'Marie Dubois',
    date: '13/03/2024',
    tags: ['Musique', 'IA', 'Création', '2024'],
    responses: 18,
    views: 345,
    authorAvatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330'
  }
];

const categories = [
  'Toutes les discussions',
  'Discussion générale',
  'Actualités IA',
  'Développement',
  'Génération d\'images',
  'Musique & Audio',
  'Vidéo & Animation',
  'Rédaction & Contenu',
  'Analyse de données',
  'Recherche & Science'
];

export function Forum() {
  return (
    <div className="min-h-screen bg-[#0B0F19]">
      <div className="max-w-7xl mx-auto px-6 py-8">
        <div className="flex justify-between items-center mb-8">
          <div>
            <h1 className="text-4xl font-bold text-white mb-2">Forum</h1>
            <p className="text-gray-400">
              Échangez avec la communauté sur l'IA et ses applications
            </p>
          </div>
          <div className="flex gap-4">
            <button className="px-4 py-2 text-gray-400 hover:text-white transition-colors">
              Connexion
            </button>
            <button className="px-4 py-2 text-gray-400 hover:text-white transition-colors">
              Inscription
            </button>
            <button className="px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-colors flex items-center gap-2">
              <span>+</span> Nouveau sujet
            </button>
          </div>
        </div>

        <div className="flex gap-8">
          {/* Sidebar */}
          <div className="w-64 flex-shrink-0">
            <div className="bg-gray-900/50 rounded-lg p-4">
              <h2 className="text-lg font-semibold text-white mb-4">Catégories</h2>
              <nav className="space-y-2">
                {categories.map((category) => (
                  <button
                    key={category}
                    className="w-full text-left px-4 py-2 text-gray-400 hover:text-blue-500 hover:bg-blue-500/10 rounded-lg transition-colors"
                  >
                    {category}
                  </button>
                ))}
              </nav>
            </div>
          </div>

          {/* Main Content */}
          <div className="flex-1">
            <div className="flex items-center gap-4 mb-6">
              <div className="flex-1 relative">
                <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
                <input
                  type="text"
                  placeholder="Rechercher dans le forum..."
                  className="w-full pl-12 pr-4 py-3 bg-gray-900/50 border border-gray-800 rounded-lg text-white placeholder-gray-400 focus:outline-none focus:border-blue-500"
                />
              </div>
              <button className="px-4 py-3 bg-gray-900/50 border border-gray-800 rounded-lg text-gray-400 hover:text-white transition-colors flex items-center gap-2">
                <Filter className="w-5 h-5" />
                Filtres
              </button>
            </div>

            <div className="space-y-4">
              {forumPosts.map((post) => (
                <div
                  key={post.id}
                  className="bg-gray-900/50 border border-gray-800 rounded-lg p-6 hover:border-blue-500 transition-all cursor-pointer"
                >
                  <div className="flex items-start gap-4">
                    <img
                      src={post.authorAvatar}
                      alt={post.author}
                      className="w-10 h-10 rounded-full object-cover"
                    />
                    <div className="flex-1">
                      <div className="flex items-start justify-between mb-2">
                        <div>
                          <div className="flex items-center gap-2 mb-1">
                            {post.isPinned && (
                              <span className="px-2 py-1 text-xs bg-blue-500 text-white rounded-full">
                                Épinglé
                              </span>
                            )}
                            {post.isPopular && (
                              <span className="px-2 py-1 text-xs bg-red-500 text-white rounded-full">
                                Populaire
                              </span>
                            )}
                          </div>
                          <h3 className="text-xl font-semibold text-white hover:text-blue-500 transition-colors">
                            {post.title}
                          </h3>
                        </div>
                        <span className="text-gray-400 text-sm">{post.date}</span>
                      </div>
                      <div className="flex flex-wrap gap-2 mb-4">
                        {post.tags.map((tag) => (
                          <span
                            key={tag}
                            className="px-3 py-1 bg-gray-800 text-gray-400 rounded-full text-sm"
                          >
                            {tag}
                          </span>
                        ))}
                      </div>
                      <div className="flex items-center gap-6 text-gray-400 text-sm">
                        <span>{post.author}</span>
                        <div className="flex items-center gap-2">
                          <MessageSquare className="w-4 h-4" />
                          {post.responses} réponses
                        </div>
                        <div className="flex items-center gap-2">
                          <Eye className="w-4 h-4" />
                          {post.views} vues
                        </div>
                        <div className="flex items-center gap-2">
                          <Clock className="w-4 h-4" />
                          {post.date}
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
