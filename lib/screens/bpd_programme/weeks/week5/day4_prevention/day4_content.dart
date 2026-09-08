// ignore_for_file: no_adjacent_strings_in_list

/// Week 5, Day 4 — plánování a prevence.
///
/// Copy verbatim from `docs/hpo/source/tyzden-5.md` §4.
///
/// The source gives this day five headings and ten instructions and nothing
/// else — no introduction, no closing beyond one sentence. The headings are
/// hers; the field labels are ours, because an instruction in the imperative
/// ("Napište si situace…") is not a label. See WEEK5_SCREEN_PLAN.md → OQ-6.
library;

import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';

const day4WorksheetId = 'week5_day4_prevention';

/// Ours — the day would otherwise open straight into ten empty fields.
// TODO: schválit autorem (OQ-6)
const day4Intro =
    'Dnes si připravíš vlastní plán pro chvíle, kdy přijde silný impulz. '
    'Nemusíš vyplnit všechno najednou – vrátit se k němu můžeš kdykoliv.';

/// Section titles and intros are verbatim; `label` is ours (OQ-6).
const day4PreventionWorksheet = <WorksheetSection>[
  WorksheetSection(
    title: 'Rozpoznání spouštěčů',
    intro: 'Napište si situace, myšlenky nebo emoce, které obvykle vedou k '
        'impulzivní reakci nebo život ohrožujícímu chování.',
    fields: [
      WorksheetField(
        id: 'triggers',
        label: 'Moje spouštěče',
        hint: 'Situace, myšlenky nebo emoce…',
      ),
      WorksheetField(
        id: 'body_signals',
        label: 'Tělesné signály, kterých si u sebe všímám',
        hint: 'Naučte se všímat tělesných signálů (např. napětí, bušení srdce, neklid).',
      ),
    ],
  ),
  WorksheetSection(
    title: 'Bezpečnostní plán',
    intro: 'Mějte připravený seznam kroků, co uděláte, když přijde silné nutkání '
        '(např. zavolat kamarádovi, použít techniku TIPS, jít na procházku).',
    fields: [
      WorksheetField(
        id: 'safety_steps',
        label: 'Co udělám, když přijde silné nutkání',
        hint: 'Moje kroky…',
      ),
      WorksheetField(
        id: 'safety_contacts',
        label: 'Komu můžu zavolat',
        hint: 'Seznam osob nebo kontaktů, na které se můžete obrátit v krizi '
            '(blízcí, krizová linka, terapeut).',
      ),
    ],
  ),
  WorksheetSection(
    title: 'Nahrazení škodlivých reakcí bezpečnějšími',
    intro: 'Vyberte si předem techniky (UZNÁVÁM, STOP, TIPS, mindfulness), které '
        'můžete použít, až přijde silná emoce.',
    fields: [
      WorksheetField(
        id: 'chosen_techniques',
        label: 'Techniky, které si vybírám',
        hint: 'UZNÁVÁM, STOP, TIPS, mindfulness…',
      ),
      WorksheetField(
        id: 'first_aid_box',
        label: 'Co dám do krabičky první psychické pomoci',
        hint: 'Připravte si „krabičku první psychické pomoci“ – papír s '
            'uklidňujícími myšlenkami, obrázky, věc na zmáčknutí, éterický olej, '
            'hudbu.',
      ),
    ],
  ),
  WorksheetSection(
    title: 'Plánování předem',
    intro: 'Rozmyslete si, co budete dělat, když víte, že vás čeká těžký den '
        '(více odpočinku, připravené copingové strategie).',
    fields: [
      WorksheetField(
        id: 'hard_day_plan',
        label: 'Co udělám, když vím, že mě čeká těžký den',
        hint: 'Víc odpočinku, připravené strategie…',
      ),
      WorksheetField(
        id: 'small_goals',
        label: 'Moje malé, reálné cíle',
        hint: 'Nastavte si malé, reálné cíle, aby byl den zvládnutelnější.',
      ),
    ],
  ),
  WorksheetSection(
    title: 'Pravidelná prevence',
    intro: 'Pečujte o sebe pomocí spánku, jídla, pohybu, kontaktu s lidmi '
        '(SPOKO model).',
    fields: [
      WorksheetField(
        id: 'self_care',
        label: 'Jak o sebe pečuju každý den',
        hint: 'Spánek, jídlo, pohyb, kontakt s lidmi…',
      ),
      WorksheetField(
        id: 'long_term',
        label: 'Co mi dlouhodobě snižuje stres',
        hint: 'Věnujte se aktivitám, které z dlouhodobého hlediska snižují stres '
            'a podporují regulaci emocí.',
      ),
    ],
  ),
];

const day4CompletionText = 'Dnešek máme za sebou a těšíme se na zítra.';
