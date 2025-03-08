import { createClient } from '@supabase/supabase-js';
import type { Database } from './database.types';
import { parseSearchIntent, calculateRelevanceScore } from './utils';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error('Les variables d\'environnement Supabase sont manquantes. Assurez-vous d\'avoir configuré VITE_SUPABASE_URL et VITE_SUPABASE_ANON_KEY.');
}

console.log('Initialisation de Supabase avec URL:', supabaseUrl);

export const supabase = createClient<Database>(supabaseUrl, supabaseAnonKey, {
  auth: {
    persistSession: true,
    autoRefreshToken: true,
    detectSessionInUrl: true
  },
  global: {
    headers: {
      'x-application-name': 'dexofai'
    }
  },
  db: {
    schema: 'public'
  },
  realtime: {
    params: {
      eventsPerSecond: 10
    }
  }
});

// Vérifier la connexion
supabase.from('ai_tools').select('count', { count: 'exact', head: true }).then(({ count, error }) => {
  if (error) {
    console.error('Erreur de connexion Supabase:', error);
  } else {
    console.log('Connexion Supabase OK, nombre d\'outils:', count);
  }
});

// Fonction utilitaire pour les retries
const withRetry = async <T>(
  operation: () => Promise<T>,
  maxRetries = 3,
  baseDelay = 1000
): Promise<T> => {
  let lastError;
  
  for (let i = 0; i < maxRetries; i++) {
    try {
      return await operation();
    } catch (error) {
      lastError = error;
      if (i < maxRetries - 1) {
        const delay = baseDelay * Math.pow(2, i) * (0.5 + Math.random());
        await new Promise(resolve => setTimeout(resolve, delay));
      }
    }
  }
  
  throw lastError;
};

// Fonction pour récupérer les catégories avec retry
export async function getCategories() {
  try {
    // D'abord, obtenir les catégories
    const { data: categories, error: categoriesError } = await supabase
      .from('categories')
      .select(`
        id,
        name,
        slug,
        description,
        icon
      `)
      .order('name');

    if (categoriesError) throw categoriesError;

    // Ensuite, obtenir le nombre d'outils pour chaque catégorie
    const { data: toolCounts, error: toolCountsError } = await supabase
      .from('ai_tools')
      .select('category_id, id')
      .not('category_id', 'is', null);

    if (toolCountsError) throw toolCountsError;

    // Calculer le nombre d'outils par catégorie
    const toolCountMap = toolCounts.reduce((acc, tool) => {
      acc[tool.category_id] = (acc[tool.category_id] || 0) + 1;
      return acc;
    }, {});

    // Combiner les résultats
    const categoriesWithCounts = categories.map(category => ({
      ...category,
      tool_count: toolCountMap[category.id] || 0
    }));

    return categoriesWithCounts;
  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

// Fonction améliorée pour récupérer les outils avec recherche intelligente
export async function getTools(options: {
  category?: string;
  search?: string;
  featured?: boolean;
  limit?: number;
} = {}) {
  try {
    let query = supabase
      .from('ai_tools')
      .select(`
        *,
        category:categories!inner(*)
      `)
      .not('slug', 'is', null);

    if (options.search) {
      query = query.ilike('name', `%${options.search}%`);
    }

    if (options.category) {
      query = query.eq('categories.slug', options.category);
    }

    if (options.featured !== undefined) {
      query = query.eq('featured', options.featured);
    }

    if (options.limit) {
      query = query.limit(options.limit);
    }

    const { data, error } = await query;

    if (error) {
      console.error('Erreur lors de la récupération des outils:', error);
      return [];
    }

    return data || [];
  } catch (error) {
    console.error('Erreur lors de la récupération des outils:', error);
    return [];
  }
};

// Fonction pour récupérer les détails d'un outil avec retry
export async function getToolDetails(slug: string) {
  try {
    const { data, error } = await withRetry(async () => 
      await supabase
        .from('ai_tools')
        .select(`
          *,
          category:categories!ai_tools_category_id_fkey(*),
          pricing:tool_pricing(*),
          reviews:reviews(*)
        `)
        .eq('slug', slug)
        .single()
    );
    
    if (error) {
      console.error('Supabase error:', error.message);
      return null;
    }

    return data;
  } catch (error) {
    console.error('Error in getToolDetails:', error);
    return null;
  }
}

// Fonction pour incrémenter les vues d'un outil avec retry
export async function incrementToolViews(toolId: string) {
  try {
    const { error } = await withRetry(async () => 
      await supabase.rpc('increment_tool_views', {
        tool_id: toolId
      })
    );
    
    if (error) {
      console.error('Erreur Supabase:', error.message);
    }
  } catch (error) {
    console.error('Erreur lors de l\'incrémentation des vues:', error);
  }
}

// Fonction pour soumettre un avis
export async function submitReview(toolId: string, rating: number, comment: string) {
  try {
    const { error } = await withRetry(async () => 
      await supabase
        .from('reviews')
        .insert([
          {
            tool_id: toolId,
            rating,
            comment
          }
        ])
    );
    
    if (error) {
      console.error('Erreur Supabase:', error.message);
      return false;
    }
    
    return true;
  } catch (error) {
    console.error('Erreur lors de la soumission de l\'avis:', error);
    return false;
  }
}

// Fonction pour mettre à jour l'icône d'une catégorie
export async function updateCategoryIcon(categoryId: string, iconPath: string) {
  try {
    const { error } = await withRetry(async () => 
      await supabase
        .from('categories')
        .update({ icon: iconPath })
        .eq('id', categoryId)
    );
    
    if (error) {
      console.error('Erreur Supabase:', error.message);
      return false;
    }
    
    return true;
  } catch (error) {
    console.error('Erreur lors de la mise à jour de l\'icône:', error);
    return false;
  }
}

// Fonction pour catégoriser automatiquement les outils
export async function categorizeTools() {
  try {
    console.log('Début de la catégorisation...');
    
    // Récupérer tous les outils
    const { data: tools, error: toolsError } = await supabase
      .from('ai_tools')
      .select('id, name, description, category_id');

    if (toolsError) {
      console.error('Erreur lors de la récupération des outils:', toolsError);
      return false;
    }

    // Récupérer toutes les catégories
    const { data: categories, error: categoriesError } = await supabase
      .from('categories')
      .select('id, name, keywords');

    if (categoriesError) {
      console.error('Erreur lors de la récupération des catégories:', categoriesError);
      return false;
    }

    let updateCount = 0;
    
    // Pour chaque outil
    for (const tool of tools || []) {
      if (tool.category_id) continue; // Ignorer les outils déjà catégorisés

      const toolText = `${tool.name} ${tool.description}`.toLowerCase();
      let bestCategoryId = null;
      let bestScore = 0;

      // Trouver la meilleure catégorie
      for (const category of categories) {
        const keywords = category.keywords?.split(',') || [category.name];
        let score = 0;

        for (const keyword of keywords) {
          if (toolText.includes(keyword.toLowerCase().trim())) {
            score += 1;
          }
        }

        if (score > bestScore) {
          bestScore = score;
          bestCategoryId = category.id;
        }
      }

      // Mettre à jour si une catégorie a été trouvée
      if (bestCategoryId) {
        const { error: updateError } = await supabase
          .from('ai_tools')
          .update({ category_id: bestCategoryId })
          .eq('id', tool.id);

        if (!updateError) {
          updateCount++;
          console.log(`Outil ${tool.name} catégorisé avec succès`);
        }
      }
    }

    console.log(`Catégorisation terminée. ${updateCount} outils mis à jour.`);
    return true;
  } catch (error) {
    console.error('Erreur lors de la catégorisation:', error);
    return false;
  }
}

// Fonction pour récupérer les statistiques de la page d'accueil
export async function getHomeStats() {
  try {
    // Récupérer le nombre d'outils
    const { count: toolCount } = await supabase
      .from('ai_tools')
      .select('*', { count: 'exact', head: true })
      .eq('is_active', true);

    // Récupérer le nombre de catégories
    const { count: categoryCount } = await supabase
      .from('categories')
      .select('*', { count: 'exact', head: true });

    return {
      toolCount: toolCount || 0,
      categoryCount: categoryCount || 0,
      monthlyUsers: 1000, // Valeur temporaire
      averageRating: 4.5  // Valeur temporaire
    };
  } catch (error) {
    console.error('Erreur lors de la récupération des statistiques:', error);
    return {
      toolCount: 0,
      categoryCount: 0,
      monthlyUsers: 0,
      averageRating: 0
    };
  }
}

// Fonction pour mettre à jour les icônes manquantes
export async function fixMissingIcons() {
  try {
    // 1. Récupérer toutes les catégories
    const { data: categories, error: fetchError } = await supabase
      .from('categories')
      .select('id, name, icon');

    if (fetchError) {
      console.error('Erreur lors de la récupération des catégories:', fetchError);
      return false;
    }

    // 2. Filtrer les catégories sans icône ou avec une ancienne icône (chemin de fichier)
    const categoriesToUpdate = categories.filter(cat => !cat.icon || cat.icon.includes('/'));

    // 3. Mettre à jour chaque catégorie
    for (const category of categoriesToUpdate) {
      let iconName = 'folder'; // Icône par défaut
      
      // Déterminer l'icône en fonction du nom de la catégorie
      const name = category.name.toLowerCase();
      if (name.includes('acoustique')) iconName = 'acoustic';
      else if (name.includes('aviation')) iconName = 'plane';
      else if (name.includes('audio')) iconName = 'music';
      else if (name.includes('vidéo')) iconName = 'video';
      else if (name.includes('image')) iconName = 'image';
      else if (name.includes('texte')) iconName = 'filetext';
      else if (name.includes('code')) iconName = 'code';
      else if (name.includes('données')) iconName = 'database';
      else if (name.includes('3d')) iconName = 'box';
      else if (name.includes('musique')) iconName = 'music';
      else if (name.includes('productivité')) iconName = 'listcheck';
      else if (name.includes('marketing')) iconName = 'megaphone';
      else if (name.includes('business')) iconName = 'briefcase';
      else if (name.includes('éducation')) iconName = 'graduationcap';
      else if (name.includes('santé')) iconName = 'heart';
      else if (name.includes('finance')) iconName = 'dollarsign';
      else if (name.includes('jeux')) iconName = 'gamepad';
      else if (name.includes('social')) iconName = 'users';
      else if (name.includes('recherche')) iconName = 'search';
      else if (name.includes('intelligence')) iconName = 'aibrain';

      // Mettre à jour l'icône
      await updateCategoryIcon(category.id, iconName);
    }

    return true;
  } catch (error) {
    console.error('Erreur lors de la mise à jour des icônes:', error);
    return false;
  }
}
