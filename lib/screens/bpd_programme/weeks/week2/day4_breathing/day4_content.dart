// ignore_for_file: no_adjacent_strings_in_list

import 'package:flutter/material.dart';
import 'package:nepanikar/games/breathing/breathing_game_screen.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/technique_menu_page.dart';

/// The day's short lesson, delivered as chat before the menu (§4, bullets 1–2).
const week2Day4IntroChat = <String>[
  'Pojďme se dnes krátce zaměřit na všímavé dýchání. To nám pomáhá zastavit se '
      'a ukotvit v přítomném okamžiku.',
  'Díky soustředění na dech si můžeme všimnout, co se v nás děje, a lépe '
      'zvládat stres nebo silné emoce.',
];

const week2Day4IntroNote =
    'Všímavé dýchání může zklidnit tělo a mysl, snížit impulzivní reakce a '
    'podporuje sebeovládání.';

/// Week 2, Day 4 — the breathing exercises offered as a menu.
///
/// All copy verbatim from docs/hpo/source/tyzden-2.md §4. Each one can launch
/// the app's existing breathing exercise with the matching shape/preset.
const week2Day4Techniques = <TechniqueData>[
  TechniqueData(
    id: 'w2_breathing_mindful',
    iconKey: 'air',
    icon: Icons.air,
    title: 'Všímavé dýchání',
    shortDescription: 'Jen pozoruješ svůj dech tak, jak přirozeně plyne',
    detailParagraphs: [
      'Jen pozoruješ svůj dech tak, jak přirozeně plyne – všímáš si nádechu, '
          'výdechu, pohybu břicha nebo hrudníku. Když uteče pozornost, jemně ji '
          'vrátíš zpět k dechu.',
    ],
    videoUrl: 'https://youtu.be/ZD6BZt_TqmU?si=Q_YYG1enb8GiLrkR',
    breathingShape: BreathingGameShape.circle,
  ),
  TechniqueData(
    id: 'w2_breathing_box',
    iconKey: 'box',
    icon: Icons.crop_square,
    title: 'Dýchání do čtverce',
    shortDescription: 'Nádech 4 – zádrž 4 – výdech 4 – zádrž 4',
    detailParagraphs: [
      'Nadechuješ se na 4 doby, zadržíš dech na 4 doby, vydechuješ na 4 doby a '
          'opět zadržíš na 4 doby. Opakuješ několik kol.',
    ],
    videoUrl: 'https://youtu.be/bXa8UINStB4?si=AKV_M_DrCt9fm2Yy',
    breathingShape: BreathingGameShape.square,
    breathingPreset: 'box',
  ),
  TechniqueData(
    id: 'w2_breathing_711',
    iconKey: 'waves',
    icon: Icons.waves,
    title: 'Dýchání 7-11',
    shortDescription: 'Krátký nádech, delší výdech – tělo se zklidní',
    detailParagraphs: [
      'Při dýchání 7–11 se nadechujeme kratší dobu (na 7 dob) a vydechujeme '
          'delší dobu (na 11 dob). Díky tomu se tělo přirozeně zklidňuje a '
          'nervový systém přepíná do režimu odpočinku.',
      'Pokud je pro tebe 7 a 11 moc náročné, začni klidně třeba s 4–6 a '
          'postupně si délku nadechování a vydechování prodlužuj.',
    ],
    videoUrl: 'https://youtu.be/7SXCurNXQd8?si=xmzTpr3y4Ea1V2cJ',
    breathingShape: BreathingGameShape.circle,
    breathingPreset: '7-11',
  ),
];
