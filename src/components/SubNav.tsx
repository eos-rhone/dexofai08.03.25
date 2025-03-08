import React from 'react';
import { Link, useLocation } from 'react-router-dom';

const subNavItems = [
  { path: '/forum', label: 'Forum', icon: <Monitor className="w-5 h-5 text-blue-500" /> },
  { path: '/publier', label: 'Publier une IA', icon: <Zap className="w-5 h-5 text-yellow-500" /> },
  { path: '/rester-informe', label: 'Rester informé', icon: <TreePine className="w-5 h-5 text-green-500" /> },
  { path: '/contact', label: 'Contact', icon: <Droplet className="w-5 h-5 text-red-500" /> }
];

export function SubNav() {
  const location = useLocation();

  return (
    <div className="bg-gray-900/50 border-b border-gray-800">
      <div className="max-w-7xl mx-auto px-6">
        <nav className="flex space-x-6">
          {subNavItems.map((item) => (
            <Link
              key={item.path}
              to={item.path}
              className={`py-4 text-sm flex items-center gap-2 ${
                location.pathname === item.path
                  ? 'text-blue-500 border-b-2 border-blue-500'
                  : 'text-gray-400 hover:text-blue-500'
              }`}
            >
              {item.icon}
              {item.label}
            </Link>
          ))}
        </nav>
      </div>
    </div>
  );
}
