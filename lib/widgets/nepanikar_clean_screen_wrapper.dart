import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';

class NepanikarCleanScreenWrapper extends StatelessWidget {
  const NepanikarCleanScreenWrapper({
    super.key,
    required this.appBarTitle,
    required this.child,
  });

  final String appBarTitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      backgroundColor: NepanikarColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}
