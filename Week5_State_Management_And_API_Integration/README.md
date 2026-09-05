# Week 5 — State Management & API Integration (REST)

During Week 5, I worked on two important Flutter development concepts:

1. **State Management using Provider**
2. **REST API Integration**

The goal was to understand how data can be shared and maintained across different parts of a Flutter application and how a mobile app can retrieve and display data from an external API.


# Task 1 — State Management

## Task Description

Learn how to manage data across the application using a Flutter state management solution such as Provider, Bloc, or Riverpod.

For this task, I used **Provider** to create a **Counter & Theme Switcher** application where state remains consistent while moving between different tabs.

## Features

The application includes two main tabs:

### Counter

The Counter screen allows the user to:

- Increase the counter
- Decrease the counter
- Reset the counter to zero
- Move to another tab without losing the current counter value

### Theme Switcher

The Theme screen allows the user to:

- Switch between Dark Mode and Light Mode
- Apply the selected theme across the application
- View the counter value stored in the shared state
- Move between tabs while maintaining the selected theme

## State Management Logic

A central `AppState` class is used to manage shared application data.

```dart
class AppState extends ChangeNotifier {
  int _counter = 0;
  bool _isDarkMode = true;

  int get counter => _counter;
  bool get isDarkMode => _isDarkMode;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}
```

The `AppState` class extends `ChangeNotifier`.

Whenever the counter or theme changes, `notifyListeners()` informs the widgets listening to Provider that the state has changed.

The Provider is placed above `MaterialApp`, allowing the same state to be accessed throughout the application.

## State Flow

```text
                 AppState
                    |
          ---------------------
          |                   |
          v                   v
     Counter Tab          Theme Tab
          |                   |
          ------- Shared ------
                 State
```

For example:

```text
Counter = 0
    ↓
Increase 5 times
    ↓
Counter = 5
    ↓
Open Theme Tab
    ↓
Counter is still 5
    ↓
Enable Light Mode
    ↓
Return to Counter
    ↓
Counter = 5
Theme = Light
```

This demonstrates that both tabs use the same source of application state.

## State Management Deliverables

- Counter & Theme Switcher source code
- Provider implementation
- Shared state between tabs
- Dynamic light/dark theme
- One-page logic explanation

---

# Task 2 — API Integration (REST)

## Task Description

Connect the Flutter application to a live REST API, fetch a list of project data, and display the results as **Zynxis Projects** using a `ListView` with images and descriptions.

For this task, the application uses a REST API to retrieve data asynchronously.

## Features

The API Projects screen includes:

- Live HTTP GET request
- JSON response processing
- Dart project model
- Dynamic `ListView`
- Project cards
- Network images
- Project titles and descriptions
- Loading indicator
- Error handling
- Request timeout handling
- Retry functionality
- Image loading error handling
- Pull-to-refresh functionality

---

## REST API Flow

The application follows this process:

```text
Flutter Application
        |
        v
   HTTP GET Request
        |
        v
     REST API
        |
        v
   JSON Response
        |
        v
Convert JSON to Dart Objects
        |
        v
    FutureBuilder
        |
        v
ListView of Zynxis Projects
```

When the Projects screen opens, Flutter sends an asynchronous HTTP request.

While the application waits for the server response, the user sees:

```text
Fetching live projects...
```

When the request succeeds, the JSON response is converted into Dart `Project` objects and displayed inside a `ListView`.

---

## Project Model

The project model converts JSON data received from the API into Dart objects.

Example:

```dart
factory Project.fromJson(Map<String, dynamic> json) {
  return Project(
    id: json['id'],
    title: json['title'],
    description: json['body'],
  );
}
```

This separates the API response structure from the user interface.

---

## Fetching Live Data

The API request is handled inside `ApiService`.

```dart
final response = await http
    .get(Uri.parse(apiUrl))
    .timeout(
      const Duration(seconds: 10),
    );
```

A successful HTTP request returns status code:

```text
200 OK
```

The JSON response is then decoded:

```dart
final List<dynamic> jsonData =
    jsonDecode(response.body);
```

and converted into a list of Dart project objects.

---

## Loading State

`FutureBuilder` is used to monitor the asynchronous API request.

While data is being retrieved, the application displays a progress indicator and:

```text
Fetching live projects...
```

This provides feedback instead of leaving the screen blank while the application waits for the API.

---

## Successful Data State

After the request succeeds, project information is displayed in a scrollable `ListView`.

Each project card contains:

```text
┌──────────────────────────────┐
│                              │
│        Project Image         │
│                              │
├──────────────────────────────┤
│ PROJECT 1          LIVE API  │
│                              │
│ Project Title                │
│                              │
│ Project Description          │
│                              │
│ API Record ID: 1             │
└──────────────────────────────┘
```

Network images are loaded dynamically using `Image.network()`.

---

## Error Handling

The application handles failed requests instead of crashing.

The API service uses `try` and `catch`:

```dart
try {
  final response = await http
      .get(Uri.parse(apiUrl))
      .timeout(
        const Duration(seconds: 10),
      );

  if (response.statusCode == 200) {
    final List<dynamic> jsonData =
        jsonDecode(response.body);

    return jsonData
        .take(10)
        .map(
          (item) => Project.fromJson(item),
        )
        .toList();
  } else {
    throw Exception(
      'Server error: ${response.statusCode}',
    );
  }
} catch (error) {
  throw Exception(
    'Unable to fetch projects. '
    'Please check your internet connection.',
  );
}
```

The application can therefore handle:

- Internet connection failures
- API/server errors
- Request timeouts
- Invalid or unavailable responses

---

## Error UI

When the API request fails, the user sees:

```text
Unable to load projects

Please check your internet
connection and try again.

[ Retry ]
```

The **Retry** button sends another API request, allowing the user to recover without restarting the application.

This functionality was tested by disabling the network connection, confirming the error screen appeared, reconnecting to the internet, and retrying the request.

---

## Network Image Error Handling

Images retrieved from the internet also include error handling.

If an image cannot be loaded, the application displays a fallback image icon rather than breaking the project card.

```dart
errorBuilder: (
  context,
  error,
  stackTrace,
) {
  return const Icon(
    Icons.image_not_supported_outlined,
  );
}
```

---

# Project Structure

The Week 5 functionality is organized into separate Dart files:

```text
lib/
├── main.dart
├── app_state.dart
├── state_management.dart
├── project_model.dart
├── api_service.dart
├── api_projects.dart
├── splash.dart
├── login.dart
├── dashboard.dart
├── home.dart
├── about.dart
├── services.dart
└── task_manager.dart
```

### Important Week 5 Files

| File | Purpose |
|---|---|
| `app_state.dart` | Stores and updates shared application state |
| `state_management.dart` | Counter and Theme Switcher UI |
| `project_model.dart` | Converts API JSON into Dart project objects |
| `api_service.dart` | Handles REST API requests and errors |
| `api_projects.dart` | Displays API project data in the UI |
| `main.dart` | Provides global state and application theme |
| `dashboard.dart` | Provides navigation to the Week 5 features |

---

# Technologies Used

- Flutter
- Dart
- Provider
- ChangeNotifier
- Material Design
- REST API
- HTTP
- JSON
- FutureBuilder
- ListView
- Network Images

---

# Concepts Practiced

During Week 5, I practiced:

- State management with Provider
- `ChangeNotifier`
- `notifyListeners()`
- Shared application state
- State persistence between tabs
- Dynamic light and dark themes
- REST API communication
- HTTP GET requests
- Asynchronous programming
- JSON decoding
- Dart data models
- `FutureBuilder`
- Dynamic `ListView` creation
- Network image loading
- Loading states
- API error handling
- Timeout handling
- Retry functionality
