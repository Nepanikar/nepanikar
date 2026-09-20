/// The participant's own number for the pilot study.
///
/// The number is **issued by the researcher**, not by the app: it arrives by
/// e-mail before onboarding, the participant types it in at the end of the
/// seven weeks, and it travels out with the study export. That is what ties
/// three separate things together — the entry questionnaire, the exit
/// questionnaire and the export — without any of them carrying a name.
///
/// The app generated this code itself until 2026-09-20. Having the researcher
/// issue it instead means she holds the list of who has which number, so the
/// export is pseudonymous rather than anonymous. That is a deliberate trade:
/// the study needs to pair people, and she is the one with the consent forms.
///
/// **It is still never sent anywhere by the app** — not to Analytics, not to
/// Crashlytics. The only way it leaves the phone is inside a file the
/// participant saves and sends themselves.
library;

/// Longest number we will store. Nothing legitimate comes close; this only
/// stops a stray paste from filling the record.
const bpdParticipantCodeMaxLength = 64;

/// Tidies what someone typed without changing what they meant.
///
/// Whitespace goes, because it is what a copy-paste drags in and it is
/// invisible in a spreadsheet join. Case stays exactly as entered: the numbers
/// come from the researcher's own list, and silently rewriting someone's input
/// in the one field the whole pairing depends on looks like a bug.
String normalizeBpdParticipantCode(String input) {
  final collapsed = input.trim().replaceAll(RegExp(r'\s+'), '');
  return collapsed.length > bpdParticipantCodeMaxLength
      ? collapsed.substring(0, bpdParticipantCodeMaxLength)
      : collapsed;
}
