import 'package:collection/collection.dart';

// Modified version of https://github.com/dart-lang/collection/pull/217. This does not throw an
// exception if the index is negative and returns null instead.
extension IterableExtension<T> on Iterable<T> {
  /// Does not throw an exception if the index is negative or out of bounds.
  T? safeElementAtOrNull(int index) => index <= -1 ? null : skip(index).firstOrNull;
}

extension ListExtensions<E> on List<E> {
  /// Does not throw an exception if the index is negative or out of bounds.
  E? safeElementAtOrNull(int index) => index <= -1
      ? null
      : (index < length)
          ? this[index]
          : null;
}
