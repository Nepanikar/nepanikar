import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/games/math/math_answer_result_state.dart';
import 'package:nepanikar/games/math/math_equation_model.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/utils/lottie_cache_manager.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';

class MathGameRoute extends GoRouteData {
  const MathGameRoute();

  @override
  Widget build(BuildContext context) => const MathGameScreen();
}

class MathGameScreen extends StatefulWidget {
  const MathGameScreen({super.key});

  @override
  State<MathGameScreen> createState() => _MathGameScreenState();
}

class _MathGameScreenState extends State<MathGameScreen> {
  MathAnswerResultState _answerResultState = MathAnswerResultState.notAnsweredYet;

  late MathEquation _equation;

  final TextEditingController _textEditingController = TextEditingController();

  final _lottieCacheManager = registry.get<LottieCacheManager>();

  void _setAnswerResultState(MathAnswerResultState state) {
    if (state != _answerResultState) {
      setState(() => _answerResultState = state);
    }
  }

  Future<void> _evaluateEquation(String textInput) async {
    if (textInput.isEmpty) return;
    await Future.delayed(const Duration(milliseconds: 200));
    if (_equation.isValid(textInput)) {
      _setAnswerResultState(MathAnswerResultState.correct);
    } else {
      _setAnswerResultState(MathAnswerResultState.wrong);
    }
  }

  @override
  void initState() {
    super.initState();
    _equation = MathEquation.generate();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _generateNewEquation() {
    _textEditingController.clear();
    setState(() {
      _answerResultState = MathAnswerResultState.notAnsweredYet;
      _equation = MathEquation.generate();
    });
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 56,
      fontWeight: FontWeight.w900,
      color: NepanikarColors.primary,
    );

    return Scaffold(
      backgroundColor: NepanikarColors.primary,
      appBar: AppBar(title: Text(context.l10n.math)),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                const SizedBox(height: 90),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 20),
                        Align(
                          child: Text(
                            _equation.getDisplayText(),
                            style: textStyle,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('=', style: textStyle),
                            const SizedBox(width: 19),
                            Expanded(
                              child: TextField(
                                textInputAction: TextInputAction.done,
                                enabled: !_answerResultState.isCorrect,
                                keyboardType: TextInputType.number,
                                controller: _textEditingController,
                                onSubmitted: _evaluateEquation,
                                decoration: const InputDecoration(
                                  // TODO: l10n
                                  hintText: 'Jaký je výsledek?',
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        ValueListenableBuilder<TextEditingValue>(
                          valueListenable: _textEditingController,
                          builder: (_, textEditingValue, __) {
                            final textInput = textEditingValue.text;
                            return _answerResultState.isCorrect
                                ? NepanikarButton(
                                    onTap: () => _generateNewEquation(),
                                    trailingIcon: Assets.icons.navigation.chevronRight,
                                    // TODO: l10n
                                    text: 'Další',
                                  )
                                : NepanikarButton.async(
                                    onTapAsync: () async => _evaluateEquation(textInput),
                                    trailingIcon: Assets.icons.navigation.chevronRight,
                                    enabled: textInput.isNotEmpty,
                                    text: context.l10n.submit,
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (_answerResultState.isAnswered) ...[
              if (_answerResultState.isCorrect)
                Positioned(
                  bottom: 10,
                  child: _lottieCacheManager.loadFromCache(
                    Assets.animatedIllustrations.confetti,
                    repeat: false,
                  ),
                ),
              Positioned(
                child: _answerResultState.icon,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
