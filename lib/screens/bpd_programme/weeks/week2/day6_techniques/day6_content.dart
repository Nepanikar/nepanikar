import 'package:flutter/material.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/technique_menu_page.dart';

/// Week 2, Day 6 — the mindfulness techniques offered as a menu.
///
/// All copy verbatim from docs/hpo/source/tyzden-2.md §6.
const week2Day6Techniques = <TechniqueData>[
  TechniqueData(
    id: 'w2_technique_body_scan',
    iconKey: 'body',
    icon: Icons.accessibility_new,
    title: 'Skenování těla',
    shortDescription: 'Najdi napětí v těle a nech ho uvolnit',
    detailParagraphs: [
      'Při nádechu vnímáš, jak vzduch vstupuje do těla, při výdechu si '
          'uvědomuješ, kde v těle cítíš napětí, a necháváš ho uvolnit.',
    ],
    videoUrl: 'https://youtu.be/U_XJAe_Vx8k?si=kJWHSAKu_N08B4ud',
  ),
  TechniqueData(
    id: 'w2_technique_walking',
    iconKey: 'walk',
    icon: Icons.directions_walk,
    title: 'Všímavá chůze',
    shortDescription: 'Každý krok, kontakt nohou se zemí, pohyb těla',
    detailParagraphs: ['Vnímáš každý krok, kontakt nohou se zemí, pohyb těla.'],
  ),
  TechniqueData(
    id: 'w2_technique_eating',
    iconKey: 'eat',
    icon: Icons.restaurant,
    title: 'Všímavé jezení',
    shortDescription: 'Jíš pomalu a všímáš si chutí, vůní i textury',
    detailParagraphs: [
      'Jíš pomalu a všímáš si chutí, vůní, textury i toho, jak se cítíš při '
          'jídle.',
    ],
  ),
  TechniqueData(
    id: 'w2_technique_listening',
    iconKey: 'listen',
    icon: Icons.hearing,
    title: 'Všímavé naslouchání',
    shortDescription: 'Plně se soustředíš na to, co říká druhý',
    detailParagraphs: ['Plně se soustředíš na to, co říká druhý, bez plánování své odpovědi.'],
  ),
  TechniqueData(
    id: 'w2_technique_five_senses',
    iconKey: 'senses',
    icon: Icons.auto_awesome,
    title: 'Všech pět pohromadě',
    shortDescription: 'Ukotvení v pěti smyslech',
    detailParagraphs: [
      'Ukotvení v pěti smyslech – zaměříš se na to, co právě teď vidíš, slyšíš, '
          'cítíš čichem, chutnáš a vnímáš dotekem.',
    ],
  ),
];
