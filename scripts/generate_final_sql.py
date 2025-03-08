import re
from collections import defaultdict

def extract_categories_from_file(file_path):
    categories = []
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
        # Trouve toutes les insertions de catégories
        category_matches = re.finditer(r"INSERT INTO (?:public\.)?categories.*?\(name,\s*slug,\s*description,\s*icon\)\s*VALUES\s*['\"](.*?)['\"]\s*,\s*['\"](.*?)['\"]\s*,\s*['\"](.*?)['\"]\s*,\s*['\"](.*?)['\"]", content, re.DOTALL)
        for match in category_matches:
            name, slug, description, icon = match.groups()
            # Vérifie si la catégorie existe déjà (par slug)
            if not any(c[1] == slug for c in categories):
                categories.append((name, slug, description, icon))
    return categories

def extract_tools_and_categories(file_path):
    tools = []
    tool_categories = {}  # Mapping slug -> category_slug
    
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
        
        # Trouve tous les INSERT INTO pour les outils
        tool_matches = re.finditer(r"INSERT INTO public\.ai_tools.*?\(name,\s*slug,\s*description,\s*website_url,\s*category_id.*?\)\s*VALUES\s*['\"](.*?)['\"]\s*,\s*['\"](.*?)['\"]\s*,\s*['\"](.*?)['\"]\s*,\s*['\"](.*?)['\"]\s*,\s*['\"](.*?)['\"]", content, re.DOTALL)
        
        for match in tool_matches:
            if len(match.groups()) >= 5:
                name, slug, desc, url, category = match.groups()
                tools.append((name, slug, desc, url))
                tool_categories[slug] = category
            else:
                name, slug, desc, url = match.groups()[:4]
                tools.append((name, slug, desc, url))
                tool_categories[slug] = 'unknown'
                
    return tools, tool_categories

def generate_final_sql():
    source_file = 'supabase/migrations/20250303153000_restore_all_tools_combined.sql'
    
    # Extraction des catégories
    categories = extract_categories_from_file(source_file)
    print(f"Nombre de catégories extraites : {len(categories)}")
    
    # Extraction des outils et leurs catégories
    tools, tool_categories = extract_tools_and_categories(source_file)
    print(f"Nombre d'outils extraits : {len(tools)}")

    # Gestion des slugs en double
    slug_count = defaultdict(int)
    unique_tools = []
    for name, slug, desc, url in tools:
        # Nettoie le slug
        clean_slug = slug.strip().lower().replace(' ', '-')
        if not clean_slug:
            clean_slug = name.strip().lower().replace(' ', '-')
        
        # Ajoute un suffixe si le slug existe déjà
        base_slug = clean_slug
        while base_slug in [t[1] for t in unique_tools]:
            slug_count[clean_slug] += 1
            base_slug = f"{clean_slug}-{slug_count[clean_slug]}"
        
        # Récupère la catégorie associée
        category = tool_categories.get(slug, 'unknown')
        unique_tools.append((name, base_slug, desc, url, category))

    print(f"Nombre d'outils uniques : {len(unique_tools)}")

    # Compte les outils par catégorie
    category_counts = defaultdict(int)
    for _, _, _, _, cat in unique_tools:
        category_counts[cat] += 1
    print("\nDistribution des outils par catégorie :")
    for cat, count in sorted(category_counts.items()):
        print(f"{cat}: {count} outils")

    # Génération du fichier SQL
    with open('supabase/migrations/501_tools_final.sql', 'w', encoding='utf-8') as f:
        f.write('-- Migration SQL pour les outils IA\n\n')
        f.write('BEGIN;\n\n')
        
        # Supprime les tables existantes
        f.write('DROP TABLE IF EXISTS public.ai_tools CASCADE;\n')
        f.write('DROP TABLE IF EXISTS public.categories CASCADE;\n\n')
        
        # Crée la table des catégories
        f.write("""CREATE TABLE public.categories (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    name text NOT NULL,
    slug text NOT NULL UNIQUE,
    description text,
    icon text DEFAULT 'default-icon.svg',
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);\n\n""")
        
        # Crée la table des outils
        f.write("""CREATE TABLE public.ai_tools (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    name text NOT NULL,
    slug text NOT NULL UNIQUE,
    description text,
    website_url text,
    category_id uuid REFERENCES public.categories(id),
    pricing jsonb DEFAULT '[]'::jsonb,
    is_active boolean DEFAULT true,
    is_featured boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);\n\n""")
        
        # Insère les catégories
        f.write('-- Insère les catégories\n')
        for name, slug, description, icon in categories:
            name = name.replace("'", "''")
            description = description.replace("'", "''")
            f.write(f"INSERT INTO public.categories (name, slug, description, icon) VALUES ('{name}', '{slug}', '{description}', '{icon}');\n")
        f.write('\n')
        
        # Insère tous les outils
        f.write('-- Insère les outils\n')
        for name, slug, desc, url, category in unique_tools:
            # Nettoie les valeurs pour éviter les problèmes SQL
            name = name.replace("'", "''")
            slug = slug.replace("'", "''")
            desc = desc.replace("'", "''")
            url = url.replace("'", "''")
            category = category.replace("'", "''")
            
            f.write(f"""INSERT INTO public.ai_tools (name, slug, description, website_url, category_id)
SELECT '{name}', '{slug}', '{desc}', '{url}', (SELECT id FROM public.categories WHERE slug = '{category}');\n\n""")
        
        f.write('COMMIT;\n')

if __name__ == '__main__':
    generate_final_sql()
