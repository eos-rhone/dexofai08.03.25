import os
import re
import unicodedata
from pathlib import Path
from collections import defaultdict

# Mapping pour corriger les noms d'outils
NAME_CORRECTIONS = {
    'DALL-E': 'DALL·E',
    'DALL-E 2': 'DALL·E 2',
    'DALL-E 3': 'DALL·E 3',
    'Auto-GPT': 'AutoGPT',
    'PrivateGPT': 'privateGPT',
    'Mem AI': 'Mem.ai',
    'NVIDIA Canvas': 'Nvidia Canvas',
    'Character.AI': 'Character.ai',
    'Copy AI': 'Copy.ai',
    'FastAI': 'fastai',
    'Leonardo.Ai': 'Leonardo.ai',
    'SciSpace': 'Scispace',
    'RunwayML': 'Runway',
}

# Mapping pour corriger les catégories
CATEGORY_CORRECTIONS = {
    'developpement': 'development',
    'développement': 'development',
    'generation-code': 'development',
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
}

# Catégories par défaut pour les outils connus
DEFAULT_CATEGORIES = {
    'ChatGPT': 'text',
    'GPT-4': 'text',
    'Claude': 'text',
    'Anthropic': 'text',
    'AutoGPT': 'development',
    'AgentGPT': 'development',
    'BabyAGI': 'development',
    'AudioCraft': 'audio',
    'AssemblyAI': 'audio',
    'Coqui': 'audio',
    'DeepMind': 'research',
    'AllenNLP': 'nlp',
    'BERT': 'nlp',
    'spaCy': 'nlp',
    'PyTorch': 'machine-learning',
    'TensorFlow': 'machine-learning',
    'Scikit-learn': 'machine-learning',
    'DataRobot': 'data',
    'Dataiku': 'data',
    'H2O': 'data',
}

def normalize_string(s):
    """Normalise une chaîne en supprimant les caractères spéciaux"""
    if not s:
        return s
    # Convertit en NFKD pour décomposer les caractères accentués
    normalized = unicodedata.normalize('NFKD', s)
    # Supprime les caractères de contrôle et non imprimables
    normalized = ''.join(c for c in normalized if unicodedata.category(c)[0] != 'C')
    return normalized

def escape_sql_string(s):
    """Échappe une chaîne pour SQL"""
    if not s or s == 'NULL':
        return 'NULL'
    # Normalise d'abord la chaîne
    s = normalize_string(s)
    # Échappe les apostrophes et autres caractères spéciaux
    s = s.replace("'", "''").replace("\\", "\\\\")
    return f"'{s}'"

def clean_sql_value(value):
    """Nettoie une valeur SQL"""
    if not value or value == 'NULL':
        return ''
    # Supprime les guillemets et normalise
    value = value.strip().strip("'").replace("''", "'")
    return normalize_string(value)

def generate_fixed_migration():
    current_dir = Path(__file__).parent
    migrations_dir = current_dir.parent / 'supabase' / 'migrations'
    output_file = migrations_dir / '20250303154500_fixed_tools.sql'
    
    # Stocke les outils uniques par slug
    unique_tools = {}
    
    # Parcours tous les fichiers SQL
    for file in migrations_dir.glob('*.sql'):
        if 'combined' not in file.name.lower() and 'final' not in file.name.lower() and 'fixed' not in file.name.lower():
            print(f"Processing {file.name}")
            try:
                with open(file, 'r', encoding='utf-8') as f:
                    content = f.read()
            except UnicodeDecodeError:
                print(f"Warning: Could not read {file.name} with UTF-8, trying with latin-1")
                with open(file, 'r', encoding='latin-1') as f:
                    content = f.read()
                
            # Trouve les insertions d'outils
            tool_matches = re.finditer(
                r"INSERT INTO (?:public\.)?ai_tools[^;]+VALUES\s*\((.*?)\)",
                content,
                re.DOTALL
            )
            
            for match in tool_matches:
                values = match.group(1)
                
                # Extrait les informations de l'outil
                parts = re.findall(r"'([^']*)'|NULL", values)
                if len(parts) >= 6:
                    name = clean_sql_value(parts[0])
                    slug = clean_sql_value(parts[1])
                    description = clean_sql_value(parts[2])
                    website_url = clean_sql_value(parts[3])
                    category = clean_sql_value(parts[4])
                    pricing = clean_sql_value(parts[5]) if len(parts) > 5 else ''
                    
                    if not name:  # Skip if no name
                        continue
                        
                    # Corrige le nom si nécessaire
                    corrected_name = NAME_CORRECTIONS.get(name, name)
                    
                    # Corrige la catégorie
                    if category in CATEGORY_CORRECTIONS:
                        category = CATEGORY_CORRECTIONS[category]
                    elif category == 'Unknown' and corrected_name in DEFAULT_CATEGORIES:
                        category = DEFAULT_CATEGORIES[corrected_name]
                    elif category == 'Unknown':
                        # Essaie de deviner la catégorie basée sur le nom
                        if any(word in corrected_name.lower() for word in ['gpt', 'llm', 'claude']):
                            category = 'text'
                        elif 'ai' in corrected_name.lower():
                            category = 'development'
                    
                    # Crée un slug propre si nécessaire
                    if not slug:
                        slug = re.sub(r'[^a-z0-9]+', '-', corrected_name.lower()).strip('-')
                    
                    # Stocke l'outil avec les corrections
                    tool_key = slug
                    if tool_key not in unique_tools or len(unique_tools[tool_key][2]) < len(description):
                        unique_tools[tool_key] = (
                            corrected_name,
                            slug,
                            description,
                            website_url,
                            category,
                            pricing
                        )
    
    # Génère le nouveau fichier de migration
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write('-- Fixed migration file for all AI tools\n')
        f.write('BEGIN;\n\n')
        
        # Écrit les outils uniques et corrigés
        for tool_data in sorted(unique_tools.values()):
            name, slug, description, website_url, category, pricing = tool_data
            
            # Échappe les valeurs pour SQL
            name_sql = escape_sql_string(name)
            slug_sql = escape_sql_string(slug)
            description_sql = escape_sql_string(description)
            website_sql = escape_sql_string(website_url)
            category_sql = escape_sql_string(category)
            pricing_sql = escape_sql_string(pricing) if pricing else 'NULL'
            
            f.write(f"INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES\n")
            f.write(f"({name_sql}, {slug_sql}, {description_sql}, {website_sql}, (SELECT id FROM categories WHERE slug = {category_sql}), {pricing_sql}, true, false)\n")
            f.write("ON CONFLICT (slug) DO UPDATE SET\n")
            f.write("    name = EXCLUDED.name,\n")
            f.write("    description = EXCLUDED.description,\n")
            f.write("    website_url = EXCLUDED.website_url,\n")
            f.write("    category_id = EXCLUDED.category_id,\n")
            f.write("    pricing = EXCLUDED.pricing,\n")
            f.write("    updated_at = CURRENT_TIMESTAMP;\n\n")
        
        f.write('\nCOMMIT;\n')
    
    print(f"\nCréé le fichier de migration corrigé : {output_file}")
    print(f"Nombre total d'outils uniques : {len(unique_tools)}")
    
    # Affiche les statistiques par catégorie
    categories = defaultdict(int)
    for tool_data in unique_tools.values():
        categories[tool_data[4]] += 1
    
    print("\nOutils par catégorie :")
    for category, count in sorted(categories.items()):
        print(f"{category}: {count} outils")

if __name__ == '__main__':
    generate_fixed_migration()
