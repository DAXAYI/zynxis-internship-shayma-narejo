# Week 6 - Local Storage & Firebase + Final Capstone: Zynxis Intern Portal

A Flutter-based Intern Portal developed as part of the Zynxis Mobile App Development Internship. The project combines Firebase Cloud Firestore, REST API integration, state management, and form submission into a functional mobile application.

## Project Overview

The Zynxis Intern Portal allows interns to view their profiles, access a task list, submit weekly reports, and save favorite projects using Firebase Cloud Firestore.

The final capstone builds upon the features developed during previous internship weeks and brings them together in a single Flutter application.

## Week 6: Local Storage & Firebase

**Objective:** Implement a Favorites feature that saves selected projects to a database and retains them after the application restarts.

### Features Implemented

* Integrated Firebase with the existing Flutter application.
* Configured Cloud Firestore for database storage.
* Created a Favorites service to add, retrieve, and remove saved projects.
* Added interactive heart buttons to the Zynxis Projects screen.
* Stored project IDs, titles, descriptions, image URLs, favorite status, and timestamps in Firestore.
* Implemented favorite restoration when the Projects screen is reopened after an app restart.

### Firebase Database Structure

```text
Cloud Firestore
└── favorites
    └── project_1
        ├── projectId
        ├── title
        ├── description
        ├── imageUrl
        ├── isFavorite
        └── savedAt
```

**Persistence:** Favorite records are stored in Cloud Firestore rather than only in application memory.

## Final Capstone: Zynxis Intern Portal

**Objective:** Build a mini Intern Portal featuring a profile view, a task list using the Week 5 REST API, and a report submission form connected to a mock backend.

### 1. Intern Profile

* Displays the username entered during login.
* Shows internship role, company, status, and development track.
* Uses a responsive Flutter interface with a dark-themed profile card.

### 2. Intern Task List

* Retrieves demo task-list records using the Week 5 REST API integration.
* Displays task IDs, titles, and descriptions.
* Includes loading indicators, error handling, retry functionality, and pull-to-refresh.

The task list uses JSONPlaceholder demo records rather than actual Zynxis-assigned internship tasks.

### 3. Submit Report

* Provides a weekly internship report form.
* Includes report title, internship week, work summary, and challenges/blockers.
* Validates required fields before submission.
* Sends report data to the JSONPlaceholder mock backend using an HTTP POST request.
* Displays a success dialog containing the simulated report ID and submission details.
* Handles network and submission errors.

**Note:** The mock backend acknowledges submissions but does not permanently store reports.

### 4. Additional Integrated Features

The portal retains previously developed functionality, including:

* Splash screen, login, and dashboard navigation.
* Home, About, and Services screens.
* Task Manager.
* Provider-based counter and theme switcher.
* REST API project listing.
* Firebase Favorites.

## Technologies Used

| Technology      | Purpose                                  |
| --------------- | ---------------------------------------- |
| Flutter & Dart  | Mobile application development           |
| Firebase Core   | Firebase initialization                  |
| Cloud Firestore | Persistent Favorites storage             |
| Provider        | Application state management             |
| HTTP            | REST API requests and report submission  |
| JSONPlaceholder | Mock REST API backend                    |
| Android Studio  | Development, testing, and APK generation |

## Project Structure

```text
lib/
├── main.dart
├── firebase_options.dart
├── app_state.dart
├── splash.dart
├── login.dart
├── dashboard.dart
├── profile.dart
├── intern_tasks.dart
├── submit_report.dart
├── home.dart
├── about.dart
├── services.dart
├── task_manager.dart
├── state_management.dart
├── api_projects.dart
├── api_service.dart
├── project_model.dart
└── favorites_service.dart
```

## Installation and Setup

**Requirements:** Flutter SDK, Android Studio or VS Code, an Android emulator or physical device, and a configured Firebase project.

Clone the repository:

```bash
git clone <your-repository-url>
cd zynxis_welcome_app
```

Install dependencies:

```bash
flutter pub get
```

Configure Firebase for your own project using FlutterFire CLI if the included Firebase configuration is not applicable to your environment:

```bash
flutterfire configure
```

Run the application:

```bash
flutter run
```

Build the release APK:

```bash
flutter build apk --release
```

The generated APK is located at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

## Testing

The application was tested on an Android emulator. The release APK was successfully generated and installed.

Testing covered the Intern Profile display, REST API task listing, report submission response, and Firebase Favorites functionality.

## Final Deliverables

* **Zynxis_Intern_Portal.apk** — Android release application.
* **Zynxis_Intern_Portal_Documentation.pdf** — Four-page project documentation.
* **Zynxis_Intern_Portal_Final.zip** — Final submission package containing the APK and documentation.

## Conclusion

The Week 6 and Final Capstone tasks demonstrate the integration of persistent cloud storage, REST API data retrieval, form validation, mock-backend communication, and Flutter navigation into a single mobile application.

The completed Zynxis Intern Portal brings together the technical skills developed throughout the internship and provides a foundation for future features such as Firebase Authentication, user-specific data storage, and permanent report management.
