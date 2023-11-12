
# Clean Architecture Todo App with BLoC

This is a sample Flutter project that demonstrates how to implement Clean Architecture with BLoC for state management.
The app is a simple todo list manager that follows best practices for structuring your Flutter projects.

[bloc]: https://bloclibrary.dev/
[clean_architecture]: https://dev.to/marwamejri/flutter-clean-architecture-1-an-overview-project-structure-4bhf

## Features

- **Weekly tasks list**: See weekly tasks.

- **Add Tasks**: Create and add new tasks to your to-do list.

- **Mark as Completed**: Mark tasks as completed when you finish them.

## Architecture

This project follows Clean Architecture principles, separating the application into different layers:

- **Presentation Layer**: Contains the user interface components, including screens, widgets, and BLoC classes for managing the UI state.

- **Domain Layer**: Represents the core business logic and use cases of the app. It defines entities, repositories, and use cases.

- **Data Layer**: Handles data sources, data models, and repositories. In this project, we use in-memory data ('Floor' an SQLite database) for simplicity.

## Unit Tests

In this project, we have unit tests for the domain layer and the data layer.

## Getting Started

Download the project.

Make sure you have Flutter installed on your machine:

[flutter]: https://flutter.dev/docs/get-started/install

Get dependencies by running: flutter pub get

Generate the required files by running: dart pub run build_runner build --delete-conflicting-outputs

Run the app: flutter run