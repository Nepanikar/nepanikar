// ignore_for_file: no_adjacent_strings_in_list

/// Copy for Week 2, Day 1 — Edukace všímavosti.
/// Verbatim from `docs/hpo/source/tyzden-2.md` §1 unless marked otherwise.
library;

import 'package:flutter/material.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_lists.dart';

/// Opening messages — what this week is about and what mindfulness is (§1,
/// bullet 1, split into bubbles at the source's own sentence breaks).
const day1IntroChat = <String>[
  'Dostáváme se do druhého týdne programu. Tématem tohoto týdne je všímavost.',
  'Všímavost je schopnost vědomě zaměřit pozornost na přítomný okamžik. Na to, '
      'co právě teď prožíváme, cítíme nebo děláme, a to bez posuzování.',
];

const day1EmptyHeadTitle = 'Není to o „prázdné hlavě“';
const day1EmptyHeadBody =
    'Všímavost není o tom „mít prázdnou hlavu“, ale spíš o tom umět si '
    'všimnout, co se v nás i kolem nás děje, a zůstat u toho chvíli přítomní.';

/// §1, bullet 2 — who it helps and how.
const day1WhyUseful =
    'Pro lidi, kteří zažívají silné emoce, mají sklony jednat bez uvážení nebo '
    'prožívají silný stres, může být všímavost užitečná v tom, že přináší '
    'větší klid a prostor k uvědomění si možností, jak reagovat.';

/// Our breakdown of the source's "Díky tomu se snižuje riziko jednat čistě pod
/// vlivem emocí a roste schopnost zvládat situace s větší rozvahou."
const day1Benefits = <ChatFeatureItem>[
  ChatFeatureItem(
    icon: Icons.spa,
    title: 'Větší klid',
    description: 'Tělo i mysl mají chvíli, kdy nemusí nikam spěchat.',
  ),
  ChatFeatureItem(
    icon: Icons.alt_route,
    title: 'Prostor pro volbu',
    description: 'Mezi tím, co cítím, a tím, co udělám, se objeví mezera.',
  ),
  ChatFeatureItem(
    icon: Icons.trending_down,
    title: 'Méně jednání pod vlivem emocí',
    description: 'Snižuje se riziko jednat čistě pod vlivem emocí.',
  ),
  ChatFeatureItem(
    icon: Icons.psychology_outlined,
    title: 'Větší rozvaha',
    description: 'Roste schopnost zvládat situace s větší rozvahou.',
  ),
];

/// §1, bullet 3, first sentence.
const day1Research =
    'Výzkumy ukazují, že pravidelný trénink všímavosti pomáhá snižovat úzkost, '
    'depresi i napětí, posiluje soustředění a zlepšuje kvalitu mezilidských '
    'vztahů.';

/// The three effects named in [day1Research], as a list.
const day1ResearchEffects = <ChatFeatureItem>[
  ChatFeatureItem(
    icon: Icons.sentiment_satisfied_alt,
    title: 'Nižší úzkost, depresivita a napětí',
    description: 'Pravidelný trénink má měřitelný efekt.',
  ),
  ChatFeatureItem(
    icon: Icons.filter_center_focus,
    title: 'Silnější soustředění',
    description: 'Pozornost se dá cvičit jako sval.',
  ),
  ChatFeatureItem(
    icon: Icons.people_outline,
    title: 'Lepší mezilidské vztahy',
    description: 'Když jsem přítomný/á, slyším druhé jinak.',
  ),
];

const day1DbtTitle = 'Základ všech dovedností';
const day1DbtBody =
    'V rámci DBT je všímavost považována za základní dovednost, na které stojí '
    'všechny ostatní – protože nám pomáhá „zastavit se“ a všimnout si, co se '
    'skutečně děje, než uděláme další krok.';

/// §1, bullet 4 — "Chci vědět víc".
const day1Links = <ChatLink>[
  ChatLink(
    label: 'Co je to mindfulness a jak začít',
    url: 'https://mindfulness.med.muni.cz/mindfulness/co-je-to-mindfulness-a-jak-zacit',
    icon: Icons.article_outlined,
  ),
  ChatLink(
    label: 'Video o všímavosti',
    url: 'https://youtu.be/5VmE_iofvuw?si=2PC8KgPSXxptokpS',
    icon: Icons.play_circle_outline,
  ),
];

const day1CompletionText =
    'Dozvěděl/a jsi se, co je všímavost a proč je v DBT považovaná za základní '
    'dovednost, na které stojí všechny ostatní.';
