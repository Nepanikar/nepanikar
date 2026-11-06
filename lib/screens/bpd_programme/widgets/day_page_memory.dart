import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

/// Keeps a day's place in its page flow across leaving and coming back.
///
/// A `PageView`'s position lived only in widget state, so recording a mood from
/// inside a lesson — or closing the app — restarted a half-finished lesson from
/// page one. The index is written to the day's own progress record, where
/// completion also lives, so the two cannot disagree.
///
/// ```dart
/// static const _pageMemory = BpdDayPageMemory(2, 4);
/// _pageMemory.restore(this, _pageController, _totalPages,
///     (page) => setState(() => _currentPage = page));
/// ```
class BpdDayPageMemory {
  const BpdDayPageMemory(this.weekNumber, this.dayNumber);

  final int weekNumber;
  final int dayNumber;

  BpdDaysDao get _dao => registry.get<BpdDaysDao>();

  /// Jumps [controller] to the remembered page, once the flow is laid out.
  /// [onRestored] lets the screen's own page counter catch up with the jump.
  /// [totalPages] clamps the stored index — an update that shortens a day would
  /// otherwise send someone to a page that no longer exists.
  void restore(
    State<StatefulWidget> state,
    PageController controller,
    int totalPages,
    ValueChanged<int> onRestored,
  ) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final stored = await _dao.getDayPage(weekNumber, dayNumber);
      final page = stored.clamp(0, totalPages - 1);
      if (page <= 0) return;
      if (!state.mounted || !controller.hasClients) return;
      controller.jumpToPage(page);
      onRestored(page);
    });
  }

  /// Records that the user is now on [page]. Fire and forget: a lost write
  /// costs one restored step, and blocking the page turn on a disk write
  /// would be worse.
  void remember(int page) => unawaited(_dao.saveDayPage(weekNumber, dayNumber, page));
}
