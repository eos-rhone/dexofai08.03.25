import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import { aiTools, aiToolsPart2, aiToolsPart3, aiToolsPart4, aiToolsPart5, aiToolsPart6 } from './data/aiTools.js';

dotenv.config();

const supabase = createClient(
    process.env.SUPABASE_URL,
    process.env.SUPABASE_KEY
);

// Combiner tous les outils
const allTools = [
    ...aiTools,
    ...aiToolsPart2,
    ...aiToolsPart3,
    ...aiToolsPart4,
    ...aiToolsPart5,
    ...aiToolsPart6
];

// Fonction pour attendre un certain temps
const wait = (ms) => new Promise(resolve => setTimeout(resolve, ms));

async function addTool(tool) {
    try {
        // Attendre un peu avant chaque requête
        await wait(1000);

        // 1. Créer ou récupérer la catégorie
        const { data: category, error: categoryError } = await supabase
            .from('categories')
            .select('id')
            .eq('name', tool.category)
            .single();

        if (categoryError) {
            // Attendre un peu avant de créer la catégorie
            await wait(1000);

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

        // Attendre un peu avant d'ajouter l'outil
        await wait(1000);

        // 2. Ajouter l'outil
        const { error: toolError } = await supabase
            .from('ai_tools')
            .insert({
                name: tool.name,
                slug: tool.name.toLowerCase().replace(/\s+/g, '-'),
                description: tool.description,
                website_url: tool.website_url,
                image_url: tool.image_url || null,
                category_id: categoryId,
                pricing: tool.pricing,
                is_active: true,
                is_featured: false
            });

        if (toolError) throw toolError;

        // 3. Ajouter les prix
        if (tool.pricing && tool.pricing.length > 0) {
            const { error: pricingError } = await supabase
                .from('pricing')
                .insert(
                    tool.pricing.map(price => ({
                        tool_id: toolData[0].id,
                        plan_name: price.plan_name,
                        price: price.price
                    }))
                );

            if (pricingError) throw pricingError;
        }
        console.log(`Outil ajouté avec succès: ${tool.name}`);
    } catch (error) {
        console.error(`Erreur lors de l'ajout de l'outil ${tool.name}:`, error);
    }
}

// Fonction principale
async function main() {
    console.log("Démarrage de l'ajout des outils...");
    // Attendre 5 secondes avant de commencer pour s'assurer que le schéma est à jour
    console.log("Attente de 5 secondes pour la mise à jour du schéma...");
    await wait(5000);

    for (const tool of allTools) {
        console.log(`Adding tool: ${tool.name}`);
        await addTool(tool);
    }
    console.log("Terminé !");
}

main().catch(console.error);
