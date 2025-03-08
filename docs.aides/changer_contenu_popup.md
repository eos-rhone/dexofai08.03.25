# Guide de modification du contenu du popup

Ce guide explique comment modifier le contenu et les données affichées dans le popup des outils populaires.

Les données principales (nom, description, etc.)
Les statistiques et métriques
Les images et médias
Les textes et labels
Les plans tarifaires
Les liens et la navigation

## 1. Données principales

Les données principales sont passées via les props du composant `PopupOutilPopulaire` :

```tsx
interface PopupOutilPopulaireProps {
  isOpen: boolean;
  onClose: () => void;
  name: string;              // Nom de l'outil
  description: string;       // Description détaillée
  image_url?: string;        // URL de l'image
  website_url?: string;      // URL du site web
  category?: {
    name: string;           // Nom de la catégorie
    slug: string;          // Slug pour la navigation
  };
  pricing?: {
    name: string;          // Nom du plan
    price: number | string; // Prix
    features: string[];    // Liste des fonctionnalités
  }[];
}
```

## 2. Modification des données

### Dans AIQuickView.tsx
```tsx
<PopupOutilPopulaire
  isOpen={isPopupOpen}
  onClose={() => setIsPopupOpen(false)}
  name="Nom de l'outil"
  description="Description détaillée..."
  image_url="/chemin/vers/image.jpg"
  website_url="https://example.com"
  category={{
    name: "Nom Catégorie",
    slug: "slug-categorie"
  }}
  pricing={[
    {
      name: "Gratuit",
      price: "0€",
      features: ["Fonction 1", "Fonction 2"]
    },
    {
      name: "Pro",
      price: 29,
      features: ["Fonction 1", "Fonction 2", "Fonction 3"]
    }
  ]}
/>
```

## 3. Statistiques et métriques

### Modification des statistiques rapides
```tsx
// Dans PopupOutilPopulaire.tsx

// Utilisateurs
<div className="text-2xl font-bold text-white">15k+</div>

// Note moyenne
<div className="text-2xl font-bold text-white">4.8/5</div>

// Vues totales
<div className="text-2xl font-bold text-white">50k+</div>
```

## 4. Images et médias

### Image principale
```tsx
// Image par défaut si aucune n'est fournie
const fallbackImage = "/images/placeholder.png";

// Utilisation
<img
  src={image_url || fallbackImage}
  alt={name}
  className="w-full h-full object-cover"
  onError={(e) => {
    e.currentTarget.src = fallbackImage;
  }}
/>
```

## 5. Textes et labels

### Modification des textes
```tsx
// Titre du bouton de site web
<a>Visiter le site</a>

// Titre de la section description
<h3>À propos</h3>

// Titre de la section prix
<h3>Plans tarifaires</h3>

// Bouton d'action principal
<a>Commencer maintenant</a>
```

## 6. Plans tarifaires

### Structure d'un plan
```tsx
{
  name: "Nom du plan",
  price: "Prix", // Peut être un nombre ou une chaîne
  features: [
    "Fonctionnalité 1",
    "Fonctionnalité 2",
    "Fonctionnalité 3"
  ]
}
```

### Format du prix
```tsx
// Pour un prix numérique
typeof plan.price === 'number' ? `${plan.price}€` : plan.price
```

## 7. Liens et navigation

### Lien de catégorie
```tsx
<Link
  to={`/categories/${category.slug}`}
  onClick={onClose}
>
  {category.name}
</Link>
```

### Lien externe
```tsx
<a
  href={website_url}
  target="_blank"
  rel="noopener noreferrer"
>
  Visiter le site
</a>
```

## 8. Gestion des données manquantes

Le composant gère automatiquement les données optionnelles :

```tsx
// Catégorie
{category && (
  <Link>...</Link>
)}

// Prix
{pricing && pricing.length > 0 && (
  <div>...</div>
)}

// Site web
{website_url && (
  <a>...</a>
)}
```

## Astuces

1. Toujours fournir une image par défaut pour éviter les erreurs
2. Vérifier que les URLs sont valides avant de les passer
3. Formater les grands nombres pour une meilleure lisibilité
4. Utiliser des listes pour structurer les fonctionnalités
5. Gérer les cas où les données sont absentes avec des conditions

## Exemple complet de données

```tsx
const outilData = {
  name: "Super Outil",
  description: "Une description détaillée de l'outil...",
  image_url: "/images/outil.jpg",
  website_url: "https://superoutil.com",
  category: {
    name: "IA & Machine Learning",
    slug: "ia-machine-learning"
  },
  pricing: [
    {
      name: "Gratuit",
      price: "0€",
      features: [
        "5 projets",
        "Support basique",
        "Mises à jour gratuites"
      ]
    },
    {
      name: "Pro",
      price: 29,
      features: [
        "Projets illimités",
        "Support prioritaire",
        "Fonctionnalités avancées",
        "API access"
      ]
    }
  ]
};
```
