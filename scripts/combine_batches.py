import os
import re
from pathlib import Path

def get_batch_number(filename):
    # Extrait le numéro de batch du nom de fichier
    match = re.search(r'(\d+)', filename)
    if match:
        return int(match.group(1))
    return 0

def combine_migration_files():
    current_dir = Path(__file__).parent
    migrations_dir = current_dir.parent / 'supabase' / 'migrations'
    output_file = migrations_dir / '20250303154200_restore_all_tools_final.sql'
    
    print(f"Looking for SQL files in: {migrations_dir}")
    
    # Trouve tous les fichiers SQL
    sql_files = []
    for file in migrations_dir.glob('*.sql'):
        if 'combined' not in file.name.lower() and 'final' not in file.name.lower():
            sql_files.append(file)
    
    # Trie les fichiers par numéro
    sql_files.sort(key=lambda x: get_batch_number(x.name))
    
    print(f"Found {len(sql_files)} SQL files")
    
    # Combine tous les fichiers
    with open(output_file, 'w', encoding='utf-8') as outfile:
        outfile.write('-- Combined migration file for all AI tools\n')
        outfile.write('BEGIN;\n\n')
        
        # Ne pas toucher aux catégories comme demandé
        outfile.write('-- Ajouter tous les outils\n')
        tools_seen = set()
        total_tools = 0
        
        for file in sql_files:
            print(f"Processing {file.name}")
            with open(file, 'r', encoding='utf-8') as infile:
                content = infile.read()
                
                # Trouve les insertions d'outils avec une regex plus permissive
                tool_matches = re.finditer(
                    r"INSERT INTO (?:public\.)?ai_tools[^;]+VALUES\s*\((.*?)\)",
                    content,
                    re.DOTALL
                )
                
                for match in tool_matches:
                    tool_values = match.group(1).strip()
                    # Extrait le nom de l'outil pour le déduplication
                    name_match = re.search(r"'([^']+)'", tool_values)
                    if name_match:
                        tool_name = name_match.group(1)
                        if tool_name not in tools_seen:
                            tools_seen.add(tool_name)
                            total_tools += 1
                            outfile.write(f"INSERT INTO public.ai_tools (name, slug, description, website_url, category_id, pricing, is_active, is_featured) VALUES {tool_values}\n")
                            outfile.write("ON CONFLICT (slug) DO UPDATE SET\n")
                            outfile.write("    name = EXCLUDED.name,\n")
                            outfile.write("    description = EXCLUDED.description,\n")
                            outfile.write("    website_url = EXCLUDED.website_url,\n")
                            outfile.write("    category_id = EXCLUDED.category_id,\n")
                            outfile.write("    pricing = EXCLUDED.pricing,\n")
                            outfile.write("    is_active = EXCLUDED.is_active,\n")
                            outfile.write("    is_featured = EXCLUDED.is_featured,\n")
                            outfile.write("    updated_at = CURRENT_TIMESTAMP;\n\n")
        
        outfile.write('\nCOMMIT;\n')
    
    print(f"Created combined migration file: {output_file}")
    print(f"Total unique tools found: {total_tools}")
    print("\nTools found:")
    for tool in sorted(tools_seen):
        print(f"- {tool}")

if __name__ == '__main__':
    combine_migration_files()
