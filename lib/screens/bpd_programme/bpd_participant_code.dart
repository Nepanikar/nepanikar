/// The participant's own code for the pilot study.
///
/// The entry and exit questionnaires have to be matched to each other, and the
/// entry form does that with an e-mail address it then deletes. A code the app
/// generates does the same job without anyone having to hand over an address,
/// and it is what the researcher asked for (2026-09-20): the participant reads
/// it off this screen and writes it into both questionnaires.
///
/// It identifies a questionnaire pair, nothing else. **It is never sent
/// anywhere from the app** — not to Analytics, not to Crashlytics, not in any
/// payload. Attaching it to the adherence events would turn an anonymous count
/// into per-person behavioural data about someone in a BPD study, which is
/// exactly what keeping the answers in Microsoft Forms avoids.
library;

import 'dart:math';

/// The alphabet skips everything people mis-transcribe — `0/O`, `1/I/L`,
/// `5/S`, `2/Z`, `8/B` — because this code gets copied by hand, twice, seven
/// weeks apart.
const _alphabet = '34679ACDEFGHJKMNPQRTUVWXY';

/// Two groups of four. Long enough that a study's worth of participants will
/// not collide (25^8 ≈ 1.5e11), short enough to copy off a screen.
const _groupLength = 4;
const _groupCount = 2;

/// Draws a fresh code. Callers persist it — see
/// `UserSettingsDao.getOrCreateBpdParticipantCode`, which is the only place
/// that should ever call this.
String generateBpdParticipantCode([Random? random]) {
  final rnd = random ?? Random.secure();
  final groups = <String>[
    for (var g = 0; g < _groupCount; g++)
      String.fromCharCodes([
        for (var i = 0; i < _groupLength; i++)
          _alphabet.codeUnitAt(rnd.nextInt(_alphabet.length)),
      ]),
  ];
  return groups.join('-');
}
