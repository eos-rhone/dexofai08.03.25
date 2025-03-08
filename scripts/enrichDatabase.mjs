import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
import slugify from 'slugify';
import { scrapeProductHunt } from './scrapers/producthunt.js';
import { scrapeAlternativeTo } from './scrapers/alternativeto.js';
import { writeFileSync } from 'fs';

// Configuration du logging
const log = (message) => {
    const timestamp = new Date().toISOString();
    const logMessage = `${timestamp}: ${message}\n`;
    console.log(logMessage);
    writeFileSync('enrich.log', logMessage, { flag: 'a' });
};

// Charger les variables d'environnement
dotenv.config();

const supabase = createClient(
    process.env.SUPABASE_URL,
    process.env.SUPABASE_KEY
);

// Fonction pour créer un slug unique
function createSlug(name) {
    return slugify(name, {
        lower: true,
        strict: true,
        trim: true
    });
}

// Fonction pour obtenir ou créer une catégorie
async function getOrCreateCategory(categoryName) {
    const slug = createSlug(categoryName);
    
    try {
        // Vérifier si la catégorie existe
        const { data: existingCategory } = await supabase
            .from('categories')
            .select('id')
            .eq('slug', slug)
            .single();
        
        if (existingCategory) {
            log(`Catégorie existante trouvée: ${categoryName}`);
            return existingCategory.id;
        }
        
        // Créer la catégorie si elle n'existe pas
        log(`Création de la catégorie: ${categoryName}`);
        const { data: newCategory, error } = await supabase
            .from('categories')
            .insert({
                name: categoryName,
                slug: slug,
                description: `Tools related to ${categoryName}`,
                icon: 'default-icon'
            })
            .select('id')
            .single();
            
        if (error) {
            throw error;
        }
        
        return newCategory.id;
    } catch (error) {
        log(`Erreur avec la catégorie ${categoryName}: ${error.message}`);
        throw error;
    }
}

// Fonction pour insérer un outil
async function insertTool(tool) {
    try {
        // Obtenir l'ID de la catégorie
        const categoryId = await getOrCreateCategory(tool.category || 'Other');
        
        // Créer le slug
        const slug = createSlug(tool.name);
        
        // Vérifier si l'outil existe déjà
        const { data: existingTool } = await supabase
            .from('ai_tools')
            .select('id')
            .eq('slug', slug)
            .single();
            
        // Préparer les données de l'outil
        const toolData = {
            name: tool.name,
            slug: slug,
            description: tool.description,
            category_id: categoryId,
            website_url: tool.website_url,
            image_url: tool.image_url,
            is_verified: false,
            is_featured: false,
            monthly_users: tool.monthly_users || 0,
            total_views: 0,
            average_rating: null,
            total_reviews: 0
        };
        
        if (existingTool) {
            log(`Mise à jour de ${tool.name}...`);
            const { error: updateError } = await supabase
                .from('ai_tools')
                .update(toolData)
                .eq('id', existingTool.id);
                
            if (updateError) throw updateError;
            return 'updated';
        } else {
            log(`Insertion de ${tool.name}...`);
            const { error: insertError } = await supabase
                .from('ai_tools')
                .insert(toolData);
                
            if (insertError) throw insertError;
            return 'inserted';
        }
    } catch (error) {
        log(`Erreur pour ${tool.name}: ${error.message}`);
        return 'error';
    }
}

// Fonction principale
async function main() {
    try {
        log('=== Démarrage de l\'enrichissement de la base de données ===');
        
        // 1. Scraper ProductHunt
        log('Scraping ProductHunt...');
        const productHuntTools = await scrapeProductHunt();
        log(`Trouvé ${productHuntTools.length} outils sur ProductHunt`);
        
        // 2. Scraper AlternativeTo
        log('\nScraping AlternativeTo...');
        const alternativeToTools = await scrapeAlternativeTo();
        log(`Trouvé ${alternativeToTools.length} outils sur AlternativeTo`);
        
        const allTools = [...productHuntTools, ...alternativeToTools];
        log(`\nTotal d'outils trouvés: ${allTools.length}`);
        
        // 3. Insérer les outils
        log('\nInsertion des outils dans la base de données...');
        let stats = {
            inserted: 0,
            updated: 0,
            errors: 0
        };
        
        for (const tool of allTools) {
            const result = await insertTool(tool);
            stats[result]++;
        }
        
        // 4. Rapport final
        log('\n=== Rapport Final ===');
        log(`Total d'outils trouvés: ${allTools.length}`);
        log(`Outils insérés: ${stats.inserted}`);
        log(`Outils mis à jour: ${stats.updated}`);
        log(`Erreurs: ${stats.errors}`);
        
        // Vérifier le nombre total d'outils
        const { count } = await supabase
            .from('ai_tools')
            .select('*', { count: 'exact', head: true });
        
        log(`Nombre total d'outils dans la base: ${count}`);
        
    } catch (error) {
        log(`ERREUR FATALE: ${error.message}`);
        if (error.stack) log(error.stack);
    }
}

main();
