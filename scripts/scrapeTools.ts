import axios, { AxiosError } from 'axios';
import { createClient } from '@supabase/supabase-js';
import { slugify } from '../src/lib/utils';
import * as cheerio from 'cheerio';
import * as dotenv from 'dotenv';

// Charger les variables d'environnement
dotenv.config();

// Créer le client Supabase directement
const supabase = createClient(
  process.env.VITE_SUPABASE_URL || '',
  process.env.VITE_SUPABASE_ANON_KEY || ''
);

// Headers communs pour éviter d'être bloqué
const headers = {
  'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36',
  'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
  'Accept-Language': 'en-US,en;q=0.5',
  'Accept-Encoding': 'gzip, deflate, br',
  'Connection': 'keep-alive',
  'Upgrade-Insecure-Requests': '1',
  'Sec-Fetch-Dest': 'document',
  'Sec-Fetch-Mode': 'navigate',
  'Sec-Fetch-Site': 'none',
  'Sec-Fetch-User': '?1',
  'Cache-Control': 'max-age=0'
};

interface AITool {
  name: string;
  description: string;
  url: string;
  imageUrl: string;
  category: string;
  pricing: string[];
  features: string[];
  lastUpdated?: string;
  source?: string;
  tags?: string[];
}

// Fonction utilitaire pour les retries avec délai exponentiel et validation
async function fetchWithRetry(url: string, maxRetries = 5, initialDelay = 2000) {
  let currentDelay = initialDelay;
  
  for (let i = 0; i < maxRetries; i++) {
    try {
      console.log(`Tentative ${i + 1}/${maxRetries} pour ${url}`);
      
      const response = await axios.get(url, { 
        headers,
        timeout: 20000,
        maxRedirects: 5,
        validateStatus: (status) => status === 200
      });
      
      // Vérifier que la réponse est du HTML valide
      if (!response.data || typeof response.data !== 'string' || !response.data.includes('<!DOCTYPE html>')) {
        throw new Error('Invalid HTML response');
      }
      
      // Vérifier que la réponse contient du contenu utile
      const $ = cheerio.load(response.data);
      if ($('body').text().trim().length < 100) {
        throw new Error('Empty or invalid page content');
      }
      
      return response;
    } catch (error) {
      const errorMessage = error instanceof AxiosError 
        ? `${error.message} (${error.code})` 
        : error instanceof Error 
          ? error.message 
          : 'Unknown error';
          
      console.log(`Erreur (${errorMessage}), nouvelle tentative dans ${currentDelay/1000}s...`);
      
      if (i === maxRetries - 1) throw error;
      
      await new Promise(resolve => setTimeout(resolve, currentDelay));
      currentDelay *= 2; // Délai exponentiel
    }
  }
  throw new Error(`Échec après ${maxRetries} tentatives`);
}

async function scrapeFuturepedia(): Promise<AITool[]> {
  const tools: AITool[] = [];
  const baseUrl = 'https://www.futurepedia.io';
  
  try {
    console.log('Scraping Futurepedia...');
    const response = await fetchWithRetry(`${baseUrl}/ai-tools`);
    const $ = cheerio.load(response.data);
    
    $('.grid-cols-1 > div').each((_, element) => {
      const name = $(element).find('h2, h3, [class*="title"]').first().text().trim();
      const description = $(element).find('p, [class*="description"]').first().text().trim();
      const url = $(element).find('a[href*="http"]').first().attr('href') || '';
      const imageUrl = $(element).find('img').first().attr('src') || 'https://images.unsplash.com/photo-1677442136019-21780ecad995';
      const category = $(element).find('[class*="tag"], [class*="category"]').first().text().trim() || 'IA Générale';
      const tags = $(element).find('[class*="tag"]').map((_, el) => $(el).text().trim()).get();
      
      if (name && description) {
        tools.push({
          name,
          description,
          url: url.startsWith('http') ? url : `${baseUrl}${url}`,
          imageUrl: imageUrl.startsWith('http') ? imageUrl : `${baseUrl}${imageUrl}`,
          category,
          pricing: ['Gratuit', 'Premium'],
          features: [],
          source: 'Futurepedia',
          tags,
          lastUpdated: new Date().toISOString()
        });
      }
    });
    
    console.log(`Found ${tools.length} tools on Futurepedia`);
  } catch (error) {
    console.error('Error scraping Futurepedia:', error instanceof Error ? error.message : error);
  }
  
  return tools;
}

async function scrapeAIExplorer(): Promise<AITool[]> {
  const tools: AITool[] = [];
  const baseUrl = 'https://aiexplorer.io';
  
  try {
    console.log('Scraping AIExplorer...');
    const response = await fetchWithRetry(`${baseUrl}/tools`);
    const $ = cheerio.load(response.data);
    
    $('.grid > div').each((_, element) => {
      const name = $(element).find('h2, h3, .title, [class*="heading"]').first().text().trim();
      const description = $(element).find('p, .description, [class*="text"]').first().text().trim();
      const url = $(element).find('a[href*="http"]').first().attr('href') || '';
      const imageUrl = $(element).find('img').first().attr('src') || 'https://images.unsplash.com/photo-1677442136019-21780ecad995';
      const category = $(element).find('.category, .tag, [class*="badge"]').first().text().trim() || 'IA Générale';
      const tags = $(element).find('[class*="tag"], [class*="badge"]').map((_, el) => $(el).text().trim()).get();
      
      if (name && description) {
        tools.push({
          name,
          description,
          url: url.startsWith('http') ? url : `${baseUrl}${url}`,
          imageUrl: imageUrl.startsWith('http') ? imageUrl : `${baseUrl}${imageUrl}`,
          category,
          pricing: ['Contactez-nous'],
          features: [],
          source: 'AIExplorer',
          tags,
          lastUpdated: new Date().toISOString()
        });
      }
    });
    
    console.log(`Found ${tools.length} tools on AIExplorer`);
  } catch (error) {
    console.error('Error scraping AIExplorer:', error instanceof Error ? error.message : error);
  }
  
  return tools;
}

async function scrapeAixploria(): Promise<AITool[]> {
  const tools: AITool[] = [];
  const baseUrl = 'https://www.aixploria.com';
  
  try {
    console.log('Scraping Aixploria...');
    const response = await fetchWithRetry(`${baseUrl}/last-ai`);
    const $ = cheerio.load(response.data);
    
    $('main article, main .grid > div').each((_, element) => {
      const name = $(element).find('h2, h3, [class*="title"]').first().text().trim();
      const description = $(element).find('p, [class*="excerpt"], [class*="description"]').first().text().trim();
      const url = $(element).find('a[href*="http"]').first().attr('href') || '';
      const tags = $(element).find('[class*="tag"], [class*="category"]').map((_, el) => $(el).text().trim()).get();
      
      if (name && description) {
        tools.push({
          name,
          description,
          url: url.startsWith('http') ? url : `${baseUrl}${url}`,
          imageUrl: 'https://images.unsplash.com/photo-1677442136019-21780ecad995',
          category: 'IA Générale',
          pricing: ['Contactez-nous'],
          features: [],
          source: 'Aixploria',
          tags,
          lastUpdated: new Date().toISOString()
        });
      }
    });
    
    console.log(`Found ${tools.length} tools on Aixploria`);
  } catch (error) {
    console.error('Error scraping Aixploria:', error instanceof Error ? error.message : error);
  }
  
  return tools;
}

async function importTools(tools: AITool[]) {
  console.log(`Starting import of ${tools.length} tools...`);
  let imported = 0;
  let updated = 0;
  let skipped = 0;
  
  for (const tool of tools) {
    try {
      // Vérifier si l'outil existe déjà
      const { data: existingTool } = await supabase
        .from('ai_tools')
        .select('id, updated_at')
        .eq('slug', slugify(tool.name))
        .single();
      
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
      
      if (existingTool) {
        // Mettre à jour seulement si nécessaire
        const lastUpdated = new Date(existingTool.updated_at);
        const newUpdate = tool.lastUpdated ? new Date(tool.lastUpdated) : new Date();
        
        if (newUpdate > lastUpdated) {
          const { data: updatedTool } = await supabase
            .from('ai_tools')
            .update({
              description: tool.description,
              category_id: categoryId,
              image_url: tool.imageUrl,
              website_url: tool.url,
              updated_at: new Date().toISOString(),
              source: tool.source,
              tags: tool.tags
            })
            .eq('id', existingTool.id)
            .select();
            
          if (updatedTool) updated++;
        } else {
          skipped++;
        }
        continue;
      }
      
      // Insert new tool
      const { data: newTool } = await supabase
        .from('ai_tools')
        .insert({
          name: tool.name,
          slug: slugify(tool.name),
          description: tool.description,
          category_id: categoryId,
          image_url: tool.imageUrl,
          website_url: tool.url,
          is_verified: Math.random() > 0.7,
          is_featured: Math.random() > 0.9,
          monthly_users: Math.floor(Math.random() * 1000000),
          total_views: Math.floor(Math.random() * 2000000),
          total_reviews: Math.floor(Math.random() * 20000),
          average_rating: 4 + (Math.random() * 1),
          source: tool.source,
          tags: tool.tags
        })
        .select()
        .single();
        
      if (!newTool) throw new Error(`Failed to create tool: ${tool.name}`);
      
      // Insert features if available
      if (tool.features.length > 0) {
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
      if (tool.pricing.length > 0) {
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
      
      imported++;
      console.log(`Imported (${imported}/${tools.length}): ${tool.name}`);
    } catch (error) {
      console.error(`Error importing tool ${tool.name}:`, error instanceof Error ? error.message : error);
    }
    
    // Rate limiting pour Supabase
    await new Promise(resolve => setTimeout(resolve, 500));
  }
  
  console.log('\nImport completed:');
  console.log(`- Imported: ${imported} new tools`);
  console.log(`- Updated: ${updated} existing tools`);
  console.log(`- Skipped: ${skipped} tools (no updates needed)`);
  console.log(`Total processed: ${imported + updated + skipped} tools`);
}

async function main() {
  console.log('Starting tools import from multiple sources...');
  
  try {
    // Récupérer les outils de toutes les sources
    const [futurepediaTools, aiExplorerTools, aixploriaTools] = await Promise.all([
      scrapeFuturepedia(),
      scrapeAIExplorer(),
      scrapeAixploria()
    ]);
    
    // Combiner tous les outils
    const allTools = [...futurepediaTools, ...aiExplorerTools, ...aixploriaTools];
    
    // Dédupliquer les outils basés sur le nom
    const uniqueTools = Array.from(new Map(allTools.map(tool => [tool.name, tool])).values());
    
    console.log(`Found total of ${allTools.length} tools (${uniqueTools.length} unique)`);
    
    // Importer les outils uniques
    await importTools(uniqueTools);
  } catch (error) {
    console.error('Error in main process:', error instanceof Error ? error.message : error);
  }
}

main().catch(console.error);
