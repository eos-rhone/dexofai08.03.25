const fs = require('fs');
const { createClient } = require('@supabase/supabase-js');
require('dotenv').config();

const log = (message) => {
    const timestamp = new Date().toISOString();
    const logMessage = `${timestamp}: ${message}\n`;
    fs.appendFileSync('debug.log', logMessage);
};

async function main() {
    try {
        log('Démarrage du script de debug');
        log(`SUPABASE_URL: ${process.env.SUPABASE_URL}`);
        
        const supabase = createClient(
            process.env.SUPABASE_URL,
            process.env.SUPABASE_KEY
        );
        
        log('Client Supabase créé');
        
        const { data, error } = await supabase
            .from('tools')
            .select('*');
            
        if (error) {
            log(`ERREUR: ${JSON.stringify(error)}`);
        } else {
            log(`Nombre d'outils trouvés: ${data?.length}`);
            if (data?.[0]) {
                log(`Premier outil: ${JSON.stringify(data[0])}`);
            }
        }
    } catch (error) {
        log(`ERREUR FATALE: ${error.message}`);
        log(error.stack);
    }
}

main();
