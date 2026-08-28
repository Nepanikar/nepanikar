// ignore_for_file: no_adjacent_strings_in_list

/// Copy for Week 3, Day 4 — Změna odezvy na emoce: opačná akce.
/// Verbatim from `docs/hpo/source/tyzden-3.md` §4.
///
/// Reading only — the source gives this day no exercise, and that is deliberate
/// (confirmed with the author 2026-08-06). It is therefore delivered entirely in
/// chat form, so a day without a task still moves at the user's pace.
library;

const day4IntroChat = <String>[
  'Opačná akce (opposite action) je technika používaná k regulaci emocí.',
  'Jednoduše řečeno: když máme silnou emoci, často nás nutí jednat způsobem, '
      'který ji posiluje nebo způsobuje problémy (např. úzkost → vyhýbání se, '
      'hněv → hádka).',
  'Opačná akce znamená jednat opačně, než by nás emoce nutila, pokud by byla '
      'emoce nepřiměřená nebo neprospěšná.',
];

/// The safety boundary. The source states it only as a subordinate clause
/// ("pokud by byla emoce nepřiměřená nebo neprospěšná"), but "do the opposite of
/// what your emotion tells you" is dangerous advice when the fear is warranted,
/// so it gets its own card next to the technique rather than a passing mention.
const day4WarningTitle = 'Kdy opačnou akci nepoužívat';
const day4WarningBody =
    'Opačná akce je na emoce, které situaci neodpovídají nebo ti škodí. Pokud '
    'je tvůj strach oprávněný — hrozí ti reálné nebezpečí, někdo ti ubližuje, '
    'nebo tě tělo varuje před něčím skutečným — emoce dělá přesně to, k čemu '
    'je. Tehdy ji neobcházej a řiď se jí. Když si nejsi jistý/á, pomůže '
    'ověření faktů ze včerejšího dne.';

/// The three levels the technique works on, verbatim.
const day4Levels = <(String, String)>[
  (
    'Rovina tělesná',
    'Tělo a výraz. Zahrnuje změnu výrazu tváře, postoje těla a dýchání. Pokud '
        'cítíme hněv, opačnou akcí v této rovině je uvolnění zaťatých pěstí, '
        'narovnání obočí a nepatrný úsměv. Tělo pak posílá mozku signál, '
        'že nejsme v ohrožení.',
  ),
  (
    'Rovina kognitivní',
    'Myšlení. Když změníme to, co si o situaci říkáme, myslíme. Pokud cítíme '
        'strach a chceme se něčemu vyhnout, opačná akce v myšlení znamená '
        'přestat přemýšlet nad nejhorším a začít se soustředit na fakta nebo '
        'na to, co můžeme zvládnout. Jde o aktivní změnu toho, co si uvnitř '
        'myslíme.',
  ),
  (
    'Rovina chování',
    'Samotný čin. To je to, co uděláme navenek. Místo toho, abychom utekli '
        '(strach), zaútočili (hněv) nebo se schovali (stud), uděláme pravý '
        'opak – jdeme do situace.',
  ),
];

const day4GoalNote =
    'Cílem je změnit emoci nebo její intenzitu, získat kontrolu nad chováním '
    'a nepodlehnout impulsivní reakci.';

const day4SmallStepsTitle = 'Cvičit po malých krocích';
const day4SmallStepsBody =
    'Technika opačná akce může znít jednoduše – jen udělej opak toho, co ti '
    'emoce říká. V realitě se to ale často zdá hodně těžké, protože emoce jsou '
    'silné a návykové. Je potřeba cvičit na malých krocích – zkoušet opačné '
    'akce u situací, kde se cítíš bezpečně, a postupně přecházet '
    'k náročnějším. Cvičení a opakování ti pomohou získat kontrolu nad '
    'reakcemi a emoce se postupně zmírní.';

// TODO: schválit autorem — zdroj u Dne 4 závěrečnou větu nemá.
const day4CompletionText =
    'Dnes bylo jen na čtení — žádné cvičení, žádné vyplňování. Opačná akce '
    'funguje ve třech rovinách a nejlépe se učí na malých, bezpečných '
    'situacích. Zkus si všimnout, kdy tě dnes nebo zítra nějaká emoce k něčemu '
    'tlačí.';
