# Flutter BLoC State Management App

A Flutter project created to practice state management using the `flutter_bloc` package.

The application demonstrates multiple independent BLoCs, counter state management, theme switching, `BlocBuilder`, `BlocListener`, `BlocConsumer`, and `MultiBlocProvider`.

## Features

- Counter state management
- Increment counter
- Decrement counter
- Light theme
- Dark theme
- Theme toggle
- SnackBar when counter reaches 10
- Multiple BLoCs
- BlocProvider
- MultiBlocProvider
- BlocBuilder
- BlocListener
- BlocConsumer
- Clean project structure

## Counter BLoC

The `CounterBloc` manages the counter value.

### Events

- `IncrementCounter`
- `DecrementCounter`

### State

The counter state stores the current integer value.

Example flow:

```text
IncrementCounter
       ↓
CounterBloc
       ↓
CounterState(value + 1)
       ↓
UI rebuilds
```

## Theme BLoC

The `ThemeBloc` manages the application theme.

### Event

- `ToggleTheme`

### State

The theme state stores the current `ThemeMode`.

```text
ToggleTheme
     ↓
ThemeBloc
     ↓
Light ↔ Dark
```

## BlocBuilder

`BlocBuilder` rebuilds widgets whenever a BLoC emits a new state.

It is used to update the application theme.

```dart
BlocBuilder<ThemeBloc, ThemeState>(
  builder: (context, state) {
    return MaterialApp(
      themeMode: state.themeMode,
    );
  },
)
```

## BlocListener

`BlocListener` is used for side effects such as:

- SnackBars
- Dialogs
- Navigation

In this project, a SnackBar is shown when the counter reaches `10`.

## BlocConsumer

`BlocConsumer` combines:

```text
BlocBuilder + BlocListener
```

It is used for the counter screen so the UI can rebuild while also listening for special counter values.

## MultiBlocProvider

The application provides both BLoCs using `MultiBlocProvider`:

```text
MultiBlocProvider
├── CounterBloc
└── ThemeBloc
```

## Project Structure

```text
lib/
├── main.dart
├── blocs/
│   ├── counter/
│   │   ├── counter_bloc.dart
│   │   ├── counter_event.dart
│   │   └── counter_state.dart
│   └── theme/
│       ├── theme_bloc.dart
│       ├── theme_event.dart
│       └── theme_state.dart
└── ui/
    └── home_screen.dart
```

## Run the Project

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

## Code Quality

Format the source code:

```bash
dart format lib
```

Analyze the project:

```bash
flutter analyze
```

## Technologies

- Flutter
- Dart
- flutter_bloc
- Git
- GitHub

## Git Workflow

This project uses a GitFlow-style workflow:

```text
feature/* → develop → main
```

- `main` contains the stable version
- `develop` contains integrated development work
- `feature/*` branches are used for individual features
