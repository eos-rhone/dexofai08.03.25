import { ScrapedTool, CategorySuggestion } from '../types';

// Dictionnaire de mots-clés par catégorie
const categoryKeywords = {
    'image-generation': [
        'image', 'art', 'design', 'generate', 'création', 'picture', 'photo',
        'artistic', 'drawing', 'illustration', 'visual', 'graphics'
    ],
    'text-to-speech': [
        'voice', 'audio', 'speech', 'text to speech', 'tts', 'speak',
        'narration', 'voiceover', 'vocal', 'sound'
    ],
    'chatbot': [
        'chat', 'conversation', 'assistant', 'messaging', 'dialogue',
        'interactive', 'communication', 'bot', 'ai assistant'
    ],
    'code-assistant': [
        'code', 'programming', 'development', 'developer', 'software',
        'ide', 'coding', 'programmer', 'git', 'github'
    ],
    'writing-assistant': [
        'write', 'text', 'content', 'copy', 'article', 'blog',
        'writing', 'editor', 'grammar', 'copywriting'
    ],
    'video-generation': [
        'video', 'animation', 'motion', 'film', 'movie',
        'cinematic', 'footage', 'render', 'animated'
    ],
    'music-generation': [
        'music', 'audio', 'sound', 'track', 'song',
        'melody', 'composition', 'musical', 'acoustic'
    ],
    'data-analysis': [
        'data', 'analytics', 'analysis', 'statistics', 'visualization',
        'dashboard', 'metrics', 'insights', 'reporting'
    ],
    'productivity': [
        'productivity', 'workflow', 'automation', 'task', 'organize',
        'management', 'efficiency', 'time-saving', 'process'
    ]
};

export function analyzeTool(tool: ScrapedTool): CategorySuggestion[] {
    const suggestions: CategorySuggestion[] = [];
    
    // Texte à analyser (nom + description)
    const textToAnalyze = `${tool.name} ${tool.description}`.toLowerCase();
    
    // Analyser chaque catégorie
    for (const [category, keywords] of Object.entries(categoryKeywords)) {
        const matches = keywords.filter(keyword => 
            textToAnalyze.includes(keyword.toLowerCase())
        );
        
        if (matches.length > 0) {
            // Calculer la confiance basée sur le nombre de mots-clés trouvés
            const confidence = matches.length / Math.min(5, keywords.length);
            
            suggestions.push({
                name: category,
                confidence: Math.min(confidence, 1), // Limiter à 1 maximum
                keywords: matches
            });
        }
    }
    
    // Trier par confiance décroissante
    return suggestions.sort((a, b) => b.confidence - a.confidence);
}

export function suggestTags(tool: ScrapedTool): string[] {
    const tags = new Set<string>();
    
    // Ajouter les catégories comme tags
    tool.categories.forEach(category => {
        tags.add(category.toLowerCase());
    });
    
    // Ajouter les mots-clés trouvés dans l'analyse
    const suggestions = analyzeTool(tool);
    suggestions.forEach(suggestion => {
        suggestion.keywords.forEach(keyword => {
            tags.add(keyword.toLowerCase());
        });
    });
    
    // Ajouter des tags basés sur le prix
    const hasFree = tool.pricing.some(p => p.price === 0);
    const hasPaid = tool.pricing.some(p => p.price > 0);
    if (hasFree) tags.add('free');
    if (hasPaid) tags.add('premium');
    if (hasFree && hasPaid) tags.add('freemium');
    
    return Array.from(tags);
}
