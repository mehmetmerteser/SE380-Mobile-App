# SE380-Mobile-App

Group project for **SE 380 – Mobile Application Development** at **Izmir University of Economics**.

## Purpose

This repository will host a mobile application built with **Flutter** and **Dart**. The project provides a shared workspace for applying course concepts, planning the application, developing its interface and functionality, and testing the result collaboratively.

The application topic, requirements, and supported platforms will be defined by the project team in accordance with course requirements.

## Current status

Initial repository setup only. No application features or runnable Flutter scaffold have been implemented yet.

## Repository structure

```text
SE380-Mobile-App/
├── assets/       # Future images, fonts, and other application assets
├── docs/         # Requirements, design notes, and course documentation
├── lib/          # Future Dart application source code
├── test/         # Future automated tests
├── .gitignore    # Flutter, Dart, platform, and local configuration exclusions
└── README.md
```

Empty directories contain `.gitkeep` placeholders so they can be tracked by Git. Replace these placeholders as files are added.

## Future development setup

1. Install the Flutter SDK, which includes Dart, and the tools for the platforms selected by the team.
2. Run `flutter doctor` to verify the development environment.
3. Clone this repository and switch to the `main` branch.
4. When development begins, generate the Flutter scaffold in the repository root using the Dart-compatible project name `se380_mobile_app` and the team's selected platforms. Review generated changes and preserve this README and ignore rules.
5. Once the scaffold and `pubspec.yaml` exist, use `flutter pub get`, `flutter analyze`, and `flutter test` to prepare and check the project.

Commit `pubspec.lock` once generated to keep application dependency versions consistent. Declare assets in `pubspec.yaml` when they are introduced.

## Team workflow

Keep `main` stable. Develop changes on descriptive branches and review them through pull requests. Record agreed requirements and design decisions in `docs/`. Do not commit credentials, signing keys, or local environment configuration.

## Academic context

This repository is maintained for the SE 380 university group project. Implementation and documentation should follow the course's collaboration, submission, and academic integrity requirements.
