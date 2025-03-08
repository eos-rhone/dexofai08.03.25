# Référence des Catégories et Outils

Ce document sert de référence pour l'ajout d'outils dans la base de données. Il contient les identifiants et slugs exacts des catégories pour éviter les erreurs lors de l'ajout de nouveaux outils.

## Catégories

Voici la liste des catégories avec leurs identifiants :

| Nom | Slug | ID (UUID) |
|-----|------|-----------|
| Frameworks & Bibliothèques | frameworks-&-bibliothèques | 1715f3fe-c800-425e-b5d3-ee8af4477a39 |
| Médias & Divertissement | médias-&-divertissement | f5bd99ea-826a-47f7-b9fe-fff09aa3391a |
| Impression 3D | impression-3d | c040716f-51fb-47e4-af7f-40eaf2f63769 |
| Jeux vidéo | jeux-vidéo | b1230acd-170b-4490-a64d-c55e33e5a19e |

## Format des Données

Lors de l'ajout d'un nouvel outil, utilisez ce format :

```sql
INSERT INTO ai_tools (
    name,           -- Nom de l'outil
    slug,           -- Slug unique (en minuscules, avec des tirets)
    description,    -- Description en français
    website_url,    -- URL du site web
    category_id,    -- UUID de la catégorie (voir ci-dessus)
    pricing,        -- Format JSON : [{"plan_name": "Nom", "price": prix}]
    is_active,      -- true/false
    is_featured     -- true/false
)
VALUES (
    'Nom Outil',
    'nom-outil',
    'Description...',
    'https://...',
    'UUID-de-la-categorie',
    '[{"plan_name": "Free", "price": 0}]'::jsonb,
    true,
    false
);
```

## Exemple d'Utilisation

Voici un exemple d'ajout d'outil pour la catégorie "Frameworks & Bibliothèques" :

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
)
VALUES (
    'Nouveau Framework',
    'nouveau-framework',
    'Description du framework',
    'https://nouveau-framework.com',
    '1715f3fe-c800-425e-b5d3-ee8af4477a39',  -- ID de Frameworks & Bibliothèques
    '[{"plan_name": "Gratuit", "price": 0}, {"plan_name": "Pro", "price": 99}]'::jsonb,
    true,
    false
);
```

## Notes Importantes

1. Les slugs doivent être uniques dans la table `ai_tools`
2. Utilisez toujours l'UUID exact de la catégorie
3. Le pricing doit être un tableau JSON valide
4. Les accents sont autorisés dans les noms et descriptions, mais pas dans les slugs

## Mise à Jour

Pour mettre à jour ce document, exécutez la requête SQL dans le fichier `export_reference_data.sql`.
