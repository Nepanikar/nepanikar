import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/services/db/bpd/bpd_user_profile_model.dart';

/// Page 1/7 — Welcome + how the programme works + name/pronoun, in chat form
/// (verbatim, source: tyzden-1.md §1 "Představení programu").
class Day1WelcomeChatPage extends StatefulWidget {
  const Day1WelcomeChatPage({super.key, required this.onNext});

  final void Function(String name, BpdPronoun pronoun) onNext;

  @override
  State<Day1WelcomeChatPage> createState() => _Day1WelcomeChatPageState();
}

class _Day1WelcomeChatPageState extends State<Day1WelcomeChatPage> {
  final _nameController = TextEditingController();
  final _formValid = ValueNotifier<bool>(false);
  BpdPronoun? _selectedPronoun;

  static const _areas = <String>[
    'všímavost',
    'emoční regulace',
    'snášení tísně',
    'mezilidské vztahy',
    'sebepojetí',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _formValid.dispose();
    super.dispose();
  }

  void _revalidate() {
    _formValid.value = _nameController.text.trim().isNotEmpty && _selectedPronoun != null;
  }

  void _selectPronoun(BpdPronoun pronoun) {
    setState(() => _selectedPronoun = pronoun);
    _revalidate();
  }

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: () => widget.onNext(_nameController.text.trim(), _selectedPronoun!),
      steps: [
        const ChatStep(
          messages: [
            ChatBotBubble(text: 'Ahoj! 👋'),
            ChatBotBubble(
              showAvatar: true,
              text:
                  'Právě jste otevřeli program, který byl vytvořen pro lidi učící se '
                  'zvládat projevy hraniční poruchy osobnosti. Je ale i pro ty, kteří mají '
                  'obecně potíže v oblasti emocí, stresu, impulzivního chování a '
                  'mezilidských vztahů, včetně toho sami se sebou.',
            ),
          ],
        ),
        const ChatStep(
          messages: [
            ChatBotBubble(
              text:
                  'Program může uživateli poskytnout řadu nástrojů a strategií, pro '
                  'které byly inspirací ověřené metody dialekticko-behaviorální terapie '
                  '(DBT). Více o DBT se můžete dozvědět v začátku programu.',
            ),
            ChatBotBubble(
              showAvatar: true,
              text:
                  'Nabité dovednosti z programu Vám mohou pomoci lépe porozumět svým '
                  'emocím, regulovat impulsy, zlepšit komunikaci s ostatními a vztah sám '
                  'se sebou.',
            ),
            ChatInfoCard(
              icon: Icons.info_outline,
              title: 'Důležité',
              text:
                  'Přijde nám důležité říct, že program nenahrazuje terapii. Může být '
                  'však dobrým pomocníkem pro ty, kteří z jakéhokoliv důvodu na terapii '
                  'jít nemohou nebo nechtějí nebo čekají na svůj termín.',
            ),
          ],
        ),
        const ChatStep(
          messages: [
            ChatBotBubble(
              showAvatar: true,
              text:
                  'Program trvá 7 týdnů. Je žádoucí, aby byl plněn každodenně, není to '
                  'však nutnou podmínkou. Program obsahuje zejména praktická cvičení, ale '
                  'i jednoduchá vysvětlení různých souvisejících jevů, které se mohou v '
                  'našich životech objevovat. Jeho plnění zabere v průměru 5-20 minut '
                  'denně.',
            ),
            ChatStatsRow(
              stats: [
                ('7', 'týdnů programu'),
                ('5–20', 'minut denně'),
                ('1', 'klíčová dovednost týdně'),
              ],
            ),
          ],
        ),
        const ChatStep(
          messages: [
            ChatBotBubble(
              showAvatar: true,
              text:
                  'Během těchto společných sedmi týdnů se budeme věnovat následujícím '
                  'oblastem:',
            ),
            ChatAreaChips(labels: _areas),
            ChatBotBubble(showAvatar: true, text: 'Každý týden bude zaměřen na konkrétní oblast.'),
          ],
        ),
        const ChatStep(
          messages: [
            ChatBotBubble(
              text:
                  'Týden obvykle začne nějakým poučením o dané oblasti, aby dávalo '
                  'smysl, na co se v daném týdnu budeme zaměřovat a proč. V dalších dnech '
                  'se postupně budeme učit novým dovednostem, které Vám v programu '
                  'zůstanou jako opora do každodenních situací. Konec týdne bude vždy '
                  'věnován shrnutí a zamyšlení nad tím, co jsme se naučili a co je pro '
                  'Vás užitečné.',
            ),
            ChatBotBubble(
              text:
                  'Možná to zní teď složitě a náročně, ale není třeba se obávat. '
                  'Cvičení jsou dávkována tak, aby pro Vás nebyla příliš zahlcující. V '
                  'každém týdnu bude jedna klíčová dovednost, kterou bude žádoucí si '
                  'během týdne v rámci programu projít a zkusit si připravená cvičení.',
            ),
            ChatBotBubble(
              showAvatar: true,
              text:
                  'Zároveň program obsahuje v každém týdnu i další cvičení a témata, '
                  'která si můžete projít dobrovolně. Chtěli bychom Vás v tom však '
                  'povzbudit. Čím více energie do programu věnujete během následujících '
                  'společných sedmi týdnu, tím lépe Vám může být do budoucna.',
            ),
          ],
        ),
        ChatStep(
          buttonLabel: 'Uložit a pokračovat',
          enabled: _formValid,
          messages: [
            const ChatBotBubble(
              showAvatar: true,
              text:
                  'Dává to smysl? Věříme, že ano. 💜 Zezačátku, než se do programu '
                  'pustíme, zajímá nás Vaše křestní jméno a jak chcete, aby Vás Nepanikař '
                  'oslovovalo.',
            ),
            ChatRichMessage(child: _buildNameForm(context)),
          ],
        ),
      ],
    );
  }

  Widget _buildNameForm(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    final textColor = isDarkMode ? Colors.white : NepanikarColors.dark;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.07) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isDarkMode ? null : NepanikarColors.cardShadow(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tvoje křestní jméno',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: isDarkMode ? Colors.white : primaryColor,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: _nameController,
            onChanged: (_) => _revalidate(),
            style: TextStyle(fontSize: 15, color: textColor),
            decoration: InputDecoration(
              hintText: 'Napiš svoje jméno…',
              hintStyle: TextStyle(color: isDarkMode ? Colors.white38 : Colors.grey.shade400),
              filled: true,
              fillColor: isDarkMode
                  ? Colors.white.withOpacity(0.05)
                  : NepanikarColors.filledContainer,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: primaryColor, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Jak chceš, aby tě Nepanikař oslovoval?',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: isDarkMode ? Colors.white : primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _PronounPill(
                label: 'On',
                selected: _selectedPronoun == BpdPronoun.he,
                onTap: () => _selectPronoun(BpdPronoun.he),
              ),
              const SizedBox(width: 6),
              _PronounPill(
                label: 'Ona',
                selected: _selectedPronoun == BpdPronoun.she,
                onTap: () => _selectPronoun(BpdPronoun.she),
              ),
              const SizedBox(width: 6),
              _PronounPill(
                label: 'Oni',
                selected: _selectedPronoun == BpdPronoun.they,
                onTap: () => _selectPronoun(BpdPronoun.they),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PronounPill extends StatelessWidget {
  const _PronounPill({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected
                ? primaryColor
                : (isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selected
                  ? primaryColor
                  : (isDarkMode ? Colors.white.withOpacity(0.2) : NepanikarColors.purple200),
              width: 1.5,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: selected
                  ? Colors.white
                  : (isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.6)),
            ),
          ),
        ),
      ),
    );
  }
}
