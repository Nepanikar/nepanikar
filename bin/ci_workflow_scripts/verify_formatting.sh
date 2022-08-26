#!/usr/bin/env sh

libFiles=$(find ./lib/ -type f -not -regex ".*\.\(freezed\|gr\|g\).dart" -not -name "*.arb")
for file in $libFiles; do
  dart format --line-length 100 --output=none --set-exit-if-changed $file
  if [ $? -eq 1 ]; then
    exit 1
  fi
done
