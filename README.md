# SE380-Mobile-App

Group project for **SE 380 – Mobile Application Development** at **Izmir University of Economics**.

## Purpose

This repository will host a mobile application built with **Flutter** and **Dart**. The project provides a shared workspace for applying course concepts, planning the application, developing its interface and functionality, and testing the result collaboratively.

The application topic, requirements, and supported platforms will be defined by the project team in accordance with course requirements.

## Current status

Constructly now includes a runnable Flutter scaffold for Android, iOS, and web,
an initial responsive interface, and a Firebase-connected data layer.

Implemented UI work:

- Login and demo access flow
- Project dashboard and reusable design components
- Apartment list and apartment detail screens
- Cost, supplier, and worker management screens
- Navigation between the main features

Implemented backend preparation:

- Android and web Firebase configuration
- Live e-mail/password authentication and profile lookup
- Firebase Core, Authentication, and Cloud Firestore dependencies
- User roles and application data models
- Authentication, project, apartment, and financial repositories
- Initial Firestore schema documentation and security rules

Authentication is live on Android and web. Dashboard, apartment, cost, supplier,
and worker screens still use sample records while their Firestore repositories
are integrated. iOS Firebase configuration is planned for the next iteration.

## Repository structure

```text
SE380-Mobile-App/
├── android/      # Android application host
├── ios/          # iOS application host
├── web/          # Chrome/web application host
├── docs/         # Database and design documentation
├── lib/
│   ├── app/      # Application root
│   ├── core/     # Theme, widgets, and Firebase bootstrap
│   ├── features/ # UI screens grouped by feature
│   ├── models/   # Application data models
│   └── repositories/ # Firebase data access layer
├── test/         # Widget and model tests
├── firestore.rules
├── firebase.json
├── pubspec.yaml
└── README.md
```

## Development setup

1. Install the Flutter SDK, which includes Dart, and the tools for the platforms selected by the team.
2. Run `flutter doctor` to verify the development environment.
3. Clone this repository and switch to the `main` branch.
4. Run `flutter pub get`.
5. Use `flutter run -d chrome` for the web preview or select an Android/iOS device.
6. Run `flutter analyze` and `flutter test` before opening a pull request.

Commit `pubspec.lock` once generated to keep application dependency versions consistent. Declare assets in `pubspec.yaml` when they are introduced.

## Team workflow

Keep `main` stable. Develop changes on descriptive branches and review them through pull requests. Record agreed requirements and design decisions in `docs/`. Do not commit credentials, signing keys, or local environment configuration.

## Academic context

This repository is maintained for the SE 380 university group project. Implementation and documentation should follow the course's collaboration, submission, and academic integrity requirements.
