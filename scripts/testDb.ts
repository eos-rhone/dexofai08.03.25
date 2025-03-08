import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import slugify from 'slugify';

dotenv.config();

const supabase = createClient(
    process.env.SUPABASE_URL!,
    process.env.SUPABASE_KEY!
);

async function main() {
    try {
        console.log('Test de connexion à Supabase...');
        console.log('URL:', process.env.SUPABASE_URL);
        
        // Créer une catégorie de test
        const categoryData = {
            name: 'Test Category',
            slug: 'test-category',
            description: 'A test category',
            icon: 'test-icon'
        };
        
        console.log('Création de la catégorie de test...');
        const { data: category, error: categoryError } = await supabase
            .from('categories')
            .insert(categoryData)
            .select()
            .single();
            
        if (categoryError) {
            throw categoryError;
        }
        
        console.log('Catégorie créée:', category);
        
        // Créer un outil de test
        const toolData = {
            name: 'Test AI Tool ' + Date.now(),
            slug: 'test-ai-tool-' + Date.now(),
            description: 'A test AI tool',
            category_id: category.id,
            website_url: 'https://example.com',
            image_url: 'https://example.com/image.png',
            is_verified: false,
            is_featured: false
        };
        
        console.log('Création de l\'outil de test...');
        const { data: tool, error: toolError } = await supabase
            .from('ai_tools')
            .insert(toolData)
            .select()
            .single();
            
        if (toolError) {
            throw toolError;
        }
        
        console.log('Outil créé:', tool);
        
    } catch (error) {
        console.error('Erreur:', error);
    }
}

main();
