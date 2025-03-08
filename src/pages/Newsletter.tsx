import React, { useState } from 'react';
import { Mail, Bell, Shield, Zap, CheckCircle2, AlertCircle, Star, Sparkles, MessageSquare } from 'lucide-react';

export function Newsletter() {
  const [email, setEmail] = useState('');
  const [interests, setInterests] = useState<string[]>([]);
  const [frequency, setFrequency] = useState('weekly');
  const [status, setStatus] = useState<'idle' | 'loading' | 'success' | 'error'>('idle');
  const [message, setMessage] = useState('');

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!email) return;

    setStatus('loading');
    
    try {
      // TODO: Implement Supabase integration
      await new Promise(resolve => setTimeout(resolve, 1000));
      
      setStatus('success');
      setMessage('Vous êtes maintenant inscrit à notre newsletter !');
      setEmail('');
      setInterests([]);
    } catch (error) {
      setStatus('error');
      setMessage('Une erreur est survenue. Veuillez réessayer.');
    }
  };

  const toggleInterest = (interest: string) => {
    setInterests(prev => 
      prev.includes(interest)
        ? prev.filter(i => i !== interest)
        : [...prev, interest]
    );
  };

  return (
    <div className="min-h-screen bg-[#0B0F19] text-white">
      <div className="max-w-7xl mx-auto px-6 py-24">
        <div className="max-w-3xl mx-auto">
          {/* Animated Header */}
          <div className="text-center mb-16">
            <div className="flex justify-center mb-8">
              <div className="relative group">
                {/* Animated background glow */}
                <div className="absolute inset-0 bg-blue-500/20 rounded-full blur-xl group-hover:blur-2xl transition-all duration-500 animate-pulse"></div>
                
                {/* Main mail icon with rotation and scale animation */}
                <div className="relative bg-gray-900/80 p-8 rounded-full transform group-hover:scale-110 transition-transform duration-500">
                  <Mail className="w-16 h-16 text-blue-500 animate-float" />
                  
                  {/* Orbiting elements */}
                  <div className="absolute inset-0 animate-spin-slow">
                    <Bell className="w-8 h-8 text-yellow-500 absolute -top-4 left-1/2 -translate-x-1/2 transform -rotate-12" />
                    <Star className="w-8 h-8 text-purple-500 absolute -bottom-4 left-1/2 -translate-x-1/2 transform rotate-12" />
                    <Sparkles className="w-8 h-8 text-green-500 absolute top-1/2 -right-4 -translate-y-1/2" />
                    <MessageSquare className="w-8 h-8 text-red-500 absolute top-1/2 -left-4 -translate-y-1/2" />
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
              Restez à la pointe de l'IA
            </h1>
            <p className="text-xl text-gray-400 animate-fade-in">
              Recevez les dernières actualités, outils et innovations en intelligence artificielle
            </p>
          </div>

          {/* Features with animations */}
          <div className="grid grid-cols-3 gap-6 mb-16">
            {[
              {
                icon: Zap,
                title: "Actualités Exclusives",
                description: "Soyez les premiers informés des dernières innovations en IA"
              },
              {
                icon: Bell,
                title: "Alertes Personnalisées",
                description: "Recevez uniquement les informations qui vous intéressent"
              },
              {
                icon: Shield,
                title: "Confidentialité",
                description: "Vos données sont protégées et jamais partagées"
              }
            ].map((feature, index) => (
              <div
                key={feature.title}
                className="bg-black/40 rounded-xl p-6 transform hover:scale-105 transition-all duration-300 hover:shadow-xl hover:shadow-blue-500/10 border border-gray-800 hover:border-blue-500 group animate-fade-in"
                style={{ animationDelay: `${index * 0.1}s` }}
              >
                <div className="w-12 h-12 bg-blue-500/10 rounded-xl flex items-center justify-center mb-4 group-hover:scale-110 transition-transform duration-300">
                  <feature.icon className="w-6 h-6 text-blue-500" />
                </div>
                <h3 className="text-lg font-semibold mb-2 group-hover:text-blue-500 transition-colors">
                  {feature.title}
                </h3>
                <p className="text-gray-400">
                  {feature.description}
                </p>
              </div>
            ))}
          </div>

          {/* Subscription Form with animations */}
          <div className="bg-black/40 rounded-xl p-8 border border-gray-800 hover:border-blue-500 transition-all duration-300 hover:shadow-xl hover:shadow-blue-500/10 animate-fade-in">
            <form onSubmit={handleSubmit} className="space-y-8">
              {/* Email Input */}
              <div>
                <label htmlFor="email" className="block text-sm font-medium mb-2">
                  Adresse email
                </label>
                <div className="relative group">
                  <div className="absolute -inset-1 bg-gradient-to-r from-blue-500 to-purple-500 rounded-lg blur opacity-25 group-hover:opacity-75 transition duration-1000 group-hover:duration-200"></div>
                  <div className="relative">
                    <input
                      type="email"
                      id="email"
                      value={email}
                      onChange={(e) => setEmail(e.target.value)}
                      placeholder="vous@exemple.com"
                      className="w-full px-4 py-3 bg-gray-900/50 border border-gray-800 rounded-lg focus:outline-none focus:border-blue-500 transition-all duration-300"
                      required
                    />
                  </div>
                </div>
              </div>

              {/* Interests */}
              <div>
                <label className="block text-sm font-medium mb-3">
                  Centres d'intérêt
                </label>
                <div className="flex flex-wrap gap-2">
                  {[
                    'IA Générative',
                    'Machine Learning',
                    'Chatbots',
                    'Computer Vision',
                    'NLP',
                    'Robotique',
                    'IA & Business',
                    'Éthique & IA'
                  ].map((interest) => (
                    <button
                      key={interest}
                      type="button"
                      onClick={() => toggleInterest(interest)}
                      className={`px-4 py-2 rounded-full text-sm transition-all duration-300 transform hover:scale-105 ${
                        interests.includes(interest)
                          ? 'bg-blue-500 text-white shadow-lg shadow-blue-500/25'
                          : 'bg-gray-900/50 text-gray-400 hover:bg-gray-800'
                      }`}
                    >
                      {interest}
                    </button>
                  ))}
                </div>
              </div>

              {/* Frequency */}
              <div>
                <label className="block text-sm font-medium mb-3">
                  Fréquence des emails
                </label>
                <div className="grid grid-cols-3 gap-4">
                  {[
                    { value: 'daily', label: 'Quotidien' },
                    { value: 'weekly', label: 'Hebdomadaire' },
                    { value: 'monthly', label: 'Mensuel' }
                  ].map((option) => (
                    <button
                      key={option.value}
                      type="button"
                      onClick={() => setFrequency(option.value)}
                      className={`px-4 py-3 rounded-lg text-sm transition-all duration-300 transform hover:scale-105 ${
                        frequency === option.value
                          ? 'bg-blue-500 text-white shadow-lg shadow-blue-500/25'
                          : 'bg-gray-900/50 text-gray-400 hover:bg-gray-800'
                      }`}
                    >
                      {option.label}
                    </button>
                  ))}
                </div>
              </div>

              {/* Submit Button */}
              <button
                type="submit"
                disabled={status === 'loading'}
                className="w-full py-3 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-all duration-300 disabled:opacity-50 disabled:cursor-not-allowed group relative overflow-hidden"
              >
                <span className="relative z-10 flex items-center justify-center gap-2">
                  {status === 'loading' ? 'Inscription en cours...' : "S'abonner à la newsletter"}
                  <Mail className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
                </span>
                <div className="absolute inset-0 bg-gradient-to-r from-blue-600 to-purple-600 opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
              </button>

              {/* Status Message with animation */}
              {status !== 'idle' && (
                <div className={`flex items-center gap-2 ${
                  status === 'success' ? 'text-green-500' : 'text-red-500'
                } animate-fade-in`}>
                  {status === 'success' ? (
                    <CheckCircle2 className="w-5 h-5 animate-bounce" />
                  ) : (
                    <AlertCircle className="w-5 h-5 animate-pulse" />
                  )}
                  <span>{message}</span>
                </div>
              )}
            </form>
          </div>

          {/* Privacy Notice */}
          <p className="text-center text-gray-400 text-sm mt-8 animate-fade-in">
            En vous inscrivant, vous acceptez de recevoir des emails de notre part.
            Vous pouvez vous désabonner à tout moment.
            <br />
            Nous respectons votre vie privée et ne partagerons jamais vos informations.
          </p>
        </div>
      </div>
    </div>
  );
}
