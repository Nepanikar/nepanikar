# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Nepanikař (Don't Panic) - A Flutter-based mobile app providing first aid for psychological issues. Targets iOS and Android platforms. Official app for [nepanikar.eu](https://nepanikar.eu/).

## Agent reference docs (load on demand)

Detailed, focused references live in `docs/agent/`. Read **only the one you need** for the task
at hand (keeps context small) — start from the index:

- `docs/agent/README.md` — index + repo map + 10-second orientation
- `docs/agent/design-system.md` — color palette, fonts, sizes, theming, reusable widgets
- `docs/agent/architecture.md` — DI (GetIt), routing, database/DAO pattern, services, startup
- `docs/agent/localization.md` — l10n usage, ARB files, plurals, supported languages
- `docs/agent/patterns.md` — code style, naming, screen skeleton, codegen, do/don'ts

## Tech Stack & Conventions

- **Flutter version**: 3.35.x
- **Code style**: 100 characters per line, lint package for analysis
- **State management**: Provider package
- **Routing**: GoRouter with typed routes (go_router_builder)
- **Data persistence**: sembast (NoSQL)
- **Dependency injection**: GetIt (via `registry` singleton)
- **Localizations**: Localazy for multi-language support (20+ languages)
- **Code generation**: build_runner with freezed, json_serializable, flutter_gen
- **Notifications**: AwesomeNotifications

## Common Development Commands

### Running the app
```bash
flutter run
```

### Code generation
After modifying routes, models with @freezed, or adding assets:
```bash
flutter packages pub run build_runner build -d
```

Watch mode for automatic generation:
```bash
flutter pub run build_runner watch -d
```

### Localization
Recompile .arb language files:
```bash
flutter gen-l10n
```

Update localizations from Localazy (requires Python SDK, stringcase package, and Localazy CLI):
```bash
./bin/localazy/localazy_gen.sh
```

### Formatting
```bash
dart format --line-length 100 ./
```

### Splash screen
Regenerate splash screen after changes:
```bash
flutter pub run flutter_native_splash:create
```

### Contacts & Help Data
Update contacts and help section data (generates JSON from Dart objects):
```bash
./bin/nepanikar_contacts_gen/nepanikar_contacts_gen.sh
```
Source data is in `./packages/nepanikar_contacts_gen/bin/translation_extra_files/{language_tag}.dart`.

### Tests
```bash
flutter test
```

## Architecture

### Application Initialization
Entry point: `lib/main.dart` → calls `setup()` from `lib/utils/app_setup.dart`

The `setup()` function:
1. Initializes Firebase (Crashlytics, Analytics)
2. Registers services in GetIt registry
3. Initializes DatabaseService (sembast)
4. Sets up NotificationsService
5. Precaches assets (SVGs, Lottie animations)
6. Initializes ContactsDataManager

### Dependency Injection
Uses GetIt via `lib/utils/registry.dart`:
- Single global instance accessed via `registry` variable
- Services registered during app setup
- Access via `registry.get<ServiceType>()`

### Routing
GoRouter with code generation:
- Route definitions in `lib/app/router/routes.dart`
- Uses `@TypedGoRoute` annotations with `part 'routes.g.dart'`
- After changes, run build_runner to regenerate `routes.g.dart`
- Main route groups: settings, games, contacts, home modules, BPD programme/tests
- GoRouterObserver automatically logs screen views to Firebase Analytics

### Database Architecture
NoSQL database using sembast:
- Main service: `lib/services/db/database_service.dart`
- Database file: `app.db` in app's documents directory
- Module-based structure with DAOs (Data Access Objects)
- Modules: depression, self_harm, suicidal_thoughts, eating_disorder, my_records, my_contacts, tests
- Each module has:
  - ModuleDb class (e.g., `DepressionModuleDb`) with `initModuleDaos()` and `preloadDefaultModuleData()`
  - DAO classes for data access
  - Models using `@freezed` and `@JsonSerializable` with generated `.freezed.dart` and `.g.dart` files
- Supports migration from old app versions (Android config files, iOS SharedPreferences)
- User settings stored via `UserSettingsDao` with streams for reactive UI
- Data export functionality via `ExportService`

### State Management
Provider package:
- App-level providers in `lib/main.dart` (MoodChartFilterProvider, MoodState, MoodHeatmapFilterProvider)
- Services provide streams that rebuild UI (e.g., `UserSettingsDao.localeStream`, `themeModeStream`)
- UI listens to streams via StreamBuilder

### Screen Structure
Screens organized by feature modules:
- `lib/screens/home/` - Core features (anxiety, depression, self_harm, suicidal_thoughts, eating_disorder, my_records)
- `lib/screens/contacts/` - Contact and crisis support screens
- `lib/screens/settings/` - App settings
- `lib/screens/main/` - Main navigation screen
- `lib/screens/bpd_programme/` - Test screens (GAD-7, PHQ-9, PSS, BRCS)
- `lib/games/` - Interactive exercises (breathing, relaxation, math, balance, balloons)

### Widgets
Reusable components in `lib/widgets/`:
- Screen wrapper: `NepanikarScreenWrapper`
- Contact tiles: `PhoneContactTile`, `ChatContactTile`
- Record tiles: `DiaryTile`, `FoodRecordTile`
- Test components: `TestCard`, `TestScoreWidget`
- Navigation: `BottomNavbarItem`

### Assets
Generated asset references via flutter_gen:
- Path: `lib/app/generated/assets.gen.dart`
- After adding assets to `./assets/`, run build_runner
- Reference new asset folders in `pubspec.yaml`

### Theming
- Light theme: `lib/app/theme/theme.dart`
- Dark theme: `lib/app/theme/dark_theme.dart`
- Custom font: Satoshi (with fallback for Ukrainian)
- Dynamic main color support via UserSettings
- Custom colors in `lib/app/theme/colors.dart`

### Services
Key services in `lib/services/`:
- **DatabaseService**: Main database coordinator, initializes all module DAOs
- **NotificationsService**: Handles notifications via AwesomeNotifications, integrates with routing
- **ExportService**: Exports user data from database
- **SaveDirectories**: Manages app file paths

### Local Packages
Two internal packages in `./packages/`:
1. **nepanikar_contacts_gen**: Generates JSON contact/help data from Dart models
   - After updating models, run: `flutter pub get` then `flutter packages pub run build_runner build -d`
2. **nepanikar_data_migration**: Handles data migration from old app versions

## Data Flow

1. User settings changes → `UserSettingsDao` → Stream → UI rebuilds via StreamBuilder
2. Database operations → Module DAO → sembast store → persistence
3. Routes → GoRouter → TypedGoRoute classes → Screen widgets
4. Localization → Localazy → .arb files → `flutter gen-l10n` → AppLocalizations

## Testing

Build verification test ensures generated files are up to date:
- Located in `test/ensure_build_runner_test.dart`
- Run after modifying annotated files to verify build_runner output is committed

## Code Generation Pattern

Files using code generation follow the `part`/`part of` pattern:
- In the main file: `part 'filename.g.dart';` or `part 'filename.freezed.dart';`
- Generated files contain: `part of 'filename.dart';`
- Always run build_runner after modifying:
  - Routes (files with `@TypedGoRoute`)
  - Models with `@freezed` annotation
  - Models with `@JsonSerializable`
  - Adding new assets to `./assets/`

## Important Notes

- Contacts/help content is JSON-driven from `./assets/contacts/`, generated from Dart models
- Test data (GAD-7, PHQ-9, PSS, BRCS) stored in `./assets/tests/` as CSV files
- Firebase is configured for both platforms (see `lib/firebase_options.dart`)
- Firebase Analytics automatically tracks screen navigation via GoRouterObserver
- Multi-language support with locale-specific app names (Nepanikař/Nepanikár/Don't Panic)
- Text scaling is disabled (`TextScaler.noScaling`) - accessibility consideration pending
- Custom scroll behavior via `NepanikarScrollBehavior`

---

## BPD Programme Development

### Structure
```
lib/screens/bpd_programme/
├── bpd_weeks_screen.dart       # Week selection carousel
├── bpd_week_detail_screen.dart # Days list for a week
├── days/                       # Individual day screens
│   └── day2_education_screen.dart
└── smart/                      # SMART goals feature
    ├── smart_education_screen.dart
    └── smart_goal_form_screen.dart

lib/widgets/bpd/
├── day_preview_sheet.dart      # Bottom sheet for day preview
└── day_page_base.dart          # Reusable widgets for day pages

assets/bpd/
└── programme_content.json      # All programme content data
```

### Content Data
Programme content is in `assets/bpd/programme_content.json`. Use this for:
- Day titles, descriptions, estimated times
- Page content for education days
- Consistency across the app

### Reusable Widgets (lib/widgets/bpd/day_page_base.dart)
- `DayPageBase` - Scrollable content with fixed bottom button
- `SectionHeader` - Icon + title header for sections
- `FeatureCard` - Card with icon, title, description
- `NumberedBenefit` - Numbered list item with title/description
- `InfoBox` - Highlighted info box with icon

### Route Types in bpd_week_detail_screen.dart
```dart
enum _DayRouteType {
  regular,        // Generic day content
  onboarding,     // Day 1 onboarding flow
  day2Education,  // Day 2 HPO+DBT education
  smart,          // SMART goals (Day 3)
  pause,          // Rest days (5, 6)
  summary,        // Week summary (Day 7)
}
```

### Adding a New Day Screen
1. Create `lib/screens/bpd_programme/days/dayX_screen.dart`
2. Add route to `lib/app/router/routes.dart`:
   - Import the screen
   - Add TypedGoRoute to `_bpdProgrammeRoutes`
3. Run `flutter pub run build_runner build -d`
4. If build_runner fails to generate .g.dart, create manually (copy from existing)
5. Add route type to enum in `bpd_week_detail_screen.dart`
6. Add case to switch in `_handleDayTap`

---

## Efficiency Guidelines for AI Assistants

### Build Runner Issues
- Try build_runner MAX 2 times
- If it fails, manually create .g.dart file (copy pattern from existing)
- Don't waste tokens debugging build_runner

### File Operations
- Use `offset` and `limit` when reading large files
- Read only relevant sections, not entire files
- Batch multiple edits into single Edit calls where possible

### Code Structure
- Keep files under 300 lines
- Split large screens into separate page widgets
- Use reusable widgets from `lib/widgets/bpd/`

### Content
- All BPD content is in `assets/bpd/programme_content.json`
- Reference this instead of hardcoding content
- Update JSON when adding new days/weeks

### Common Patterns
```dart
// Day screen with multi-page flow
class DayXScreen extends StatefulWidget {
  // PageController + _currentPage state
  // PageView with NeverScrollableScrollPhysics
  // Progress bar header
  // Individual page widgets using DayPageBase
}

// Prevent overflow - always use this pattern:
Column(
  children: [
    Expanded(
      child: SingleChildScrollView(
        child: content,
      ),
    ),
    // Fixed bottom button
  ],
)
```

### Don't
- Don't read entire large files multiple times
- Don't try build_runner more than twice
- Don't hardcode content that's in JSON
- Don't create files over 300 lines
- Don't use Spacer() in scrollable contexts (causes overflow)