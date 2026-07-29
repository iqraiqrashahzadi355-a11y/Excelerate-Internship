# Excelerate Learning Platform v1.0.0

## Highlights

- Persistent dashboard navigation
- JSON-backed program catalogue
- Program details and feedback flow
- My Learning and Profile screens
- Shared Material 3 design system

## Included Screens

- Login and Sign Up
- Home
- Program Listing
- Program Details
- Feedback Form
- My Learning
- Profile

## Technical Improvements

- `ProgramRepository` for program loading
- Bundled `assets/data/programs.json` data source
- Centralized named routes
- State-preserving dashboard `IndexedStack`
- Reusable design-system components
- Form validation plus loading, empty, and error states

## Known Limitations

- Authentication is currently simulated.
- Program data is loaded from local JSON.
- Feedback and enrollment are not persisted to a backend.
- Some actions remain prototype-only.
