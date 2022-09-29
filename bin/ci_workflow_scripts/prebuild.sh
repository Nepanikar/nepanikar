sed -i -e "s#package=\"org.dontpanic\"#package=\"org.dontpanic.dev\"#" android/app/src/main/AndroidManifest.xml
sed -i -e "s#android:label=\"Nepanikař\"#android:label=\"Nepanikař [dev]\"#" android/app/src/main/AndroidManifest.xml
sed -i -e "s#applicationId \"org.dontpanic\"#applicationId \"org.dontpanic.dev\"#" android/app/build.gradle
sed -i -e "s#package org.dontpanic#package org.dontpanic.dev#" android/app/src/main/kotlin/org/dontpanic/MainActivity.kt
sed -i -e "s#title: 'Nepanikař'#title: 'Nepanikař [dev]'" lib/main.dart
sed -i -e "s#version: 0.0.1#version: 0.0.$1#" pubspec.yaml
