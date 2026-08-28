// ignore_for_file: no_adjacent_strings_in_list

/// Copy for Week 3, Day 3 — Změna odezvy na emoce: ověřování faktů.
/// Verbatim from `docs/hpo/source/tyzden-3.md` §3, except the worked example.
library;

const day3IntroChat = <String>[
  'Intenzivní negativní emoce můžou být velkou přítěží do života.',
  'Včera jsme se bavili o tom, že mnoho emocí a reakcí nevzniká přímo kvůli '
      'událostem, ale kvůli našim myšlenkám a interpretacím těchto událostí. '
      'Tedy co si o dané situaci myslíme.',
];

const day3ChainTitle = 'Událost → myšlenky → emoce';
const day3ChainBody =
    'Událost tedy ovlivňuje myšlenky a až ty ovlivňují naše emoce. Naopak naše '
    'emoce mohou ovlivnit i naše myšlenky o události. Pokud ověříme fakta '
    'a své myšlenky, můžeme změnit i to, co cítíme.';

/// The links of the chain, for the schema card.
const day3ChainSteps = <String>['Událost', 'Myšlenky', 'Emoce'];

/// The six steps of checking the facts, verbatim.
const day3Steps = <(String, String)>[
  ('Urči emoci, kterou chceš změnit', ''),
  (
    'Popiš událost, která emoci vyvolala',
    'Soustřeď se na fakta, která jsi opravdu pozoroval/a svými smysly. '
        'Vyhýbej se hodnotícím slovům a černobílým popisům.',
  ),
  (
    'Zamysli se nad svými myšlenkami a interpretacemi',
    'Co si myslíš o události? Jaké předpoklady máš? Zvaž i jiné možné pohledy '
        'a interpretace. Ověř, zda tvoje myšlenky odpovídají faktům.',
  ),
  (
    'Zjisti, zda předpokládáš hrozbu',
    'Pojmenuj ji. Zvaž pravděpodobnost, že se opravdu stane. Přemýšlej '
        'o dalších možných výsledcích.',
  ),
  (
    'Představ si nejhorší scénář (katastrofu)',
    'Co by se stalo, kdyby k němu opravdu došlo? Představ si, že bys dokázal/a '
        'situaci zvládnout.',
  ),
  (
    'Zhodnoť, jestli tvoje emoce odpovídají faktům',
    'Porovnej intenzitu a typ emoce s tím, co se skutečně stalo.',
  ),
];

const day3WorksheetLead =
    'Pojď se teď zamyslet, kdy jsi naposledy cítil/a nepříjemnou emoci '
    'a zkusme si ověřit fakta.';

const day3WorksheetTitle = 'OVĚŘOVÁNÍ FAKTŮ';

// TODO: schválit autorem — u tohoto worksheetu zdroj příklad nemá (na rozdíl
// od Dne 2). Příklad níže je náš návrh v tónu autorky, aby uživatel neviděl
// deset prázdných polí bez vodítka; text čeká na schválení.
const day3WorksheetExample = <(String, String)>[
  ('1. Emoce, kterou chci změnit', 'Úzkost, hodně silná — asi 8 z 10.'),
  (
    '2. Událost, která emoci vyvolala',
    'Napsal/a jsem kamarádce ve 14:00. Do 20:00 mi neodpověděla, i když si '
        'zprávu přečetla.',
  ),
  (
    '3. Moje myšlenky, interpretace a předpoklady',
    '„Naštvala se na mě. Asi jsem řekl/a něco špatně. Už se mnou nebude chtít '
        'kamarádit."',
  ),
  (
    '4. Jiné možné pohledy nebo interpretace',
    'Může být v práci nebo ve škole. Mohla si zprávu přečíst v spěchu '
        'a zapomenout. Odpovídá mi často až za několik hodin.',
  ),
  (
    '5. Předpokládám nějakou hrozbu?',
    'Hrozba: že o kamarádku přijdu. Pravděpodobnost: nízká, nikdy dřív se to '
        'nestalo. Jiné možné výsledky: odpoví večer; napíše, že měla náročný '
        'den; ozve se sama zítra.',
  ),
  (
    '6. Nejhorší scénář',
    'Že by se opravdu odtáhla. Zvládl/a bych to tak, že bych se jí zeptal/a, '
        'co se děje, a opřel/a se o ostatní blízké lidi.',
  ),
  (
    '7. Odpovídá moje emoce a její intenzita faktům?',
    'Úzkost dává smysl — na kamarádce mi záleží. Ale 8 z 10 je na '
        'nepřečtenou odpověď hodně; fakta zatím říkají „nevím", ne '
        '„je konec".',
  ),
];

/// The worksheet itself: seven sections, ten fields. The longest form in the
/// programme, which is why it autosaves and says so.
const day3WorksheetSections = <(String, List<(String, String)>)>[
  ('Emoce, kterou chci změnit', [('emotion', 'Emoce, kterou chci změnit')]),
  (
    'Událost, která emoci vyvolala',
    [('event', 'Popiš fakta, co jsi skutečně pozoroval/a')],
  ),
  (
    'Moje myšlenky, interpretace a předpoklady o události',
    [('thoughts', 'Co si o události myslím')],
  ),
  ('Jiné možné pohledy nebo interpretace', [('alternatives', 'Jak se na to dá dívat jinak')]),
  (
    'Předpokládám nějakou hrozbu?',
    [
      ('threat', 'Jaká hrozba to je?'),
      ('threatLikelihood', 'Jak pravděpodobné je, že se skutečně stane?'),
      ('threatOutcomes', 'Jaké další možné výsledky existují?'),
    ],
  ),
  (
    'Nejhorší scénář – co by se stalo, kdyby se opravdu stal?',
    [
      ('worstCase', 'Co by se stalo'),
      ('coping', 'Jak bych situaci zvládl/a?'),
    ],
  ),
  (
    'Odpovídá moje emoce a její intenzita skutečným faktům?',
    [('factCheck', 'Jak moc odpovídá faktům?')],
  ),
];

// TODO: schválit autorem — zdroj u Dne 3 závěrečnou větu nemá.
const day3CompletionText =
    'Zkusil/a jsi rozebrat jednu situaci na fakta a na to, co sis o ní '
    'myslel/a. Tohle je dovednost, která se zlepšuje opakováním — worksheet '
    'máš uložený a můžeš se k němu vracet u dalších situací.';
