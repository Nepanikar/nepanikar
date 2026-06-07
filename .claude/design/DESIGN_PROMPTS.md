# Prompty pre generovanie dizajnu BPD programu

> **JEDINÝ ZDROJ PRAVDY** pre konštanty dizajn pipeline (paleta, Stitch ID,
> typografia, komponenty). Skilly `/plan-screens`, `/design-screen`,
> `/implement-screen` na tento súbor odkazujú — neduplikuj tieto hodnoty inde.
> Keď sa niečo zmení, zmeň to TU.

## Stitch projekt a dizajn systém
| Parameter | Hodnota |
|-----------|---------|
| Project ID | `12102936321319572704` |
| Design System ID | `6337495699421443160` |
| Design System Name | "Nepanikar Purple" |
| Default model | `GEMINI_3_1_PRO` |
| Device | `MOBILE` |
| Režim | LIGHT MODE (všetky prompty) |

## Typografia a komponenty
```
Font:               Inter (v produkcii Satoshi)
Title 24 bold · Section 20 semibold · Body 16 · Caption 14 · Button 16 bold
Card radius 16 · Button radius 12 · Screen padding 24 · Card padding 16
Card shadow: blur 32, offset (0,8), primary 8% opacity · Button height 48–54
```

## Farebná paleta Nepanikař

### Hlavné farby
| Farba | HEX | Použitie |
|-------|-----|----------|
| **Primary (fialová)** | `#491475` | Hlavná farba, nadpisy, tlačidlá, ikony |
| **Primary Dark** | `#280446` | Tmavšie akcenty, text na svetlom pozadí |
| **Secondary (tyrkysová)** | `#4EA3AD` | Sekundárne prvky, akcenty, srdiečka |
| **Background** | `#FBF6FF` | Pozadie obrazoviek |
| **Container** | `#EDE8F3` | Karty, boxy, kontajnery |
| **Purple 200** | `#E2D2EF` | Svetlé pozadia sekcií |

### Doplnkové farby
| Farba | HEX | Použitie |
|-------|-----|----------|
| **Success** | `#6FD866` | Úspech, splnené úlohy |
| **Error** | `#D86C66` | Chyby, upozornenia |
| **Info** | `#FEC786` | Tipy, informácie |
| **White** | `#FFFFFF` | Text na tmavom pozadí |

---

## Univerzálny prompt pre infografiku dňa

```
Create a clean, modern mobile app infographic for a mental health app called "Nepanikař".

**Topic:** [NAZOV DNA - napr. "DEAR MAN"]
**Subtitle:** [KRATKY POPIS - napr. "Pomáhá jasně a klidně vyjádřit naše potřeby"]

**Content to display:**
[ZOZNAM KROKOV/BODOV]

**Design requirements:**
- Color palette: Primary purple #491475, teal accent #4EA3AD, light background #FBF6FF, container #EDE8F3
- Style: Soft, rounded corners (16px radius), minimalist, calming
- Include small teal heart icons as decorative elements
- Each step should be in a rounded card/box
- Use purple gradient for headers
- Font: Clean sans-serif, good readability
- Mobile-first design (portrait orientation)
- No stock photos, only simple icons/illustrations
- Soft shadows for depth
- Include letter circles for acronym techniques (like SMART, PLEASE, DEARMAN)

**Mood:** Supportive, professional, therapeutic, non-clinical, friendly
```

---

## Špecifické prompty pre jednotlivé typy obsahu

### 1. Prompt pre TECHNIKU (STOP, TIPP, DEARMAN, GIVE, FAST, PLEASE)

```
Create a vertical infographic for mental health app "Nepanikař" explaining the [NAZOV] technique.

**Title:** [NAZOV TECHNIKY]
**Subtitle:** [KRATKY POPIS]

**Steps to show (each letter = one step):**
[KROKY S PISMENKAMI]

**Design:**
- Each letter in a large purple (#491475) circle on the left
- Step description in a rounded card (#EDE8F3) on the right
- Vertical layout, mobile-friendly
- Small teal (#4EA3AD) heart icons as accents
- Soft purple gradient header
- White background (#FBF6FF)
- Clean, minimal style
- Include connecting line between steps
- Border radius: 16px on cards

**Size:** 1080x1920px (mobile portrait)
```

### 2. Prompt pre EDUKAČNÝ OBSAH (emocie, mindfulness, stres)

```
Create an educational infographic for mental health app about [TEMA].

**Title:** [NADPIS]
**Key points to illustrate:**
[BODY ZOZNAMU]

**Design:**
- Purple (#491475) header with white text
- Light purple background (#FBF6FF)
- Icon-based illustrations (no photos)
- Each point in a soft card (#EDE8F3)
- Teal (#4EA3AD) accent icons
- Include small heart decorations
- Rounded corners throughout
- Mobile portrait format

**Style:** Calming, supportive, easy to read, therapeutic but not clinical
```

### 3. Prompt pre WORKSHEET / PRACOVNÝ LIST

```
Create a worksheet template design for mental health app "Nepanikař".

**Title:** [NAZOV WORKSHEETU]
**Fields to include:**
[POLOZKY NA VYPLNENIE]

**Design:**
- Header with purple (#491475) gradient
- Input fields with light purple (#EDE8F3) background
- Rounded input boxes with subtle border
- Teal (#4EA3AD) icons for each section
- Space for text entry (indicated by lines or boxes)
- Mobile-friendly layout
- Soft, inviting appearance
- Include small decorative hearts

**Format:** Interactive worksheet look, not form-like
```

### 4. Prompt pre ZHRNUTIE TÝŽDŇA

```
Create a week summary infographic for mental health program.

**Week:** Týždeň [CISLO] - [TEMA]
**Key learnings:**
[ZOZNAM BODOV]

**Design:**
- Celebratory but calm design
- Purple (#491475) as primary color
- Teal (#4EA3AD) checkmarks or achievement icons
- Light purple (#FBF6FF) background
- Rounded cards for each learning point
- Include motivational element
- Heart icons as decorations
- Success green (#6FD866) for completed items

**Mood:** Accomplished, supportive, encouraging
```

---

## Príklady hotových promptov

### Príklad 1: PLEASE technika (Týždeň 1, Deň 4)

```
Create a vertical infographic for mental health app "Nepanikař" explaining the PLEASE technique for self-care.

Title: "PLEASE"
Subtitle: "Aktivity pro snížení zranitelnosti vůči negativním emocím"

Steps:
- P+L: "Pečuj o tělo" - Take care of physical health, visit doctor, rest
- E: "Energie z výživy" - Eat regularly and balanced
- A: "Abstinuj od návykových látek" - Avoid alcohol, excessive caffeine
- S: "Spánek" - Get enough quality sleep
- E: "Energie z pohybu" - Move regularly, exercise

Design:
- Each letter (P, L, E, A, S, E) in large purple (#491475) circles
- Description in rounded light purple (#EDE8F3) cards
- Teal (#4EA3AD) heart icons as decorations
- Vertical mobile layout (1080x1920px)
- Soft shadows, rounded corners (16px)
- Clean sans-serif font
- Background: #FBF6FF

Style: Calming, supportive, professional mental health app aesthetic
```

### Príklad 2: SMART ciele (Týždeň 1, Deň 3)

```
Create an infographic for mental health app "Nepanikař" about SMART goals.

Title: "MOJE CÍLE JSOU" with heart decoration
Subtitle: "Jak si nastavit cíle, aby byly jasné a dosažitelné"

Content - 5 boxes with letters:
- S - SPECIFICKÉ: "Cíl je jasně definovaný, víš přesně, čeho chceš dosáhnout"
- M - MĚŘITELNÉ: "Můžeš zřetelně měřit, jestli je cíl splněný"
- A - ADEKVÁTNÍ: "Cíl je realistický a zvládnutelný vzhledem k možnostem"
- R - RELEVANTNÍ: "Cíl souvisí s něčím, co je pro Tebe důležité"
- T - TERMÍNOVANÉ: "Víš do kdy chceš cíle dosáhnout"

Design:
- Large purple (#491475) letter boxes in a row
- Description below each letter
- Teal (#4EA3AD) heart icon in corner
- Light background (#FBF6FF)
- Rounded corners, soft shadows
- Mobile portrait format

Style: Motivational, clear, easy to understand
```

### Príklad 3: Základné emocie (Týždeň 3, Deň 1)

```
Create an educational infographic about basic emotions for mental health app "Nepanikař".

Title: "ZÁKLADNÍ EMOCE"

Emotions to illustrate (each with simple icon and description):
- RADOST: "Poznáme ji podle uvolněnosti, tepla v hrudi a úsměvu"
- SMUTEK: "Cítíme těžkost na hrudi, slabost nebo ztrátu energie"
- STRACH: "Projevuje se třeba rychlým tepem nebo chvěním"
- VZTEK: "Často cítíme napětí v těle, sevření čelistí"
- ZNECHUCENÍ: "Můžeme ho vnímat jako svírání žaludku"
- STUD: "Často se projevuje zrudnutím, snahou skrýt se"

Design:
- Grid layout with 6 emotion cards
- Each card: simple cartoon face icon + emotion name + description
- Purple (#491475) for headers
- Light cards (#EDE8F3) for each emotion
- Teal (#4EA3AD) accent elements
- Rounded corners, soft aesthetic
- Mobile friendly

Style: Friendly, educational, non-clinical
```

---

## Tipy pre konzistentný dizajn

1. **Vždy používaj rovnaké zaoblenie** - 16px border-radius
2. **Srdcia sú kľúčový prvok** - malé tyrkysové srdiečka ako dekorácia
3. **Gradient v headeroch** - jemný fialový gradient
4. **Čistý priestor** - veľa bieleho miesta, nie preplnené
5. **Ikony namiesto fotiek** - jednoduché, line-art štýlové ikony
6. **Mobile-first** - vždy portrait orientácia, dotykovo priateľské

## Nástroje na generovanie

- **Midjourney:** Pridaj `--ar 9:16` pre mobile formát
- **DALL-E:** Špecifikuj "mobile app UI design"
- **Figma AI:** Použiteľné pre UI komponenty
- **Canva:** Má šablóny pre infografiky

---

## Quick reference - farby na skopírovanie

```
Primary:     #491475
Dark:        #280446
Secondary:   #4EA3AD
Background:  #FBF6FF
Container:   #EDE8F3
Purple 200:  #E2D2EF
Success:     #6FD866
Error:       #D86C66
Info:        #FEC786
White:       #FFFFFF
```
