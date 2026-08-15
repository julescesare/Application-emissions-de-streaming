


```markdown
# Application d'émissions de streaming — Flutter

Projet réalisé dans le cadre du cours **Développement Mobile** — Atelier Activité n°1 : *Application du modèle MVC*.

Ce dépôt contient deux versions de la même application :

- **Version 1** — implémentation classique (widgets Flutter "bruts", sans séparation stricte des responsabilités)
- **Version 2** — refonte selon l'architecture **MVC** (Modèle – Vue – Contrôleur)

---

## Sommaire

- [Fonctionnalités](#fonctionnalités)
- [Version 1 — Implémentation classique](#version-1--implémentation-classique)
- [Version 2 — Architecture MVC](#version-2--architecture-mvc)
- [Installation et exécution](#installation-et-exécution)
- [Comment tester l'application](#comment-tester-lapplication)

---

## Fonctionnalités

- Écran principal affichant une grille réactive d'émissions de streaming (image, nom, chaîne radio) via le package `responsive_grid`
- Navigation vers un écran de détail au clic sur une émission, avec une animation Hero sur l'image
- Écran de détail affichant le nom, la chaîne, et une liste de diffusions générées aléatoirement (numéro, date, icône volume)
- BottomNavigationBar (Accueil, Recherche, Profil) — affichée mais sans logique de navigation complète entre onglets

---

## Version 1 — Implémentation classique
Branch : version1

### Structure
```

lib/
└── main.dart   (contient toutes les classes)

```Markdown

### Classes principales

| Classe | Rôle |
|---|---|
| `MonApplication` | Point d'entrée, configure `MaterialApp` et la page d'accueil |
| `MapremierePage` | Page d'accueil : `AppBar` amber, grille, `BottomNavigationBar` |
| `IdentificationStreaming` | Carte réutilisable affichant une émission (image, nom, chaîne) |
| `partieGrilleImage` | Grille réactive (`ResponsiveGridList`) listant les émissions |
| `AlbumStreaming` | Page de détail d'une émission (image Hero, diffusions aléatoires) |

Dans cette version, l'affichage, la navigation et la génération des données (diffusions aléatoires) sont mélangés directement dans les widgets.

---

## Version 2 — Architecture MVC
Branch : version2-mvc

### Objectif

Réorganiser la même application en séparant strictement les responsabilités selon le modèle Modèle – Vue – Contrôleur, afin d'améliorer la maintenabilité, la testabilité et l'évolutivité du code.

### Structure
```

lib/
├── main.dart
├── models/
│   ├── emission.dart
│   └── diffusion.dart
├── controllers/
│   └── emission_controller.dart
└── views/
    ├── mapremiere_page.dart
    ├── partie_grille_image.dart
    ├── identification_streaming.dart
    └── album_streaming.dart

```Markdown

### Répartition des responsabilités

#### Modèle (`models/`)

- `Emission` : représente une émission (id, tag Hero, nom, chaîne, chemin de l'image). Contient la méthode `genererDiffusions()`, qui porte la logique métier de génération aléatoire des diffusions.
- `Diffusion` : représente une diffusion (numéro, date). Fournit un getter `dateFormatee` pour un affichage lisible.
- Aucune dépendance à Flutter : ni `import 'package:flutter/material.dart'`, ni `BuildContext`, ni `setState`.

#### Vue (`views/`)

- `MapremierePage` : page d'accueil. Détient le contrôleur, affiche la grille, et déclenche la navigation (`Navigator.push`) vers `AlbumStreaming` lorsqu'une émission est sélectionnée.
- `partieGrilleImage` : affiche la grille réactive à partir d'une liste d'`Emission` reçue en paramètre. Ne construit aucune donnée elle-même.
- `IdentificationStreaming` : widget purement visuel représentant une carte d'émission. Reçoit une `Emission` et un callback `onTap` — ne sait pas ce que fait le tap.
- `AlbumStreaming` : affiche les détails d'une émission. Récupère les diffusions via `emission.genererDiffusions()` — aucun calcul dans la vue.
- Toutes les vues reçoivent leurs données via le constructeur et remontent les interactions via des callbacks.

#### Contrôleur (`controllers/`)

- `EmissionController` (`ChangeNotifier`) :
  - `loadEmissions()` : construit la liste des émissions (données simulées)
  - `getEmissions()` : expose la liste des émissions à la vue (liste non modifiable)
  - `onEmissionSelected(Emission)` : prépare/valide la sélection et retourne l'émission choisie — ne fait aucune navigation ni aucun affichage

### Échanges entre les trois couches

L'application suit un flux de données simple entre les trois couches :

1. **Au démarrage**, `MapremierePage` (vue) interroge `EmissionController` (contrôleur) via `getEmissions()` pour obtenir la liste des émissions à afficher.
2. Le contrôleur construit cette liste à partir du modèle, via `loadEmissions()`, qui instancie des objets `Emission`.
3. La vue transmet cette liste à `partieGrilleImage`, qui l'affiche sous forme de grille en déléguant le rendu de chaque élément à `IdentificationStreaming`.
4. **Lorsque l'utilisateur appuie sur une émission**, l'interaction remonte via un callback (`onTap`) jusqu'à `MapremierePage`.
5. La vue transmet la sélection au contrôleur via `onEmissionSelected(emission)`, qui la valide et la retourne.
6. La vue déclenche elle-même la navigation (`Navigator.push`) vers `AlbumStreaming`, en lui passant l'émission sélectionnée.
7. `AlbumStreaming` appelle `emission.genererDiffusions()` directement sur le modèle pour obtenir la liste des diffusions à afficher — sans aucun calcul métier dans la vue.

Ce flux garantit que :
- le **modèle** ne dépend jamais de Flutter,
- la **vue** ne fait aucun calcul métier,
- le **contrôleur** ne construit aucun widget et ne navigue jamais lui-même.

*(Emplacement réservé pour le schéma illustrant ces échanges — insère ton image ci-dessous)*

`![Schéma des échanges entre couches](assets\images\schema_mvc_streaming.png)`

---

## Installation et exécution

### Prérequis

- Flutter SDK installé et configuré (`flutter doctor` sans erreur bloquante)
- Un émulateur Android/iOS lancé, ou un appareil physique connecté

### Étapes

```bash
flutter pub get
flutter run
```

### Dépendances utilisées

| Package             | Usage                                                |
| ------------------- | ---------------------------------------------------- |
| `responsive_grid` | Grille réactive d'émissions sur l'écran d'accueil |

> Si tu obtiens une erreur liée à `ink_sparkle.frag` / `ShaderCompilerException` au premier `flutter run` sous Windows, vérifie que le chemin du projet ne contient ni accents ni caractères spéciaux, et qu'il n'est pas trop long (limite Windows de 260 caractères).

---

## Comment tester l'application

1. **Écran d'accueil** : vérifier que la grille affiche bien 6 émissions avec image, nom et chaîne radio.
2. **Navigation** : cliquer sur une émission et vérifier que l'écran de détail s'ouvre avec une transition fluide de l'image (Hero).
3. **Écran de détail** : vérifier l'affichage du nom, de la chaîne, et de 5 diffusions avec dates et icônes volume.
4. **Retour** : le bouton retour doit ramener à l'écran d'accueil avec l'animation Hero inverse.
5. **BottomNavigationBar** : vérifier que les 3 icônes (Accueil, Recherche, Profil) sont visibles et cliquables, sans navigation fonctionnelle complète entre les onglets.
