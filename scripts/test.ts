import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config();

console.log('Test de connexion à Supabase...');

const supabase = createClient(
    process.env.SUPABASE_URL!,
    process.env.SUPABASE_KEY!
);

async function test() {
    const { data, error } = await supabase
        .from('tools')
        .select('count');
        
    if (error) {
        console.error('Erreur:', error);
    } else {
        console.log('Nombre d\'outils:', data);
    }
}

test().catch(console.error);
