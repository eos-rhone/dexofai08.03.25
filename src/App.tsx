import React, { useState, useEffect } from 'react';
import { Outlet } from 'react-router-dom';
import { Navbar } from './components/Navbar';
import { IntroAnimation } from './components/IntroAnimation';

function App() {
  const [showIntro, setShowIntro] = useState(true);

  useEffect(() => {
    const hasSeenIntro = localStorage.getItem('hasSeenIntro');
    if (hasSeenIntro) {
      setShowIntro(false);
    }
  }, []);

  const handleIntroComplete = () => {
    localStorage.setItem('hasSeenIntro', 'true');
    setShowIntro(false);
  };

  return (
    <div className="min-h-screen bg-gray-900 text-gray-900 dark:text-white">
      {showIntro && <IntroAnimation onComplete={handleIntroComplete} />}
      <Navbar />
      <main className="w-full pt-16">
        <Outlet />
      </main>
    </div>
  );
}

export default App;
