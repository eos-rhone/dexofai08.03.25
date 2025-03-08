import os
import re
from datetime import datetime

def get_migration_files(directory):
    """Get all migration files sorted by timestamp."""
    files = []
    for file in os.listdir(directory):
        if file.endswith('.sql') and ('batch' in file.lower() or 'insert' in file.lower() or 'restore' in file.lower()):
            timestamp = re.search(r'(\d{14})', file)
            if timestamp:
                files.append((int(timestamp.group(1)), file))
    return [f[1] for f in sorted(files)]

def combine_migrations(directory):
    """Combine all migration files into one SQL script."""
    files = get_migration_files(directory)
    
    combined = """-- Script de restauration complet généré le {}
BEGIN;

-- Nettoyage des tables
TRUNCATE TABLE tool_pricing CASCADE;
TRUNCATE TABLE ai_tools CASCADE;

""".format(datetime.now().strftime('%Y-%m-%d %H:%M:%S'))

    for file in files:
        with open(os.path.join(directory, file), 'r', encoding='utf-8') as f:
            content = f.read()
            # Remove any existing BEGIN/COMMIT
            content = re.sub(r'BEGIN;|COMMIT;', '', content)
            combined += f"\n-- From {file}\n{content}\n"

    combined += "\nCOMMIT;"
    return combined

def main():
    migrations_dir = os.path.join(os.path.dirname(os.path.dirname(__file__)), 'supabase', 'migrations')
    combined_sql = combine_migrations(migrations_dir)
    
    output_file = os.path.join(os.path.dirname(__file__), 'full-restore.sql')
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(combined_sql)
    
    print(f"Script de restauration complet créé dans {output_file}")
    print("Copiez le contenu de ce fichier dans l'éditeur SQL de Supabase")

if __name__ == '__main__':
    main()
