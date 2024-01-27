
# Gallery Photos

Se ha implementado la [API REST de Unplash](https://unsplash.com/developers) y el manejador de estados flutter BLoC.
Y el diseño de Figma se obtubo de la [comundidad.](https://www.figma.com/community/file/1122826989346871198)

La estructura del proyecto es el siguiente:

```bash
├── lib
│   ├── photos
│   │   ├── bloc
│   │   │   └── photo_bloc.dart
│   │   ├── events
│   │   │   └── photo_event.dart
│   │   ├── states
│   │   │   └── photo_state.dart
│   │   ├── models
│   │   │   └── photo.dart
│   │   └── views
│   │       ├── photos_page.dart
│   │       └── photos_list.dart
│   ├── widgets
│   │   ├── bottom_loader.dart
│   │   └── photo_list_item.dart
│   ├── app.dart
│   ├── simple_bloc_observer.dart
│   └── main.dart
├── pubspec.lock
└── pubspec.yaml
```

## Deployment

Para correr el proyecto: 

```bash
  flutter pub get
```
```bash
  flutter run
```

## Tech Stack

**Client:** Flutter, Dart, Material 3

**Server:** Dart

## Color Reference


| Color             | Hex                                                                |
| ----------------- | ------------------------------------------------------------------ |
| Primary | ![#f3edf6](https://via.placeholder.com/10/f3edf6?text=+) #f3edf6 |
| Secondary | ![#7d5260](https://via.placeholder.com/10/7d5260?text=+) #7d5260 |
| Tertiary | ![#6c647c](https://via.placeholder.com/10/6c647c?text=+) #6c647c |



## Feedback

Si tienes algun comentario puedes escribirme al instagram [Flutterina Studio.](https://www.instagram.com/flutterinastudio/)

## Demo

Aquí el resultado:

https://github.com/SamaritanoDev/gallery_with_unplash/assets/91768959/a8e6ff22-2f0a-47b7-bcff-6c91d6e5f0d6
