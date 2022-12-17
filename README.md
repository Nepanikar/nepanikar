# Nepanikař!

First aid for psychological issues - Official mobile app for [nepanikar.eu](https://nepanikar.eu/)

Original Qt version: https://github.com/ichlubna/mind

## Project specs & conventions

- targeted platforms: iOS, Android
- Flutter version: 3.3.x
- code style: 100 characters per line
- state management: [Provider](https://pub.dev/packages/provider)
- routing: [GoRouter](https://pub.dev/packages/go_router)
- data persistence: [sembast](https://pub.dev/packages/sembast) (NoSQL)

We are committing generated files (.g.dart, .freezed.dart) to VCS to save time in Continuous Integration.

## Project documentation

### Adding a new asset

[flutter_gen](https://pub.dev/packages/flutter_gen) package let's us quickly generate paths for images/icons.
To add a new asset, add it to `./assets/` and then run `flutter packages pub run build_runner build -d`.
If you are creating a new assets folder, do not forget to reference it in `pubspec.yaml`.

### Updating localization files

We are using [Localazy](https://localazy.com/) for managing app localizations.

The prerequisites for running the localization update script are:

- Python SDK
- Python dependency `stringcase`: `pip install stringcase`
- Localazy CLI (run `npm install -g @localazy/cli` or see [Installation](https://localazy.com/docs/cli/installation)
  page for other options)

After that you can simply run the script located in `./bin/localazy/localazy_gen.sh`.

### Updating contacts & help data

Contacts & help data are generated from Dart objects for easier maintainability. These data are then converted and
shipped within the app as JSON which is located in the `./assets/contacts/` folder. The whole contacts & help UI in 
the app is controlled by the content of this JSON file.

The prerequisites for updating and regenerating these data is:

- Dart SDK

The source of these data are managed by `nepanikar_contacts_gen` Dart package, source data are located 
in `./packages/nepanikar_contacts_gen/bin/translation_extra_files/{language_tag}.dart`. 

Make there the necessary changes then simply run the script located in `./bin/nepanikar_contacts_gen` 
to regenerate the JSON file.

### Commands

- `flutter packages pub run build_runner build -d` - regenerate go_route/freezed/assets files
- `flutter pub run build_runner watch --delete-conflicting-outputs` - watch and generate automatically changes when files are changed
- `flutter gen-l10n` - recompile .arb language files

### Credits
We thank these tools and services for making better developer experience:
- [Codemagic](https://codemagic.io/) - CI/CD for mobile apps (automatic builds, tests & publishing to stores)
- [Localazy](https://localazy.com/) - localization management