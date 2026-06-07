# Prehľad obrazoviek BPD programu

> Posledná aktualizácia: 2026-04-19

---

## ŠTRUKTÚRA PRIEČINKOV

```
lib/screens/bpd_programme/
├── bpd_programme_screen.dart      # Hlavná obrazovka programu
├── bpd_landing_screen.dart        # Landing page pred štartom
├── bpd_weeks_screen.dart          # Výber týždňov (carousel)
├── bpd_week_detail_screen.dart    # Detail týždňa (zoznam dní)
├── bpd_day_onboarding_screen.dart # Onboarding (T1D1)
│
├── shared/                        # Zdieľané/recyklovateľné obrazovky
│   ├── day_pause_screen.dart      # Pauza deň (používa sa viackrát)
│   └── week_review_screen.dart    # Zhrnutie týždňa (používa sa 7x)
│
├── smart/                         # SMART ciele (T1D3)
│   ├── smart_education_screen.dart
│   └── smart_goal_form_screen.dart
│
├── week1/                         # Týždeň 1 - Úvod do programu
│   ├── day2_hpo_dbt_screen.dart   # HPO + DBT edukácia
│   └── day4_please_screen.dart    # PLEASE model
│
├── week2/                         # Týždeň 2 - Mindfulness
│   ├── day1_mindfulness_education_screen.dart
│   ├── day2_what_skills_screen.dart
│   ├── day3_how_skills_screen.dart
│   ├── day4_breathing_screen.dart
│   └── day6_techniques_screen.dart
│
├── week3/                         # Týždeň 3 - Regulácia emócií I
├── week4/                         # Týždeň 4 - Tolerancia distresu I
├── week5/                         # Týždeň 5 - Tolerancia distresu II
├── week6/                         # Týždeň 6 - Medziľudská efektivita
└── week7/                         # Týždeň 7 - Záver a integrácia
```

---

## STAV IMPLEMENTÁCIE PO TÝŽDŇOCH

### Legenda:
- ✅ = Implementované
- 🚧 = Rozpracované
- ❌ = Neimplementované
- ♻️ = Použije sa zdieľaná šablóna

---

## TÝŽDEŇ 1: Úvod do programu

| Deň | Názov | Route | Súbor | Stav |
|-----|-------|-------|-------|------|
| 1 | Představení programu | `onboarding` | `bpd_day_onboarding_screen.dart` | ✅ |
| 2 | Edukace HPO + DBT | `day2Education` | `days/day2_education_screen.dart` | ✅ |
| 3 | Cíle SMART | `smart` | `smart/smart_education_screen.dart` | ✅ |
| 4 | Péče o sebe (PLEASE) | `day4Please` | `days/day4_please_screen.dart` | ✅ |
| 5 | Pauza | `pause` | `days/day_pause_screen.dart` | ✅ ♻️ |
| 6 | Pauza | `pause` | `days/day_pause_screen.dart` | ✅ ♻️ |
| 7 | Shrnutí týdne | `summary` | `days/week_review_screen.dart` | ✅ ♻️ |

**Stav týždňa 1: ✅ KOMPLETNÝ**

---

## TÝŽDEŇ 2: Mindfulness

| Deň | Názov | Route Type | Súbor | Stav |
|-----|-------|------------|-------|------|
| 1 | Edukace mindfulness | `week2Day1Mindfulness` | `week2/day1_mindfulness_intro/` | ✅ |
| 2 | What skills | `week2Day2WhatSkills` | `week2/day2_what_skills/` | ✅ |
| 3 | How skills | `week2Day3HowSkills` | `week2/day3_how_skills/` | ✅ |
| 4 | Všímavé dýchanie | `week2Day4Breathing` | `week2/day4_breathing/` | ✅ |
| 5 | Pauza | `pause` | `shared/day_pause_screen.dart` | ✅ ♻️ |
| 6 | Mindfulness techniky | `week2Day6Techniques` | `week2/day6_techniques/` | ✅ |
| 7 | Zhrnutie týždňa | `summary` | `shared/week_review_screen.dart` | ✅ ♻️ |

**Stav týždňa 2: ✅ KOMPLETNÝ**

---

## TÝŽDEŇ 3: Regulácia emócií I

| Deň | Názov | Route Type | Súbor | Stav |
|-----|-------|------------|-------|------|
| 1 | Edukace – emócie | `week3Day1` | `week3/day1_emotions_education_screen.dart` | ❌ |
| 2 | Pomenovanie emócií | `week3Day2` | `week3/day2_naming_emotions_screen.dart` | ❌ |
| 3 | Pozitívne emócie | `week3Day3` | `week3/day3_positive_emotions_screen.dart` | ❌ |
| 4 | Check the facts | `week3Day4` | `week3/day4_check_facts_screen.dart` | ❌ |
| 5 | Pauza | `pause` | `shared/day_pause_screen.dart` | ✅ ♻️ |
| 6 | Pauza | `pause` | `shared/day_pause_screen.dart` | ✅ ♻️ |
| 7 | Zhrnutie týždňa | `summary` | `shared/week_review_screen.dart` | ✅ ♻️ |

**Stav týždňa 3: ❌ NEIMPLEMENTOVANÉ (3/7 hotové vďaka šablónam)**

---

## TÝŽDEŇ 4: Tolerancia distresu I

| Deň | Názov | Route Type | Súbor | Stav |
|-----|-------|------------|-------|------|
| 1 | Edukace – distres | `week4Day1` | `week4/day1_distress_education_screen.dart` | ❌ |
| 2 | STOP technika | `week4Day2` | `week4/day2_stop_screen.dart` | ❌ |
| 3 | TIPP technika | `week4Day3` | `week4/day3_tipp_screen.dart` | ❌ |
| 4 | ACCEPTS | `week4Day4` | `week4/day4_accepts_screen.dart` | ❌ |
| 5 | Pauza | `pause` | `shared/day_pause_screen.dart` | ✅ ♻️ |
| 6 | Rozptýlenie | `week4Day6` | `week4/day6_distraction_screen.dart` | ❌ |
| 7 | Zhrnutie týždňa | `summary` | `shared/week_review_screen.dart` | ✅ ♻️ |

**Stav týždňa 4: ❌ NEIMPLEMENTOVANÉ**

---

## TÝŽDEŇ 5: Tolerancia distresu II

| Deň | Názov | Route Type | Súbor | Stav |
|-----|-------|------------|-------|------|
| 1 | Radikálne prijatie | `week5Day1` | `week5/day1_radical_acceptance_screen.dart` | ❌ |
| 2 | Pros and cons | `week5Day2` | `week5/day2_pros_cons_screen.dart` | ❌ |
| 3 | Reťazová analýza | `week5Day3` | `week5/day3_chain_analysis_screen.dart` | ❌ |
| 4 | Opačné konanie | `week5Day4` | `week5/day4_opposite_action_screen.dart` | ❌ |
| 5 | Pauza | `pause` | `shared/day_pause_screen.dart` | ✅ ♻️ |
| 6 | Pauza | `pause` | `shared/day_pause_screen.dart` | ✅ ♻️ |
| 7 | Zhrnutie týždňa | `summary` | `shared/week_review_screen.dart` | ✅ ♻️ |

**Stav týždňa 5: ❌ NEIMPLEMENTOVANÉ**

---

## TÝŽDEŇ 6: Medziľudská efektivita

| Deň | Názov | Route Type | Súbor | Stav |
|-----|-------|------------|-------|------|
| 1 | Edukace – vzťahy | `week6Day1` | `week6/day1_relationships_education_screen.dart` | ❌ |
| 2 | DEARMAN | `week6Day2` | `week6/day2_dearman_screen.dart` | ❌ |
| 3 | GIVE | `week6Day3` | `week6/day3_give_screen.dart` | ❌ |
| 4 | FAST | `week6Day4` | `week6/day4_fast_screen.dart` | ❌ |
| 5 | Pauza | `pause` | `shared/day_pause_screen.dart` | ✅ ♻️ |
| 6 | Hranice | `week6Day6` | `week6/day6_boundaries_screen.dart` | ❌ |
| 7 | Zhrnutie týždňa | `summary` | `shared/week_review_screen.dart` | ✅ ♻️ |

**Stav týždňa 6: ❌ NEIMPLEMENTOVANÉ**

---

## TÝŽDEŇ 7: Záver a integrácia

| Deň | Názov | Route Type | Súbor | Stav |
|-----|-------|------------|-------|------|
| 1 | Opakovanie zručností | `week7Day1` | `week7/day1_skills_review_screen.dart` | ❌ |
| 2 | Osobný plán | `week7Day2` | `week7/day2_personal_plan_screen.dart` | ❌ |
| 3 | Krízový plán | `week7Day3` | `week7/day3_crisis_plan_screen.dart` | ❌ |
| 4 | Záverečná reflexia | `week7Day4` | `week7/day4_final_reflection_screen.dart` | ❌ |
| 5 | Pauza | `pause` | `shared/day_pause_screen.dart` | ✅ ♻️ |
| 6 | Pauza | `pause` | `shared/day_pause_screen.dart` | ✅ ♻️ |
| 7 | Záver programu | `week7Day7` | `week7/day7_programme_end_screen.dart` | ❌ |

**Stav týždňa 7: ❌ NEIMPLEMENTOVANÉ**

---

## SÚHRN STAVU

| Týždeň | Téma | Hotové | Celkom | Stav |
|--------|------|--------|--------|------|
| 1 | Úvod do programu | 7/7 | 7 | ✅ 100% |
| 2 | Mindfulness | 7/7 | 7 | ✅ 100% |
| 3 | Regulácia emócií I | 3/7 | 7 | ❌ 43% |
| 4 | Tolerancia distresu I | 2/7 | 7 | ❌ 29% |
| 5 | Tolerancia distresu II | 3/7 | 7 | ❌ 43% |
| 6 | Medziľudská efektivita | 2/7 | 7 | ❌ 29% |
| 7 | Záver a integrácia | 2/7 | 7 | ❌ 29% |
| **CELKOM** | | **26/49** | **49** | **53%** |

> Poznámka: Percentá zahŕňajú zdieľané šablóny (pauza, zhrnutie), ktoré sú už hotové.

---

## ZDIEĽANÉ ŠABLÓNY

| Šablóna | Súbor | Použitie | Stav |
|---------|-------|----------|------|
| Pauza deň | `day_pause_screen.dart` | ~14x (2x každý týždeň) | ✅ |
| Zhrnutie týždňa | `week_review_screen.dart` | 7x (1x každý týždeň) | ✅ |

---

## ĎALŠIE KROKY

### Priorita 1: Týždeň 2 (Mindfulness) - dokončiť zostávajúce dni
- [x] Vytvoriť `week2/` priečinok
- [x] `day1_mindfulness_intro/` (5 strán)
- [x] `day2_what_skills/` (5 strán)
- [x] `day3_how_skills/` (5 strán)
- [x] `day4_breathing/` (6 strán)
- [ ] `day6_techniques_screen.dart` (7 strán)
- [x] Pridať route types do enum
- [x] Pridať routes do `routes.dart`
- [x] Pridať Week 2 content do `_weekDaysContent`

### Priorita 2: Reorganizácia súborov
- [x] Vytvoriť `shared/` priečinok
- [x] Presunúť `day_pause_screen.dart` do `shared/`
- [x] Presunúť `week_review_screen.dart` do `shared/`
- [ ] Vytvoriť `week1/` priečinok
- [ ] Presunúť Week 1 špecifické súbory
- [ ] Aktualizovať importy

---

## POZNÁMKY

- Obsah všetkých týždňov je v `assets/bpd/programme_content.json`
- Design prompty pre Stitch sú v `.claude/design/WEEK2_STITCH_PROMPTS.md`
- Vyplnené dáta pre týždne sú v `.claude/data/TYZDEN_X_VYPLNENY.txt`
- Návod na prácu s dátami je v `.claude/data/BPD_DATA_GUIDE.md`
