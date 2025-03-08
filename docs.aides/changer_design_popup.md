# Guide de personnalisation du design du popup

Ce guide explique comment modifier l'apparence visuelle du popup des outils populaires.
changer_design_popup.md : Explique comment modifier :
Les dimensions et tailles
Les couleurs et dégradés
La mise en page et l'espacement
Les animations et effets
La typographie
Le responsive design




## 1. Structure générale du popup

Le popup est divisé en sections :
- En-tête avec image
- Stats rapides
- Description
- Plans tarifaires
- Bouton d'action

## 2. Modification des dimensions

### Taille globale du popup
```tsx
// Dans le conteneur principal
className="... max-w-4xl ..." // Changer 4xl pour plus petit/grand (2xl, 3xl, 5xl, etc.)
```

### Hauteur de l'image
```tsx
// Section image d'en-tête
className="relative h-64" // Changer h-64 pour plus petit/grand (h-48, h-72, etc.)
```

## 3. Couleurs et arrière-plans

### Fond du popup
```tsx
// Conteneur principal
className="bg-[#0B0F19] ..." // Changer #0B0F19 pour une autre couleur
```

### Dégradés
```tsx
// Dégradé de l'image
className="bg-gradient-to-t from-[#0B0F19] via-[#0B0F19]/70 to-transparent"

// Dégradé des boutons
className="bg-gradient-to-r from-blue-500 to-purple-500" 
```

### Bordures
```tsx
// Bordure principale
className="... border border-gray-800" // Modifier gray-800 pour changer la couleur

// Bordures des cartes
className="... border border-gray-700/50 hover:border-blue-500/50"
```

## 4. Espacement et mise en page

### Padding général
```tsx
// Section contenu
className="p-8" // Augmenter/diminuer (p-6, p-10, etc.)
```

### Grilles
```tsx
// Stats rapides
className="grid grid-cols-3 gap-4" // Modifier le nombre de colonnes ou l'espacement

// Plans tarifaires
className="grid grid-cols-1 md:grid-cols-2 gap-4" // Modifier la mise en page responsive
```

## 5. Animations et effets

### Animation d'entrée
```tsx
// Fond du popup
className="... animate-fade-in"

// Contenu
className="... animate-scale-up"
```

### Effets de survol
```tsx
// Boutons et liens
className="... hover:scale-105 transition-all"
className="... hover:bg-blue-500/30"
```

## 6. Éléments interactifs

### Bouton de fermeture
```tsx
// Style du bouton X
className="... bg-black/50 hover:bg-black/70"
```

### Boutons d'action
```tsx
// Bouton principal
className="... px-8 py-4 rounded-xl" // Modifier taille et forme
```

## 7. Typographie

### Tailles de texte
```tsx
// Titre principal
className="text-3xl font-bold" // Modifier la taille (2xl, 4xl, etc.)

// Sous-titres
className="text-lg font-semibold" // Ajuster selon besoin
```

### Couleurs de texte
```tsx
className="text-white" // Texte principal
className="text-gray-300" // Texte secondaire
className="text-blue-500" // Texte accent
```

## 8. Responsive Design

Pour modifier le comportement sur mobile :
```tsx
// Exemple de grille responsive
className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3"

// Exemple de padding responsive
className="p-4 md:p-6 lg:p-8"
```

## Astuces

1. Les classes Tailwind suivent un format préfixe-taille :
   - Padding : p-{taille}
   - Margin : m-{taille}
   - Width : w-{taille}
   - Height : h-{taille}

2. Pour les couleurs :
   - Intensité : 50 à 900 (ex: blue-500)
   - Opacité : /50 pour 50% (ex: black/50)

3. Pour les breakpoints responsive :
   - sm: > 640px
   - md: > 768px
   - lg: > 1024px
   - xl: > 1280px
