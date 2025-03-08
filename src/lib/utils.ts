import { clsx, type ClassValue } from 'clsx';
import { twMerge } from 'tailwind-merge';

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

// Fonction pour analyser le contexte de la conversation
export function analyzeConversationContext(messages: any[]): {
  topics: string[];
  preferences: string[];
  constraints: string[];
} {
  const context = {
    topics: new Set<string>(),
    preferences: new Set<string>(),
    constraints: new Set<string>()
  };

  // Analyser les derniers messages pour extraire le contexte
  messages.forEach(msg => {
    const text = msg.content.toLowerCase();
    
    // Détecter les sujets d'intérêt
    if (text.includes('image')) context.topics.add('image');
    if (text.includes('video') || text.includes('vidéo')) context.topics.add('video');
    if (text.includes('musique') || text.includes('audio')) context.topics.add('audio');
    if (text.includes('texte') || text.includes('écriture')) context.topics.add('text');
    
    // Détecter les préférences
    if (text.includes('gratuit')) context.preferences.add('free');
    if (text.includes('professionnel')) context.preferences.add('professional');
    if (text.includes('simple') || text.includes('facile')) context.preferences.add('easy');
    if (text.includes('avancé')) context.preferences.add('advanced');
    
    // Détecter les contraintes
    if (text.includes('budget')) context.constraints.add('budget');
    if (text.includes('temps réel')) context.constraints.add('realtime');
    if (text.includes('hors ligne') || text.includes('offline')) context.constraints.add('offline');
  });

  return {
    topics: Array.from(context.topics),
    preferences: Array.from(context.preferences),
    constraints: Array.from(context.constraints)
  };
}

// Fonction pour générer une réponse personnalisée
export function generatePersonalizedResponse(
  tools: any[],
  context: ReturnType<typeof analyzeConversationContext>
): string {
  if (tools.length === 0) {
    return "Je ne trouve pas d'outils correspondant exactement à vos critères. Pourriez-vous me donner plus de détails sur vos besoins ? Par exemple :\n" +
           "- Quel type de contenu souhaitez-vous créer ?\n" +
           "- Avez-vous des exigences particulières (gratuit, professionnel, etc.) ?\n" +
           "- Dans quel contexte utiliserez-vous l'outil ?";
  }

  let response = '';
  
  // Adapter l'introduction en fonction du contexte
  if (context.preferences.includes('professional')) {
    response = `J'ai sélectionné ${tools.length} solution${tools.length > 1 ? 's' : ''} professionnelle${tools.length > 1 ? 's' : ''} qui correspond${tools.length > 1 ? 'ent' : ''} à vos besoins :\n\n`;
  } else if (context.preferences.includes('easy')) {
    response = `Voici ${tools.length} outil${tools.length > 1 ? 's' : ''} simple${tools.length > 1 ? 's' : ''} et intuitif${tools.length > 1 ? 's' : ''} que je recommande :\n\n`;
  } else {
    response = `J'ai trouvé ${tools.length} outil${tools.length > 1 ? 's' : ''} qui pourrai${tools.length > 1 ? 'ent' : 't'} vous intéresser :\n\n`;
  }

  // Ajouter les outils avec des descriptions personnalisées
  tools.slice(0, 3).forEach(tool => {
    response += `• ${tool.name} - ${tool.description}\n`;
    
    // Ajouter des informations contextuelles
    if (tool.is_verified) response += "  ✓ Vérifié par notre équipe\n";
    if (tool.is_featured) response += "  ⭐ Très populaire dans sa catégorie\n";
    if (context.preferences.includes('free') && tool.pricing?.some((p: any) => p.price === 0)) {
      response += "  💫 Dispose d'une version gratuite\n";
    }
  });

  // Ajouter des suggestions de suivi
  if (tools.length > 3) {
    response += `\nJ'ai ${tools.length - 3} autres suggestions. Souhaitez-vous :\n`;
    response += "- Voir plus d'options ?\n";
    response += "- Affiner la recherche avec des critères spécifiques ?\n";
    response += "- En savoir plus sur un outil en particulier ?";
  } else {
    response += "\nQue souhaitez-vous savoir de plus sur ces outils ?";
  }

  return response;
}

// Fonction pour suggérer des questions de suivi
export function generateFollowUpQuestions(
  context: ReturnType<typeof analyzeConversationContext>,
  tools: any[]
): string[] {
  const questions = new Set<string>();

  // Questions basées sur le contexte
  if (context.topics.includes('image')) {
    questions.add("Quel style d'images souhaitez-vous créer ?");
    questions.add("Avez-vous besoin de fonctionnalités d'édition avancées ?");
  }
  
  if (context.topics.includes('video')) {
    questions.add("Quel type de vidéos souhaitez-vous créer ?");
    questions.add("Avez-vous besoin d'effets spéciaux ou d'animations ?");
  }

  // Questions basées sur les préférences
  if (!context.preferences.includes('free') && !context.preferences.includes('professional')) {
    questions.add("Recherchez-vous plutôt une solution gratuite ou professionnelle ?");
  }

  // Questions basées sur les outils trouvés
  if (tools.length > 0) {
    const categories = new Set(tools.map(tool => tool.category?.name));
    if (categories.size > 1) {
      questions.add("Dans quelle catégorie souhaitez-vous vous concentrer ?");
    }
  }

  // Questions générales de suivi
  questions.add("Avez-vous déjà utilisé des outils similaires ?");
  questions.add("Dans quel contexte utiliserez-vous cet outil ?");

  return Array.from(questions).slice(0, 3);
}

// Exporter les fonctions existantes
export function slugify(text: string): string {
  return text
    .toString()
    .toLowerCase()
    .trim()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9\s-]/g, '')
    .replace(/[\s_-]+/g, '-')
    .replace(/^-+|-+$/g, '');
}

export function normalizeText(text: string): string {
  return text
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .trim();
}

export function extractKeywords(text: string): string[] {
  const normalized = normalizeText(text);
  return normalized.split(/\s+/);
}

export function containsKeywords(text: string, keywords: string[]): boolean {
  const normalizedText = normalizeText(text);
  return keywords.some(keyword => normalizedText.includes(keyword));
}

export function parseSearchIntent(query: string): {
  action?: string;
  subject?: string;
  keywords: string[];
} {
  const normalizedQuery = normalizeText(query);
  
  // Patterns d'intention communs en français
  const intentPatterns = {
    creation: [
      'creer', 'créer', 'faire', 'generer', 'générer', 'produire', 'developper', 'développer',
      'concevoir', 'construire', 'batir', 'bâtir', 'realiser', 'réaliser', 'fabriquer', 'inventer',
      'composer', 'dessiner', 'peindre', 'sculpter', 'modeler', 'façonner', 'former'
    ],
    analysis: [
      'analyser', 'analyser', 'etudier', 'étudier', 'examiner', 'comprendre', 'explorer',
      'rechercher', 'investiguer', 'evaluer', 'évaluer', 'diagnostiquer', 'inspecter',
      'observer', 'mesurer', 'calculer', 'verifier', 'vérifier', 'tester'
    ],
    learning: [
      'apprendre', 'etudier', 'étudier', 'decouvrir', 'découvrir', 'comprendre', 'maitriser',
      'maîtriser', 'formation', 'cours', 'tutoriel', 'education', 'éducation', 'enseigner',
      'former', 'entrainer', 'entraîner', 'pratiquer', 'exercer'
    ],
    optimization: [
      'optimiser', 'ameliorer', 'améliorer', 'perfectionner', 'raffiner', 'augmenter',
      'maximiser', 'booster', 'accelerer', 'accélérer', 'renforcer', 'enrichir',
      'developper', 'développer', 'progresser', 'evoluer', 'évoluer'
    ],
    automation: [
      'automatiser', 'simplifier', 'faciliter', 'streamliner', 'robotiser', 'programmer',
      'scripter', 'orchestrer', 'planifier', 'organiser', 'gerer', 'gérer', 'controler',
      'contrôler', 'piloter', 'administrer'
    ],
    transformation: [
      'transformer', 'convertir', 'changer', 'modifier', 'adapter', 'ajuster', 'personnaliser',
      'customiser', 'remodeler', 'restructurer', 'reorganiser', 'réorganiser'
    ],
    communication: [
      'communiquer', 'parler', 'discuter', 'echanger', 'échanger', 'dialoguer', 'converser',
      'interagir', 'collaborer', 'partager', 'presenter', 'présenter', 'expliquer'
    ]
  };

  // Sujets communs
  const subjectPatterns = {
    image: [
      'image', 'photo', 'dessin', 'illustration', 'graphique', 'visuel', 'artwork', 'art',
      'design', 'logo', 'icone', 'icône', 'pictogramme', 'symbole', 'diagramme', 'schema',
      'schéma', 'croquis', 'esquisse', 'peinture', 'portrait', 'paysage'
    ],
    video: [
      'video', 'vidéo', 'film', 'animation', 'montage', 'clip', 'motion', 'cinema', 'cinéma',
      'documentaire', 'court-metrage', 'court-métrage', 'spot', 'trailer', 'bande-annonce'
    ],
    audio: [
      'audio', 'son', 'musique', 'voix', 'parole', 'melodie', 'mélodie', 'chanson',
      'instrumental', 'composition', 'harmonie', 'rythme', 'beat', 'podcast', 'radio',
      'enregistrement', 'mixage', 'mastering'
    ],
    text: [
      'texte', 'contenu', 'article', 'blog', 'redaction', 'rédaction', 'ecriture', 'écriture',
      'document', 'rapport', 'livre', 'ebook', 'newsletter', 'email', 'lettre', 'scenario',
      'scénario', 'script', 'copywriting', 'traduction'
    ],
    code: [
      'code', 'programme', 'application', 'logiciel', 'developpement', 'développement',
      'programmation', 'script', 'algorithme', 'api', 'backend', 'frontend', 'web',
      'mobile', 'desktop', 'base de donnees', 'base de données', 'sql', 'cloud'
    ],
    data: [
      'donnee', 'donnée', 'data', 'analyse', 'statistique', 'information', 'big data',
      'dataset', 'base de donnees', 'base de données', 'tableau', 'graphique', 'dashboard',
      'reporting', 'bi', 'business intelligence', 'prediction', 'prédiction'
    ],
    business: [
      'business', 'entreprise', 'marketing', 'vente', 'commerce', 'client', 'marche', 'marché',
      'strategie', 'stratégie', 'projet', 'gestion', 'management', 'organisation',
      'processus', 'workflow', 'productivite', 'productivité', 'performance'
    ],
    research: [
      'recherche', 'science', 'etude', 'étude', 'academique', 'académique', 'these', 'thèse',
      'publication', 'article', 'journal', 'conference', 'conférence', 'symposium',
      'experimentation', 'expérimentation', 'laboratoire', 'methodologie', 'méthodologie'
    ]
  };

  // Détecter l'intention
  let action: string | undefined;
  for (const [intent, patterns] of Object.entries(intentPatterns)) {
    if (patterns.some(pattern => normalizedQuery.includes(pattern))) {
      action = intent;
      break;
    }
  }

  // Détecter le sujet
  let subject: string | undefined;
  for (const [subj, patterns] of Object.entries(subjectPatterns)) {
    if (patterns.some(pattern => normalizedQuery.includes(pattern))) {
      subject = subj;
      break;
    }
  }

  // Extraire les mots-clés significatifs
  const keywords = extractKeywords(query).filter(word => 
    word.length > 2 && 
    !['je', 'tu', 'il', 'elle', 'nous', 'vous', 'ils', 'elles', 'le', 'la', 'les', 'un', 'une', 'des', 'pour', 'avec', 'dans', 'sur', 'par'].includes(word)
  );

  return { action, subject, keywords };
}

export function calculateRelevanceScore(tool: any, searchIntent: ReturnType<typeof parseSearchIntent>): number {
  let score = 0;
  const { action, subject, keywords } = searchIntent;

  // Score basé sur la correspondance des mots-clés
  const toolText = normalizeText(`${tool.name} ${tool.description}`);
  keywords.forEach(keyword => {
    if (toolText.includes(keyword)) score += 1;
  });

  // Score basé sur l'intention
  if (action) {
    const actionKeywords = {
      creation: ['créer', 'générer', 'produire', 'créatif', 'concevoir', 'développer', 'fabriquer'],
      analysis: ['analyser', 'examiner', 'évaluer', 'comprendre', 'explorer', 'étudier'],
      learning: ['apprendre', 'tutoriel', 'formation', 'éducation', 'enseigner', 'découvrir'],
      optimization: ['optimiser', 'améliorer', 'performance', 'accélérer', 'renforcer'],
      automation: ['automatiser', 'automatique', 'robot', 'simplifier', 'faciliter'],
      transformation: ['transformer', 'convertir', 'modifier', 'adapter', 'personnaliser'],
      communication: ['communiquer', 'dialoguer', 'interagir', 'collaborer', 'partager']
    }[action] || [];

    actionKeywords.forEach(keyword => {
      if (toolText.includes(keyword)) score += 2;
    });
  }

  // Score basé sur le sujet
  if (subject) {
    const subjectKeywords = {
      image: ['image', 'photo', 'visuel', 'design', 'graphique', 'illustration'],
      video: ['vidéo', 'film', 'animation', 'montage', 'cinéma'],
      audio: ['audio', 'son', 'musique', 'voix', 'mélodie', 'composition'],
      text: ['texte', 'contenu', 'rédaction', 'écriture', 'document', 'article'],
      code: ['code', 'développement', 'programmation', 'application', 'logiciel'],
      data: ['données', 'analyse', 'statistiques', 'information', 'prédiction'],
      business: ['business', 'entreprise', 'marketing', 'vente', 'commerce', 'client'],
      research: ['recherche', 'science', 'étude', 'académique', 'expérimentation']
    }[subject] || [];

    subjectKeywords.forEach(keyword => {
      if (toolText.includes(keyword)) score += 2;
    });
  }

  // Bonus pour les outils vérifiés et populaires
  if (tool.is_verified) score += 1;
  if (tool.is_featured) score += 1;

  return score;
}
