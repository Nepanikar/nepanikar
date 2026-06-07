import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/screens/home/my_records/tests/test_detail_screen.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

part 'test_list_screen.g.dart';

@TypedGoRoute<TestListScreenRoute>(path: '/home/my-records/tests')
class TestListScreenRoute extends GoRouteData with $TestListScreenRoute {
  const TestListScreenRoute();

  @override
  Widget build(BuildContext context, _) => const TestListScreen();
}

// --- Dátový model pre metadáta testov ---
class TestMetadata {
  TestMetadata({
    required this.id,
    required this.name,
    required this.description,
    required this.svgImagePath,
    required this.pngImagePath,
    required this.csvPath,
  });

  factory TestMetadata.fromJson(Map<String, dynamic> json) {
    return TestMetadata(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      svgImagePath: json['svg_image_path'] as String,
      pngImagePath: json['png_image_path'] as String,
      csvPath: json['csv_path'] as String,
    );
  }
  final String id;
  final String name;
  final String description;
  final String svgImagePath;
  final String pngImagePath;
  final String csvPath;
}

class TestListScreen extends StatefulWidget {
  const TestListScreen({super.key});

  @override
  State<TestListScreen> createState() => _TestListScreenState();
}

class _TestListScreenState extends State<TestListScreen> {
  List<TestMetadata> _tests = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadManifest();
  }

  Future<void> _loadManifest() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/tests/tests-data.json',
      );

      final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;

      final List<TestMetadata> tests = jsonList
          .map(
            (jsonItem) =>
                TestMetadata.fromJson(jsonItem as Map<String, dynamic>),
          )
          .toList();

      if (mounted) {
        setState(() {
          _tests = tests;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading tests manifest: $e');
      }
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorFilter = svgColorFilterBasedOnDarkMode(context);

    final List<Widget> modules;

    if (_isLoading) {
      modules = [const Center(child: CircularProgressIndicator())];
    } else {
      modules = _tests.map((test) {
        return LongTile(
          text: test.name,
          image: SvgPicture.asset(test.svgImagePath, colorFilter: colorFilter),
          onTap: () =>
              context.push(TestDetailScreenRoute(testId: test.id).location),
        );
      }).toList();
    }

    return NepanikarScreenWrapper(
      appBarTitle: 'Test List', // TODO: Lokalizovať
      showBottomNavbar: true,
      children: modules,
    );
  }
}
