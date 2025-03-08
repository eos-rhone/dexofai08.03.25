import axios from 'axios';
import dotenv from 'dotenv';
import fs from 'fs';
import { ScrapedTool } from '../types.js';

dotenv.config();

interface ProductHuntPost {
    name: string;
    description: string;
    website: string;
    thumbnail: {
        url: string;
    };
    topics: {
        name: string;
    }[];
    votesCount: number;
    pricing?: string;
    reviewsCount: number;
    tagline: string;
    commentsCount: number;
}

function log(message: string, error?: any) {
    const timestamp = new Date().toISOString();
    const logMessage = `${timestamp} - ${message}${error ? '\n' + JSON.stringify(error, null, 2) : ''}`;
    console.log(logMessage);
    fs.appendFileSync('producthunt.log', logMessage + '\n');
}

function transformProductHuntData(data: any): ScrapedTool[] {
    const posts = data.data.posts.nodes;
    return posts.map((post: ProductHuntPost) => {
        // Analyse du prix
        const pricing = [];
        if (post.pricing?.toLowerCase().includes('free')) {
            pricing.push({ plan_name: 'Free', price: 0 });
        }
        if (post.pricing?.toLowerCase().includes('premium') || post.pricing?.toLowerCase().includes('paid')) {
            pricing.push({ plan_name: 'Premium', price: -1 });
        }

        // Extraire les catégories pertinentes liées à l'IA
        const aiCategories = post.topics
            .map(topic => topic.name.toLowerCase())
            .filter(topic => 
                topic.includes('ai') || 
                topic.includes('artificial intelligence') ||
                topic.includes('machine learning') ||
                topic.includes('deep learning') ||
                topic.includes('neural') ||
                topic.includes('gpt') ||
                topic.includes('nlp') ||
                topic.includes('computer vision') ||
                topic.includes('chatbot') ||
                topic.includes('automation')
            );

        return {
            name: post.name,
            description: post.tagline || post.description,
            website_url: post.website,
            pricing: pricing.length > 0 ? pricing : [{ plan_name: 'Unknown', price: -1 }],
            categories: aiCategories.length > 0 ? aiCategories : ['AI Tools'],
            tags: post.topics.map(topic => topic.name.toLowerCase()),
            monthly_users: post.votesCount,
            image_url: post.thumbnail?.url,
            source: 'producthunt'
        };
    }).filter(tool => tool.categories.length > 0); // Ne garder que les outils avec des catégories
}

export async function scrapeProductHunt(): Promise<ScrapedTool[]> {
    const API_KEY = process.env.PRODUCTHUNT_API_KEY;
    if (!API_KEY) {
        log('PRODUCTHUNT_API_KEY non définie dans les variables d\'environnement');
        return [];
    }

    log(`API Key trouvée: ${API_KEY.substring(0, 5)}...`);
    const BASE_URL = 'https://api.producthunt.com/v2/api/graphql';
    
    const query = `
        query {
            posts(
                topic: "artificial-intelligence",
                first: 100,
                order: RANKING,
                featured: true
            ) {
                nodes {
                    name
                    tagline
                    description
                    website
                    thumbnail {
                        url
                    }
                    topics {
                        name
                    }
                    votesCount
                    reviewsCount
                    commentsCount
                    pricing
                }
            }
        }
    `;
    
    try {
        log('Envoi de la requête à ProductHunt...');
        const response = await axios.post(BASE_URL, 
            { query },
            { 
                headers: { 
                    'Authorization': `Bearer ${API_KEY}`,
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                } 
            }
        );
        
        log('Réponse reçue de ProductHunt');
        
        if (!response.data?.data?.posts?.nodes) {
            log('Format de réponse ProductHunt invalide:', response.data);
            return [];
        }

        const tools = transformProductHuntData(response.data);
        log(`${tools.length} outils trouvés sur ProductHunt`);
        return tools;
    } catch (error) {
        log('Erreur lors du scraping de ProductHunt:', error);
        if (error.response?.data) {
            log('Détails de l\'erreur:', error.response.data);
        }
        return [];
    }
}
