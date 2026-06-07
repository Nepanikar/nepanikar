import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/screens/home/my_records/tests/test_list_screen.dart';
import 'package:nepanikar/screens/home/my_records/tests/test_screen.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';
import 'package:nepanikar/widgets/test/test_card.dart';

part 'test_detail_screen.g.dart';

@TypedGoRoute<TestDetailScreenRoute>(
  path: '/home/my-records/tests/test-detail/:testId',
)
class TestDetailScreenRoute extends GoRouteData with $TestDetailScreenRoute {
  const TestDetailScreenRoute({required this.testId});

  final String testId;

  @override
  Widget build(BuildContext context, _) => TestDetailScreen(testId: testId);
}

class TestDetailScreen extends StatefulWidget {
  const TestDetailScreen({super.key, required this.testId});

  final String testId;

  @override
  State<TestDetailScreen> createState() => _TestDetailScreenState();
}

class _TestDetailScreenState extends State<TestDetailScreen> {
  TestMetadata? _testData;

  @override
  void initState() {
    super.initState();
    _loadTestDetailsFallback();
  }

  Future<void> _loadTestDetailsFallback() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/tests/tests-data.json',
      );
      final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;

      final Map<String, dynamic> testJson = jsonList
          .cast<Map<String, dynamic>>()
          .firstWhere((item) => item['id'] == widget.testId);

      if (mounted) {
        setState(() {
          _testData = TestMetadata.fromJson(testJson);
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading test details fallback: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final TestMetadata? testData = _testData;

    return NepanikarScreenWrapper(
      appBarTitle: testData?.name ?? 'Načítava sa...',
      showBottomNavbar: true,
      children: [
        if (testData == null)
          const Center(child: CircularProgressIndicator())
        else
          TestCard(
            title: testData.name,
            description: testData.description,
            imagePath: testData.pngImagePath,
            onStartTest: () {
              context.push(TestScreenRoute(testId: testData.id).location);
            },
          ),
      ],
    );
  }
}
