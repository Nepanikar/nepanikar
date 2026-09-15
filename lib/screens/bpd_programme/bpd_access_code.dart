/// Access code for the DBT programme.
///
/// The programme runs as a closed pilot: its home tile and its bottom-bar tab
/// stay hidden until someone types this code in Settings. Anyone who has the
/// code can unlock the app for themselves — that is the point, it is not
/// per-user.
///
/// This is a gate, **not** protection. The string ships inside the APK and can
/// be read out of it, so nothing that must stay secret may depend on it. What
/// it does buy is that the programme cannot be stumbled into, and the code
/// cannot be guessed: it is 12 random characters (~55 bits).
///
/// The alphabet deliberately leaves out the characters people mix up when they
/// copy a code off a leaflet — `0/O`, `1/I/L`, `5/S`, `2/Z`, `8/B`.
///
/// Changing the code is a one-line edit here, but it takes a new build, and it
/// does not re-lock anyone: [UserSettingsDao.unlockBpdProgramme] stores the
/// unlocked state, not the code.
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
