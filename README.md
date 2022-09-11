# Nepanikař!

First aid for psychological issues - Official mobile app for [nepanikar.eu](https://nepanikar.eu/)

Original Qt version: https://github.com/ichlubna/mind

## Project specs

- targeted platforms: iOS, Android
- Flutter version: 3.0.5
- code style: 100 characters per line
- state management: [Provider](https://pub.dev/packages/provider)

## Project documentation

### Updating localization files
We are using [Localazy](https://localazy.com/) for managing app localizations.
The prerequisites for running the localization update script are:
   - Python SDK
   - Python dependency `stringcase`: `pip install stringcase`
   - Localazy CLI (run `npm install -g @localazy/cli` or see [Installation](https://localazy.com/docs/cli/installation) page for other options)

After that you can simply run the script located in `./bin/localazy/localazy_gen.sh`.

### Recompile .arb language files
`flutter gen-l10n`
