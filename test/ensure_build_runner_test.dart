@Timeout(Duration(minutes: 10))
import 'package:build_verify/build_verify.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ensure generated files are up to date', expectBuildClean);
}
