import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';
import fs from 'fs';

// Charger les variables d'environnement
dotenv.config();

const supabase = createClient(
  process.env.VITE_SUPABASE_URL,
  process.env.VITE_SUPABASE_ANON_KEY
);

async function restoreTools() {
  try {
    console.log('Début de la restauration des outils...');

    // Lire les fichiers de migration
    const migrationsDir = path.join(path.dirname(fileURLToPath(import.meta.url)), '../supabase/migrations');
    const migrationFiles = fs.readdirSync(migrationsDir)
      .filter(file => file.includes('insert_ai_tools_batch') && file.endsWith('.sql'));

    console.log(`Fichiers de migration trouvés: ${migrationFiles.length}`);

    // Réinitialiser la table ai_tools
    const { error: truncateError } = await supabase
      .from('ai_tools')
      .delete()
      .neq('id', '00000000-0000-0000-0000-000000000000');

    if (truncateError) {
      throw new Error(`Erreur lors de la réinitialisation: ${truncateError.message}`);
    }

    // Traiter chaque fichier de migration
    for (const file of migrationFiles) {
      const content = fs.readFileSync(path.join(migrationsDir, file), 'utf8');
      console.log(`Traitement du fichier: ${file}`);

      // Extraire les données d'insertion
      const matches = content.match(/VALUES\s+\(([\s\S]+?)\)/);
      if (matches && matches[1]) {
        const values = matches[1].split('),\n    (');
        
        for (const value of values) {
          const [name, description, website_url, category_name, pricing] = value
            .replace(/^\(|\)$/g, '')
            .split(',')
            .map(v => v.trim().replace(/^'|'$/g, ''));

          // Récupérer l'ID de la catégorie
          const { data: categoryData } = await supabase
            .from('categories')
            .select('id')
            .eq('name', category_name)
            .single();

          if (categoryData) {
            // Insérer l'outil
            const { error: insertError } = await supabase
              .from('ai_tools')
              .insert({
                name,
                slug: name.toLowerCase().replace(/\s+/g, '-'),
                description,
                website_url,
                category_id: categoryData.id,
                pricing: JSON.parse(pricing),
                is_active: true,
                is_featured: false
              });

            if (insertError) {
              console.error(`Erreur lors de l'insertion de ${name}: ${insertError.message}`);
            } else {
              console.log(`Outil inséré avec succès: ${name}`);
            }
          }
        }
      }
    }

    console.log('Restauration terminée !');

    // Vérifier le nombre total d'outils
    const { data: count } = await supabase
      .from('ai_tools')
      .select('*', { count: 'exact' });

    console.log(`Nombre total d'outils après restauration: ${count?.length || 0}`);

  } catch (error) {
    console.error('Erreur lors de la restauration:', error);
  }
}

restoreTools();
