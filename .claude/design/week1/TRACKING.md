# Week 1 — Úvod do programu — Design Tracking

> Posledná aktualizácia: 2026-06-12
> D1 rozhodnutie: jedna plynulá obrazovka (PageView)

## Legenda
- ✅ Hotovo
- ⏳ Vygenerované / prebieha
- ❌ Treba spraviť
- 🔁 Reuse šablóny

---

## Stav — Design (HTML mockupy)

### Deň 1: Predstavenie programu (10 strán)
| Strana | Názov | Design |
|--------|-------|--------|
| 1/10 | Uvítání — intro + meno/zámeno | ⏳ mockups/day1_page1_uvitani.html |
| 2/10 | Jak program funguje | ⏳ mockups/day1_page2_jak_funguje.html |
| 3/10 | HPO edukácia | ⏳ mockups/day1_page3_hpo.html |
| 4/10 | DBT edukácia | ⏳ mockups/day1_page4_dbt.html |
| 5/10 | První aktivita → mood (reuse Moje záznamy) | ⏳ mockups/day1_page5_mood.html |
| 6/10 | Reakce na náladu + follow-up | ⏳ mockups/day1_page6_reakce.html |
| 7/10 | Cíle a očekávání | ⏳ mockups/day1_page7_cile.html |
| 8/10 | SMART vizualizácia | ⏳ mockups/day1_page8_smart.html |
| 9/10 | SMART worksheet | ⏳ mockups/day1_page9_worksheet.html |
| 10/10 | Completion | ⏳ mockups/day1_page10_completion.html |

> Strana 5 reusuje existujúci 5-moodový záznam nálady (`MoodPickerRoute`,
> `lib/widgets/mood/`). Bandované reakcie (str. 6): good/happy → povzbudenie,
> okay → neutrál, sad/bad → malé akcie.

### Deň 2: SPOKO + Spánek (4 strany) — SPOKO šablóna
| Strana | Názov | Design |
|--------|-------|--------|
| 1/4 | SPOKO intro (5 písmen, DNES = Spánek) | ⏳ mockups/day2_page1_spoko_intro.html |
| 2/4 | Edukácia spánok + mapovacie otázky | ⏳ mockups/day2_page2_edukace_otazky.html |
| 3/4 | Challenge pick-list + future challenge | ⏳ mockups/day2_page3_challenge.html |
| 4/4 | Completion | ⏳ mockups/day2_page4_completion.html |

> Deň 2 je **konkrétna inštancia SPOKO šablóny**. Dni 3–6 reusujú rovnaký layout,
> menia sa len: edukácia, mapovacie otázky, challenge zoznam, closing — a
> deep-link na kontakty (Deň 3 → PPP, Deň 4 → Podané ruce).

### Deň 3: Potrava
🔁 SPOKO šablóna (Deň 2) — deep-link na PPP kontakty

### Deň 4: Ne Omamným látkám
🔁 SPOKO šablóna (Deň 2) — deep-link na Podané ruce

### Deň 5: Kondice
🔁 SPOKO šablóna (Deň 2)

### Deň 6: Léčba Onemocnění
🔁 SPOKO šablóna (Deň 2)

### Deň 7: Reflexe SPOKO a reflexe týdne (3 strany)
| Strana | Názov | Design |
|--------|-------|--------|
| 1/3 | Recall 5 SPOKO oblastí (reveal-on-tap) | ⏳ mockups/day7_page1_recall.html |
| 2/3 | Reflexia týždňa (4 voľné texty) | ⏳ mockups/day7_page2_reflexe.html |
| 3/3 | Gratulácia k dokončeniu týždňa | ⏳ mockups/day7_page3_completion.html |

> Flutter: Deň 7 môže reusovať `WeekReviewScreen` (summary routeType).

---

## Stav — Flutter implementácia

| Deň | Názov | Flutter |
|-----|-------|---------|
| 1 | Představení programu | ✅ `weeks/week1/day1_onboarding/` (10-page flow) |
| 2 | SPOKO + Spánek | ❌ |
| 3 | Potrava | ❌ |
| 4 | Ne Omamným látkám | ❌ |
| 5 | Kondice | ❌ |
| 6 | Léčba Onemocnění | ❌ |
| 7 | Reflexe SPOKO | 🔁 WeekReviewScreen |

---

## Súhrn

| Deň | Design | Flutter |
|-----|--------|---------|
| 1 | ⏳ 100% (10/10 mockupov) | ✅ 100% (čaká na `flutter analyze` + beh) |
| 2 | ⏳ 100% (SPOKO šablóna, 4/4) | ❌ |
| 3–6 | 🔁 SPOKO šablóna (Deň 2) | ❌ |
| 7 | ⏳ 100% (3/3) | 🔁 WeekReviewScreen |
