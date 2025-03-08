import React, { useState } from 'react';
import { Mail, MessageSquare, Send, Phone, MapPin, Globe, CheckCircle2, AlertCircle, Star, Sparkles, Zap } from 'lucide-react';

interface FormData {
  name: string;
  email: string;
  subject: string;
  message: string;
}

export function Contact() {
  const [formData, setFormData] = useState<FormData>({
    name: '',
    email: '',
    subject: '',
    message: ''
  });
  const [status, setStatus] = useState<'idle' | 'loading' | 'success' | 'error'>('idle');
  const [statusMessage, setStatusMessage] = useState('');
  const [focusedField, setFocusedField] = useState<string | null>(null);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setStatus('loading');

    try {
      // TODO: Implement form submission logic
      await new Promise(resolve => setTimeout(resolve, 1000));
      
      setStatus('success');
      setStatusMessage('Votre message a été envoyé avec succès !');
      setFormData({
        name: '',
        email: '',
        subject: '',
        message: ''
      });
    } catch (error) {
      setStatus('error');
      setStatusMessage('Une erreur est survenue. Veuillez réessayer.');
    }
  };

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
  };

  return (
    <div className="min-h-screen bg-[#0B0F19] text-white">
      <div className="max-w-7xl mx-auto px-6 py-24">
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
                  <MessageSquare className="w-8 h-8 text-yellow-500 absolute -top-4 left-1/2 -translate-x-1/2 transform -rotate-12" />
                  <Star className="w-8 h-8 text-purple-500 absolute -bottom-4 left-1/2 -translate-x-1/2 transform rotate-12" />
                  <Sparkles className="w-8 h-8 text-green-500 absolute top-1/2 -right-4 -translate-y-1/2" />
                  <Zap className="w-8 h-8 text-red-500 absolute top-1/2 -left-4 -translate-y-1/2" />
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
            Contactez-nous
          </h1>
          <p className="text-xl text-gray-400 max-w-2xl mx-auto leading-relaxed animate-fade-in">
            Une question ? Une suggestion ? N'hésitez pas à nous contacter. 
            Notre équipe vous répondra dans les plus brefs délais.
          </p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-12">
          {/* Contact Information with hover effects */}
          <div className="space-y-6">
            {[
              {
                icon: Mail,
                title: "Email",
                description: "Pour toute question générale :",
                value: "contact@dexofai.com",
                action: "mailto:contact@dexofai.com"
              },
              {
                icon: Phone,
                title: "Téléphone",
                description: "Du lundi au vendredi, 9h-18h :",
                value: "+33 1 23 45 67 89",
                action: "tel:+33123456789"
              },
              {
                icon: MapPin,
                title: "Adresse",
                description: "Nos bureaux :",
                value: "123 Avenue de l'Innovation\n75001 Paris\nFrance"
              },
              {
                icon: Globe,
                title: "Réseaux sociaux",
                description: "Suivez-nous :",
                links: ['Twitter', 'LinkedIn', 'GitHub']
              }
            ].map((item, index) => (
              <div
                key={item.title}
                className="bg-black/40 rounded-xl p-6 transform hover:scale-105 transition-all duration-300 hover:shadow-xl hover:shadow-blue-500/10 border border-gray-800 hover:border-blue-500 group animate-fade-in"
                style={{ animationDelay: `${index * 0.1}s` }}
              >
                <div className="flex items-start gap-4">
                  <div className="w-12 h-12 bg-blue-500/10 rounded-xl flex items-center justify-center flex-shrink-0 group-hover:scale-110 transition-transform duration-300">
                    <item.icon className="w-6 h-6 text-blue-500" />
                  </div>
                  <div>
                    <h3 className="text-lg font-semibold mb-2 group-hover:text-blue-500 transition-colors">
                      {item.title}
                    </h3>
                    <p className="text-gray-400 mb-2">{item.description}</p>
                    {item.value && (
                      <a
                        href={item.action}
                        className="text-blue-500 hover:text-blue-400 transition-colors inline-flex items-center gap-2 group/link"
                      >
                        {item.value.split('\n').map((line, i) => (
                          <React.Fragment key={i}>
                            {line}
                            {i < item.value.split('\n').length - 1 && <br />}
                          </React.Fragment>
                        ))}
                        {item.action && (
                          <Send className="w-4 h-4 group-hover/link:translate-x-1 transition-transform" />
                        )}
                      </a>
                    )}
                    {item.links && (
                      <div className="space-y-3">
                        {item.links.map((network) => (
                          <a
                            key={network}
                            href="#"
                            className="block text-gray-400 hover:text-blue-500 transition-colors transform hover:translate-x-2 duration-300 flex items-center gap-2 group/link"
                          >
                            {network}
                            <Send className="w-4 h-4 opacity-0 group-hover/link:opacity-100 transition-opacity" />
                          </a>
                        ))}
                      </div>
                    )}
                  </div>
                </div>
              </div>
            ))}
          </div>

          {/* Contact Form with animations */}
          <div className="lg:col-span-2">
            <div className="bg-black/40 rounded-xl p-8 border border-gray-800 hover:border-blue-500 transition-all duration-500 transform hover:shadow-xl hover:shadow-blue-500/10 animate-fade-in">
              <form onSubmit={handleSubmit} className="space-y-6">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <label 
                      htmlFor="name" 
                      className={`block text-sm font-medium mb-2 transition-colors duration-300 ${
                        focusedField === 'name' ? 'text-blue-500' : 'text-gray-300'
                      }`}
                    >
                      Nom complet
                    </label>
                    <input
                      type="text"
                      id="name"
                      name="name"
                      value={formData.name}
                      onChange={handleChange}
                      onFocus={() => setFocusedField('name')}
                      onBlur={() => setFocusedField(null)}
                      required
                      className="w-full px-4 py-3 bg-gray-900/50 border border-gray-800 rounded-lg focus:outline-none focus:border-blue-500 transition-all duration-300 focus:ring-2 focus:ring-blue-500/20"
                      placeholder="John Doe"
                    />
                  </div>
                  <div>
                    <label 
                      htmlFor="email" 
                      className={`block text-sm font-medium mb-2 transition-colors duration-300 ${
                        focusedField === 'email' ? 'text-blue-500' : 'text-gray-300'
                      }`}
                    >
                      Email
                    </label>
                    <input
                      type="email"
                      id="email"
                      name="email"
                      value={formData.email}
                      onChange={handleChange}
                      onFocus={() => setFocusedField('email')}
                      onBlur={() => setFocusedField(null)}
                      required
                      className="w-full px-4 py-3 bg-gray-900/50 border border-gray-800 rounded-lg focus:outline-none focus:border-blue-500 transition-all duration-300 focus:ring-2 focus:ring-blue-500/20"
                      placeholder="john@example.com"
                    />
                  </div>
                </div>

                <div>
                  <label 
                    htmlFor="subject" 
                    className={`block text-sm font-medium mb-2 transition-colors duration-300 ${
                      focusedField === 'subject' ? 'text-blue-500' : 'text-gray-300'
                    }`}
                  >
                    Sujet
                  </label>
                  <select
                    id="subject"
                    name="subject"
                    value={formData.subject}
                    onChange={handleChange}
                    onFocus={() => setFocusedField('subject')}
                    onBlur={() => setFocusedField(null)}
                    required
                    className="w-full px-4 py-3 bg-gray-900/50 border border-gray-800 rounded-lg focus:outline-none focus:border-blue-500 transition-all duration-300 focus:ring-2 focus:ring-blue-500/20"
                  >
                    <option value="">Sélectionnez un sujet</option>
                    <option value="general">Question générale</option>
                    <option value="support">Support technique</option>
                    <option value="partnership">Partenariat</option>
                    <option value="press">Presse</option>
                    <option value="other">Autre</option>
                  </select>
                </div>

                <div>
                  <label 
                    htmlFor="message" 
                    className={`block text-sm font-medium mb-2 transition-colors duration-300 ${
                      focusedField === 'message' ? 'text-blue-500' : 'text-gray-300'
                    }`}
                  >
                    Message
                  </label>
                  <textarea
                    id="message"
                    name="message"
                    value={formData.message}
                    onChange={handleChange}
                    onFocus={() => setFocusedField('message')}
                    onBlur={() => setFocusedField(null)}
                    required
                    rows={6}
                    className="w-full px-4 py-3 bg-gray-900/50 border border-gray-800 rounded-lg focus:outline-none focus:border-blue-500 transition-all duration-300 focus:ring-2 focus:ring-blue-500/20 resize-none"
                    placeholder="Votre message..."
                  />
                </div>

                <button
                  type="submit"
                  disabled={status === 'loading'}
                  className="w-full py-3 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-all duration-300 disabled:opacity-50 disabled:cursor-not-allowed group relative overflow-hidden"
                >
                  <span className="relative z-10 flex items-center justify-center gap-2">
                    {status === 'loading' ? 'Envoi en cours...' : 'Envoyer le message'}
                    <Send className="w-4 h-4 group-hover:translate-x-1 transition-transform" />
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
                    <span>{statusMessage}</span>
                  </div>
                )}
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
