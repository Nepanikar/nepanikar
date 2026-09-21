// ignore_for_file: no_adjacent_strings_in_list

/// Week 4, Day 2 — dovednosti pro překonání krize.
///
/// Copy verbatim from `docs/hpo/source/tyzden-4.md` §2, including its spacing
/// and typos (OQ-9) — the author corrects her own text.
library;

/// Bullets 1–3: what a crisis is and what these skills are for.
const day2CrisisChat = <String>[
  'Když se ocitneme v krizi nebo velmi silném stresu, často máme pocit, že '
      'nezvládneme nic. Mozek je zahlcený a tělo reaguje bouřlivě. V takových '
      'chvílích není cílem hned všechno vyřešit, ale přežít těžký moment, aniž '
      'bychom si ublížili nebo situaci zhoršili.',
  'Právě k tomu slouží dovednosti pro zvládání krize. Pomůžou ti získat '
      'odstup, uklidnit tělo a najít trochu prostoru k nadechnutí. Neřeší '
      'dlouhodobý problém, ale pomůžou ti přečkat bouři, dokud se nevrátí '
      'klidnější chvíle.',
  'Pak se dají použít strategie, které ti pomůžou se stresory pracovat v '
      'delším čase. Ale teď se společně naučíme pár jednoduchých nástrojů, '
      'které můžeš použít hned, kdykoli je toho moc.',
];

/// Bullet 4 — how to recognise a crisis. Ends on "nic, co nejde vzít zpátky",
/// which is why the crisis-contact link sits directly under it.
const day2RecogniseCrisis =
    'Jak poznáme, že se nacházíme v krizi? Být v krizi neznamená jen mít '
    'trápení. Je to situace, kdy jsou tvé pocity tak silné, že ztrácíš '
    'nadhled. Cítíš obrovský impuls jednat hned teď a bez přemýšlení. Cílem v '
    'tuhle chvíli není vyřešit tvůj problém, ale prostě to přečkat a neudělat '
    'nic, co nejde vzít zpátky.';

/// Bullet 5 — when to use them.
const day2WhenToUse =
    'Dovednosti přežití krize je dobré používat, když máme intenzivní bolest '
    'nebo silné emoce, které nelze rychle zmírnit, a kdy by jednání podle '
    'emocí situaci jen zhoršilo. Pomáhají nám zůstat schopni jednat, i když se '
    'cítíme zahlcení nebo rozrušeni problémy, které nelze okamžitě vyřešit.';

/// Bullet 6 — the boundary. Deliberately on the same page as [day2WhenToUse].
const day2NotForTitle = 'Na co naopak nejsou';
const day2NotFor =
    'Tyto dovednosti není dobré používat pro běžné každodenní problémy, pro '
    'řešení všech životních problémů ani pro hledání smyslu života.';

/// Ours. The source promises "tři klíčové dovednosti" and then lists two —
/// UZNÁVÁM arrives on Day 5. Rather than edit her sentence, we keep the promise
/// by saying where the third one is (WEEK4_SCREEN_PLAN.md → OQ-12).
// TODO: schválit autorem
const day2ThirdSkillNote =
    'Dvě z nich — STOP a TIPS — si ukážeme dnes. Třetí, UZNÁVÁM, na tebe čeká '
    've dni 5.';

/// Ours — a quiet way into the app's existing crisis contacts (OQ-5).
// TODO: schválit autorem
const day2CrisisLinkLabel = 'Když je toho moc právě teď — tady je pomoc';

// ── STOP ────────────────────────────────────────────────────────────────────

const day2StopLead = <String>[
  'STOP je krátká technika, která ti pomůže nezareagovat impulzivně',
  'STOP ti pomůže získat chvíli mezi impulsem a reakcí – a v té chvíli máš '
      'šanci vybrat si jinou cestu.',
];

/// (letter, title, description) — rendered by `NumberedBenefit`, whose `number`
/// is a String, so an acronym needs no widget of its own.
const day2StopLetters = <(String, String, String)>[
  ('S', 'Stop!', 'zastav se na chvíli -  nic nedělej, nic neříkej.'),
  ('T', 'Tah zpátky', 'udělej krok zpět, dej si čas.'),
  ('O', 'Obhlédni situaci', 'co se právě děje? jaké máš pocity, myšlenky, co říká okolí?'),
  (
    'P',
    'Postupuj všímavě',
    'rozhodni se, co ti v té situaci nejvíc pomůže – ne co chce emoce, ale co '
        'dává smysl, co je efektivní.',
  ),
];

// ── TIPS ────────────────────────────────────────────────────────────────────

const day2TipsLead =
    'Když je tělo v maximálním stresu, někdy je nejrychlejší začít právě u '
    'něj. TIPS techniky ti pomůžou rychle stáhnout intenzitu emocí:';

const day2TipsLetters = <(String, String, String)>[
  (
    'T',
    'Teplota',
    'opláchni obličej studenou vodou, drž kostku ledu v dlani, použij studený '
        'obklad. když se ponoříš do studené vody a dohromady na chvíli zadržíš '
        'dech, tělo automaticky zpomalí srdeční tep, snižuje napětí a aktivuje '
        'uklidňující reakce nervového systému.',
  ),
  (
    'I',
    'Intenzivní cvičení',
    'udělej 30 dřepů/kliků, běž na krátký sprint, protřep tělo. krátký '
        'intenzivní pohyb nebo cvičení zmírňuje napětí a emoce, takže se tělo i '
        'mysl uklidní.',
  ),
  (
    'P',
    'Pravidelné dýchání',
    'zpomal dech – nádech na 4, výdech na 6–8. pomalé a hluboké dýchání '
        'zklidňuje  nervový systému a snižuje stres a úzkost.',
  ),
  (
    'S',
    'Svalová relaxace',
    'střídavé napínání a uvolňování svalů snižuje fyzické napětí a tím i '
        'emocionální napětí.',
  ),
];

/// Ours, and the one place we add to the author's clinical text (OQ-4).
///
/// Cold-water immersion with breath-holding deliberately slows the heart, and
/// intense exercise can be a compensatory behaviour — this app ships an
/// eating-disorder module and a self-harm module, so it reaches exactly the
/// people for whom these two are not neutral. Flagged, never silently added.
// TODO: schválit autorem
const day2TipsCautionTitle = 'Kdy zvolit jinou techniku';
const day2TipsCaution =
    'Ochlazení se zadržením dechu a intenzivní cvičení výrazně zapojují tělo. '
    'Pokud máš potíže se srdcem, nízký tlak nebo se léčíš s poruchou příjmu '
    'potravy, vyber si prosím raději jinou techniku z tohoto seznamu nebo se '
    'poraď se svým lékařem.';

// ── Progresivní svalová relaxace ────────────────────────────────────────────

const day2PmrInvitation = 'Pojďme si teď společně vyzkoušet progresivní svalovou relaxaci';
const day2PmrVideoUrl = 'https://youtu.be/6U3C_uhKfUc?si=A9IQOakEibQEww5l';

/// Ours — the source has no closing line for this day.
// TODO: schválit autorem
const day2CompletionText =
    'Máš dva nástroje pro nejtěžší chvíle — STOP na to, aby ses nerozhodl/a '
    'unáhleně, a TIPS na to, když je potřeba začít u těla. Oba najdeš '
    'kdykoliv v záchranném balíčku.';
