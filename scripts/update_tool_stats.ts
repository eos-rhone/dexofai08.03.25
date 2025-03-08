import { supabase } from '../src/lib/supabase';
import axios from 'axios';

interface ToolStats {
  name: string;
  monthlyUsers: number;
  totalViews: number;
}

async function fetchToolStats(websiteUrl: string): Promise<number | null> {
  try {
    // Utiliser SimilarWeb API pour obtenir les statistiques réelles
    // Note: Nécessite une clé API SimilarWeb
    const response = await axios.get(`https://api.similarweb.com/v1/similar-rank/${websiteUrl}/rank`, {
      headers: {
        'api-key': process.env.SIMILARWEB_API_KEY
      }
    });
    
    return response.data.visits || null;
  } catch (error) {
    console.error(`Erreur lors de la récupération des stats pour ${websiteUrl}:`, error);
    return null;
  }
}

async function updateToolStats() {
  try {
    // 1. Récupérer tous les outils
    const { data: tools, error } = await supabase
      .from('ai_tools')
      .select('id, name, website_url');

    if (error) throw error;

    // 2. Pour chaque outil, mettre à jour les statistiques
    for (const tool of tools) {
      console.log(`Mise à jour des stats pour ${tool.name}...`);
      
      // Récupérer les stats réelles si possible
      const realStats = await fetchToolStats(tool.website_url);
      
      // Si on a des stats réelles, les utiliser, sinon garder les estimations actuelles
      if (realStats) {
        await supabase
          .from('ai_tools')
          .update({
            monthly_users: realStats,
            total_views: Math.floor(realStats * (1 + Math.random())), // Un peu plus que les utilisateurs mensuels
            updated_at: new Date().toISOString()
          })
          .eq('id', tool.id);
      }
    }

    console.log('Mise à jour des statistiques terminée !');
  } catch (error) {
    console.error('Erreur lors de la mise à jour des statistiques:', error);
  }
}

// Exécuter la mise à jour
updateToolStats();
