import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import slugify from 'slugify';
import { scrapeProductHunt } from './scrapers/producthunt.js';
import { scrapeAlternativeTo } from './scrapers/alternativeto.js';
import { writeFileSync } from 'fs';
import { ScrapedTool } from './types.js';
import fs from 'fs';

// Types
interface AITool {
    name: string;
    description: string;
    category?: string;
    website_url: string;
    image_url?: string;
    monthly_users?: number;
}

interface Category {
    id: string;
    name: string;
    slug: string;
    description?: string;
    icon: string;
}

interface Stats {
    inserted: number;
    updated: number;
    errors: number;
}

// Configuration du logging
function log(message: string, error?: any): void {
    const timestamp = new Date().toISOString();
    const logMessage = `${timestamp} - ${message}${error ? '\n' + JSON.stringify(error, null, 2) : ''}`;
    console.log(logMessage);
    fs.appendFileSync('scraping.log', logMessage + '\n');
}

// Charger les variables d'environnement
dotenv.config();

if (!process.env.SUPABASE_URL || !process.env.SUPABASE_KEY) {
    throw new Error('Les variables d\'environnement SUPABASE_URL et SUPABASE_KEY sont requises');
}

const supabase = createClient(
    process.env.SUPABASE_URL,
    process.env.SUPABASE_KEY
);

// Test de connexion à Supabase
async function testSupabaseConnection() {
    try {
        const { count, error } = await supabase
            .from('ai_tools')
            .select('*', { count: 'exact', head: true });
            
        if (error) throw error;
        log(`Connexion à Supabase OK - ${count} outils dans la base`);
        return true;
    } catch (error) {
        log('Erreur de connexion à Supabase', error);
        return false;
    }
}

// Fonction pour créer un slug unique
function createSlug(name: string): string {
    return slugify(name, {
        lower: true,
        strict: true,
        trim: true
    });
}

// Fonction pour obtenir ou créer une catégorie
async function getOrCreateCategory(categoryName: string): Promise<string> {
    const slug = createSlug(categoryName);
    
    try {
        // Nettoyer le nom de la catégorie
        const cleanName = categoryName
            .replace('/software/', '')
            .split('-')
            .map(word => word.charAt(0).toUpperCase() + word.slice(1))
            .join(' ');
            
        // Mapper certains noms de catégories à des catégories plus générales
        const categoryMapping: { [key: string]: string } = {
            'Chatgpt': 'Chatbots & Assistants',
            'Claude': 'Chatbots & Assistants',
            'Bard': 'Chatbots & Assistants',
            'Pi Ai': 'Chatbots & Assistants',
            'Character Ai': 'Chatbots & Assistants',
            'Replika': 'Chatbots & Assistants',
            
            'Midjourney': 'Génération d\'Images',
            'Dall E': 'Génération d\'Images',
            'Stable Diffusion': 'Génération d\'Images',
            'Leonardo Ai': 'Génération d\'Images',
            'Firefly': 'Génération d\'Images',
            'Dream Studio': 'Génération d\'Images',
            'Imagen': 'Génération d\'Images',
            
            'Github Copilot': 'Génération de Code',
            'Codeium': 'Génération de Code',
            'Tabnine': 'Génération de Code',
            'Amazon Codewhisperer': 'Génération de Code',
            'Replit Ghostwriter': 'Génération de Code',
            
            'Jasper': 'Génération de Texte',
            'Copy Ai': 'Génération de Texte',
            'Notion Ai': 'Génération de Texte',
            'Grammarly': 'Génération de Texte',
            'Wordtune': 'Génération de Texte',
            'Writesonic': 'Génération de Texte',
            'Rytr': 'Génération de Texte',
            
            'Elevenlabs': 'Audio & Voix',
            'Murf': 'Audio & Voix',
            'Resemble Ai': 'Audio & Voix',
            'Play Ht': 'Audio & Voix',
            'Wellsaid Labs': 'Audio & Voix',
            
            'Synthesia': 'Vidéo',
            'Descript': 'Vidéo',
            'Runway': 'Vidéo',
            'D Id': 'Vidéo',
            'Heygen': 'Vidéo',
            'Kaiber': 'Vidéo',
            
            'Mem Ai': 'Productivité',
            'Taskade': 'Productivité',
            'Tome': 'Productivité',
            'Gamma': 'Productivité',
            'Otter Ai': 'Productivité',
            
            'Figma Ai': 'Design',
            'Microsoft Designer': 'Design',
            'Uizard': 'Design',
            'Looka': 'Design',
            'Brandmark': 'Design',
            
            'Elicit': 'Recherche & Analyse',
            'Consensus': 'Recherche & Analyse',
            'Scholarai': 'Recherche & Analyse',
            'Iris Ai': 'Recherche & Analyse',
            'Semantic Scholar': 'Recherche & Analyse'
        };
        
        const mappedCategory = categoryMapping[cleanName] || cleanName;
        
        // Vérifier si la catégorie existe
        const { data: existingCategory, error: selectError } = await supabase
            .from('categories')
            .select('id')
            .eq('slug', createSlug(mappedCategory))
            .single();
            
        if (selectError) {
            log(`Erreur lors de la recherche de la catégorie ${mappedCategory}`, selectError);
            throw selectError;
        }
        
        if (existingCategory) {
            log(`Catégorie existante trouvée: ${mappedCategory}`);
            return existingCategory.id;
        }
        
        // Créer la catégorie si elle n'existe pas
        log(`Création de la catégorie: ${mappedCategory}`);
        const { data: newCategory, error: insertError } = await supabase
            .from('categories')
            .insert({
                name: mappedCategory,
                slug: createSlug(mappedCategory),
                description: `Outils d'IA pour ${mappedCategory.toLowerCase()}`,
                icon: 'default-icon'
            })
            .select('id')
            .single();
            
        if (insertError) {
            log(`Erreur lors de la création de la catégorie ${mappedCategory}`, insertError);
            throw insertError;
        }
        
        if (!newCategory) {
            throw new Error('Nouvelle catégorie créée mais pas de données retournées');
        }
        
        return newCategory.id;
    } catch (error) {
        log(`Erreur avec la catégorie ${categoryName}`, error);
        throw error;
    }
}

// Fonction pour insérer un outil
async function insertTool(tool: ScrapedTool): Promise<keyof Stats> {
    try {
        log(`Traitement de l'outil: ${tool.name}`);
        
        // Obtenir l'ID de la catégorie (utiliser la première catégorie comme principale)
        const categoryId = await getOrCreateCategory(tool.categories[0] || 'Other');
        log(`ID de catégorie obtenu: ${categoryId}`);
        
        // Créer le slug
        const slug = createSlug(tool.name);
        
        // Vérifier si l'outil existe déjà
        const { data: existingTool, error: selectError } = await supabase
            .from('ai_tools')
            .select('id')
            .eq('slug', slug)
            .single();
            
        if (selectError && selectError.code !== 'PGRST116') {
            log(`Erreur lors de la recherche de l'outil ${tool.name}`, selectError);
            throw selectError;
        }
            
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
                
            if (updateError) {
                log(`Erreur lors de la mise à jour de ${tool.name}`, updateError);
                throw updateError;
            }
            return 'updated';
        } else {
            log(`Insertion de ${tool.name}...`);
            const { error: insertError } = await supabase
                .from('ai_tools')
                .insert(toolData);
                
            if (insertError) {
                log(`Erreur lors de l'insertion de ${tool.name}`, insertError);
                throw insertError;
            }
            return 'inserted';
        }
    } catch (error) {
        log(`Erreur pour ${tool.name}`, error);
        return 'errors';
    }
}

// Fonction principale
async function main() {
    try {
        log('Démarrage du script d\'enrichissement...');
        
        // Test de connexion
        const isConnected = await testSupabaseConnection();
        if (!isConnected) {
            throw new Error('Impossible de se connecter à Supabase');
        }
        
        // 1. Scraper ProductHunt
        log('Scraping ProductHunt...');
        const productHuntTools = await scrapeProductHunt();
        log(`Trouvé ${productHuntTools.length} outils sur ProductHunt`);
        
        // 2. AlternativeTo temporairement désactivé
        log('AlternativeTo temporairement désactivé pour éviter le blocage');
        const alternativeToTools: ScrapedTool[] = [];
        
        const allTools = [...productHuntTools, ...alternativeToTools];
        log(`Total d'outils trouvés: ${allTools.length}`);
        
        // Traitement des outils
        for (const tool of allTools) {
            try {
                await insertTool(tool);
            } catch (error) {
                log(`Erreur lors du traitement de l'outil ${tool.name}:`, error);
            }
        }
        
        log('Script terminé avec succès');
    } catch (error) {
        log('Erreur fatale:', error);
        process.exit(1);
    }
}

main().catch(error => {
    log('Erreur non gérée:', error);
    process.exit(1);
});
