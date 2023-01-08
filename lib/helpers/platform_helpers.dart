import 'dart:io';

T platformMapper<T>({
  required T Function() ios,
  required T Function() android,
}) {
  if (Platform.isIOS) {
    return ios();
  }
  return android();
}
