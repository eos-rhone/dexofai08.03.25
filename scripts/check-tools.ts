import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config();

const supabaseUrl = process.env.VITE_SUPABASE_URL!;
const supabaseKey = process.env.VITE_SUPABASE_KEY!;

const supabase = createClient(supabaseUrl, supabaseKey);

async function checkTools() {
  // Compter le nombre total d'outils
  const { count: toolCount } = await supabase
    .from('ai_tools')
    .select('*', { count: 'exact' });

  console.log(`Nombre total d'outils: ${toolCount}`);

  // Récupérer quelques outils pour vérifier
  const { data: sampleTools } = await supabase
    .from('ai_tools')
    .select('name, description')
    .limit(5);

  console.log('\nExemples d\'outils trouvés:');
  console.log(sampleTools);
}

checkTools();
