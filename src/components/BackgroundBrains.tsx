import React, { useEffect, useState } from 'react';
import BrainIcon from './BrainIcon';

interface BrainIcon {
  x: number;
  y: number;
  size: number;
  rotation: number;
  opacity: number;
}

const BackgroundBrains: React.FC = () => {
  const [mousePosition, setMousePosition] = useState({ x: 0, y: 0 });
  const [brains, setBrains] = useState<BrainIcon[]>([]);

  useEffect(() => {
    // Disposition harmonieuse des cerveaux
    const newBrains: BrainIcon[] = [
      // Coin supérieur gauche
      { x: 15, y: 15, size: 80, rotation: -15, opacity: 0.15 },
      // Coin supérieur droit
      { x: 85, y: 15, size: 90, rotation: 15, opacity: 0.12 },
      // Centre gauche
      { x: 20, y: 50, size: 100, rotation: 0, opacity: 0.18 },
      // Centre droit
      { x: 80, y: 50, size: 85, rotation: -10, opacity: 0.14 },
      // Coin inférieur gauche
      { x: 25, y: 85, size: 95, rotation: 20, opacity: 0.16 },
      // Coin inférieur droit
      { x: 75, y: 85, size: 75, rotation: -20, opacity: 0.13 },
      // Centre haut
      { x: 50, y: 25, size: 110, rotation: 5, opacity: 0.17 },
      // Centre bas
      { x: 50, y: 75, size: 70, rotation: -5, opacity: 0.15 }
    ];
    setBrains(newBrains);
  }, []);

  useEffect(() => {
    const handleMouseMove = (e: MouseEvent) => {
      setMousePosition({
        x: (e.clientX / window.innerWidth) * 100,
        y: (e.clientY / window.innerHeight) * 100
      });
    };

    window.addEventListener('mousemove', handleMouseMove);
    return () => window.removeEventListener('mousemove', handleMouseMove);
  }, []);

  return (
    <div className="fixed inset-0 overflow-hidden pointer-events-none z-0">
      {brains.map((brain, index) => {
        // Calculer la distance entre la souris et le cerveau
        const distance = Math.hypot(
          brain.x - mousePosition.x,
          brain.y - mousePosition.y
        );
        
        const isNear = distance < 25; 
        const scale = isNear ? 1.3 : 1;
        const opacity = isNear ? 0.6 : brain.opacity;
        
        return (
          <div
            key={index}
            className="absolute transition-all duration-500"
            style={{
              left: `${brain.x}%`,
              top: `${brain.y}%`,
              transform: `translate(-50%, -50%) rotate(${brain.rotation}deg) scale(${scale})`,
              opacity,
              filter: isNear ? 'blur(0.5px)' : 'none',
              boxShadow: isNear ? '0 0 40px rgba(59, 130, 246, 0.5)' : 'none'
            }}
          >
            <BrainIcon 
              size={brain.size} 
              className={`text-blue-500 transition-all duration-500 ${
                isNear ? 'animate-pulse filter brightness-150' : ''
              }`}
              style={{
                filter: isNear ? 'drop-shadow(0 0 10px #3B82F6)' : 'none'
              }}
            />
          </div>
        );
      })}
    </div>
  );
};

export default BackgroundBrains;
