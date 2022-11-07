sed -i -e "s#android:label=\"Nepanikař\"#android:label=\"Nepanikař v2\"#" android/app/src/main/AndroidManifest.xml
sed -i -e "s#title: 'Nepanikař'#title: 'Nepanikař v2'" lib/main.dart
sed -i -e "s#version: 0.0.2#version: 0.0.$1#" pubspec.yaml
