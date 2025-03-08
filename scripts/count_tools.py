import os
import re
from pathlib import Path

def count_tools():
    migrations_dir = Path(__file__).parent.parent / 'supabase' / 'migrations'
    tools = set()  # Pour stocker les noms uniques
    files_with_tools = {}  # Pour compter les outils par fichier
    
    print("Analyzing SQL files...")
    
    # Parcours tous les fichiers SQL
    sql_files = list(migrations_dir.glob('*.sql'))
    print(f"\nFound {len(sql_files)} SQL files")
    
    for file in sql_files:
        try:
            with open(file, 'r', encoding='utf-8') as f:
                content = f.read()
                
                # Trouve toutes les insertions d'outils
                matches = list(re.finditer(r"INSERT INTO.*?ai_tools.*?VALUES\s*\((.*?)\)", content, re.DOTALL))
                if matches:
                    files_with_tools[file.name] = len(matches)
                    
                    # Extrait les noms des outils
                    for match in matches:
                        values = match.group(1)
                        parts = re.findall(r"'((?:''|[^'])*)'", values)
                        if parts:
                            name = parts[0].replace("''", "'").lower().strip()
                            tools.add(name)
        except Exception as e:
            print(f"Error processing {file}: {e}")
            continue
    
    print(f"\nFound {len(tools)} unique tools")
    print("\nTop 20 files with most tools:")
    for file, count in sorted(files_with_tools.items(), key=lambda x: x[1], reverse=True)[:20]:
        print(f"- {file}: {count} tools")

if __name__ == '__main__':
    count_tools()
