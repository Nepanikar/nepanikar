import 'dart:math';

import 'package:nepanikar/games/math/math_operation_model.dart';

const int _cppMaxInt = 32767;

/// [a] [operation] [b] = [_correctResult]
class Equation {
  const Equation._({
    required this.a,
    required this.b,
    required this.operation,
    required int correctResult,
  }) : _correctResult = correctResult;

  factory Equation.generate() {
    final r = Random();
    var a = r.nextInt(_cppMaxInt) % 10;
    var b = r.nextInt(_cppMaxInt) % 10;
    final MathOperation operation = MathOperation.values[r.nextInt(MathOperation.values.length)];
    if (operation == MathOperation.subtract && b > a) {
      // Swap so we don't get negative result.
      final int temp = a;
      a = b;
      b = temp;
    }
    final correctResult = operation.calculate(a, b);
    return Equation._(
      a: a,
      b: b,
      operation: operation,
      correctResult: correctResult,
    );
  }

  final int a;
  final int b;
  final MathOperation operation;
  final int _correctResult;

  bool isValid(String input) {
    final answer = int.tryParse(input);
    if (answer != null) {
      return answer == _correctResult;
    }
    return false;
  }

  String getDisplayText() => '$a${operation.symbol}$b';
}
