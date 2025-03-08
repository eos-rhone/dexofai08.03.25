import axios from 'axios';
import * as cheerio from 'cheerio';
import { ScrapedTool } from '../types.js';

const HEADERS = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8',
    'Accept-Language': 'en-US,en;q=0.9',
    'Accept-Encoding': 'gzip, deflate, br',
    'Connection': 'keep-alive',
    'Upgrade-Insecure-Requests': '1',
    'Sec-Fetch-Dest': 'document',
    'Sec-Fetch-Mode': 'navigate',
    'Sec-Fetch-Site': 'none',
    'Sec-Fetch-User': '?1'
};

async function scrapeAlternativeToPage(url: string): Promise<string[]> {
    try {
        // Ajouter un délai aléatoire entre 2 et 5 secondes
        const delay = Math.floor(Math.random() * 3000) + 2000;
        await new Promise(resolve => setTimeout(resolve, delay));

        const response = await axios.get(url, { headers: HEADERS });
        const $ = cheerio.load(response.data);
        
        return $('.app-list-item')
            .map((_, el) => $(el).find('.app-title').text().trim())
            .get();
    } catch (error) {
        console.error(`Erreur lors du scraping de ${url}:`, error);
        if (error.response?.status === 403) {
            console.error('Accès bloqué par AlternativeTo. Attente de 30 secondes avant de réessayer...');
            await new Promise(resolve => setTimeout(resolve, 30000));
            return scrapeAlternativeToPage(url);
        }
        return [];
    }
}

export async function scrapeAlternativeTo(): Promise<ScrapedTool[]> {
    const BASE_URL = 'https://alternativeto.net';
    const AI_CATEGORIES = [
        // Chatbots et Assistants
        '/software/chatgpt',
        '/software/claude',
        '/software/bard',
        '/software/anthropic-claude',
        '/software/perplexity-ai',
        '/software/pi-ai',
        '/software/character-ai',
        '/software/replika',

        // Génération d'Images
        '/software/midjourney',
        '/software/dall-e',
        '/software/stable-diffusion',
        '/software/leonardo-ai',
        '/software/firefly',
        '/software/canva-text-to-image',
        '/software/dream-studio',
        '/software/imagen',

        // Génération de Code
        '/software/github-copilot',
        '/software/codeium',
        '/software/tabnine',
        '/software/amazon-codewhisperer',
        '/software/replit-ghostwriter',

        // Génération de Texte et Contenu
        '/software/jasper',
        '/software/copy-ai',
        '/software/notion-ai',
        '/software/grammarly',
        '/software/wordtune',
        '/software/writesonic',
        '/software/rytr',

        // Audio et Voix
        '/software/elevenlabs',
        '/software/murf',
        '/software/resemble-ai',
        '/software/play-ht',
        '/software/wellsaid-labs',

        // Vidéo
        '/software/synthesia',
        '/software/descript',
        '/software/runway',
        '/software/d-id',
        '/software/heygen',
        '/software/kaiber',

        // Productivité et Organisation
        '/software/mem-ai',
        '/software/taskade',
        '/software/tome',
        '/software/gamma',
        '/software/otter-ai',

        // Design et Créativité
        '/software/figma-ai',
        '/software/microsoft-designer',
        '/software/uizard',
        '/software/looka',
        '/software/brandmark',

        // Recherche et Analyse
        '/software/elicit',
        '/software/consensus',
        '/software/scholarai',
        '/software/iris-ai',
        '/software/semantic-scholar'
    ];
    
    console.log('Démarrage du scraping AlternativeTo...');
    const tools: ScrapedTool[] = [];
    
    for (const category of AI_CATEGORIES) {
        console.log(`Scraping de la catégorie: ${category}`);
        const alternatives = await scrapeAlternativeToPage(`${BASE_URL}${category}`);
        console.log(`Trouvé ${alternatives.length} alternatives pour ${category}`);
        
        for (const name of alternatives) {
            try {
                // Ajouter un délai aléatoire entre 2 et 5 secondes
                const delay = Math.floor(Math.random() * 3000) + 2000;
                await new Promise(resolve => setTimeout(resolve, delay));

                const response = await axios.get(
                    `${BASE_URL}/software/${name.toLowerCase().replace(/\s+/g, '-')}`,
                    { headers: HEADERS }
                );
                const $ = cheerio.load(response.data);
                
                const description = $('.app-description').text().trim();
                const website = $('.app-website-button').attr('href') || '';
                const imageUrl = $('.app-logo img').attr('src') || '';
                
                // Extraire les tags
                const tags = $('.app-tags .tag')
                    .map((_, el) => $(el).text().trim().toLowerCase())
                    .get();
                
                // Extraire le prix
                const pricingText = $('.app-pricing').text().toLowerCase();
                const pricing = [];
                
                if (pricingText.includes('free')) {
                    pricing.push({ plan_name: 'Free', price: 0 });
                }
                if (pricingText.includes('premium') || pricingText.includes('paid')) {
                    pricing.push({ plan_name: 'Premium', price: -1 });
                }

                // Extraire le nombre d'utilisateurs (likes)
                const likesText = $('.likes-count').text().trim();
                const monthlyUsers = parseInt(likesText) || 0;
                
                tools.push({
                    name,
                    description,
                    website_url: website,
                    pricing: pricing.length > 0 ? pricing : [{ plan_name: 'Unknown', price: -1 }],
                    categories: [category.split('/').pop() || ''],
                    tags,
                    monthly_users: monthlyUsers,
                    image_url: imageUrl,
                    source: 'alternativeto'
                });

            } catch (error) {
                console.error(`Erreur lors du scraping de ${name}:`, error);
                if (error.response?.status === 403) {
                    console.error('Accès bloqué par AlternativeTo. Attente de 30 secondes avant de réessayer...');
                    await new Promise(resolve => setTimeout(resolve, 30000));
                    continue;
                }
            }
        }
    }
    
    console.log(`Scraping AlternativeTo terminé. ${tools.length} outils trouvés.`);
    return tools;
}
