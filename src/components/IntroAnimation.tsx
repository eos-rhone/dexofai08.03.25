import React, { useEffect, useState } from 'react';
import './IntroAnimation.css';

export const IntroAnimation = ({ onComplete }: { onComplete: () => void }) => {
  const [isVisible, setIsVisible] = useState(true);

  useEffect(() => {
    const timer = setTimeout(() => {
      setIsVisible(false);
      onComplete();
    }, 4000);

    return () => clearTimeout(timer);
  }, [onComplete]);

  const matrixChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789$+-=*/[]{}()@#&";
  const getRandomChar = () => matrixChars[Math.floor(Math.random() * matrixChars.length)];

  return isVisible ? (
    <div className="intro-animation">
      <div className="matrix-background">
        {[...Array(50)].map((_, i) => (
          <div key={i} className="matrix-column" style={{
            left: `${i * 2}%`,
            animationDelay: `${Math.random() * 2}s`
          }}>
            {[...Array(30)].map((_, j) => (
              <span key={j} style={{
                animationDelay: `${Math.random() * 5}s`
              }}>
                {getRandomChar()}
              </span>
            ))}
          </div>
        ))}
      </div>

      <div className="circuit-container">
        <div className="circuit-lines">
          {[...Array(30)].map((_, i) => (
            <div key={i} className="circuit-line" style={{ 
              animationDelay: `${i * 0.05}s`,
              top: `${Math.random() * 100}%`,
              left: `${Math.random() * 100}%`,
              width: `${Math.random() * 150 + 50}px`,
              transform: `rotate(${Math.random() * 360}deg)`
            }} />
          ))}
        </div>
        
        <div className="ai-brain">
          <div className="brain-core" />
          <div className="brain-particles">
            {[...Array(50)].map((_, i) => (
              <div key={i} className="particle" style={{
                animationDelay: `${i * 0.1}s`,
                left: `${Math.random() * 100}%`,
                top: `${Math.random() * 100}%`,
                transform: `rotate(${Math.random() * 360}deg)`
              }} />
            ))}
          </div>
        </div>

        <div className="text-container">
          <div className="glitch-text">THIS IS THE FUTUR</div>
        </div>

        <div className="scanning-line" />
      </div>
    </div>
  ) : null;
};
