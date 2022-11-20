import 'package:collection/collection.dart';

// TODO: Taken from https://github.com/dart-lang/collection/pull/217 but can not use yet due to
// dependency conflict.
extension IterableExtension<T> on Iterable<T> {
  T? elementAtOrNull(int index) => skip(index).firstOrNull;
}

extension ListExtensions<E> on List<E> {
  E? elementAtOrNull(int index) => (index < length) ? this[index] : null;
}
