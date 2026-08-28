// ignore_for_file: no_adjacent_strings_in_list

/// Copy for Week 3, Day 2 — Validace a popis emocí.
/// Verbatim from `docs/hpo/source/tyzden-3.md` §2.
library;

const day2IntroChat = <String>[
  'Včera jsme se seznámili s jednotlivými emocemi. Ne vždy je ale jednoduché '
      'poznat, o jakou emoci (nebo více emocí) jedná.',
  'Naučit se pojmenovat emoce pomáhá snižovat jejich intenzitu. Bez '
      'pojmenování nemůžeme emoci nijak regulovat.',
  'Emoce mají svoji strukturu, není to jeden neoddělitelný shluk, ale spíš '
      'řetězec událostí. V tomto řetězci existují body, na které když se '
      'zaměříme, dokážeme dosáhnout nějaké změny k lepšímu.',
];

const day2ModelLead =
    'Základem emoční regulace je tedy popisování emocí. K tomu nám může pomoci '
    'model popisu emocí… je to vlastně popsání našich emocí jako ve zpomaleném '
    'filmu. To pomáhá porozumět tomu, jak emoce fungují, z jakých částí se '
    'skládají a jak je lze měnit. Když rozumíme tomu, co v nás situaci '
    'vyvolalo, lépe se nám s ní pracuje.';

/// The six steps of the emotion-description model, verbatim.
const day2Model = <(String, String)>[
  (
    'Spouštěcí událost',
    'Co přesně emoci vyvolalo? (Fakta v prostředí kolem nás nebo uvnitř nás.)',
  ),
  ('Interpretace', 'Jaké myšlenky, domněnky nebo přesvědčení o události mám?'),
  (
    'Biologické změny a prožívání',
    'Jaké tělesné pocity (např. bušení srdce, zrudnutí) prožívám a zažívám '
        'nějaká specifická nutkání k jednání (např. utéct, udeřit někoho, '
        'plakat…)?',
  ),
  ('Výrazy a činy', 'Řeč těla, výraz tváře, to, co říkám a co reálně dělám.'),
  ('Pojmenování emoce', 'Jakou emoci / emoce cítím?'),
  (
    'Následky',
    'Jaký má emoce dopad na stav mysli, další emoce, paměť nebo chování?',
  ),
];

const day2WorksheetLead =
    'Nyní si pojďme rozebrat nějakou nedávnou situaci, která vyvolala silné emoce.';

/// The author's worked example for the model, revealed on tap.
const day2WorksheetExample = <(String, String)>[
  (
    'Spouštěcí událost',
    'Otevřu školní systém a vidím mnohem horší hodnocení, než jsem čekal, '
        'z testu, na kterém mi záleželo.',
  ),
  (
    'Interpretace',
    'V hlavě mi naskočí myšlenky: „Jsem úplně k ničemu, na tuhle školu nemám. '
        'Učitel si na mě zasedl. Nikdy nic nezvládnu."',
  ),
  (
    'Biologické změny a prožívání',
    'Tělesné pocity: Cítím nával horka do obličeje, stažené hrdlo a „kámen" '
        'v žaludku. Specifická nutkání k jednání: Mám chuť okamžitě zaklapnout '
        'notebook, s nikým nemluvit, vymazat se ze skupiny spolužáků na '
        'WhatsAppu nebo jít do ledničky a „zajíst to".',
  ),
  (
    'Výrazy a činy',
    'Zatnu zuby, hodím telefon na postel, mračím se a na dotaz mámy „Jak '
        'dopadl test?" odseknu: „Nech mě být, je mi to fuk!"',
  ),
  ('Pojmenování emoce', 'Cítím se smutně, naštvaně, stydím se a cítím se provinile.'),
  (
    'Následky',
    'Stav mysli: Jsem smutný a cítím se ještě hůř kvůli tomu, jak jsem vyjel '
        'na mámu. Chování: Místo abych se podíval, kde jsem udělal chybu, se '
        'celý večer učení ani nedotknu, protože mám pocit, že je to stejně '
        'zbytečné.',
  ),
];

const day2ValidationTitle = 'Validace emocí';
const day2ValidationBody =
    'Validace neznamená souhlasit se svým chováním (např. s tím, že jsem na '
    'někoho křičel), ale znamená uznat pravdu o svém vnitřním prožitku. Je to '
    'potvrzení, že moje emoce má v tuhle chvíli svou logiku a že mám právo '
    'ji cítit.';

/// What validation is good for — four points, verbatim.
const day2ValidationBenefits = <(String, String)>[
  (
    'Snižuje intenzitu emocí',
    'Když přestaneme bojovat s tím, co cítíme, emoce paradoxně dříve odezní.',
  ),
  ('Dává smysl', 'Ukazuje, že náš vnitřní svět není rozbitý, ale dává smysl.'),
  (
    'Zastavuje sekundární emoce',
    'Cítím emoci na základě předchozí emoce – např. jsem naštvaná, že jsem '
        'byla celý den smutná; stydím se, že mě někdo naštval.',
  ),
  (
    'Umožňuje změnu',
    'Teprve když přijmu, kde jsem (validace), můžu se pohnout dál (změna).',
  ),
];

const day2StemsLead = 'Pojďme si teď zkusit tuto dovednost.';
const day2StemsHelp =
    'Doplň každou větu tak, aby platila pro tebe. Když nevíš, mrkni na '
    'příklad — a klidně vyplň jen ty věty, které ti dnes sedí.';
const day2StemFieldLabel = 'Moje věta:';

/// The five sentence frames with the author's completed examples.
const day2Stems = <(String, String)>[
  (
    'To, že cítím …… je oprávněné, protože….',
    'To, že cítím vztek, je oprávněné, protože mi někdo bez dovolení vzal moje '
        'věci a narušil moje soukromí.',
  ),
  (
    'Teď prožívám ….. a je to v pořádku.',
    'Teď prožívám velký smutek a chuť plakat a je to v pořádku.',
  ),
  (
    'Dává smysl že se cítím ….., když …..',
    'Dává smysl, že se cítím osaměle, když jsem se přestěhoval do nového města '
        'a nikoho tu ještě neznám.',
  ),
  (
    'Je přirozené ……, protože …..',
    'Je přirozené mít strach z odmítnutí, protože každý člověk potřebuje někam '
        'patřit a být přijímán.',
  ),
  (
    'Vzhledem k tomu, že……, je pochopitelné, že se cítím ….',
    'Vzhledem k tomu, že jsem byl v minulosti často kritizován za svůj projev, '
        'je pochopitelné, že se cítím úzkostně, když mám mluvit před lidmi.',
  ),
];

/// The author's own closing line for this day.
const day2CompletionText = 'Pro dnešní den toho bylo až až, oceňujeme tvoji snahu a odhodlání.';
