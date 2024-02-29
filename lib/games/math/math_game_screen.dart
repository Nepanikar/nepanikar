import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/games/math/math_answer_result_state.dart';
import 'package:nepanikar/games/math/math_equation_model.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/helpers/screen_resolution_helpers.dart';
import 'package:nepanikar/helpers/semantics_helpers.dart';
import 'package:nepanikar/utils/lottie_cache_manager.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';

class MathGameRoute extends GoRouteData {
  const MathGameRoute();

  @override
  Widget build(BuildContext context, _) => const MathGameScreen();
}

class MathGameScreen extends StatefulWidget {
  const MathGameScreen({super.key});

  @override
  State<MathGameScreen> createState() => _MathGameScreenState();
}

class _MathGameScreenState extends State<MathGameScreen> {
  MathAnswerResultState _answerResultState = MathAnswerResultState.notAnsweredYet;
  final analytics = registry.get<FirebaseAnalytics>();

  late MathEquation _equation;

  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final _lottieCacheManager = registry.get<LottieCacheManager>();

  static const _winAnimDuration = Duration(milliseconds: 800);
  static const _answerEvaluationDuration = Duration(milliseconds: 200);

  void _setAnswerResultState(MathAnswerResultState state) {
    if (state != _answerResultState) {
      setState(() => _answerResultState = state);
    }
  }

  Future<void> _evaluateEquation(String textInput, {bool isInputActionFromButton = false}) async {
    if (textInput.isEmpty) return;
    if (isInputActionFromButton) await Future.delayed(_answerEvaluationDuration);
    if (_equation.isValid(textInput)) {
      if (mounted) {
        _setAnswerResultState(MathAnswerResultState.correct);
        context.semanticsAnnounce(context.l10n.math_annouce_correct_answer);
      }
      await Future.delayed(_winAnimDuration);

      if (mounted) _generateNewEquation();
      unawaited(analytics.logEvent(name: 'math_game_correct_answer'));
    } else {
      if (mounted) {
        context.semanticsAnnounce(context.l10n.math_annouce_incorrect_answer);
        context.semanticsAnnounce(_equation.getSemanticsText());
        _textEditingController.clear();
        _setAnswerResultState(MathAnswerResultState.wrong);
        if (!isInputActionFromButton) _focusNode.requestFocus();
        unawaited(analytics.logEvent(name: 'math_game_wrong_answer'));
      }
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
    _focusNode.dispose();
    super.dispose();
  }

  void _generateNewEquation() {
    final newEquation = MathEquation.generate();
    context.semanticsAnnounce(newEquation.getSemanticsText());
    _textEditingController.clear();
    setState(() {
      _answerResultState = MathAnswerResultState.notAnsweredYet;
      _equation = newEquation;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = backgroundColorsBasedOnDarkMode(context);

    final textColor = customColorsBasedOnDarkMode(
        context,
        NepanikarColors.white,
        NepanikarColors.primary,);

    final cardColor = longTileColorBasedOnDarkMode(context);

    final textStyle = TextStyle(
      fontSize: 56,
      fontWeight: FontWeight.w900,
      color: textColor,
    );

    return GestureDetector(
      onTapDown: (_) => _focusNode.unfocus(),
      excludeFromSemantics: true,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(title: Text(context.l10n.math)),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 90),
                    Card(
                      color: cardColor,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 20),
                            Align(
                              child: Text(
                                _equation.getDisplayText(),
                                semanticsLabel: _equation.getSemanticsText(),
                                style: textStyle,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('=', style: textStyle),
                                const SizedBox(width: 19),
                                Expanded(
                                  child: TextField(
                                    textInputAction: TextInputAction.done,
                                    focusNode: _focusNode,
                                    enabled: !_answerResultState.isCorrect,
                                    keyboardType: TextInputType.number,
                                    controller: _textEditingController,
                                    onSubmitted: _evaluateEquation,
                                    decoration: InputDecoration(
                                      hintText: context.l10n.math_game_answer_button,
                                      contentPadding: const EdgeInsets.symmetric(
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
                                return Visibility(
                                  maintainState: true,
                                  maintainAnimation: true,
                                  maintainSize: true,
                                  visible: !_answerResultState.isCorrect,
                                  child: NepanikarButton.async(
                                    onTapAsync: () async =>
                                        _evaluateEquation(textInput, isInputActionFromButton: true),
                                    trailingIcon: Assets.icons.navigation.chevronRight,
                                    enabled: textInput.isNotEmpty,
                                    text: context.l10n.submit,
                                  ),
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
                      top: -(context.screenHeight * 0.15),
                      child: IgnorePointer(
                        child: _lottieCacheManager.loadFromCache(
                          Assets.animatedIllustrations.confetti,
                          repeat: false,
                          width: context.screenWidth + 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  Positioned(
                    child: _answerResultState.icon,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
