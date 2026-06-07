# BPD Program - Sprievodca datovou strukturou

## Prehlad

Program ma **7 tyzdnov**, kazdy tyzden ma **7 dni**. Data su rozdelene na:

1. **JSON subory** - struktura a metadata (co, kde, ako)
2. **ARB subory** - preklady textov (konkretny text v danom jazyku)

---

## Struktura suborov

```
assets/bpd/
├── bpd_weeks_data.json     # Existuje - zakladne info o tyzdnoch
├── bpd_days_data.json      # NOVE - detaily dni a ich obsah
├── infographics/           # SVG obrazky technik
│   ├── stop.svg
│   ├── tipp.svg
│   └── ...
└── audio/                  # Audio meditacie (po jazykoch)
    ├── cs/
    ├── sk/
    └── en/

lib/app/l10n/arb/
├── app_cs.arb              # Ceske preklady
├── app_sk.arb              # Slovenske preklady
├── app_en.arb              # Anglicke preklady
└── ...
```

---

## Typy obsahu (contentType)

| Typ | Popis | Pouzitie |
|-----|-------|----------|
| `lesson` | Edukacny obsah | Teoreticka cast, vysvetlenie konceptov |
| `exercise` | Interaktivne cvicenie | Dychanie, meditacia - uzivatel nieco robi |
| `reflection` | Sebareflexia | Otazky na zamyslenie, pisanie |
| `worksheet` | Pracovny list | Strukturovany formular na vyplnenie |
| `technique` | Technika DBT | STOP, TIPP, ACCEPTS, DEARMAN... |
| `meditation` | Mindfulness | Vedena meditacia, body scan |
| `summary` | Zhrnutie | Koniec tyzdna, co sme sa naucili |

---

## Typy sekcii (section types)

```json
// Bezny text
{
  "type": "text",
  "contentKey": "bpd_w1_d1_intro_text"
}

// Nadpis
{
  "type": "heading",
  "contentKey": "bpd_w1_d1_heading"
}

// Zoznam s odrazkami
{
  "type": "bullet_list",
  "contentKeys": [
    "bpd_w1_d1_bullet_1",
    "bpd_w1_d1_bullet_2"
  ]
}

// Cislovany zoznam (kroky)
{
  "type": "numbered_list",
  "contentKeys": [
    "bpd_w1_d1_step_1",
    "bpd_w1_d1_step_2"
  ]
}

// Tip/rada
{
  "type": "tip",
  "contentKey": "bpd_w1_d1_tip"
}

// Upozornenie
{
  "type": "warning",
  "contentKey": "bpd_w1_d1_warning"
}

// Citat/motivacna myslienka
{
  "type": "quote",
  "contentKey": "bpd_w1_d1_quote"
}

// Otazka na reflexiu
{
  "type": "reflection_question",
  "contentKey": "bpd_w1_d1_question"
}

// Infografika/obrazok
{
  "type": "infographic",
  "imagePath": "assets/bpd/infographics/stop.svg",
  "altTextKey": "bpd_w1_d1_infographic_alt"
}

// Zadanie cvicenia
{
  "type": "exercise_prompt",
  "contentKey": "bpd_w1_d1_exercise_instructions"
}
```

---

## Pomenovanie klucov (naming convention)

Format: `bpd_w{tyzden}_d{den}_{typ}_{poradie}`

Priklady:
- `bpd_w1_d1_title` - Nazov dna 1 v tyzdni 1
- `bpd_w1_d1_description` - Popis dna 1 v tyzdni 1
- `bpd_w1_d1_section_1_text` - Prvy textovy blok dna 1
- `bpd_w1_d1_bullet_1` - Prva odrazka v zozname
- `bpd_w1_d1_tip_1` - Prvy tip dna
- `bpd_w3_d5_reflection_2` - Druha reflexna otazka, tyzden 3, den 5

Pre techniky:
- `technique_stop_name` - Nazov techniky STOP
- `technique_stop_step_s` - Krok S v technike STOP

Pre cvicenia:
- `exercise_breathing_basic_title` - Nazov dychacieho cvicenia
- `exercise_breathing_basic_instructions` - Instrukcie

Pre worksheety:
- `worksheet_emotion_diary_title` - Nazov pracovneho listu
- `worksheet_emotion_diary_situation_label` - Popisok pola "situacia"

---

## Priklad: Kompletny den

### JSON (v bpd_days_data.json):

```json
{
  "dayNumber": 3,
  "titleKey": "bpd_w1_d3_title",
  "descriptionKey": "bpd_w1_d3_description",
  "contentType": "technique",
  "durationMinutes": 25,
  "sections": [
    {
      "type": "heading",
      "contentKey": "bpd_w1_d3_intro_heading"
    },
    {
      "type": "text",
      "contentKey": "bpd_w1_d3_intro_text"
    },
    {
      "type": "infographic",
      "imagePath": "assets/bpd/infographics/stop.svg",
      "altTextKey": "bpd_w1_d3_stop_infographic_alt"
    },
    {
      "type": "heading",
      "contentKey": "bpd_w1_d3_steps_heading"
    },
    {
      "type": "numbered_list",
      "contentKeys": [
        "bpd_w1_d3_stop_step_1",
        "bpd_w1_d3_stop_step_2",
        "bpd_w1_d3_stop_step_3",
        "bpd_w1_d3_stop_step_4"
      ]
    },
    {
      "type": "tip",
      "contentKey": "bpd_w1_d3_tip"
    },
    {
      "type": "reflection_question",
      "contentKey": "bpd_w1_d3_reflection"
    }
  ],
  "techniqueId": "STOP"
}
```

### ARB - Cesky (v app_cs.arb):

```json
{
  "bpd_w1_d3_title": "Den 3: Technika STOP",
  "bpd_w1_d3_description": "Naucte se zakladni techniku pro zastaveni impulzivniho jednani",
  "bpd_w1_d3_intro_heading": "Co je technika STOP?",
  "bpd_w1_d3_intro_text": "Technika STOP je jednoduchy nastroj, ktery vam pomuze zastavit se drive, nez udelate neco, ceho byste mohli litovat. Pouzijte ji vzdy, kdyz citite silnou emoci nebo nutkani.",
  "bpd_w1_d3_stop_infographic_alt": "Infografika techniky STOP se ctyrmi kroky",
  "bpd_w1_d3_steps_heading": "Ctyri kroky techniky STOP",
  "bpd_w1_d3_stop_step_1": "S - Stop (Zastavte se): Kdyz ucitite silnou emoci, okamzite se zastavte. Nejednejte.",
  "bpd_w1_d3_stop_step_2": "T - Take a step back (Ustupte): Fyzicky nebo mentalne ustupte od situace. Nadechnete se.",
  "bpd_w1_d3_stop_step_3": "O - Observe (Pozorujte): Vsimejte si, co se deje. Co citite? Co si myslite? Co se deje kolem vas?",
  "bpd_w1_d3_stop_step_4": "P - Proceed mindfully (Pokracujte vedome): Az kdyz jste klidnejsi, rozhodnete se, jak budete reagovat.",
  "bpd_w1_d3_tip": "Tip: Procvicujte techniku STOP i v beznych situacich, nejen v krizi. Cim vice budete cvicit, tim snazsi bude ji pouzit, kdyz ji opravdu budete potrebovat.",
  "bpd_w1_d3_reflection": "Vzpomente si na situaci z posledniho tyzdne, kdy jste jednali impulzivne. Jak by vam technika STOP mohla pomoct?"
}
```

### ARB - Slovensky (v app_sk.arb):

```json
{
  "bpd_w1_d3_title": "Den 3: Technika STOP",
  "bpd_w1_d3_description": "Naucte sa zakladnu techniku na zastavenie impulzivneho konania",
  "bpd_w1_d3_intro_heading": "Co je technika STOP?",
  "bpd_w1_d3_intro_text": "Technika STOP je jednoduchy nastroj, ktory vam pomoze zastavit sa skor, ako urobit nieco, coho by ste mohli lutovat..."
}
```

---

## DBT Techniky v programe

| Technika | Kategoria | Pouzitie |
|----------|-----------|----------|
| **STOP** | Distress Tolerance | Zastavenie impulzivneho konania |
| **TIPP** | Distress Tolerance | Rychle znizenie intenzity emocie |
| **ACCEPTS** | Distress Tolerance | Odvrátenie pozornosti od krizy |
| **DEARMAN** | Interpersonal | Asertivna komunikacia, ziskanie coho chcem |
| **GIVE** | Interpersonal | Udrzanie vztahu |
| **FAST** | Interpersonal | Sebauctivanie |
| **PLEASE** | Emotion Regulation | Znizenie zranitelnosti |

---

## Workflow pre pridanie obsahu

1. **Vytvor JSON strukturu** pre den v `bpd_days_data.json`
2. **Pridaj preklady** do ARB suborov (`app_cs.arb`, `app_sk.arb`, atd.)
3. **Spusti lokalizaciu**: `flutter gen-l10n`
4. **Ak mas nove assety**: pridaj do `pubspec.yaml` a spusti `flutter packages pub run build_runner build -d`

---

## Volitelne rozsirenia

### Audio meditacie
```json
{
  "type": "audio_player",
  "audioPath": "assets/bpd/audio/{locale}/meditation_w1_d5.mp3",
  "titleKey": "bpd_w1_d5_audio_title"
}
```

### Video obsah
```json
{
  "type": "video",
  "videoUrl": "https://...",
  "titleKey": "bpd_w1_d2_video_title"
}
```

### Interaktivny kviz
```json
{
  "type": "quiz",
  "questions": [
    {
      "questionKey": "bpd_w1_d7_quiz_q1",
      "options": [
        {"key": "bpd_w1_d7_quiz_q1_a", "correct": false},
        {"key": "bpd_w1_d7_quiz_q1_b", "correct": true},
        {"key": "bpd_w1_d7_quiz_q1_c", "correct": false}
      ]
    }
  ]
}
```

---

## Poznamky

- **Lokalizacia**: Vsetky texty su len kluce. Skutocny text je v ARB suboroch.
- **Localazy**: ARB subory sa synchronizuju cez Localazy pre preklady.
- **Flexibilita**: Struktura je flexibilna - mozes pridavat nove typy sekcii podla potreby.
- **Konzistencia**: Drz sa naming convention pre lahsiu orientaciu.