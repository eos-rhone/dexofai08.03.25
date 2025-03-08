import os
import re
from pathlib import Path
from difflib import SequenceMatcher
from collections import defaultdict

def similar(a, b):
    """Vérifie si deux chaînes sont similaires"""
    return SequenceMatcher(None, a.lower(), b.lower()).ratio() > 0.85

def clean_name(name):
    """Nettoie un nom d'outil pour la comparaison"""
    return re.sub(r'[^a-zA-Z0-9]', '', name.lower())

def find_similar_tools(tools):
    """Trouve les outils avec des noms similaires"""
    similar_groups = []
    used = set()
    
    tools_list = list(tools)
    for i, tool1 in enumerate(tools_list):
        if tool1 in used:
            continue
            
        group = {tool1}
        for tool2 in tools_list[i+1:]:
            if tool2 not in used and (similar(tool1, tool2) or 
                                    clean_name(tool1) == clean_name(tool2)):
                group.add(tool2)
        
        if len(group) > 1:
            similar_groups.append(group)
            used.update(group)
    
    return similar_groups

def analyze_tools_in_files():
    current_dir = Path(__file__).parent
    migrations_dir = current_dir.parent / 'supabase' / 'migrations'
    
    print("Analysing AI tools...")
    
    # Dictionnaire pour stocker les outils par catégorie
    tools_by_category = defaultdict(list)
    all_tools = set()
    
    # Liste de référence des outils attendus
    expected_tools = {
        'ChatGPT', 'GPT-4', 'Claude', 'DALL-E', 'Midjourney', 'Stable Diffusion',
        'GitHub Copilot', 'AutoGPT', 'AgentGPT', 'Anthropic Claude',
        # ... ajoutez plus d'outils attendus ici
    }
    
    # Parcours tous les fichiers SQL
    for file in migrations_dir.glob('*.sql'):
        if 'combined' not in file.name.lower() and 'final' not in file.name.lower():
            with open(file, 'r', encoding='utf-8') as f:
                content = f.read()
                
                # Trouve les insertions d'outils
                tool_matches = re.finditer(
                    r"INSERT INTO (?:public\.)?ai_tools.*?VALUES\s*\((.*?)\)",
                    content,
                    re.DOTALL
                )
                
                for match in tool_matches:
                    values = match.group(1)
                    
                    # Extrait le nom et la catégorie
                    name_match = re.search(r"'([^']+)'", values)
                    category_match = re.search(r"SELECT id FROM categories WHERE (?:name|slug) = '([^']+)'", values)
                    
                    if name_match:
                        tool_name = name_match.group(1)
                        category = category_match.group(1) if category_match else "Unknown"
                        
                        all_tools.add(tool_name)
                        tools_by_category[category].append(tool_name)
    
    # 1. Analyse des doublons potentiels
    print("\n1. Outils potentiellement en double :")
    similar_groups = find_similar_tools(all_tools)
    for group in similar_groups:
        print(f"Groupe d'outils similaires : {', '.join(sorted(group))}")
    
    # 2. Outils manquants
    print("\n2. Outils manquants de la liste de référence :")
    missing_tools = expected_tools - all_tools
    for tool in sorted(missing_tools):
        print(f"- {tool}")
    
    # 3. Analyse des catégories
    print("\n3. Répartition des outils par catégorie :")
    for category, tools in sorted(tools_by_category.items()):
        print(f"\n{category} ({len(tools)} outils):")
        for tool in sorted(tools):
            print(f"- {tool}")
    
    # Statistiques générales
    print("\nStatistiques générales :")
    print(f"Nombre total d'outils uniques trouvés : {len(all_tools)}")
    print(f"Nombre de catégories : {len(tools_by_category)}")
    print(f"Nombre de groupes d'outils similaires : {len(similar_groups)}")
    print(f"Nombre d'outils manquants : {len(missing_tools)}")

if __name__ == '__main__':
    analyze_tools_in_files()
