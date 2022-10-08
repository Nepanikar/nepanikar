import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/games/math/equation_model.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';

enum MathAnswerResultState {
  correct,
  wrong,
  notAnswered;

  bool get isCorrect => this == MathAnswerResultState.correct;

  bool get isIncorrect => this == MathAnswerResultState.wrong;

  bool get isNotAnswered => this == MathAnswerResultState.notAnswered;

  Widget get icon {
    switch (this) {
      case MathAnswerResultState.correct:
        return Assets.illustrations.games.math.correct.svg();
      case MathAnswerResultState.wrong:
        return Assets.illustrations.games.math.wrong.svg();
      case MathAnswerResultState.notAnswered:
        return const SizedBox.shrink();
    }
  }
}

class MathGameScreen extends StatefulWidget {
  const MathGameScreen({super.key});

  @override
  State<MathGameScreen> createState() => _MathGameScreenState();
}

class _MathGameScreenState extends State<MathGameScreen> {
  MathAnswerResultState _answerResultState = MathAnswerResultState.notAnswered;

  late Equation _equation;

  final TextEditingController _textEditingController = TextEditingController();

  void _setAnswerResultState(MathAnswerResultState state) {
    if (state != _answerResultState) {
      setState(() => _answerResultState = state);
    }
  }

  @override
  void initState() {
    super.initState();
    _equation = Equation.generate();
  }

  void _generateNewEquation() {
    _textEditingController.clear();
    setState(() {
      _answerResultState = MathAnswerResultState.notAnswered;
      _equation = Equation.generate();
    });
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 56,
      fontWeight: FontWeight.w900,
      color: NepanikarColors.background,
    );
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: NepanikarColors.background),
    );

    return Scaffold(
      backgroundColor: NepanikarColors.background,
      appBar: AppBar(
        title: Text(context.l10n.math),
        backgroundColor: NepanikarColors.background,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                const SizedBox(height: 90),
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 20),
                        Align(
                          child: Text(
                            _equation.getDisplayText(),
                            style: const TextStyle(
                              fontSize: 56,
                              fontWeight: FontWeight.w900,
                              color: NepanikarColors.background,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('=', style: textStyle),
                            const SizedBox(width: 19),
                            Expanded(
                              // Outline TextField
                              child: TextField(
                                textInputAction: TextInputAction.done,
                                enabled: !_answerResultState.isCorrect,
                                keyboardType: TextInputType.number,
                                controller: _textEditingController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 16,
                                  ),
                                  border: inputBorder,
                                  focusedBorder: inputBorder,
                                  disabledBorder: inputBorder.copyWith(
                                    borderSide: const BorderSide(color: Colors.grey),
                                  ),
                                  enabledBorder: inputBorder,
                                  errorBorder: inputBorder,
                                  focusedErrorBorder: inputBorder,
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
                                    trailingIcon: Assets.icons.navigation.right,
                                    text: 'Další',
                                  )
                                : NepanikarButton.async(
                                    onTapAsync: () async {
                                      await Future.delayed(const Duration(milliseconds: 200));
                                      if (_equation.isValid(textInput)) {
                                        _setAnswerResultState(MathAnswerResultState.correct);
                                      } else {
                                        _setAnswerResultState(MathAnswerResultState.wrong);
                                      }
                                    },
                                    trailingIcon: Assets.icons.navigation.right,
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
            if (!_answerResultState.isNotAnswered) ...[
              if (_answerResultState.isCorrect)
                Positioned(
                  top: -10,
                  right: 0,
                  left: 60,
                  child: Assets.animatedIllustrations.confetti.lottie(repeat: false),
                ),
              Positioned(
                top: -20,
                right: 0,
                left: 60,
                child: _answerResultState.icon,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
