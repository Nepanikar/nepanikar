import 'package:flutter/material.dart';

/// Temporary dialog. For showing data for screens that are not yet implemented.
void showDataDialog<T>(
  BuildContext context, {
  required Stream<T> dataStream,
  required Widget Function(T data) itemBuilder,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Temporary dialog for testing'),
        content: StreamBuilder<T>(
          stream: dataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: itemBuilder(snapshot.data as T),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      );
    },
  );
}
