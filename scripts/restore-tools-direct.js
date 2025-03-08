import fetch from 'node-fetch';

const supabaseUrl = 'https://epfmxwovbljqvrrwgmrz.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVwZm14d292YmxqcXZycndnbXJ6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczOTgyODE2NiwiZXhwIjoyMDU1NDA0MTY2fQ.obT14rMpkW0MmE_rAZfSRxZhHntoejpUlUH2IB4Ey_8';

async function fetchWithAuth(endpoint, options = {}) {
  const response = await fetch(`${supabaseUrl}/rest/v1/${endpoint}`, {
    ...options,
    headers: {
      ...options.headers,
      'apikey': supabaseKey,
      'Authorization': `Bearer ${supabaseKey}`
    }
  });

  if (!response.ok) {
    throw new Error(`HTTP error! status: ${response.status}`);
  }

  return response;
}

async function restoreTools() {
  try {
    console.log('Début de la restauration...');

    // Vérifier l'état actuel
    const countResponse = await fetchWithAuth('ai_tools?select=count');
    const beforeCount = await countResponse.json();
    console.log(`Nombre d'outils avant restauration: ${beforeCount.length}`);

    // Nettoyer les tables
    console.log('Nettoyage des tables...');
    await fetchWithAuth('tool_pricing', { method: 'DELETE' });
    await fetchWithAuth('ai_tools', { method: 'DELETE' });

    // Restaurer les catégories
    const categories = [
      { name: 'Agents & Automatisation', slug: 'agents-automatisation', icon: 'Bot' },
      { name: 'Génération de Code', slug: 'generation-code', icon: 'Code' },
      { name: "Génération d'Images", slug: 'generation-images', icon: 'Image' },
      // ... autres catégories
    ];

    console.log('Restauration des catégories...');
    await fetchWithAuth('categories', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(categories)
    });

    // Restaurer les outils depuis les fichiers de sauvegarde
    const tools = [
      {
        name: 'ChatGPT',
        slug: 'chatgpt',
        description: 'Assistant conversationnel avancé basé sur GPT-4',
        website_url: 'https://chat.openai.com',
        category_slug: 'agents-automatisation',
        is_featured: true
      },
      // ... autres outils
    ];

    console.log('Restauration des outils...');
    for (const tool of tools) {
      const categoryResponse = await fetchWithAuth(`categories?slug=eq.${tool.category_slug}`);
      const [category] = await categoryResponse.json();

      if (category) {
        await fetchWithAuth('ai_tools', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            ...tool,
            category_id: category.id
          })
        });
      }
    }

    // Vérifier le résultat
    const finalCountResponse = await fetchWithAuth('ai_tools?select=count');
    const afterCount = await finalCountResponse.json();
    console.log(`Nombre d'outils après restauration: ${afterCount.length}`);

  } catch (error) {
    console.error('Erreur lors de la restauration:', error);
  }
}

restoreTools();
