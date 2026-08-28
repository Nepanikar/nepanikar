import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/bpd/bpd_reflection_dao.dart';
import 'package:nepanikar/utils/registry.dart';

/// Keeps a week's reflection answers saved while the user is still typing.
///
/// The "week done" button at the end of the flow is not a safe save point — the
/// reflection page tells the user the answers stay saved, but they can leave it
/// with the back arrow, the close control or by killing the app, and everything
/// typed would be gone. Mixing this in writes each edit through a short
/// debounce and flushes whatever is pending on dispose.
///
/// Call [initReflectionAutosave] from `initState` (it also loads the previously
/// saved answers into the controllers) and [saveReflectionNow] wherever an
/// immediate write matters, e.g. right before marking the week completed.
mixin ReflectionAutosave<T extends StatefulWidget> on State<T> {
  static const _debounce = Duration(milliseconds: 400);

  Timer? _saveTimer;
  int _weekNumber = 0;
  List<TextEditingController> _controllers = const <TextEditingController>[];

  /// Latest answers, kept as plain strings so a flush never has to touch a
  /// controller that may already be disposed.
  List<String> _pending = const <String>[];
  bool _isDirty = false;

  BpdReflectionDao get _reflectionDao => registry.get<BpdReflectionDao>();

  Future<void> initReflectionAutosave({
    required int weekNumber,
    required List<TextEditingController> controllers,
  }) async {
    _weekNumber = weekNumber;
    _controllers = controllers;

    final saved = await _reflectionDao.getReflection(weekNumber: weekNumber);
    if (!mounted) return;
    for (var i = 0; i < controllers.length && i < saved.length; i++) {
      controllers[i].text = saved[i];
    }
    for (final controller in controllers) {
      controller.addListener(_onAnswerChanged);
    }
  }

  void _onAnswerChanged() {
    _pending = _controllers.map((c) => c.text.trim()).toList();
    _isDirty = true;
    _saveTimer?.cancel();
    _saveTimer = Timer(_debounce, _flush);
  }

  Future<void> saveReflectionNow() => _flush();

  Future<void> _flush() async {
    _saveTimer?.cancel();
    if (!_isDirty) return;
    _isDirty = false;
    await _reflectionDao.saveReflection(weekNumber: _weekNumber, answers: _pending);
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.removeListener(_onAnswerChanged);
    }
    // Fire and forget — the DAO outlives this widget.
    _flush();
    super.dispose();
  }
}
