import { createClient } from '@supabase/supabase-js';
import { slugify } from '../src/lib/utils';
import * as dotenv from 'dotenv';

// Charger les variables d'environnement
dotenv.config();

// Créer le client Supabase
const supabase = createClient(
  process.env.VITE_SUPABASE_URL || '',
  process.env.VITE_SUPABASE_ANON_KEY || ''
);

interface ManualTool {
  name: string;
  category: string;
  description?: string;
  url?: string;
  imageUrl?: string;
  pricing?: string[];
  features?: string[];
}

async function importManualTool(tool: ManualTool) {
  try {
    // Get or create category
    const { data: category } = await supabase
      .from('categories')
      .select('id')
      .eq('slug', slugify(tool.category))
      .single();
    
    let categoryId;
    
    if (!category) {
      const { data: newCategory } = await supabase
        .from('categories')
        .insert({
          name: tool.category,
          slug: slugify(tool.category),
          description: `Outils d'IA pour ${tool.category}`,
          icon: 'Zap'
        })
        .select()
        .single();
        
      if (!newCategory) throw new Error(`Failed to create category: ${tool.category}`);
      categoryId = newCategory.id;
    } else {
      categoryId = category.id;
    }
    
    // Insert tool
    const { data: newTool, error } = await supabase
      .from('ai_tools')
      .insert({
        name: tool.name,
        slug: slugify(tool.name),
        description: tool.description || `${tool.name} - Outil d'IA pour ${tool.category}`,
        category_id: categoryId,
        image_url: tool.imageUrl || 'https://images.unsplash.com/photo-1677442136019-21780ecad995',
        website_url: tool.url || '#',
        is_verified: true,
        is_featured: false,
        monthly_users: Math.floor(Math.random() * 1000000),
        total_views: Math.floor(Math.random() * 2000000),
        total_reviews: Math.floor(Math.random() * 20000),
        average_rating: 4 + (Math.random() * 1),
        source: 'Manual Import'
      })
      .select()
      .single();
      
    if (error) throw error;
    if (!newTool) throw new Error(`Failed to create tool: ${tool.name}`);
    
    // Insert features if available
    if (tool.features && tool.features.length > 0) {
      await supabase
        .from('tool_features')
        .insert(
          tool.features.map(feature => ({
            tool_id: newTool.id,
            name: feature,
            description: feature
          }))
        );
    }
    
    // Insert pricing if available
    if (tool.pricing && tool.pricing.length > 0) {
      await supabase
        .from('tool_pricing')
        .insert(
          tool.pricing.map((plan, index) => ({
            tool_id: newTool.id,
            plan_name: plan,
            price: index === 0 ? 0 : Math.floor(Math.random() * 100),
            billing_period: 'monthly',
            features: [`Feature ${index + 1}`, `Feature ${index + 2}`]
          }))
        );
    }
    
    console.log(`✅ Imported: ${tool.name}`);
    return newTool;
    
  } catch (error) {
    console.error(`❌ Error importing ${tool.name}:`, error);
    return null;
  }
}

// Exemple d'utilisation
const tools: ManualTool[] = [
  {
    name: "ChatGPT",
    category: "Assistants & Chatbots",
    description: "Assistant conversationnel avancé basé sur GPT-4",
    url: "https://chat.openai.com",
    imageUrl: "https://images.unsplash.com/photo-1677442136019-21780ecad995",
    pricing: ["Gratuit", "Plus", "Enterprise"],
    features: ["Chat en temps réel", "Génération de code", "Analyse de données"]
  }
];

async function importTools() {
  console.log('🚀 Démarrage de l\'import manuel...\n');
  
  for (const tool of tools) {
    await importManualTool(tool);
  }
  
  console.log('\n✨ Import terminé !');
}

importTools().catch(console.error);
