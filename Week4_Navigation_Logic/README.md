# Week 4 - Multi-Page Navigation

A Flutter app demonstrating screen navigation and data passing between pages, built around a **Splash → Login → Dashboard** flow, with the Dashboard branching out to four additional screens.

## Task Description

> Create a 3-page app: (1) Splash Screen, (2) Login Page, (3) Dashboard. Implement navigation logic to move between screens and pass a **Username** string from Login to Dashboard.

This repo fulfills that requirement and extends it: the Dashboard also routes to four sub-pages (Home, About, Services, Task Manager) to demonstrate additional `Navigator.push` navigation and simple state management.

## Screens

| Screen | File | Description |
|---|---|---|
| Splash Screen | `splash.dart` | App entry point; briefly shows branding, then auto-navigates to Login |
| Login Page | `login.dart` | Collects a username via a `TextField`; validates it's not empty |
| Dashboard | `dashboard.dart` | Greets the user by name (`Welcome, $username`); links out to 4 sections |
| Home | `home.dart` | Landing-page-style content for the app |
| About | `about.dart` | Company/app info cards |
| Services | `services.dart` | List of services offered |
| Task Manager | `task_manager.dart` | Create, complete, and delete tasks with a priority slider |

## Navigation Logic

- **Splash → Login**: `Navigator.pushReplacement` after a short delay, so the splash screen isn't left in the back stack.
- **Login → Dashboard**: On a valid (non-empty) username, `Navigator.pushReplacement` is used, passing the value through the widget constructor:
  ```dart
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => DashboardPage(username: username),
    ),
  );
  ```
- **Dashboard → Home / About / Services / Task Manager**: `Navigator.push`, so the back button returns to the Dashboard.
- **Dashboard → Login (Logout)**: `Navigator.pushReplacement`, clearing the Dashboard (and username) from the stack.

The username is declared as a required constructor field on `DashboardPage`:
```dart
class DashboardPage extends StatelessWidget {
  final String username;
  const DashboardPage({super.key, required this.username});
  ...
}
```
and rendered directly in the UI via string interpolation: `Text('Welcome, $username')`.

## Project Structure

```
lib/
├── main.dart
├── splash.dart
├── login.dart
├── dashboard.dart
├── home.dart
├── about.dart
├── services.dart
└── task_manager.dart
```

## Tech Stack

- **Flutter** (Material widgets)
- No external state-management or routing packages — navigation is handled entirely with Flutter's built-in `Navigator` / `MaterialPageRoute` API.

## Getting Started

1. Install the [Flutter SDK](https://docs.flutter.dev/get-started/install).
2. Clone this repo and install dependencies:
   ```bash
   git clone <your-repo-url>
   cd <your-repo-folder>
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```
