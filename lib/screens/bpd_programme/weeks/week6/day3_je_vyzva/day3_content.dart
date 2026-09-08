// ignore_for_file: no_adjacent_strings_in_list

/// Week 6, Day 3 — Je VýZVa a všímavost ve vztazích.
///
/// Copy verbatim from `docs/hpo/source/tyzden-6.md` §3, with two documented
/// exceptions (WEEK6_SCREEN_PLAN.md → OQ-2):
///
/// * the "Va" instruction reads "uznejříkáuznej pocity a názory druhé osoby" in
///   the source — an editing artefact, kept as "uznej";
/// * an empty bullet sits between "Vý" and "Z" and is simply absent here.
///
/// The day itself has no title in the source (it starts at a bare "3."), so the
/// name in the day list is ours — OQ-4.
library;

import 'package:nepanikar/screens/bpd_programme/widgets/acronym_skill_page.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Page 1/4 — Je VýZVa
// ─────────────────────────────────────────────────────────────────────────────

/// The day's opening paragraph, split in two.
const day3JeVyzvaIntro = <String>[
  'Dále v DBT existuje dovednost “Je VýZVa”. Ta ti pomáhá zlepšit vztahy s '
      'ostatními tím, že se učíš být laskavý/á, respektující a pozorný/á, i když '
      'se cítíš rozrušený/á.',
  'Používáním “Je VýZVa” ukazuješ druhým, že ti na nich záleží, že je slyšíš a '
      'že se snažíš komunikovat způsobem, který podporuje porozumění a '
      'spolupráci.',
];

/// Four letters, verbatim. Note the source separates letter from word with a
/// plain hyphen here, unlike PSANÍČKo and neZOUFej which use an en dash.
const day3JeVyzvaLetters = <AcronymLetter>[
  (
    'Je',
    'JEmné způsoby',
    'chovej se klidně a laskavě, vyhýbej se kritice, obviňování nebo urážkám',
  ),
  (
    'Vý',
    'přátelské VYstupování',
    'komunikuj klidně a přátelsky, používej humor nebo lehkost, aby situace '
        'nebyla napjatá',
  ),
  ('Z', 'Zájem', 'projevuj zájem o druhou osobu, poslouchej ji a vnímej, co říká'),
  (
    'Va',
    'VAlidace',
    'uznej pocity a názory druhé osoby, ukaž, že je chápeš, i když s nimi '
        'nesouhlasíš',
  ),
];

const day3JeVyzvaRescueId = 'week6_je_vyzva';

// ─────────────────────────────────────────────────────────────────────────────
// Page 2/4 — mindfulness in relationships
// ─────────────────────────────────────────────────────────────────────────────

const day3MindfulnessIntro = <String>[
  'V tomto dni se zaměříme na všímavost v kontextu mezilidských vztahů. '
      'Všímavost nám pomáhá lépe vnímat sebe i druhé, uvědomovat si své pocity, '
      'potřeby a impulzy, a reagovat vědomě místo impulzivně.',
  'I když hlavním cílem týdne jsou dovednosti pro efektivní komunikaci, '
      'všímavost je skvělý nástroj, který podporuje všechny tyto dovednosti. Je '
      'užitečné se k němu pravidelně vracet, protože čím častěji cvičíme vědomou '
      'pozornost, tím snazší je zůstat klidný/á, soustředěný/á a konstruktivní '
      've vztazích s ostatními.',
];

// ─────────────────────────────────────────────────────────────────────────────
// Page 3/4 — pick a technique
// ─────────────────────────────────────────────────────────────────────────────

/// The source asks the user to **choose** here ("Vyber to, které ti nejvíc
/// vyhovuje"), where Week 5 asked for a draw ("kolo štěstí"). So the menu is
/// primary on this day and the draw is the fallback — the reverse of Week 5.
/// See OQ-5.
const day3PickInvitation =
    'Teď si můžeš vybrat z nabídky všímavých cvičení, které chceš vyzkoušet. '
    'Vyber to, které ti nejvíc vyhovuje, a věnuj mu chvíli pozornosti, abys '
    'cítil/a, jak ti pomáhá zůstat klidný/á a soustředěný/á v daném okamžiku.';

// ─────────────────────────────────────────────────────────────────────────────
// Page 4/4 — completion
// ─────────────────────────────────────────────────────────────────────────────

const day3CompletionText =
    'Už musíš mít úplně plnou hlavu nových informací. Pro dnešek toho necháme. '
    'Chceme tě ocenit za Tvoji práci.';
