import { createClient } from '@supabase/supabase-js';
import { promises as fs } from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const supabaseUrl = 'https://epfmxwovbljqvrrwgmrz.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVwZm14d292YmxqcXZycndnbXJ6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczOTgyODE2NiwiZXhwIjoyMDU1NDA0MTY2fQ.obT14rMpkW0MmE_rAZfSRxZhHntoejpUlUH2IB4Ey_8';

const supabase = createClient(supabaseUrl, supabaseKey);

async function restoreDatabase() {
  console.log('Début de la restauration...');

  try {
    // Vérifier l'état actuel
    const { count: beforeCount } = await supabase
      .from('ai_tools')
      .select('*', { count: 'exact' });

    console.log(`Nombre d'outils avant restauration: ${beforeCount}`);

    // Charger la sauvegarde
    const backupFiles = [
      '20250225224300_restore_all_tools.sql',
      '20250225224700_restore_all_tools_batch2.sql',
      '20250225224800_restore_all_tools_batch3.sql',
      '20250225225600_restore_all_tools_complete.sql',
      '20250225225700_restore_all_tools_final.sql'
    ];

    for (const file of backupFiles) {
      const filePath = path.join(__dirname, '..', 'supabase', 'migrations', file);
      const sql = await fs.readFile(filePath, 'utf8');
      
      console.log(`Exécution de ${file}...`);
      const { error } = await supabase.from('ai_tools').insert(sql);
      
      if (error) {
        console.error(`Erreur lors de l'exécution de ${file}:`, error);
        throw error;
      }
    }

    // Vérifier le résultat
    const { count: afterCount } = await supabase
      .from('ai_tools')
      .select('*', { count: 'exact' });

    console.log(`Nombre d'outils après restauration: ${afterCount}`);

    if (afterCount >= 700) {
      console.log('✅ Restauration réussie !');
    } else {
      console.error('❌ Restauration incomplète. Nombre d\'outils insuffisant.');
    }

  } catch (error) {
    console.error('Erreur lors de la restauration:', error);
  }
}

restoreDatabase();
