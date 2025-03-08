import React, { useState } from 'react';
import { Bot, Brain, MessageSquare, Star, Zap, Search } from 'lucide-react';
import { getTools } from '../lib/supabase';
import { useNavigate } from 'react-router-dom';

interface Message {
  id: string;
  content: string;
  timestamp: string;
  isBot: boolean;
  tools?: any[];
}

export function Assistant() {
  const [messages, setMessages] = useState<Message[]>([
    {
      id: '1',
      content: "Bonjour ! Je suis votre assistant IA. Comment puis-je vous aider à trouver l'outil parfait ?",
      timestamp: new Date().toLocaleTimeString(),
      isBot: true
    }
  ]);
  const [input, setInput] = useState('');
  const [isTyping, setIsTyping] = useState(false);
  const navigate = useNavigate();

  const quickSuggestions = [
    "Je cherche un outil pour créer des images",
    "Je veux composer de la musique",
    "Je cherche un assistant pour l'écriture",
    "Je veux créer des vidéos",
    "Je cherche de l'aide pour coder"
  ];

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!input.trim()) return;

    const userMessage: Message = {
      id: Date.now().toString(),
      content: input,
      timestamp: new Date().toLocaleTimeString(),
      isBot: false
    };

    setMessages(prev => [...prev, userMessage]);
    setInput('');
    setIsTyping(true);

    try {
      const tools = await getTools({ search: input });
      
      let response = "Voici ce que j'ai trouvé :\n\n";
      
      tools.slice(0, 3).forEach(tool => {
        response += `• ${tool.name} - ${tool.description}\n`;
        if (tool.is_verified) response += "  ✓ Vérifié\n";
        if (tool.is_featured) response += "  ⭐ Très populaire\n";
      });

      const botMessage: Message = {
        id: Date.now().toString(),
        content: response,
        timestamp: new Date().toLocaleTimeString(),
        isBot: true,
        tools: tools.slice(0, 3)
      };

      setMessages(prev => [...prev, botMessage]);
    } catch (error) {
      const errorMessage: Message = {
        id: Date.now().toString(),
        content: "Désolé, je n'ai pas trouvé d'outils correspondant à votre recherche. Pouvez-vous reformuler ?",
        timestamp: new Date().toLocaleTimeString(),
        isBot: true
      };
      setMessages(prev => [...prev, errorMessage]);
    }

    setIsTyping(false);
  };

  const handleToolClick = (tool: any) => {
    navigate(`/categories?search=${encodeURIComponent(tool.name)}`);
  };

  return (
    <div className="min-h-screen bg-[#0B0F19] text-white">
      <div className="max-w-4xl mx-auto px-6 py-12">
        <div className="text-center mb-12">
          <div className="flex justify-center mb-4">
            <div className="relative group">
              <div className="absolute inset-0 bg-blue-500/20 rounded-full blur-xl group-hover:blur-2xl transition-all duration-500 animate-pulse"></div>
              <div className="relative bg-gray-900/80 p-8 rounded-full transform group-hover:scale-110 transition-transform duration-500">
                <Brain className="w-16 h-16 text-blue-500" />
                
                {/* Orbiting elements */}
                <div className="absolute inset-0 animate-spin-slow">
                  <Star className="w-8 h-8 text-yellow-500 absolute -top-4 left-1/2 -translate-x-1/2 transform -rotate-12" />
                  <MessageSquare className="w-8 h-8 text-purple-500 absolute -bottom-4 left-1/2 -translate-x-1/2 transform rotate-12" />
                  <Zap className="w-8 h-8 text-green-500 absolute top-1/2 -right-4 -translate-y-1/2" />
                  <Search className="w-8 h-8 text-red-500 absolute top-1/2 -left-4 -translate-y-1/2" />
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
          <h1 className="text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-blue-500 via-purple-500 to-pink-500 mb-4">
            Assistant IA
          </h1>
          <p className="text-gray-400 max-w-2xl mx-auto">
            Je vous aide à trouver les meilleurs outils d'IA pour vos besoins
          </p>
        </div>

        <div className="bg-gray-900/50 rounded-xl border border-gray-800 overflow-hidden">
          <div className="h-[400px] overflow-y-auto p-6 space-y-6">
            {messages.map((message) => (
              <div
                key={message.id}
                className={`flex items-start gap-4 ${
                  message.isBot ? '' : 'justify-end'
                }`}
              >
                {message.isBot && (
                  <div className="w-10 h-10 rounded-lg bg-blue-500 flex items-center justify-center flex-shrink-0">
                    <Bot className="w-6 h-6 text-white" />
                  </div>
                )}
                <div className="flex flex-col gap-4 max-w-[80%]">
                  <div
                    className={`rounded-lg p-4 ${
                      message.isBot ? 'bg-gray-800' : 'bg-blue-500'
                    }`}
                  >
                    <p className="mb-1 whitespace-pre-line">{message.content}</p>
                    <span className="text-xs text-gray-400">
                      {message.timestamp}
                    </span>
                  </div>

                  {message.tools && (
                    <div className="grid gap-2">
                      {message.tools.map((tool) => (
                        <button
                          key={tool.name}
                          onClick={() => handleToolClick(tool)}
                          className="p-4 bg-gray-800/50 rounded-lg hover:bg-blue-500/10 transition-all duration-300 text-left group"
                        >
                          <h4 className="font-semibold group-hover:text-blue-500 transition-colors">
                            {tool.name}
                          </h4>
                          <p className="text-sm text-gray-400">{tool.description}</p>
                        </button>
                      ))}
                    </div>
                  )}
                </div>
              </div>
            ))}
            {isTyping && (
              <div className="flex items-center gap-2 text-gray-400">
                <div className="w-2 h-2 bg-blue-500 rounded-full animate-bounce"></div>
                <div className="w-2 h-2 bg-blue-500 rounded-full animate-bounce" style={{ animationDelay: '0.2s' }}></div>
                <div className="w-2 h-2 bg-blue-500 rounded-full animate-bounce" style={{ animationDelay: '0.4s' }}></div>
              </div>
            )}
          </div>

          <div className="border-t border-gray-800 p-6">
            <form onSubmit={handleSubmit} className="space-y-4">
              <div className="relative">
                <input
                  type="text"
                  value={input}
                  onChange={(e) => setInput(e.target.value)}
                  placeholder="Décrivez vos besoins en IA..."
                  className="w-full px-4 py-3 bg-gray-800 rounded-lg border border-gray-700 focus:outline-none focus:border-blue-500 transition-all duration-300"
                />
                <button
                  type="submit"
                  disabled={isTyping}
                  className="absolute right-2 top-1/2 -translate-y-1/2 p-2 bg-blue-500 rounded-lg hover:bg-blue-600 transition-all duration-300 disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  <MessageSquare className="w-5 h-5" />
                </button>
              </div>

              <div className="space-y-2">
                <p className="text-sm text-gray-400 flex items-center gap-2">
                  <Brain className="w-4 h-4 animate-pulse" />
                  Suggestions rapides :
                </p>
                <div className="flex flex-wrap gap-2">
                  {quickSuggestions.map((suggestion) => (
                    <button
                      key={suggestion}
                      type="button"
                      onClick={() => setInput(suggestion)}
                      className="px-4 py-2 bg-gray-800 rounded-full text-sm hover:bg-gray-700 transition-all duration-300 hover:scale-105"
                    >
                      {suggestion}
                    </button>
                  ))}
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
}
