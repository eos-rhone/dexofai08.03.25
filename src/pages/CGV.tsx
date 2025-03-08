import React, { useEffect } from 'react';

export function CGV() {
  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);

  return (
    <div className="min-h-screen bg-[#0B0F19] text-white py-16">
      <div className="max-w-4xl mx-auto px-6">
        <div className="mb-12 pb-8 border-b border-gray-800">
          <h1 className="text-4xl font-bold mb-4 bg-gradient-to-r from-blue-500 via-purple-500 to-pink-500 text-transparent bg-clip-text">
            Conditions Générales de Vente (CGV) - DexofAi
          </h1>
        </div>
        
        <div className="space-y-12 text-gray-300">
          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">1. Objet</h2>
            <p>
              Les présentes Conditions Générales de Vente (CGV) régissent les relations entre DexofAi et ses utilisateurs pour l'utilisation de la plateforme et de ses services.
            </p>
          </section>

          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">2. Services Proposés</h2>
            <p className="mb-4">
              DexofAi propose une plateforme de recherche et de comparaison d'outils d'intelligence artificielle. Nos services incluent :
            </p>
            <ul className="list-disc list-inside space-y-3 ml-4">
              <li className="text-blue-400">Accès à notre catalogue d'outils IA</li>
              <li className="text-blue-400">Système de recherche intelligent</li>
              <li className="text-blue-400">Comparaison d'outils</li>
              <li className="text-blue-400">Recommandations personnalisées</li>
              <li className="text-blue-400">Services payants : Promotion, listing et mise en avant d'outils IA (les tarifs seront clairement indiqués avant toute souscription).</li>
            </ul>
          </section>

          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">3. Prix et Paiement</h2>
            <p>
              L'accès à notre plateforme est gratuit. Toutefois, certains services premium peuvent être payants. Les tarifs seront clairement indiqués avant toute souscription à ces services.
            </p>
          </section>

          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">4. Responsabilités</h2>
            <p className="mb-4">
              DexofAi s'efforce de fournir des informations exactes et à jour sur les outils d'IA. Cependant, nous ne pouvons être tenus responsables des changements effectués par les fournisseurs d'outils d'IA référencés sur notre plateforme.
            </p>
            <p>
              De plus, DexofAi décline toute responsabilité quant à l'utilisation des outils IA proposés sur la plateforme. Nous recommandons aux utilisateurs de consulter les conditions d'utilisation des outils avant toute souscription.
            </p>
          </section>

          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">5. Propriété Intellectuelle</h2>
            <p>
              Tout le contenu présent sur DexofAi, y compris les textes, images, logos, designs, et le code source, est protégé par les lois sur la propriété intellectuelle. Toute reproduction, diffusion, ou exploitation non autorisée de ce contenu est interdite et passible de poursuites judiciaires.
            </p>
          </section>

          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">6. Modifications des CGV</h2>
            <p>
              DexofAi se réserve le droit de modifier les présentes CGV à tout moment. Les utilisateurs seront informés des modifications importantes par email ou par notification sur la plateforme.
            </p>
          </section>

          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">7. Droit Applicable et Règlement des Litiges</h2>
            <p>
              Les présentes CGV sont soumises au droit français. En cas de litige, une solution amiable sera privilégiée avant toute action judiciaire.
            </p>
          </section>
        </div>
      </div>
    </div>
  );
}

export default CGV;
