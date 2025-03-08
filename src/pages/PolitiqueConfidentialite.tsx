import React, { useEffect } from 'react';

export function PolitiqueConfidentialite() {
  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);

  return (
    <div className="min-h-screen bg-[#0B0F19] text-white py-16">
      <div className="max-w-4xl mx-auto px-6">
        <div className="mb-12 pb-8 border-b border-gray-800">
          <h1 className="text-4xl font-bold mb-4 bg-gradient-to-r from-blue-500 via-purple-500 to-pink-500 text-transparent bg-clip-text">
            Politique de confidentialité – DexofAi
          </h1>
          <p className="text-gray-400">Dernière mise à jour : 06/03/2025</p>
        </div>

        <p className="text-gray-300 mb-12 text-lg">
          DexofAi attache une grande importance à la confidentialité de ses utilisateurs. Cette politique décrit quelles données nous collectons, comment nous les utilisons et vos droits à ce sujet.
        </p>
        
        <div className="space-y-12 text-gray-300">
          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">1. Données collectées</h2>
            <p className="mb-4">Nous collectons certaines informations lorsque vous utilisez notre site :</p>
            <ul className="list-disc list-inside space-y-3 ml-4">
              <li><span className="text-blue-400">Données fournies volontairement :</span> Nom, adresse e-mail, informations de paiement (si applicable).</li>
              <li><span className="text-blue-400">Données collectées automatiquement :</span> Adresse IP, type de navigateur, cookies et outils analytiques.</li>
            </ul>
          </section>

          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">2. Utilisation des données</h2>
            <p className="mb-4">Nous utilisons vos données pour :</p>
            <ul className="list-disc list-inside space-y-3 ml-4">
              <li>Fournir nos services (listing, promotion et mise en avant d'outils IA).</li>
              <li>Gérer les paiements et les abonnements.</li>
              <li>Améliorer notre site et analyser l'audience.</li>
            </ul>
          </section>

          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">3. Partage des données</h2>
            <p className="mb-4">Vos données ne sont jamais revendues. Elles peuvent être partagées avec :</p>
            <ul className="list-disc list-inside space-y-3 ml-4">
              <li>Des services tiers (paiement sécurisé, outils d'analyse).</li>
              <li>Les autorités en cas d'obligation légale.</li>
            </ul>
          </section>

          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">4. Cookies et suivi</h2>
            <p>
              Nous utilisons des cookies pour améliorer votre expérience et analyser l'audience. Vous pouvez les désactiver via votre navigateur.
            </p>
          </section>

          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">5. Sécurité des données</h2>
            <p>
              Nous mettons en place des mesures pour protéger vos informations, mais aucun système n'est infaillible.
            </p>
          </section>

          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">6. Vos droits</h2>
            <p className="mb-4">Conformément au RGPD, vous pouvez :</p>
            <ul className="list-disc list-inside space-y-3 ml-4">
              <li>Accéder à vos données.</li>
              <li>Demander leur modification ou suppression.</li>
              <li>Vous opposer à leur utilisation.</li>
            </ul>
            <p className="mt-4">
              Pour exercer ces droits, contactez-nous à contact@dexofai.com.
            </p>
          </section>

          <section className="bg-gray-900/30 p-8 rounded-xl border border-gray-800 hover:border-blue-500/50 transition-all duration-300">
            <h2 className="text-2xl font-semibold mb-6 text-blue-500">7. Contact</h2>
            <p>
              Si vous avez des questions, contactez-nous à{' '}
              <a href="mailto:contact@dexofai.com" className="text-blue-500 hover:text-blue-400 transition-colors">
                contact@dexofai.com
              </a>
            </p>
          </section>
        </div>
      </div>
    </div>
  );
}

export default PolitiqueConfidentialite;
