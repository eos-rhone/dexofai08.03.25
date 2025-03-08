# Base de Données AI Tools - Document de Référence

Ce document sert de référence complète pour la base de données des outils d'IA. Il contient tous les identifiants, slugs et relations entre les catégories et les outils.

## Structure de la Base de Données

### Tables Principales
- `categories` : Stocke les catégories d'outils
- `ai_tools` : Stocke les outils d'IA

## Catégories

Voici la liste complète des catégories avec leurs identifiants :

| Nom | Slug | ID (UUID) |
|-----|------|-----------|
| Frameworks & Bibliothèques | frameworks-&-bibliothèques | 1715f3fe-c800-425e-b5d3-ee8af4477a39 |
| Médias & Divertissement | médias-&-divertissement | f5bd99ea-826a-47f7-b9fe-fff09aa3391a |
| 3D & Animation | 3d-animation | db440759-dda1-44d9-9519-6cef2519578d |
| Agents & Automatisation | agents-&-automatisation | 4a4b9c8e-1251-47b1-a482-5aab928d83c2 |
| Architecture & Construction | architecture-&-construction | 52515112-99b5-4616-a1dd-4ca600f68248 |
| Art & Créativité | art-&-créativité | f6a08051-1292-48d4-83ee-c93b7d3d33d3 |
| Business & Marketing | business-&-marketing | 54d1db79-7040-4eea-824a-7df88bcd9437 |
| Développement | développement | e17dc7f4-a974-4ad4-9fae-582502fc8025 |

## Format pour Ajouter des Outils

```sql
INSERT INTO ai_tools (
    name,
    slug,
    description,
    website_url,
    category_id,
    pricing,
    is_active,
    is_featured
) VALUES (
    'Nom de l''outil',
    'slug-de-loutil',
    'Description en français',
    'https://site-web.com',
    'UUID-de-la-categorie',
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 99}]'::jsonb,
    true,
    false
);
```

## Règles Importantes

1. **Slugs** :
   - Doivent être uniques
   - En minuscules
   - Utiliser des tirets (-) pour les espaces
   - Sans caractères spéciaux ni accents

2. **UUIDs** :
   - Toujours utiliser l'UUID exact de la catégorie
   - Ne pas créer de nouveaux UUIDs manuellement

3. **Pricing** :
   - Format JSON valide
   - Tableau d'objets avec `plan_name` et `price`
   - Prix en nombre (pas de string)

4. **Validation** :
   - Vérifier l'existence de la catégorie avant l'insertion
   - Vérifier que le slug n'existe pas déjà
   - S'assurer que tous les champs requis sont remplis

## Exemples par Catégorie

### Frameworks & Bibliothèques (1715f3fe-c800-425e-b5d3-ee8af4477a39)
```sql
INSERT INTO ai_tools (name, slug, category_id) 
VALUES ('TensorFlow', 'tensorflow', '1715f3fe-c800-425e-b5d3-ee8af4477a39');
```

### Médias & Divertissement (f5bd99ea-826a-47f7-b9fe-fff09aa3391a)
```sql
INSERT INTO ai_tools (name, slug, category_id)
VALUES ('DALL·E', 'dall-e', 'f5bd99ea-826a-47f7-b9fe-fff09aa3391a');
```

## Requêtes Utiles

### Vérifier les Outils d'une Catégorie
```sql
SELECT name, slug 
FROM ai_tools 
WHERE category_id = 'UUID-de-la-categorie'
ORDER BY name;
```

### Vérifier les Doublons de Slugs
```sql
SELECT slug, COUNT(*) 
FROM ai_tools 
GROUP BY slug 
HAVING COUNT(*) > 1;
```

## Maintenance

Pour maintenir ce document à jour, exécutez régulièrement :
```sql
SELECT 
    c.name as category_name,
    COUNT(t.id) as tool_count,
    array_agg(t.name ORDER BY t.name) as tool_names
FROM categories c
LEFT JOIN ai_tools t ON c.id = t.category_id
GROUP BY c.name
ORDER BY c.name;
```
