/// Access code for the closed DBT pilot: the home tile and the DBT tab stay
/// hidden until someone types it in Settings. Shared, not per-user.
///
/// A gate, **not** protection — the string ships inside the APK. Twelve random
/// characters, leaving out `0/O`, `1/I/L`, `5/S`, `2/Z`, `8/B` so it survives
/// being read off a leaflet. Changing it takes a build and re-locks nobody.
const kBpdAccessCode = 'AVFK-GXN4-T966';

/// Everything that is not a letter or a digit, plus letter case, is noise: the
/// same code is typed `AVFK-GXN4-T966`, `avfk gxn4 t966` or `AVFKGXN4T966`
/// depending on who is reading it out.
String _normalise(String value) => value.toLowerCase().replaceAll(RegExp('[^a-z0-9]'), '');

/// Whether [input] unlocks the programme.
bool isValidBpdAccessCode(String input) {
  final typed = _normalise(input);
  // Guard the degenerate case: punctuation only normalises to an empty
  // string, which must never match.
  return typed.isNotEmpty && typed == _normalise(kBpdAccessCode);
}
