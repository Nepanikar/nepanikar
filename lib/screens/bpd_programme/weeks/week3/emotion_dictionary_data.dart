import 'package:flutter/material.dart';

/// One entry of the emotion dictionary.
class EmotionEntry {
  const EmotionEntry({
    required this.name,
    required this.function,
    required this.icon,
    this.isInInfographic = false,
  });

  final String name;

  /// What the emotion is for — verbatim from the source.
  final String function;

  final IconData icon;

  /// Whether the author's `ZÁKLADNÍ EMOCE` infographic covers this emotion.
  /// It shows six of the ten, so the picture is presented as an illustration of
  /// those six rather than as a complete overview.
  final bool isInInfographic;
}

/// The "slovníček emocí" from Week 3, Day 1 — verbatim, source: tyzden-3.md §1.
///
/// The source asks twice for this to be something the user "can simply come back
/// to", so it also lives on its own screen under *Moje záznamy → DBT program*.
/// Order follows the source. No emotion is styled as good or bad — including
/// envy and jealousy, which the source treats as informative like the rest.
const emotionDictionary = <EmotionEntry>[
  EmotionEntry(
    name: 'Vztek',
    function: 'Chrání naše hranice a pomáhá bránit se nespravedlnosti.',
    icon: Icons.local_fire_department_outlined,
    isInInfographic: true,
  ),
  EmotionEntry(
    name: 'Strach',
    function: 'Varuje před nebezpečím a připravuje tělo na obranu nebo útěk.',
    icon: Icons.warning_amber_outlined,
    isInInfographic: true,
  ),
  EmotionEntry(
    name: 'Radost',
    function: 'Motivuje nás opakovat příjemné chování a posiluje vztahy.',
    icon: Icons.wb_sunny_outlined,
    isInInfographic: true,
  ),
  EmotionEntry(
    name: 'Smutek',
    function: 'Signalizuje ztrátu, podporuje zpomalení a hledání podpory.',
    icon: Icons.water_drop_outlined,
    isInInfographic: true,
  ),
  EmotionEntry(
    name: 'Znechucení',
    function:
        'Upozorňuje nás na věci, které by nám mohly uškodit nebo nám nejsou '
        'příjemné; chrání nás před nebezpečím nebo nepříjemnými situacemi.',
    icon: Icons.block_outlined,
    isInInfographic: true,
  ),
  EmotionEntry(
    name: 'Stud',
    function: 'Pomáhá udržovat sociální vazby a přizpůsobovat se pravidlům skupiny.',
    icon: Icons.visibility_off_outlined,
    isInInfographic: true,
  ),
  EmotionEntry(
    name: 'Vina',
    function:
        'Signalizuje, že jsme porušili vlastní hodnoty nebo normy; motivuje nás '
        'napravit chybu nebo se omluvit.',
    icon: Icons.balance_outlined,
  ),
  EmotionEntry(
    name: 'Překvapení',
    function:
        'Reaguje na neočekávané události; pomáhá nám rychle přesměrovat '
        'pozornost a přizpůsobit se nové situaci.',
    icon: Icons.bolt_outlined,
  ),
  EmotionEntry(
    name: 'Žárlivost',
    function:
        'Upozorňuje na ohrožení vztahu nebo důležitých sociálních vazeb; '
        'pomáhá nám chránit to, co je pro nás cenné.',
    icon: Icons.favorite_border,
  ),
  EmotionEntry(
    name: 'Závist',
    function:
        'Ukazuje, co si přejeme nebo co nám chybí; může nás motivovat '
        'k osobnímu růstu, pokud ji dokážeme zpracovat konstruktivně.',
    icon: Icons.compare_arrows_outlined,
  ),
];

/// Intro shown above the list, verbatim from the source.
const emotionDictionaryIntro =
    'Tento seznam může být užitečný i jako takový „slovník emocí", který si '
    'můžeš kdykoliv projít, když třeba nevíš, jak se zrovna cítíš.';

/// External reading offered by the source alongside the dictionary.
const emotionDictionaryLinkUrl = 'https://psychologie.cz/emoce-chteji-ven/';
const emotionDictionaryLinkLabel = 'Emoce chtějí ven';
