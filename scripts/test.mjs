import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';

// Charger les variables d'environnement
dotenv.config();

const supabase = createClient(
    process.env.SUPABASE_URL,
    process.env.SUPABASE_KEY
);

async function main() {
    try {
        console.log('Test de connexion à Supabase...');
        console.log('URL:', process.env.SUPABASE_URL);
        
        const { data, error } = await supabase
            .from('ai_tools')
            .select('*')
            .limit(1);
            
        if (error) {
            throw error;
        }
        
        console.log('Connexion réussie !');
        console.log('Premier outil:', data[0]);
        
    } catch (error) {
        console.error('Erreur:', error);
        // Afficher plus de détails sur l'erreur
        if (error.message) console.error('Message:', error.message);
        if (error.code) console.error('Code:', error.code);
        if (error.details) console.error('Détails:', error.details);
    }
}

main();
