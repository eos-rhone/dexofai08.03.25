import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
import { writeFileSync } from 'fs';

// Charger les variables d'environnement
dotenv.config();

const log = (message) => {
    const timestamp = new Date().toISOString();
    writeFileSync('debug.log', `${timestamp}: ${message}\n`, { flag: 'a' });
};

const supabase = createClient(
    process.env.SUPABASE_URL,
    process.env.SUPABASE_KEY
);

async function main() {
    try {
        log('Test de connexion à Supabase...');
        log(`URL: ${process.env.SUPABASE_URL}`);
        log(`KEY: ${process.env.SUPABASE_KEY ? 'présente' : 'manquante'}`);
        
        const { data, error } = await supabase
            .from('ai_tools')
            .select('*')
            .limit(1);
            
        if (error) {
            log(`ERREUR: ${JSON.stringify(error)}`);
            throw error;
        }
        
        log('Connexion réussie !');
        log(`Premier outil: ${JSON.stringify(data[0])}`);
        
    } catch (error) {
        log('ERREUR:');
        log(error.message || 'Pas de message d\'erreur');
        log(error.stack || 'Pas de stack trace');
    }
}

main();
