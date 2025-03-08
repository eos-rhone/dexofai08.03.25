import os
import re
from pathlib import Path

# Mapping des catégories
CATEGORY_MAPPING = {
    'developpement': 'development',
    'développement': 'development',
    'generation-code': 'development',
    'generation-de-code': 'development',
    'données-&-préparation': 'data',
    'outils-donnees': 'data',
    'data-analysis': 'data',
    'generation-images': 'image-generation',
    'voix-parole': 'voice',
    'redaction-contenu': 'writing',
    'rh-recrutement': 'hr',
    'science-recherche': 'research',
    'recherche': 'research',
    'sante': 'health',
    'iot-robotique': 'robotics',
    'juridique': 'legal',
    'meteo': 'weather',
    'mode-style': 'fashion',
    'sport-fitness': 'fitness',
    'traduction': 'translation',
    'video-animation': 'video',
    'chatbots-assistants': 'chatbots',
    'assistants-chatbots': 'chatbots',
}

def fix_category_name(category):
    """Standardise les noms de catégories"""
    # Si c'est une URL ou un UUID, mettre en Unknown
    if category.startswith('http') or re.match(r'^[0-9a-f-]{36}$', category):
        return 'unknown'
        
    # Nettoie la catégorie
    category = category.lower().strip()
    category = category.replace('é', 'e').replace('è', 'e').replace('à', 'a')
    category = re.sub(r'[^a-z0-9-]', '-', category)
    category = re.sub(r'-+', '-', category)
    category = category.strip('-')
    
    # Applique le mapping des catégories
    return CATEGORY_MAPPING.get(category, category)

def guess_category(name, description=''):
    """Devine la catégorie basée sur le nom et la description"""
    name_lower = name.lower()
    desc_lower = description.lower()
    
    # Mots-clés pour chaque catégorie
    keywords = {
        'text': ['gpt', 'llm', 'claude', 'llama', 'language', 'text', 'nlp'],
        'development': ['copilot', 'coder', 'code', 'dev', 'programming', 'github'],
        'image-generation': ['image', 'diffusion', 'stable', 'dall', 'midjourney', 'photo'],
        'voice': ['voice', 'speech', 'audio', 'sound', 'music', 'podcast'],
        'research': ['research', 'paper', 'academic', 'science', 'study'],
        'chatbots': ['chat', 'assistant', 'bot', 'conversation'],
        'data': ['data', 'analytics', 'database', 'sql', 'excel', 'spreadsheet'],
        'video': ['video', 'animation', 'movie', 'film'],
        'writing': ['write', 'writing', 'content', 'blog', 'article', 'copy'],
        'marketing': ['marketing', 'seo', 'ads', 'advertising'],
        'design': ['design', 'ui', 'ux', 'graphic', 'logo'],
        'productivity': ['productivity', 'workflow', 'automation', 'task'],
        'education': ['education', 'learning', 'teach', 'student', 'course'],
        'finance': ['finance', 'trading', 'stock', 'crypto', 'money'],
        'health': ['health', 'medical', 'doctor', 'healthcare'],
        'music': ['music', 'song', 'audio', 'sound', 'melody'],
        'gaming': ['game', 'gaming', 'play', 'entertainment'],
        'social': ['social', 'media', 'network', 'community'],
        'security': ['security', 'privacy', 'protection', 'cyber'],
        'legal': ['legal', 'law', 'attorney', 'contract'],
    }
    
    # Cherche les mots-clés dans le nom et la description
    for category, words in keywords.items():
        if any(word in name_lower for word in words) or any(word in desc_lower for word in words):
            return category
    
    return 'unknown'

def process_sql_files():
    current_dir = Path(__file__).parent
    migrations_dir = current_dir.parent / 'supabase' / 'migrations'
    output_file = migrations_dir / '20250303155000_deduplicated_tools.sql'
    
    # Dictionnaire pour stocker les outils uniques
    tools = {}
    
    print("Processing SQL files...")
    
    # Parcours tous les fichiers SQL
    sql_files = list(migrations_dir.glob('*.sql'))
    print(f"\nFound {len(sql_files)} SQL files")
    
    # Filtre les fichiers qui contiennent probablement des outils
    relevant_files = [f for f in sql_files if any(x in f.name.lower() for x in ['batch', 'tools', 'insert'])]
    print(f"Found {len(relevant_files)} relevant files that might contain tools:")
    for f in relevant_files:
        print(f"- {f.name}")
        
    for file in relevant_files:
        # Ignore les fichiers qui ne contiennent pas d'insertions d'outils
        if any(x in file.name.lower() for x in ['combined', 'final', 'fixed', 'deduplicated']):
            print(f"\nSkipping {file.name} (excluded by name)")
            continue
            
        print(f"\nProcessing {file.name}...")
        try:
            with open(file, 'r', encoding='utf-8') as f:
                content = f.read()
                
                # Vérifie si le fichier contient des insertions d'outils
                if 'INSERT INTO' not in content or 'ai_tools' not in content:
                    print("  No tool insertions found, skipping")
                    continue
                
                # Trouve toutes les insertions d'outils
                matches = list(re.finditer(r"INSERT INTO.*?ai_tools.*?VALUES\s*\((.*?)\)", content, re.DOTALL))
                if not matches:
                    print("  No tool insertions found after regex, skipping")
                    continue
                    
                print(f"  Found {len(matches)} tool insertions")
                for match in matches:
                    values = match.group(1)
                    
                    # Extrait les valeurs entre guillemets simples
                    parts = re.findall(r"'((?:''|[^'])*)'", values)
                    
                    if len(parts) >= 4:
                        name = parts[0].replace("''", "'")
                        description = parts[2].replace("''", "'") if len(parts) > 2 else ''
                        category = parts[-2].replace("''", "'") if len(parts) > 4 else 'unknown'
                        
                        # Nettoie et standardise la catégorie
                        category = fix_category_name(category)
                        
                        # Si la catégorie est unknown, essaie de la deviner
                        if category == 'unknown':
                            category = guess_category(name, description)
                        
                        # Crée une clé unique basée sur le nom
                        key = name.lower().strip()
                        
                        # Stocke l'insertion SQL complète
                        if key not in tools:
                            tools[key] = (name, category, values)
                            print(f"  Added tool: {name} ({category})")
                        else:
                            print(f"  Skipped duplicate tool: {name}")
        except Exception as e:
            print(f"Error processing {file}: {e}")
            continue
    
    print(f"\nFound {len(tools)} unique tools")
    
    # Compte les outils par catégorie
    categories = {}
    for name, category, _ in tools.values():
        categories[category] = categories.get(category, 0) + 1
    
    print("\nTools by category:")
    for category, count in sorted(categories.items()):
        print(f"{category}: {count}")
    
    # Génère le nouveau fichier SQL
    print(f"\nWriting to {output_file}")
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write('-- Deduplicated AI tools\n')
        f.write('BEGIN;\n\n')
        
        # Écrit les insertions d'outils
        for name, category, values in sorted(tools.values()):
            # Remplace la catégorie dans les valeurs
            values = re.sub(r"'[^']*'(?=\s*\))", f"'{category}'", values)
            
            f.write(f"INSERT INTO public.ai_tools VALUES ({values})\n")
            f.write("ON CONFLICT (slug) DO UPDATE SET\n")
            f.write("    name = EXCLUDED.name,\n")
            f.write("    description = EXCLUDED.description,\n")
            f.write("    website_url = EXCLUDED.website_url,\n")
            f.write("    category_id = EXCLUDED.category_id,\n")
            f.write("    pricing = EXCLUDED.pricing,\n")
            f.write("    is_active = EXCLUDED.is_active,\n")
            f.write("    is_featured = EXCLUDED.is_featured,\n")
            f.write("    updated_at = CURRENT_TIMESTAMP;\n\n")
        
        f.write('COMMIT;\n')

if __name__ == '__main__':
    process_sql_files()
