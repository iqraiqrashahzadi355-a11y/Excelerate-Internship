# Excelerate Learning Platform

Excelerate is a Flutter learning-platform prototype where learners can browse programs, view program details, explore enrollment and learning-tracking flows, and submit feedback.

## Features

- Simulated Login and Sign Up flows
- Dashboard with persistent bottom navigation
- Home screen with program recommendations
- Program data loaded from a bundled JSON asset
- Program Listing and Program Details screens
- Feedback Form with validation and a star rating
- My Learning and Profile dashboard tabs
- Shared Material 3 design system
- Loading, empty, and error states for program content

## Application Screens

Repository screenshots have not yet been added.

| Screen | Screenshot |
| --- | --- |
| Login | Screenshot pending: `docs/screenshots/login.png` |
| Home | Screenshot pending: `docs/screenshots/home.png` |
| Program Listing | Screenshot pending: `docs/screenshots/program-listing.png` |
| Program Details | Screenshot pending: `docs/screenshots/program-details.png` |
| Feedback Form | Screenshot pending: `docs/screenshots/feedback-form.png` |
| My Learning | Screenshot pending: `docs/screenshots/my-learning.png` |
| Profile | Screenshot pending: `docs/screenshots/profile.png` |

## Navigation Flow

```text
Login
-> Dashboard
   -> Home / Programs / My Learning / Profile

Programs
-> Program Details
-> Feedback Form
```

## Architecture

The application uses Flutter and Dart with a shared Material 3 design system. Program records are decoded into the `Program` model from `assets/data/programs.json` by `ProgramRepository`. `AppRoutes` centralizes named routes, while `DashboardScreen` uses an `IndexedStack` to preserve the state of its four tabs. Reusable design-system components provide common cards, controls, layout, feedback, and profile elements.

## Project Structure

```text
lib/
|-- app.dart                    # Theme and named-route configuration
|-- main.dart                   # Application entry point and program loading
|-- models/                     # Program data model
|-- routes/                     # Central route constants
|-- services/                   # Local JSON repository
|-- screens/                    # Application screens and dashboard tabs
|-- design_system/              # Theme, tokens, and reusable components
|-- features/programs/widgets/  # Program-specific reusable widgets
`-- debug/                      # Design-system showcase
```

## How to Run

From the repository root:

```bash
flutter pub get
flutter run
```

## Testing

Use the following validation commands:

```bash
flutter analyze
flutter test
```

Validation results are intentionally not claimed in this README; run the commands in your local Flutter environment for the current result.

## Team Contributions

- Lords Chilled Life - Team Lead, submission coordination and presentation
- Bilal Feroz Khan - Project Manager, GitHub setup, JSON data service, integration, README and final repository management
- Iqra Shahzadi - Login, Sign Up and Feedback Form
- Ibrahim Salman - Home Screen and end-to-end testing
- Faith Wahome - Program Listing and changelog documentation
- Pranshu Namdeo - Program Details, shared design system, dashboard, My Learning and Profile

## Development Timeline

### Week 1

- Flutter repository setup
- Project vision and navigation planning

### Week 2

- Four core application screens
- Shared Material 3 design system
- Navigation integration

### Week 3

- `programs.json` local data asset
- `ProgramRepository` and expanded `Program` model
- Home and Program Listing JSON integration
- Expanded Program Details and Feedback Form

### Week 4

- Dashboard and `IndexedStack` navigation
- My Learning and Profile screens
- Final UI and navigation polish
- Repository cleanup, README update, and release preparation

## Demo

Demo video: To be added before final submission.

## Current Limitations

- Authentication is currently simulated.
- Program data is loaded from local JSON.
- Feedback and enrollment are not persisted to a backend.
- Some actions remain prototype-only.

## Repository

https://github.com/bilal-feroz/Excelerate-Internship
