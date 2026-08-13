# Week 3 - Interactive Components
# Flutter Task Manager

A simple **Task Manager mobile UI** built with Flutter and Dart. This task focuses on implementing interactive Flutter input widgets, including TextFields, Checkboxes, Sliders, Buttons, Snackbars, and Alert Dialogs.

## Task: Task Manager

The objective of this task was to build an interactive Task Manager screen where users can enter task information, mark progress, adjust task priority, and interact with buttons that display feedback.

## Features

### Task Input

The Task Manager uses `TextField` widgets to allow users to enter:

* Task name
* Task notes/details

### Task Progress

Checkboxes allow the user to track different stages of task completion:

* Design completed
* Development completed
* Testing completed

Completed items are visually marked with a strikethrough.

### Priority Slider

A `Slider` allows the user to set the task priority between:

```text
0% → 100%
```

The selected priority percentage is displayed dynamically as the slider moves.

### Add Task Button

The **Add Task** button validates the task name.

If no task name has been entered, a Snackbar displays:

> Please enter a task name first.

If a task name has been entered successfully, a confirmation Snackbar is displayed.

### Save Task Button

The **Save Task** button opens an `AlertDialog` asking the user to confirm the action.

The dialog provides:

* Cancel
* Save

After confirmation, the application displays a Snackbar confirming that the task was saved.

## Flutter Concepts Practiced

This task demonstrates the use of:

* `TextField`
* `TextEditingController`
* `CheckboxListTile`
* `Slider`
* `ElevatedButton`
* `OutlinedButton`
* `SnackBar`
* `AlertDialog`
* `StatefulWidget`
* `setState()`
* `Row`
* `Column`
* `Container`
* `SingleChildScrollView`

## Project Structure

The Task Manager was added to the existing Zynxis Flutter application.

```text
lib/
├── main.dart
├── home.dart
├── about.dart
├── services.dart
└── task_manager.dart
```

### File Responsibilities

* `main.dart` — application setup, theme, and screen navigation
* `home.dart` — Zynxis Home screen
* `about.dart` — Zynxis About screen
* `services.dart` — Zynxis Services screen
* `task_manager.dart` — interactive Task Manager screen

## State Management

The Task Manager uses Flutter's built-in `StatefulWidget` and `setState()` functionality.

State is used to manage:

* Checkbox completion status
* Slider priority value
* Task input
* Notes input

This allows the interface to update immediately when the user interacts with the controls.

## Design

The Task Manager follows the existing Zynxis visual style using a professional charcoal/slate-grey dark theme.

The interface includes:

* Dark slate background
* Styled input fields
* Rounded containers
* Slate-grey borders
* White headings
* Muted secondary text
* Consistent spacing and typography

## Running the Project

Install dependencies:

```bash
flutter pub get
```

Run the Flutter application:

```bash
flutter run
```

Navigate to the **Tasks** tab using the bottom navigation bar.

## Task Requirements Completed

The implementation includes:

* ✅ TextFields for user input
* ✅ Checkboxes for task completion
* ✅ Slider for task priority
* ✅ Buttons for user actions
* ✅ Snackbar feedback
* ✅ Alert Dialog interaction
* ✅ Stateful UI updates
* ✅ Responsive mobile layout

## Technologies

* Flutter
* Dart
* Material Design 3

## Task Outcome

Successfully implemented an interactive Task Manager screen using Flutter form controls and state management. The screen demonstrates user input handling, task completion controls, priority adjustment, button interactions, Snackbars, and Alert Dialogs within the existing Zynxis mobile application.
