import 'package:flutter/material.dart';

/// This will remove the overscroll effect entirely.
///
/// On iOS, the overscroll effect comes from BouncingScrollPhysics added by ScrollBehavior.
class NepanikarScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => const ClampingScrollPhysics();
}
