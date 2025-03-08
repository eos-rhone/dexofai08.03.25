import { fixMissingIcons } from '../src/lib/supabase';

async function main() {
  console.log('Début de la correction des icônes manquantes...');
  
  const success = await fixMissingIcons();
  
  if (success) {
    console.log('✅ Les icônes ont été mises à jour avec succès !');
  } else {
    console.error('❌ Une erreur est survenue lors de la mise à jour des icônes.');
  }
}

main().catch(console.error);
