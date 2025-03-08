import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
import { aiTools, aiToolsPart2, aiToolsPart3, aiToolsPart4, aiToolsPart5, aiToolsPart6 } from './data/aiTools';

dotenv.config();

const supabase = createClient(
    process.env.SUPABASE_URL!,
    process.env.SUPABASE_KEY!
);

interface Tool {
    name: string;
    description: string;
    website_url: string;
    category: string;
    image_url?: string;
    pricing?: { plan_name: string; price: number }[];
}

async function addTool(tool: Tool) {
    try {
        // 1. Créer ou récupérer la catégorie
        const { data: category, error: categoryError } = await supabase
            .from('categories')
            .select('id')
            .eq('name', tool.category)
            .single();

        if (categoryError) {
            // Créer la catégorie si elle n'existe pas
            const { data: newCategory, error: createError } = await supabase
                .from('categories')
                .insert({
                    name: tool.category,
                    slug: tool.category.toLowerCase().replace(/\s+/g, '-'),
                    description: `Outils d'IA pour ${tool.category.toLowerCase()}`,
                    icon: 'default-icon'
                })
                .select('id')
                .single();

            if (createError) throw createError;
            var categoryId = newCategory.id;
        } else {
            var categoryId = category.id;
        }

        // 2. Ajouter l'outil
        const { error: toolError } = await supabase
            .from('ai_tools')
            .insert({
                name: tool.name,
                description: tool.description,
                website_url: tool.website_url,
                category_id: categoryId,
                image_url: tool.image_url || 'default-image.png',
                pricing: tool.pricing || [{ plan_name: 'Unknown', price: -1 }],
                is_verified: false,
                monthly_users: 0,
                total_reviews: 0,
                average_rating: null
            });

        if (toolError) throw toolError;
        console.log(`✅ Ajouté: ${tool.name} dans la catégorie ${tool.category}`);

    } catch (error) {
        console.error(`❌ Erreur avec ${tool.name}:`, error);
    }
}

// Combiner tous les outils
const allTools = [
    ...aiTools,
    ...aiToolsPart2,
    ...aiToolsPart3,
    ...aiToolsPart4,
    ...aiToolsPart5,
    ...aiToolsPart6
];

// Fonction principale
async function main() {
    console.log("Démarrage de l'ajout des outils...");
    for (const tool of allTools) {
        try {
            await addTool(tool);
            console.log(`Outil ajouté avec succès : ${tool.name}`);
        } catch (error) {
            console.error(`Erreur lors de l'ajout de l'outil ${tool.name}:`, error);
        }
    }
    console.log("Terminé !");
}

// Exécuter la fonction principale
main().catch(console.error);
