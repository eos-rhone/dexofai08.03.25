import React, { useState } from 'react';
import { categorizeTools } from '../lib/supabase';

export default function Admin() {
  const [isProcessing, setIsProcessing] = useState(false);
  const [message, setMessage] = useState('');

  const handleCategorization = async () => {
    setIsProcessing(true);
    setMessage('Catégorisation en cours...');
    
    try {
      const result = await categorizeTools();
      if (result) {
        setMessage('Catégorisation terminée avec succès !');
      } else {
        setMessage('Erreur lors de la catégorisation');
      }
    } catch (error) {
      setMessage('Une erreur est survenue');
      console.error(error);
    } finally {
      setIsProcessing(false);
    }
  };

  return (
    <div className="min-h-screen bg-gray-950 text-white py-12">
      <div className="container mx-auto px-4">
        <h1 className="text-2xl font-bold mb-6">Administration</h1>
        
        <div className="bg-gray-900 p-6 rounded-lg">
          <h2 className="text-xl mb-4">Catégorisation des outils</h2>
          <button
            onClick={handleCategorization}
            disabled={isProcessing}
            className="bg-blue-500 hover:bg-blue-600 disabled:bg-gray-500 px-4 py-2 rounded"
          >
            {isProcessing ? 'En cours...' : 'Lancer la catégorisation'}
          </button>
          {message && (
            <p className="mt-4 text-sm text-gray-400">{message}</p>
          )}
        </div>
      </div>
    </div>
  );
}