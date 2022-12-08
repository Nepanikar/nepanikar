# This generates .apk with different applicationId so that it can be
# installed without overriding the original app.

sed -i -e "s#package=\"org.dontpanic\"#package=\"org.dontpanic.dev\"#" android/app/src/main/AndroidManifest.xml
sed -i -e "s#android:label=\"Nepanikař\"#android:label=\"Nepanikař v2 [dev]\"#" android/app/src/main/AndroidManifest.xml
sed -i -e "s#applicationId \"org.dontpanic\"#applicationId \"org.dontpanic.dev\"#" android/app/build.gradle
sed -i -e "s#namespace \"org.dontpanic\"#namespace \"org.dontpanic.dev\"#" android/app/build.gradle
sed -i -e "s#package org.dontpanic#package org.dontpanic.dev#" android/app/src/main/kotlin/org/dontpanic/MainActivity.kt
sed -i -e "s#title: 'Nepanikař'#title: 'Nepanikař v2 [dev]'" lib/main.dart
sed -i -e "s#version: 0.1.0#version: 0.1.$1#" pubspec.yaml
