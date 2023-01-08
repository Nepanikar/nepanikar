#!/usr/bin/env sh

libFiles=$(find ./lib/ -type f -not -name "*.freezed.dart" -not -name "*.gr.dart" -not -name "*.gen.dart" -not -name "*.g.dart" -not -name "*.arb" -not -name ".gitkeep" -not -name "firebase_options.dart")
for file in $libFiles; do
  dart format --line-length 100 --output=none --set-exit-if-changed $file
  if [ $? -eq 1 ]; then
    exit 1
  fi
done
