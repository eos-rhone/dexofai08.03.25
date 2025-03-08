import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config();

const supabase = createClient(
    process.env.SUPABASE_URL!,
    process.env.SUPABASE_KEY!
);

async function main() {
    // 1. Vérifier la connexion
    console.log('Test de connexion à Supabase...');
    
    // 2. Compter les outils existants
    const { count: beforeCount } = await supabase
        .from('tools')
        .select('*', { count: 'exact', head: true });
    
    console.log(`Nombre d'outils avant insertion: ${beforeCount}`);
    
    // 3. Tester l'insertion d'un outil
    const testTool = {
        name: 'Test AI Tool ' + new Date().toISOString(),
        description: 'A test AI tool',
        website_url: 'https://example.com',
        image_url: 'https://example.com/image.png',
        monthly_users: 0,
        is_verified: false,
        categories: ['test'],
        tags: ['test'],
        pricing: [{ plan_name: 'Free', price: 0 }]
    };
    
    console.log('Tentative d\'insertion...');
    const { data, error } = await supabase
        .from('tools')
        .insert(testTool)
        .select()
        .single();
    
    if (error) {
        console.error('Erreur lors de l\'insertion:', error);
    } else {
        console.log('Outil inséré avec succès:', data);
    }
    
    // 4. Vérifier le nouveau compte
    const { count: afterCount } = await supabase
        .from('tools')
        .select('*', { count: 'exact', head: true });
    
    console.log(`Nombre d'outils après insertion: ${afterCount}`);
}

main().catch(console.error);
