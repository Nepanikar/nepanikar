# Nepanikař!

First aid for psychological issues - Official mobile app for [nepanikar.eu](https://nepanikar.eu/)

Original Qt version: https://github.com/ichlubna/mind

## Project specs & conventions

- targeted platforms: iOS, Android
- Flutter version: 3.0.5
- code style: 100 characters per line
- state management: [Provider](https://pub.dev/packages/provider)
- routing: [GoRouter](https://pub.dev/packages/go_router)

We are committing generated files (.g.dart, .freezed.dart) to VCS to save time in Continuous Integration.

## Project documentation

### Updating localization files
We are using [Localazy](https://localazy.com/) for managing app localizations.
The prerequisites for running the localization update script are:
   - Python SDK
   - Python dependency `stringcase`: `pip install stringcase`
   - Localazy CLI (run `npm install -g @localazy/cli` or see [Installation](https://localazy.com/docs/cli/installation) page for other options)

After that you can simply run the script located in `./bin/localazy/localazy_gen.sh`.

### Commands
- `flutter packages pub run build_runner build --delete-conflicting-outputs` - regenerate go_route/freezed files
- `flutter gen-l10n` - recompile .arb language files

