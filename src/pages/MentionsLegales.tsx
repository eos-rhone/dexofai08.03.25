import React, { useEffect } from 'react';
import { Link } from 'react-router-dom';

export function MentionsLegales() {
  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);

  return (
    <div className="min-h-screen bg-[#0B0F19] text-white py-16">
      <div className="max-w-4xl mx-auto px-6">
        <div className="mb-12 pb-8 border-b border-gray-800">
          <h1 className="text-4xl font-bold mb-4 bg-gradient-to-r from-blue-500 via-purple-500 to-pink-500 text-transparent bg-clip-text">
            Mentions Légales – DexofAi
          </h1>
          <p className="text-gray-400">Dernière mise à jour : 06/03/2025</p>
        </div>

        <div className="space-y-12 text-gray-300">
          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">1. Éditeur du site</h2>
            <p className="mb-4">Le site DexofAi est édité par :</p>
            <ul className="space-y-3">
              <li className="flex items-start gap-3">
                <span className="text-blue-400">📌</span>
                <span>Nom de l'entreprise : DexofAi</span>
              </li>
              <li className="flex items-start gap-3">
                <span className="text-blue-400">📌</span>
                <span>Adresse : 123 Avenue de l'Innovation, 75001 Paris, France</span>
              </li>
              <li className="flex items-start gap-3">
                <span className="text-blue-400">📌</span>
                <span>Email de contact : <a href="mailto:contact@dexofai.com" className="text-blue-400 hover:text-blue-300 transition-colors">contact@dexofai.com</a></span>
              </li>
            </ul>
          </section>

          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">2. Hébergement du site</h2>
            <p className="mb-4">Le site est hébergé par :</p>
            <ul className="space-y-3">
              <li className="flex items-start gap-3">
                <span className="text-blue-400">📌</span>
                <span>Hébergeur : IONOS</span>
              </li>
              <li className="flex items-start gap-3">
                <span className="text-blue-400">📌</span>
                <span>Adresse : 7 Place de la Gare, 57200 Sarreguemines, France</span>
              </li>
              <li className="flex items-start gap-3">
                <span className="text-blue-400">📌</span>
                <span>Site web : <a href="https://www.ionos.fr" target="_blank" rel="noopener noreferrer" className="text-blue-400 hover:text-blue-300 transition-colors">www.ionos.fr</a></span>
              </li>
            </ul>
          </section>

          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">3. Propriété intellectuelle</h2>
            <p>
              Le site DexofAi et l'ensemble de son contenu (textes, images, design, logo, code source, etc.) sont protégés par les lois en vigueur sur la propriété intellectuelle. Toute reproduction, distribution ou exploitation sans autorisation est interdite et passible de poursuites judiciaires.
            </p>
          </section>

          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">4. Responsabilités</h2>
            <p className="mb-4">DexofAi met à disposition une plateforme de référencement et de promotion d'outils d'intelligence artificielle.</p>
            <ul className="list-disc list-inside space-y-3 ml-4">
              <li>L'éditeur ne garantit pas l'exactitude, la fiabilité ou la mise à jour des informations fournies sur le site.</li>
              <li>DexofAi ne peut être tenu responsable des dommages liés à l'utilisation du site ou des services proposés.</li>
              <li>Les liens vers des sites tiers sont fournis à titre informatif ; nous n'assumons aucune responsabilité sur leur contenu.</li>
            </ul>
          </section>

          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">5. Données personnelles et cookies</h2>
            <p className="mb-4">
              Les données personnelles collectées sur le site sont traitées conformément à notre{' '}
              <Link to="/politique-confidentialite" className="text-blue-400 hover:text-blue-300 transition-colors">
                Politique de Confidentialité
              </Link>
              . L'utilisateur peut exercer ses droits d'accès, de modification et de suppression en nous contactant à{' '}
              <a href="mailto:contact@dexofai.com" className="text-blue-400 hover:text-blue-300 transition-colors">
                contact@dexofai.com
              </a>
              .
            </p>
            <p>
              Le site utilise des cookies pour améliorer l'expérience utilisateur. L'utilisateur peut configurer ses préférences via son navigateur.
            </p>
          </section>

          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">6. Droit applicable et litiges</h2>
            <p>
              Les présentes mentions légales sont soumises au droit français. En cas de litige, une solution amiable sera privilégiée avant toute action judiciaire.
            </p>
          </section>
        </div>
      </div>
    </div>
  );
}

export default MentionsLegales;
