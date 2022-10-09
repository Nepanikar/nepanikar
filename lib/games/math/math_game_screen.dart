import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/games/math/math_answer_result_state.dart';
import 'package:nepanikar/games/math/math_equation_model.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/utils/lottie_cache_manager.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';

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
                                onSubmitted: _evaluateEquation,
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
                                    onTapAsync: () async => _evaluateEquation(textInput),
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
