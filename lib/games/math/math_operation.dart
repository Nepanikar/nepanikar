enum MathOperation {
  add,
  subtract,
  multiply;

  String get symbol {
    switch (this) {
      case MathOperation.add:
        return '+';
      case MathOperation.subtract:
        return '-';
      case MathOperation.multiply:
        return 'x';
    }
  }

  int calculate(int a, int b) {
    switch (this) {
      case MathOperation.add:
        return a + b;
      case MathOperation.subtract:
        return a - b;
      case MathOperation.multiply:
        return a * b;
    }
  }
}
