import React, { useState } from 'react';
import { Globe, Youtube, Users, GraduationCap, Book, Star, Sparkles, Zap, Gauge, ExternalLink } from 'lucide-react';
import { AIModal } from '../components/AIModal';
import { useMousePosition } from '../hooks/useMousePosition';
import './Learn.css';

interface Tutorial {
  id: string;
  title: string;
  description: string;
  duration: string;
  platform: string;
  views: string;
  rating: number;
  image: string;
  level: 'beginner' | 'intermediate' | 'advanced';
  language: 'FR' | 'EN';
  features?: string[];
  hasPaidPlans?: boolean;
  officialUrl?: string;
}

export function Learn() {
  useMousePosition();
  const [activeTab, setActiveTab] = useState<'tutorials' | 'courses'>('tutorials');
  const [selectedLanguage, setSelectedLanguage] = useState<'all' | 'fr' | 'en'>('all');
  const [selectedLevel, setSelectedLevel] = useState<'all' | 'beginner' | 'intermediate' | 'advanced'>('all');
  const [selectedTutorial, setSelectedTutorial] = useState<Tutorial | null>(null);
  const [isModalOpen, setIsModalOpen] = useState(false);

  const tutorials: Tutorial[] = [
    {
      id: '1',
      title: 'Débuter avec ChatGPT',
      description: 'Guide complet pour bien démarrer avec ChatGPT',
      duration: '15:30',
      platform: 'YouTube',
      views: '125K',
      rating: 4.8,
      image: 'https://images.unsplash.com/photo-1677442136019-21780ecad995',
      level: 'beginner',
      language: 'FR',
      features: [
        'Introduction à l\'interface',
        'Techniques de prompt',
        'Cas d\'utilisation pratiques'
      ],
      hasPaidPlans: true,
      officialUrl: 'https://chat.openai.com'
    },
    {
      id: '2',
      title: 'Développement IA avancé',
      description: 'Techniques avancées de développement avec l\'IA',
      duration: '22:45',
      platform: 'YouTube',
      views: '89K',
      rating: 4.9,
      image: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
      level: 'intermediate',
      language: 'FR',
      features: [
        'Intégration d\'APIs',
        'Modèles personnalisés',
        'Optimisation des résultats'
      ],
      hasPaidPlans: false,
      officialUrl: 'https://example.com/dev-ia'
    },
    {
      id: '3',
      title: 'Stable Diffusion : Guide complet',
      description: 'Maîtrisez Stable Diffusion pour la génération d\'images',
      duration: '18:20',
      platform: 'YouTube',
      views: '250K',
      rating: 4.7,
      image: 'https://images.unsplash.com/photo-1519681393784-d120267933ba',
      level: 'beginner',
      language: 'FR',
      features: [
        'Installation locale',
        'Prompts efficaces',
        'Techniques avancées'
      ],
      hasPaidPlans: true,
      officialUrl: 'https://stability.ai'
    }
  ];

  const filteredTutorials = tutorials.filter(tutorial => {
    if (selectedLanguage !== 'all' && tutorial.language !== (selectedLanguage === 'fr' ? 'FR' : 'EN')) {
      return false;
    }
    if (selectedLevel !== 'all' && tutorial.level !== selectedLevel) {
      return false;
    }
    return true;
  });

  const handleTutorialClick = (tutorial: Tutorial, e: React.MouseEvent) => {
    // Vérifie si le clic n'est pas sur le lien externe
    const target = e.target as HTMLElement;
    if (!target.closest('.external-link')) {
      setSelectedTutorial(tutorial);
      setIsModalOpen(true);
    }
  };

  return (
    <div className="min-h-screen bg-[#0B0F19] text-white px-6 py-12">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-12">
          <div className="flex justify-center mb-8">
            <div className="relative group">
              <div className="absolute inset-0 bg-blue-500/20 rounded-full blur-xl group-hover:blur-2xl transition-all duration-500 animate-pulse"></div>
              
              <div className="relative bg-gray-900/80 p-8 rounded-full transform group-hover:scale-110 transition-transform duration-500">
                <GraduationCap className="w-16 h-16 text-blue-500 animate-float" />
                
                <div className="absolute inset-0 animate-spin-slow">
                  <Book className="w-8 h-8 text-yellow-500 absolute -top-4 left-1/2 -translate-x-1/2 transform -rotate-12" />
                  <Star className="w-8 h-8 text-purple-500 absolute -bottom-4 left-1/2 -translate-x-1/2 transform rotate-12" />
                  <Sparkles className="w-8 h-8 text-green-500 absolute top-1/2 -right-4 -translate-y-1/2" />
                  <Zap className="w-8 h-8 text-red-500 absolute top-1/2 -left-4 -translate-y-1/2" />
                </div>
              </div>
            </div>
          </div>
          <h1 className="text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-blue-500 via-purple-500 to-pink-500 mb-4">
            Apprendre
          </h1>
          <p className="text-gray-400 max-w-2xl mx-auto">
            Découvrez nos tutoriels et ressources pour maîtriser les outils d'IA
          </p>
        </div>

        <div className="flex flex-col items-center justify-center gap-6 mb-12">
          {/* Sélection de la langue */}
          <div className="flex items-center justify-center gap-2">
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

          {/* Sélection du niveau */}
          <div className="flex items-center justify-center gap-2">
            <Gauge className="w-5 h-5 text-gray-400" />
            {[
              { code: 'all', label: 'Tous les niveaux' },
              { code: 'beginner', label: 'Débutant' },
              { code: 'intermediate', label: 'Intermédiaire' },
              { code: 'advanced', label: 'Avancé' }
            ].map((level) => (
              <button
                key={level.code}
                onClick={() => setSelectedLevel(level.code as 'all' | 'beginner' | 'intermediate' | 'advanced')}
                className={`px-4 py-2 rounded-full transition-all duration-300 transform hover:scale-105 ${
                  selectedLevel === level.code
                    ? 'bg-blue-500 text-white shadow-lg shadow-blue-500/25'
                    : 'text-gray-400 hover:text-blue-500'
                }`}
              >
                {level.label}
              </button>
            ))}
          </div>
        </div>

        <div className="flex items-center justify-center gap-4 mb-12 bg-gray-900/50 p-1 rounded-lg max-w-xs mx-auto">
          {[
            { icon: Youtube, label: 'Tutoriels' },
            { icon: Users, label: 'Cours' }
          ].map(({ icon: Icon, label }) => (
            <button
              key={label}
              onClick={() => setActiveTab(label === 'Tutoriels' ? 'tutorials' : 'courses')}
              className={`px-6 py-3 rounded-lg flex items-center gap-2 transition-all duration-300 ${
                (activeTab === 'tutorials' && label === 'Tutoriels') ||
                (activeTab === 'courses' && label === 'Cours')
                  ? 'bg-gray-800 text-white shadow-lg transform scale-105'
                  : 'text-gray-400 hover:text-blue-500'
              }`}
            >
              <Icon className="w-5 h-5" />
              {label}
            </button>
          ))}
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {filteredTutorials.map((tutorial) => (
            <div
              key={tutorial.id}
              className="bg-gray-900/50 rounded-xl overflow-hidden border border-gray-800 hover:border-blue-500 transition-all transform hover:scale-105 hover:shadow-xl hover:shadow-blue-500/10 group cursor-pointer"
              onClick={(e) => handleTutorialClick(tutorial, e)}
            >
              <div className="relative overflow-hidden">
                <img
                  src={tutorial.image}
                  alt={tutorial.title}
                  className="w-full h-48 object-cover transform group-hover:scale-110 transition-transform duration-500"
                />
                <span className="absolute top-4 left-4 px-3 py-1 bg-blue-500 text-white text-sm rounded-full transform hover:scale-110 transition-transform">
                  {tutorial.level === 'beginner' ? 'Débutant' : 
                   tutorial.level === 'intermediate' ? 'Intermédiaire' : 
                   'Avancé'}
                </span>
                <div className="absolute bottom-4 right-4 px-2 py-1 bg-black/50 backdrop-blur-sm text-white text-sm rounded flex items-center gap-2">
                  <Youtube className="w-4 h-4" />
                  {tutorial.duration}
                </div>
                {tutorial.officialUrl && (
                  <a
                    href={tutorial.officialUrl}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="external-link absolute top-4 right-4 p-2 bg-black/50 backdrop-blur-sm rounded-full transform hover:scale-110 transition-transform"
                    onClick={(e) => e.stopPropagation()}
                  >
                    <ExternalLink className="w-4 h-4 text-blue-500" />
                  </a>
                )}
              </div>
              <div className="p-6">
                <h3 className="text-xl font-semibold mb-2 group-hover:text-blue-500 transition-colors">
                  {tutorial.title}
                </h3>
                <p className="text-gray-400 mb-4">{tutorial.description}</p>
                <div className="flex items-center justify-between">
                  <div className="flex items-center gap-2">
                    <Users className="w-4 h-4 text-gray-400" />
                    <span className="text-gray-400">{tutorial.views}</span>
                  </div>
                  <div className="flex items-center gap-1">
                    <Star className="w-4 h-4 text-yellow-500" />
                    <span className="text-gray-400">{tutorial.rating}</span>
                  </div>
                </div>
                <div className="mt-4 flex items-center gap-2">
                  <span className="text-xs px-2 py-1 bg-gray-800 rounded-full text-gray-400">
                    {tutorial.language === 'FR' ? '🇫🇷 FR' : '🇬🇧 EN'}
                  </span>
                  <button className="ml-auto text-blue-500 hover:text-blue-400 transition-colors flex items-center gap-1 group">
                    En savoir plus
                    <Zap className="w-4 h-4 group-hover:translate-x-1 transition-transform" />
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>

        {selectedTutorial && (
          <AIModal
            isOpen={isModalOpen}
            onClose={() => {
              setIsModalOpen(false);
              setSelectedTutorial(null);
            }}
            ai={{
              id: selectedTutorial.id,
              name: selectedTutorial.title,
              shortDescription: selectedTutorial.description,
              features: selectedTutorial.features || [],
              image: selectedTutorial.image,
              hasPaidPlans: selectedTutorial.hasPaidPlans || false
            }}
          />
        )}
      </div>
    </div>
  );
}
