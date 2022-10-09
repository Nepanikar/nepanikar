import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';

enum MathAnswerResultState {
  correct,
  wrong,
  notAnsweredYet;

  bool get isCorrect => this == MathAnswerResultState.correct;

  bool get isIncorrect => this == MathAnswerResultState.wrong;

  bool get isNotAnsweredYet => this == MathAnswerResultState.notAnsweredYet;

  bool get isAnswered => this != MathAnswerResultState.notAnsweredYet;

  Widget get icon {
    switch (this) {
      case MathAnswerResultState.correct:
        return Assets.illustrations.games.math.correct.svg();
      case MathAnswerResultState.wrong:
        return Assets.illustrations.games.math.wrong.svg();
      case MathAnswerResultState.notAnsweredYet:
        return const SizedBox.shrink();
    }
  }
}
