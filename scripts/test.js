const { createClient } = require('@supabase/supabase-js');
require('dotenv').config();

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
    }
}

main();
