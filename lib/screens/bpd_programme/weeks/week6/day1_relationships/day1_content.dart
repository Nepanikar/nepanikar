// ignore_for_file: no_adjacent_strings_in_list

/// Week 6, Day 1 — edukace o vztazích.
///
/// Copy verbatim from `docs/hpo/source/tyzden-6.md` §1, including the source's
/// typos ("časo", "se tyto dovednosti zaměřuje") — see WEEK6_SCREEN_PLAN.md
/// → OQ-2. The author corrects her own text; we never do it silently.
library;

// ─────────────────────────────────────────────────────────────────────────────
// Page 1/4 — why relationships
// ─────────────────────────────────────────────────────────────────────────────

/// Bullet 1, split into two bubbles. Four sentences in one bubble is a wall of
/// text on the first screen of the week; the split changes nothing in the copy.
const day1Opening = <String>[
  'Tento týden se zaměříme na vztahy – tedy na to, jak je budovat, posilovat a '
      'zvládat v nich obtížné situace. Vztahy jsou pro náš život zásadní, ale '
      'často s nimi přichází i výzvy, například obavy říci si o to, co '
      'potřebujeme, nebo strach odmítnout něco, co nechceme.',
  'Společně se naučíme dovednosti, které ti mohou pomoci být ve vztazích '
      'jistější, otevřenější a zároveň si zachovat respekt k sobě i k ostatním. '
      'Cílem není mít dokonalé vztahy, ale získat nástroje, jak zvládat situace '
      'zdravějším způsobem a postupně tak posilovat pocit stability a '
      'spokojenosti v kontaktu s lidmi kolem tebe.',
];

/// Bullet 2, likewise split in two.
const day1Effectiveness = <String>[
  'Dovednosti vztahové efektivity ti mohou pomoci navazovat nové vztahy, '
      'posilovat ty stávající a zvládat konfliktní situace. Učí, jak umět jasně '
      'požádat o to, co potřebuješ, a také jak říci „ne“ tam, kde je to pro tebe '
      'důležité.',
  'V rámci tohoto programu se tyto dovednosti zaměřuje hlavně na to, jak '
      'dosahovat svých cílů ve vztazích – tedy jak získat od druhých to, co '
      'potřebuješ, aniž by tím trpěly samotné vztahy nebo tvoje sebeúcta.',
];

/// Bullet 3 — the bridge to the exercise, so it gets a card of its own.
const day1MythsBridgeTitle = 'Mýty, které nosíme v hlavě';
const day1MythsBridge =
    'Vztahy jsou pro každého z nás důležité – přinášejí podporu, blízkost a '
    'pocit sounáležitosti. Někdy ale v hlavě nosíme různé mýty a přesvědčení, '
    'které nám brání jednat otevřeně, říkat si o to, co potřebujeme, nebo '
    'nastavovat hranice. Tyto myšlenky mohou znít velmi přesvědčivě, ale ve '
    'skutečnosti nás často jen oslabují a narušují naše vztahy i respekt k sobě. '
    'V tomto bloku se na ně podíváme blíže a naučíme se je zpochybňovat.';

/// Bullet 4. "časo" is the source's typo, left as written (OQ-2).
const day1MythsInvitation =
    'Pokud chceš vědět víc, můžeme se podívat na různé mýty, které nám časo '
    'mohou komplikovat život v rámci mezilidských vztazích.';

// ─────────────────────────────────────────────────────────────────────────────
// Pages 2/4 and 3/4 — the myths
// ─────────────────────────────────────────────────────────────────────────────

/// The author groups the myths into two named halves, so they become two
/// worksheets with separate ids rather than one list of twenty-four.
const day1NeedsWorksheetId = 'week6_day1_myths_needs';
const day1RelationshipsWorksheetId = 'week6_day1_myths_relationships';

const day1NeedsMythsTitle = 'Mýty, které brání v prosazování vlastních potřeb a cílů';
const day1RelationshipsMythsTitle = 'Mýty, které brání v budování vztahů a respektu k sobě';

/// The source's instruction for both groups: "(nechat prostor na vepsání
/// pravdivé formulace)".
const day1MythFieldLabel = 'Jak to je ve skutečnosti?';

/// How many myths are offered before the user has to ask for the rest.
///
/// Twelve free-text answers per group is far past the "5–20 minut denně" the
/// programme promises, so four are offered and the rest are one tap away.
/// Answers to all twelve persist either way. Same reasoning as Week 3, Day 1.
const day1MythsOfferedCount = 4;

const day1MythsRevealLabel = 'Chci zpochybnit i další mýty';

/// Twelve myths, verbatim and in source order.
///
/// Unlike Week 3 the author wrote no counter-statements for these, so there is
/// nothing to reveal as a worked example — tracked as OQ-1.
const day1NeedsMyths = <String>[
  'Nezasloužím si dostat to, co chci nebo potřebuji.',
  'Když o něco požádám, ukážu tím, že jsem slabý člověk.',
  'Musím předem vědět, že druhý řekne ano, než vůbec požádám.',
  'Pokud o něco požádám nebo řeknu ne, nevydržím, když se na mě někdo naštve.',
  'Když mi někdo řekne ne, zničí mě to.',
  'Požádat o něco je tlačivé, sobecké nebo špatné.',
  'Říct ne je vždycky sobecké.',
  'Měl(a) bych být ochotný/á obětovat své potřeby pro ostatní.',
  'Pokud si neumím poradit sám/sama, znamená to, že jsem neschopný/á.',
  'Problém je jen v mé hlavě – kdybych myslel/a jinak, nemusel/a bych tím '
      'obtěžovat ostatní.',
  'Pokud nemám to, co chci nebo potřebuji, je to jedno – vlastně mi na tom '
      'nezáleží.',
  'Umět používat dovednosti je známka slabosti.',
];

const day1RelationshipsMyths = <String>[
  'Neměl(a) bych muset o něco žádat (nebo říkat ne); ostatní by měli vědět, co '
      'chci, a udělat to.',
  'Ostatní by měli vědět, že jejich chování zraňuje mé pocity; neměl(a) bych '
      'jim to muset říkat.',
  'Neměl(a) bych muset vyjednávat nebo pracovat na tom, abych dostal(a), co chci.',
  'Ostatní by měli být ochotní udělat pro mě víc.',
  'Ostatní by mě měli mít rádi, schvalovat mě a podporovat mě.',
  'Nezaslouží si, abych k nim byl(a) laskavý/á nebo se k nim choval(a) dobře.',
  'Nejdůležitější je, abych dostal(a), co chci, když to chci.',
  'Nemusím být férový/á, laskavý/á nebo zdvořilý/á, pokud se ostatní tak '
      'nechovají ke mně.',
  'Pomsta bude skvělá; stojí za všechny negativní následky.',
  'Jen slaboši mají hodnoty.',
  'Každý lže.',
  'Získat to, co chci, je důležitější než způsob, jakým to získám; účel světí '
      'prostředky.',
];

// ─────────────────────────────────────────────────────────────────────────────
// Page 4/4 — completion
// ─────────────────────────────────────────────────────────────────────────────

const day1CompletionText = 'Tak dnešní kus práce máš za sebou, jen tak dál.';
