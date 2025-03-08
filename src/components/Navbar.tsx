import React, { useState, useRef, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { Brain, MoreVertical, Zap, Star, Sparkles } from 'lucide-react';
import { ThemeSelector } from './ThemeSelector';

export function Navbar() {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const menuRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (menuRef.current && !menuRef.current.contains(event.target as Node)) {
        setIsMenuOpen(false);
      }
    }

    document.addEventListener('mousedown', handleClickOutside);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, []);

  const navItems = [
    { label: 'Classement', path: '/classement' },
    { label: 'Catégories', path: '/categories' },
    { label: 'Assistant IA', path: '/assistant' },
    { label: 'Apprendre', path: '/apprendre' },
    { label: 'Actualités', path: '/actualites' }
  ];

  return (
    <nav className="flex items-center justify-between px-6 py-4 bg-black/40 backdrop-blur-sm fixed w-full z-50 transition-all duration-300">
      <div className="flex items-center gap-4">
        <Link 
          to="/" 
          className="flex items-center gap-2 group"
        >
          <div className="relative">
            <div className="absolute inset-0 bg-blue-500/20 rounded-lg blur-xl group-hover:blur-2xl transition-all duration-500 animate-pulse"></div>
            
            <div className="relative">
              <div className="relative transform group-hover:scale-110 transition-transform duration-500">
                <Brain className="w-8 h-8 text-blue-500 animate-float" />
                
                <div className="absolute inset-0 animate-spin-slow opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                  <Zap className="w-4 h-4 text-yellow-500 absolute -top-2 left-1/2 -translate-x-1/2 transform -rotate-12" />
                  <Star className="w-4 h-4 text-purple-500 absolute -bottom-2 left-1/2 -translate-x-1/2 transform rotate-12" />
                  <Sparkles className="w-4 h-4 text-green-500 absolute top-1/2 -right-2 -translate-y-1/2" />
                  <Brain className="w-4 h-4 text-red-500 absolute top-1/2 -left-2 -translate-y-1/2" />
                </div>
                
                <div className="absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                  <div className="absolute top-0 left-1/4 w-1 h-1 bg-blue-500 rounded-full animate-float-particle-1"></div>
                  <div className="absolute bottom-0 right-1/4 w-1 h-1 bg-purple-500 rounded-full animate-float-particle-2"></div>
                  <div className="absolute top-1/2 right-0 w-1 h-1 bg-green-500 rounded-full animate-float-particle-3"></div>
                </div>
              </div>
            </div>
          </div>
          <span className="text-xl font-semibold bg-gradient-to-r from-blue-500 via-purple-500 to-pink-500 bg-clip-text text-transparent group-hover:scale-105 transition-transform duration-300">
            DexofAI
          </span>
        </Link>
      </div>
      <div className="flex items-center gap-6">
        {navItems.map((item) => (
          <Link
            key={item.label}
            to={item.path}
            className="relative group"
          >
            <span className="text-gray-400 hover:text-blue-500 transition-colors duration-300 hover:scale-105 transform inline-block">
              {item.label}
            </span>
            <span className="absolute bottom-0 left-0 w-0 h-0.5 bg-blue-500 transition-all duration-300 group-hover:w-full"></span>
          </Link>
        ))}
        <ThemeSelector />
        <div className="relative" ref={menuRef}>
          <button
            onClick={() => setIsMenuOpen(!isMenuOpen)}
            className="w-10 h-10 rounded-lg bg-gray-900/50 flex items-center justify-center hover:bg-gray-800 transition-all duration-300 hover:scale-105 group"
          >
            <MoreVertical className="w-5 h-5 text-gray-400 group-hover:text-blue-500 transition-colors group-hover:rotate-90 duration-300" />
          </button>
          
          {isMenuOpen && (
            <div className="absolute right-0 mt-2 w-48 bg-gray-900/95 backdrop-blur-sm border border-gray-800 rounded-lg shadow-lg py-1 z-50 animate-fade-in">
              {[
                { to: '/forum', label: 'Forum' },
                { to: '/publier', label: 'Publier une IA' },
                { to: '/rester-informe', label: 'Rester informé' },
                { to: '/contact', label: 'Contact' }
              ].map((item) => (
                <Link
                  key={item.to}
                  to={item.to}
                  className="block px-4 py-2 text-sm text-gray-400 hover:bg-gray-800 hover:text-white transition-all duration-300 hover:translate-x-1 group"
                  onClick={() => setIsMenuOpen(false)}
                >
                  <span className="relative">
                    {item.label}
                    <span className="absolute bottom-0 left-0 w-0 h-0.5 bg-blue-500 transition-all duration-300 group-hover:w-full"></span>
                  </span>
                </Link>
              ))}
            </div>
          )}
        </div>
      </div>
    </nav>
  );
}
