// ignore_for_file: no_adjacent_strings_in_list

/// Copy for Week 3, Day 1 — Edukace o emocích.
/// Verbatim from `docs/hpo/source/tyzden-3.md` §1 unless marked otherwise.
library;

/// A myth about emotions together with the author's counter-statement.
///
/// The source lists twenty myths and, separately, twenty "busted" versions in
/// the same order; they are paired up here so each myth can reveal its own
/// example. The counter-statements are the author's words, not ours.
class EmotionMyth {
  const EmotionMyth({required this.myth, required this.busted});

  final String myth;

  /// Shown on tap as "Zobrazit příklad" once the user has had a go themselves.
  final String busted;
}

const day1IntroChat = <String>[
  'Tématem třetího týdne je emoční regulace. Emoční regulace znamená '
      'rozpoznat a pojmenovat, co cítím, porozumět tomu a vědomě si zvolit, '
      'jak na emoci zareaguju. Nejde o potlačování, ale o to, aby emoce '
      'pomáhaly, místo aby mě ovládaly.',
  'Emoční regulaci nám pomáhá zvládat i všímavost (z minulého týdne) – díky '
      'ní si všímáme svých pocitů včas a dokážeme na ně reagovat s větším '
      'klidem a nadhledem.',
];

const day1FactsTitle = 'Emoce nejsou fakta';
const day1FactsBody =
    'Emoce nejsou fakta – i když se někdy zdají velmi silné a přesvědčivé. '
    'To, že něco cítíme, ještě neznamená, že je to skutečnost. Emoce jsou '
    'spíše jako signály nebo ukazatele, které nám říkají, co je pro nás '
    'důležité. Pomáhají nám zorientovat se, ale není nutné se jimi vždy '
    'řídit doslova.';

const day1GoalNote = 'Naším cílem tedy není zbavit se emocí, ale zmírnit trápení s pocity související.';

const day1DictionaryLead = 'Protože emoce mají své funkce…';

/// Why regulating emotions is hard — six reasons, verbatim.
const day1Obstacles = <(String, String)>[
  (
    'Biologie',
    'Někteří lidé mají vrozeně citlivější emoční systém, a proto reagují '
        'rychleji a intenzivněji.',
  ),
  (
    'Nedostatek dovedností',
    'Často jsme se nikde nenaučili, jak s emocemi pracovat, takže nevíme, '
        'co dělat.',
  ),
  (
    'Posilování emočního chování',
    'Okolí může nevědomky podporovat naše silné emoční reakce.',
  ),
  (
    'Náladovost',
    'Naše momentální nálada někdy řídí, co děláme, místo aby rozhodoval rozum.',
  ),
  (
    'Přehlcení emocemi',
    'Když jsou emoce příliš silné, je snadné ztratit přehled a zapomenout '
        'na naučené dovednosti.',
  ),
  (
    'Mýty o emocích',
    'Pokud věříme, že emoce jsou špatné, slabé, nebo naopak že je musíme '
        'prožívat naplno, může nám to bránit v jejich regulaci.',
  ),
];

const day1ObstaclesGoodNews =
    'Dobrá zpráva je, že právě dovednosti, které se v programu naučíš, '
    'pomáhají tyto překážky překonat.';

/// The twenty myths with the author's counter-statements, in source order.
const day1Myths = <EmotionMyth>[
  EmotionMyth(
    myth: 'Existuje správný způsob, jak se cítit v každé situaci.',
    busted:
        'Emoce nejsou otázkou správnosti, jsou to automatické reakce '
        'organismu na situaci.',
  ),
  EmotionMyth(
    myth: 'Dát ostatním najevo, že se cítím špatně, je slabost.',
    busted:
        'Sdílení emocí s ostatními je projevem odvahy a autenticity, '
        'nikoli slabosti.',
  ),
  EmotionMyth(
    myth: 'Negativní pocity jsou špatné a destruktivní.',
    busted:
        'Žádná emoce není sama o sobě špatná, všechny nám poskytují '
        'důležité informace.',
  ),
  EmotionMyth(
    myth: 'Být emoční znamená být mimo kontrolu.',
    busted:
        'Intenzivní prožívání emocí neznamená, že nad sebou musíme ztratit '
        'kontrolu.',
  ),
  EmotionMyth(
    myth: 'Některé emoce jsou hloupé.',
    busted:
        'Každý pocit má svůj původ a smysl, i když nám v danou chvíli '
        'připadá nepochopitelný.',
  ),
  EmotionMyth(
    myth: 'Všechny bolestivé emoce jsou důsledkem špatného přístupu.',
    busted:
        'Bolestivé emoce jsou přirozenou součástí života a nejsou známkou '
        'špatného postoje.',
  ),
  EmotionMyth(
    myth: 'Pokud ostatní neschvalují mé pocity, zjevně bych se tak cítit neměl/a.',
    busted: 'Vaše pocity jsou platné i v případě, že s nimi lidé v okolí nesouhlasí.',
  ),
  EmotionMyth(
    myth: 'Jiní lidé jsou nejlepšími soudci toho, jak se cítím.',
    busted: 'Pouze vy sami můžete skutečně vědět a posoudit, co uvnitř cítíte.',
  ),
  EmotionMyth(
    myth: 'Bolestivé emoce nejsou důležité a měly by se ignorovat.',
    busted:
        'Vnímání a přijetí bolesti je efektivnější než její ignorování, '
        'které vede k nárůstu napětí.',
  ),
  EmotionMyth(
    myth: 'Extrémní emoce vás posunou dál než snaha regulovat své emoce.',
    busted:
        'Schopnost regulovat emoce nám dává větší svobodu než podléhání '
        'extrémním výkyvům.',
  ),
  EmotionMyth(
    myth: 'Kreativita vyžaduje intenzivní, často nezvládnuté emoce.',
    busted:
        'Kreativitu lze rozvíjet i s vyrovnanou emoční hladinou, která '
        'umožňuje vědomou tvorbu.',
  ),
  EmotionMyth(
    myth: 'Drama je cool.',
    busted:
        'Stabilita ve vztazích a vnitřní klid jsou dlouhodobě prospěšnější '
        'než vyhledávání dramatu.',
  ),
  EmotionMyth(
    myth: 'Je neautentické snažit se změnit své emoce.',
    busted:
        'Aktivní práce s emocemi a jejich měnění je projevem dovednosti, '
        'nikoli neautentičnosti.',
  ),
  EmotionMyth(
    myth: 'Emoční pravda je to, na čem záleží, nikoli pravda faktická.',
    busted:
        'Emoce jsou důležitým vnitřním signálem, ale fakta jsou nezbytná '
        'pro objektivní zhodnocení situace.',
  ),
  EmotionMyth(
    myth: 'Lidé by měli dělat cokoli, na co mají chuť.',
    busted:
        'Jednat čistě podle momentální chuti bez ohledu na následky omezuje '
        'naši dlouhodobou svobodu.',
  ),
  EmotionMyth(
    myth: 'Jednat podle svých emocí je známkou skutečně svobodného jedince.',
    busted:
        'Skutečná svoboda spočívá v možnosti zvolit si své chování bez ohledu '
        'na aktuální emoční impuls.',
  ),
  EmotionMyth(
    myth: 'Mé emoce jsou tím, kým jsem.',
    busted:
        'Emoce jsou stavy, které přicházejí a odcházejí, ale nedefinují celou '
        'vaši identitu.',
  ),
  EmotionMyth(
    myth: 'Mé emoce jsou důvod, proč mě lidé milují.',
    busted: 'Lidé vás oceňují pro vaši celistvou osobnost, nikoli pouze pro vaše nálady.',
  ),
  EmotionMyth(
    myth: 'Emoce mohou vznikat jen tak, bez důvodu.',
    busted:
        'Emoce mají vždy svůj spouštěč (např. v těle nebo v myšlenkách), '
        'i když není na první pohled patrný.',
  ),
  EmotionMyth(
    myth: 'Emoce by se měly vždy brát jako pravdivé.',
    busted:
        'To, že něco cítíme, je pravda, ale pocity nemusí vždy odpovídat '
        'faktické pravdě o situaci.',
  ),
];

/// How many myths the exercise offers before asking whether to continue.
/// The source expects all twenty; twenty written answers is well past the
/// "5–20 minut denně" the programme promises, so the rest are opt-in.
const day1MythsOfferedCount = 5;

const day1MythExerciseLead = 'Pojďme si tyto mýty zbořit…';
const day1MythExerciseHelp =
    'U každého mýtu zkus napsat vlastní větu, která ho boří. Nemusíš projít '
    'všechny — stačí ty, které se tě týkají. Co napíšeš, zůstane uložené.';
const day1MythFieldLabel = 'Moje věta, která mýtus boří:';

// TODO: schválit autorem — zdroj u Dne 1 závěrečnou větu nemá.
const day1CompletionText =
    'Prošel/a jsi si, co emoční regulace je, k čemu jednotlivé emoce slouží '
    'a proč je jejich zvládání někdy tak těžké. Slovník emocí máš uložený '
    'v Mých záznamech, kdykoliv si nebudeš vědět rady s tím, co cítíš.';
