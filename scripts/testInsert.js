import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config();

const supabase = createClient(
    process.env.SUPABASE_URL,
    process.env.SUPABASE_KEY
);

async function main() {
    try {
        console.log('Test de connexion à Supabase...');
        
        const { count } = await supabase
            .from('tools')
            .select('*', { count: 'exact', head: true });
        
        console.log('Nombre d\'outils actuel:', count);
        
        // Test d'insertion
        const testTool = {
            name: 'Test Tool ' + Date.now(),
            description: 'Test description',
            website_url: 'https://example.com',
            is_verified: false
        };
        
        const { data, error } = await supabase
            .from('tools')
            .insert(testTool)
            .select();
        
        if (error) {
            console.error('Erreur d\'insertion:', error);
        } else {
            console.log('Insertion réussie:', data);
        }
    } catch (error) {
        console.error('Erreur:', error);
    }
}

main();
