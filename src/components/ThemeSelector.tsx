import React, { useState, useRef, useEffect } from 'react';
import { Moon, Monitor, Zap, TreePine, Droplet, Sun, Heart } from 'lucide-react';
import { Lemon } from './icons/Lemon';
import { useTheme } from '../contexts/ThemeContext';

interface ThemeOption {
  name: string;
  value: 'light' | 'dark' | 'cyberpunk' | 'forest' | 'aqua' | 'blood' | 'citrus' | 'pastel';
  icon: React.ReactNode;
  description: string;
}

const themes: ThemeOption[] = [
  {
    name: 'Clair',
    value: 'light',
    icon: <Sun className="w-5 h-5 text-yellow-500" />,
    description: 'Thème lumineux pour une meilleure lisibilité'
  },
  {
    name: 'Sombre',
    value: 'dark',
    icon: <Moon className="w-5 h-5 text-gray-400" />,
    description: 'Parfait pour une utilisation nocturne'
  },
  {
    name: 'Cyberpunk',
    value: 'cyberpunk',
    icon: <Zap className="w-5 h-5 text-blue-500" />,
    description: 'Style futuriste et néon'
  },
  {
    name: 'Forest',
    value: 'forest',
    icon: <TreePine className="w-5 h-5 text-green-500" />,
    description: 'Thème naturel et apaisant'
  },
  {
    name: 'Aqua',
    value: 'aqua',
    icon: <Droplet className="w-5 h-5 text-blue-500" />,
    description: 'Thème marin et rafraîchissant'
  },
  {
    name: 'Blood',
    value: 'blood',
    icon: <Droplet className="w-5 h-5 text-red-500" />,
    description: 'Thème avec une belle couleur rouge'
  },
  {
    name: 'Citrus',
    value: 'citrus',
    icon: <Lemon className="w-5 h-5 text-yellow-400" strokeWidth={1.5} />,
    description: 'Thème avec une belle couleur jaune'
  },
  {
    name: 'Pastel',
    value: 'pastel',
    icon: <Heart className="w-5 h-5 text-pink-300" />,
    description: 'Thème doux aux couleurs pastel'
  }
];

export function ThemeSelector() {
  const [isOpen, setIsOpen] = useState(false);
  const { theme, setTheme } = useTheme();
  const menuRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (menuRef.current && !menuRef.current.contains(event.target as Node)) {
        setIsOpen(false);
      }
    }

    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  const currentTheme = themes.find(t => t.value === theme) || themes[0];

  return (
    <div className="relative" ref={menuRef}>
      <button
        onClick={() => setIsOpen(!isOpen)}
        className="w-10 h-10 rounded-lg bg-gray-900/50 flex items-center justify-center hover:bg-gray-800 transition-colors"
      >
        {currentTheme.icon}
      </button>

      {isOpen && (
        <div className="absolute right-0 mt-2 w-72 bg-gray-900 border border-gray-800 rounded-lg shadow-lg py-2 z-50">
          {themes.map((themeOption) => (
            <button
              key={themeOption.value}
              onClick={() => {
                setTheme(themeOption.value);
                setIsOpen(false);
              }}
              className="w-full px-4 py-2 flex items-center gap-3 hover:bg-gray-800 transition-colors"
            >
              <div className={`w-8 h-8 rounded-lg bg-gray-800 flex items-center justify-center ${
                theme === themeOption.value ? 'text-blue-500' : 'text-gray-400'
              }`}>
                {themeOption.icon}
              </div>
              <div className="text-left">
                <div className={`font-medium ${
                  theme === themeOption.value ? 'text-blue-500' : 'text-white'
                }`}>
                  {themeOption.name}
                </div>
                <div className="text-sm text-gray-400">
                  {themeOption.description}
                </div>
              </div>
            </button>
          ))}
        </div>
      )}
    </div>
  );
}
