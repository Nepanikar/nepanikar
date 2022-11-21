sed -i -e "s#android:label=\"Nepanikař\"#android:label=\"Nepanikař [dev - migration]\"#" android/app/src/main/AndroidManifest.xml
sed -i -e "s#title: 'Nepanikař'#title: 'Nepanikař [dev - migration]'" lib/main.dart
sed -i -e "s#version: 0.1.0#version: 0.1.$1#" pubspec.yaml
