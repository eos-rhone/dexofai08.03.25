import cron from 'node-cron';
import { exec } from 'child_process';
import { promisify } from 'util';
import * as dotenv from 'dotenv';

// Charger les variables d'environnement
dotenv.config();

const execAsync = promisify(exec);

// Fonction pour exécuter une commande et logger le résultat
async function runCommand(command: string): Promise<void> {
  try {
    const { stdout, stderr } = await execAsync(command);
    
    if (stdout) console.log(stdout);
    if (stderr) console.error(stderr);
    
    console.log(`✅ Commande "${command}" exécutée avec succès`);
  } catch (error) {
    console.error(`❌ Erreur lors de l'exécution de "${command}":`, error);
  }
}

// Fonction principale qui exécute les tâches
async function runTasks() {
  console.log('🔄 Démarrage des tâches planifiées...');
  
  // Import des outils
  console.log('📥 Import des outils...');
  await runCommand('npm run import-tools');
  
  // Comptage des outils
  console.log('📊 Comptage des outils...');
  await runCommand('npm run count-tools');
}

// Exécution quotidienne à 3h du matin
cron.schedule('0 3 * * *', () => {
  console.log('🕒 Exécution quotidienne - ' + new Date().toLocaleString());
  runTasks();
});

// Exécution immédiate au démarrage
console.log('🚀 Démarrage du service de cron...');
runTasks();

// Garder le processus en vie
process.on('SIGINT', () => {
  console.log('👋 Arrêt du service de cron...');
  process.exit(0);
});
