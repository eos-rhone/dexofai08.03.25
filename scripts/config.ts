import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

// Charger les variables d'environnement
dotenv.config();

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_KEY;
const productHuntKey = process.env.PRODUCTHUNT_API_KEY;

if (!supabaseUrl || !supabaseKey) {
    throw new Error('Supabase configuration manquante');
}

if (!productHuntKey) {
    throw new Error('ProductHunt API key manquante');
}

// Créer le client Supabase avec la configuration appropriée
export const supabase = createClient(supabaseUrl, supabaseKey);
export const config = {
    supabase: {
        url: supabaseUrl,
        key: supabaseKey
    },
    productHunt: {
        key: productHuntKey
    }
};
