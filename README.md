## Week 3 Updates

During Week 3, the application was upgraded from hardcoded program data to a local JSON-based data source.

### Completed Work

- Added `assets/data/programs.json` with six program records
- Added `ProgramRepository.loadPrograms()` to load and decode JSON data
- Extended the `Program` model with duration, certification, cohort size, instructor, rating and review fields
- Updated the Home Screen to load programs asynchronously
- Updated Program Listing with loading, error and retry states
- Updated Program Details to display the new JSON fields
- Added a Feedback Form with validation, star rating and success confirmation
- Connected the Feedback Form to Program Details
- Preserved navigation between Home, Program Listing and Program Details

## Week 3 Pull Requests

- PR #9 — Add Week 3 JSON program data service
- PR #10 — Add Feedback Form screen
- PR #11 — Add Home Screen JSON integration
- PR #12 — Add Program Details JSON integration

## Week 3 Validation

- JSON repository test passed
- Navigation and JSON loading were manually verified
- Loading, error and success states were implemented
