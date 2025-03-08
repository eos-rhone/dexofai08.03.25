import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
import { writeFileSync } from 'fs';

dotenv.config();

const log = (message) => {
    const timestamp = new Date().toISOString();
    const logMessage = `${timestamp}: ${message}\n`;
    console.log(logMessage);
    writeFileSync('insert.log', logMessage, { flag: 'a' });
};

const supabase = createClient(
    process.env.SUPABASE_URL,
    process.env.SUPABASE_KEY
);

async function main() {
    try {
        log('Démarrage du test d\'insertion...');
        
        // 1. Créer une catégorie de test
        log('Création de la catégorie de test...');
        const categoryData = {
            name: 'Test Category',
            slug: 'test-category',
            description: 'A test category',
            icon: 'default-icon'
        };
        
        const { data: category, error: categoryError } = await supabase
            .from('categories')
            .insert(categoryData)
            .select()
            .single();
            
        if (categoryError) {
            log(`Erreur lors de la création de la catégorie: ${JSON.stringify(categoryError)}`);
            throw categoryError;
        }
        
        log(`Catégorie créée avec succès: ${JSON.stringify(category)}`);
        
        // 2. Créer un outil de test
        log('Création de l\'outil de test...');
        const toolData = {
            name: 'Test AI Tool ' + Date.now(),
            slug: 'test-ai-tool-' + Date.now(),
            description: 'A test AI tool',
            category_id: category.id,
            website_url: 'https://example.com',
            image_url: 'https://example.com/image.png',
            is_verified: false,
            is_featured: false,
            monthly_users: 0,
            total_views: 0,
            average_rating: null,
            total_reviews: 0
        };
        
        const { data: tool, error: toolError } = await supabase
            .from('ai_tools')
            .insert(toolData)
            .select()
            .single();
            
        if (toolError) {
            log(`Erreur lors de la création de l'outil: ${JSON.stringify(toolError)}`);
            throw toolError;
        }
        
        log(`Outil créé avec succès: ${JSON.stringify(tool)}`);
        
    } catch (error) {
        log('ERREUR FATALE:');
        log(error.message || 'Pas de message d\'erreur');
        log(error.stack || 'Pas de stack trace');
    }
}

main();
