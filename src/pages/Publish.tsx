import React from 'react';
import { Users, TrendingUp, Globe, Check, AlertCircle, ChevronLeft, ChevronRight, Rocket, Star, Sparkles, Zap } from 'lucide-react';

interface Testimonial {
  id: number;
  name: string;
  role: string;
  company: string;
  image: string;
  rating: number;
  comment: string;
  plan: string;
}

const testimonials: Testimonial[] = [
  {
    id: 1,
    name: "Sophie Martin",
    role: "CEO",
    company: "TechAI",
    image: "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
    rating: 5,
    comment: "La publication de notre IA sur DexofAI a considérablement augmenté notre visibilité. Le processus était simple et les résultats sont au rendez-vous.",
    plan: "En Vedette"
  },
  {
    id: 2,
    name: "Thomas Dubois",
    role: "Fondateur",
    company: "AInnov",
    image: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e",
    rating: 5,
    comment: "Excellent retour sur investissement avec le plan Annonce Vérifiée. Notre outil a gagné en crédibilité grâce au badge de vérification.",
    plan: "Annonce Vérifiée"
  },
  {
    id: 3,
    name: "Marie Leroy",
    role: "CTO",
    company: "SmartFlow",
    image: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80",
    rating: 4,
    comment: "La Liste Rapide nous a permis de tester le marché rapidement. Nous avons ensuite upgradé vers le plan En Vedette vu les excellents résultats.",
    plan: "Liste Rapide"
  }
];

export function Publish() {
  return (
    <div className="min-h-screen bg-[#0B0F19] text-white">
      <div className="max-w-7xl mx-auto px-6 py-24">
        {/* Animated Header */}
        <div className="text-center mb-16">
          <div className="flex justify-center mb-8">
            <div className="relative group">
              {/* Animated background glow */}
              <div className="absolute inset-0 bg-blue-500/20 rounded-full blur-xl group-hover:blur-2xl transition-all duration-500 animate-pulse"></div>
              
              {/* Main rocket icon with rotation and scale animation */}
              <div className="relative bg-gray-900/80 p-8 rounded-full transform group-hover:scale-110 transition-transform duration-500">
                <Rocket className="w-16 h-16 text-blue-500 animate-float" />
                
                {/* Orbiting elements */}
                <div className="absolute inset-0 animate-spin-slow">
                  <Star className="w-8 h-8 text-yellow-500 absolute -top-4 left-1/2 -translate-x-1/2 transform -rotate-12" />
                  <Sparkles className="w-8 h-8 text-purple-500 absolute -bottom-4 left-1/2 -translate-x-1/2 transform rotate-12" />
                  <Zap className="w-8 h-8 text-green-500 absolute top-1/2 -right-4 -translate-y-1/2" />
                  <Globe className="w-8 h-8 text-red-500 absolute top-1/2 -left-4 -translate-y-1/2" />
                </div>
                
                {/* Particle effects */}
                <div className="absolute inset-0">
                  <div className="absolute top-0 left-1/4 w-2 h-2 bg-blue-500 rounded-full animate-float-particle-1"></div>
                  <div className="absolute bottom-0 right-1/4 w-2 h-2 bg-purple-500 rounded-full animate-float-particle-2"></div>
                  <div className="absolute top-1/2 right-0 w-2 h-2 bg-green-500 rounded-full animate-float-particle-3"></div>
                </div>
              </div>
            </div>
          </div>
          <h1 className="text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-blue-500 via-purple-500 to-pink-500 mb-4 animate-fade-in">
            Publiez votre outil d'IA
          </h1>
          <p className="text-center text-gray-400 text-xl max-w-3xl mx-auto mb-16 animate-fade-in">
            Choisissez le plan qui correspond le mieux à vos besoins et donnez de la
            visibilité à votre outil d'IA
          </p>
        </div>

        {/* Why Choose Us */}
        <h2 className="text-3xl font-bold text-center mb-4 animate-fade-in">
          Pourquoi nous choisir ?
        </h2>
        <p className="text-center text-gray-400 mb-12 animate-fade-in">
          DexofAI est la plateforme de référence pour promouvoir votre outil d'IA
        </p>

        {/* Stats with animations */}
        <div className="grid grid-cols-3 gap-6 mb-24">
          {[
            {
              icon: Users,
              value: "100,000+",
              label: "Visiteurs mensuels",
              description: "Une audience qualifiée et passionnée par l'IA"
            },
            {
              icon: TrendingUp,
              value: "+50%",
              label: "Croissance",
              description: "D'augmentation du trafic sur les 2 derniers mois"
            },
            {
              icon: Globe,
              value: "150+",
              label: "Pays",
              description: "Une audience véritablement internationale"
            }
          ].map((stat, index) => (
            <div
              key={stat.label}
              className="bg-black/40 rounded-xl p-8 border border-gray-800 hover:border-blue-500 transition-all transform hover:scale-105 hover:shadow-xl hover:shadow-blue-500/10 group animate-fade-in"
              style={{ animationDelay: `${index * 0.1}s` }}
            >
              <div className="w-12 h-12 bg-blue-500/10 rounded-xl flex items-center justify-center mb-4 group-hover:scale-110 transition-transform duration-300">
                <stat.icon className="w-6 h-6 text-blue-500" />
              </div>
              <div className="text-4xl font-bold text-blue-500 mb-2">{stat.value}</div>
              <div className="text-xl font-semibold mb-2">{stat.label}</div>
              <p className="text-gray-400">{stat.description}</p>
            </div>
          ))}
        </div>

        {/* Pricing Plans with animations */}
        <div className="grid grid-cols-3 gap-6 mb-24">
          {/* Liste Rapide */}
          <div className="bg-black/40 rounded-xl p-8 border border-gray-800 hover:border-blue-500 transition-all transform hover:scale-105 hover:shadow-xl hover:shadow-blue-500/10 group animate-fade-in">
            <div className="mb-8">
              <h3 className="text-2xl font-bold mb-2 flex items-center gap-2">
                Liste Rapide
                <span className="w-2 h-2 rounded-full bg-blue-500"></span>
              </h3>
              <p className="text-gray-400">Publication rapide et efficace</p>
            </div>
            <div className="mb-8">
              <span className="text-4xl font-bold">50€</span>
              <span className="text-gray-400 ml-2">frais uniques</span>
            </div>
            <div className="space-y-4 mb-8">
              <div className="flex items-start gap-3">
                <Check className="w-5 h-5 text-blue-500 mt-1 flex-shrink-0" />
                <span>Publication sous 2 jours</span>
              </div>
              <div className="flex items-start gap-3">
                <Check className="w-5 h-5 text-blue-500 mt-1 flex-shrink-0" />
                <span>Listé dans "Dernières IA" sur la page d'accueil</span>
              </div>
              <div className="flex items-start gap-3">
                <Check className="w-5 h-5 text-blue-500 mt-1 flex-shrink-0" />
                <span>30 jours en "Sélection AIxploria"</span>
              </div>
              <div className="flex items-start gap-3">
                <Check className="w-5 h-5 text-blue-500 mt-1 flex-shrink-0" />
                <span>Description jusqu'à 165 caractères</span>
              </div>
              <div className="flex items-start gap-3">
                <Check className="w-5 h-5 text-blue-500 mt-1 flex-shrink-0" />
                <span>Un lien vers votre page produit</span>
              </div>
              <div className="flex items-start gap-3">
                <Check className="w-5 h-5 text-blue-500 mt-1 flex-shrink-0" />
                <span>Indexé sur Google</span>
              </div>
            </div>
            <button className="w-full py-3 bg-blue-500 hover:bg-blue-600 transition-colors rounded-lg group relative overflow-hidden">
              <span className="relative z-10">Choisir ce plan</span>
              <div className="absolute inset-0 bg-gradient-to-r from-blue-600 to-purple-600 opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
            </button>
          </div>

          {/* Annonce Vérifiée */}
          <div className="bg-black/40 rounded-xl p-8 border border-gray-800 hover:border-blue-500 transition-all transform hover:scale-105 hover:shadow-xl hover:shadow-blue-500/10 group animate-fade-in relative">
            <div className="absolute -top-3 left-1/2 -translate-x-1/2">
              <span className="bg-blue-500 text-white px-4 py-1 rounded-full text-sm">
                Populaire
              </span>
            </div>
            <div className="mb-8">
              <h3 className="text-2xl font-bold mb-2 flex items-center gap-2">
                Annonce Vérifiée
                <span className="w-2 h-2 rounded-full bg-blue-500"></span>
              </h3>
              <p className="text-gray-400">Pour une visibilité optimale</p>
            </div>
            <div className="mb-8">
              <span className="text-4xl font-bold">279€</span>
              <span className="text-gray-400 ml-2">frais uniques</span>
            </div>
            <div className="space-y-4 mb-8">
              <div className="flex items-start gap-3">
                <Check className="w-5 h-5 text-blue-500 mt-1 flex-shrink-0" />
                <span>Toutes les fonctionnalités de "Liste Rapide"</span>
              </div>
              <div className="flex items-start gap-3">
                <Check className="w-5 h-5 text-blue-500 mt-1 flex-shrink-0" />
                <span>Badge vérifié</span>
              </div>
              <div className="flex items-start gap-3">
                <Check className="w-5 h-5 text-blue-500 mt-1 flex-shrink-0" />
                <span>3 liens vers votre page produit</span>
              </div>
              <div className="flex items-start gap-3">
                <Check className="w-5 h-5 text-blue-500 mt-1 flex-shrink-0" />
                <span>Texte jusqu'à 1000 mots</span>
              </div>
              <div className="flex items-start gap-3">
                <Check className="w-5 h-5 text-blue-500 mt-1 flex-shrink-0" />
                <span>Support médias (vidéos, images, audio)</span>
              </div>
              <div className="flex items-start gap-3">
                <Check className="w-5 h-5 text-blue-500 mt-1 flex-shrink-0" />
                <span>60 jours en "Sélection AIxploria"</span>
              </div>
            </div>
            <button className="w-full py-3 bg-blue-500 hover:bg-blue-600 transition-colors rounded-lg group relative overflow-hidden">
              <span className="relative z-10">Choisir ce plan</span>
              <div className="absolute inset-0 bg-gradient-to-r from-blue-600 to-purple-600 opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
            </button>
          </div>

          {/* En Vedette */}
          <div className="bg-black/40 rounded-xl p-8 border border-gray-800 hover:border-blue-500 transition-all transform hover:scale-105 hover:shadow-xl hover:shadow-blue-500/10 group animate-fade-in">
            <div className="mb-8">
              <h3 className="text-2xl font-bold mb-2 flex items-center gap-2">
                En Vedette
                <span className="w-2 h-2 rounded-full bg-yellow-500"></span>
              </h3>
              <p className="text-gray-400">Visibilité maximale</p>
            </div>
            <div className="mb-8">
              <span className="text-4xl font-bold">399€</span>
              <span className="text-gray-400 ml-2">frais uniques</span>
            </div>
            <div className="space-y-4 mb-8">
              <div className="flex items-start gap-3">
                <Check className="w-5 h-5 text-yellow-500 mt-1 flex-shrink-0" />
                <span>Badge vérifié doré</span>
              </div>
              <div className="flex items-start gap-3">
                <Check className="w-5 h-5 text-yellow-500 mt-1 flex-shrink-0" />
                <span>3 jours en vedette sur le site</span>
              </div>
              <div className="flex items-start gap-3">
                <Check className="w-5 h-5 text-yellow-500 mt-1 flex-shrink-0" />
                <span>Visible sur toutes les pages de catégories</span>
              </div>
              <div className="flex items-start gap-3">
                <Check className="w-5 h-5 text-yellow-500 mt-1 flex-shrink-0" />
                <span>En vedette sur la page d'accueil</span>
              </div>
              <div className="flex items-start gap-3">
                <Check className="w-5 h-5 text-yellow-500 mt-1 flex-shrink-0" />
                <span>Toutes les fonctionnalités "Annonce Vérifiée"</span>
              </div>
              <div className="flex items-start gap-3">
                <AlertCircle className="w-5 h-5 text-yellow-500 mt-1 flex-shrink-0" />
                <span>Placement prioritaire</span>
              </div>
            </div>
            <button className="w-full py-3 bg-yellow-500 hover:bg-yellow-600 transition-colors rounded-lg group relative overflow-hidden">
              <span className="relative z-10">Choisir ce plan</span>
              <div className="absolute inset-0 bg-gradient-to-r from-yellow-600 to-orange-600 opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
            </button>
          </div>
        </div>

        {/* Testimonials with animations */}
        <h2 className="text-3xl font-bold text-center mb-12 animate-fade-in">
          Ce qu'en disent nos clients
        </h2>
        <div className="relative">
          <div className="grid grid-cols-3 gap-6">
            {testimonials.map((testimonial, index) => (
              <div
                key={testimonial.id}
                className="bg-black/40 rounded-xl p-6 border border-gray-800 hover:border-blue-500 transition-all transform hover:scale-105 hover:shadow-xl hover:shadow-blue-500/10 group animate-fade-in"
                style={{ animationDelay: `${index * 0.1}s` }}
              >
                <div className="flex items-center gap-4 mb-4">
                  <img
                    src={testimonial.image}
                    alt={testimonial.name}
                    className="w-12 h-12 rounded-full object-cover"
                  />
                  <div>
                    <h4 className="font-semibold">{testimonial.name}</h4>
                    <p className="text-gray-400">
                      {testimonial.role} de {testimonial.company}
                    </p>
                  </div>
                </div>
                <div className="flex mb-4">
                  {[...Array(5)].map((_, i) => (
                    <Star
                      key={i}
                      className={`w-5 h-5 ${
                        i < testimonial.rating ? 'text-yellow-500' : 'text-gray-500'
                      }`}
                    />
                  ))}
                </div>
                <p className="text-gray-400 mb-4">{testimonial.comment}</p>
                <p className="text-blue-500 text-sm">
                  Plan choisi: {testimonial.plan}
                </p>
              </div>
            ))}
          </div>
          <button className="absolute -left-12 top-1/2 -translate-y-1/2 w-10 h-10 bg-gray-800 rounded-full flex items-center justify-center hover:bg-gray-700 transition-colors group">
            <ChevronLeft className="w-6 h-6 group-hover:scale-110 transition-transform" />
          </button>
          <button className="absolute -right-12 top-1/2 -translate-y-1/2 w-10 h-10 bg-gray-800 rounded-full flex items-center justify-center hover:bg-gray-700 transition-colors group">
            <ChevronRight className="w-6 h-6 group-hover:scale-110 transition-transform" />
          </button>
        </div>
      </div>
    </div>
  );
}
