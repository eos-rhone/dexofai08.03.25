import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';

// Charger les variables d'environnement
dotenv.config();

// Créer le client Supabase
const supabase = createClient(
  process.env.VITE_SUPABASE_URL || '',
  process.env.VITE_SUPABASE_ANON_KEY || ''
);

async function countTools() {
  try {
    // Compter le nombre total d'outils
    const { count: toolsCount } = await supabase
      .from('ai_tools')
      .select('*', { count: 'exact', head: true });

    // Compter le nombre d'outils par catégorie
    const { data: categoryCounts } = await supabase
      .from('categories')
      .select(`
        name,
        ai_tools (count)
      `);

    // Compter les outils par source
    const { data: tools } = await supabase
      .from('ai_tools')
      .select('source');

    const sourceCounts = tools?.reduce((acc: {[key: string]: number}, tool) => {
      if (tool.source) {
        acc[tool.source] = (acc[tool.source] || 0) + 1;
      }
      return acc;
    }, {});

    console.log('\n=== Statistiques DexofAI ===\n');
    console.log(`Nombre total d'outils IA : ${toolsCount}`);
    
    console.log('\nRépartition par catégorie :');
    categoryCounts?.forEach(category => {
      console.log(`- ${category.name}: ${category.ai_tools.length} outils`);
    });

    console.log('\nRépartition par source :');
    Object.entries(sourceCounts || {}).forEach(([source, count]) => {
      console.log(`- ${source}: ${count} outils`);
    });

    // Afficher les dernières mises à jour
    const { data: recentUpdates } = await supabase
      .from('ai_tools')
      .select('name, updated_at')
      .order('updated_at', { ascending: false })
      .limit(5);

    console.log('\nDernières mises à jour :');
    recentUpdates?.forEach(tool => {
      console.log(`- ${tool.name}: ${new Date(tool.updated_at).toLocaleString()}`);
    });

  } catch (error) {
    console.error('Erreur lors du comptage des outils:', error);
  }
}

countTools();
