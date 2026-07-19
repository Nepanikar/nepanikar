import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

part 'bpd_programme_screen.g.dart';

@TypedGoRoute<BpdProgrammeScreenRoute>(path: '/bpd-programme')
class BpdProgrammeScreenRoute extends GoRouteData
    with $BpdProgrammeScreenRoute {
  const BpdProgrammeScreenRoute();

  @override
  Widget build(BuildContext context, _) => const BpdProgrammeScreen();
}

class BpdProgrammeScreen extends StatelessWidget {
  const BpdProgrammeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NepanikarScreenWrapper(
      appBarTitle: 'DBT program',
      showBottomNavbar: true,
      children: [
        const SizedBox(height: 40),
        const Center(
          child: Icon(Icons.construction, size: 80, color: Colors.grey),
        ),
        const SizedBox(height: 24),
        const Center(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'DBT Programme Content\n\nComing Soon...',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
