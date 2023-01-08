import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/services/db/my_records/food/my_records_food_record_dao.dart';
import 'package:nepanikar/services/db/my_records/food/my_records_food_record_model.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class MyRecordsFoodRecordsDetailMenuDetailRoute extends GoRouteData {
  const MyRecordsFoodRecordsDetailMenuDetailRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // TODO: Unsafe casting.
    final extra = state.extra! as FoodRecordRouteExtraData;
    return MyRecordsFoodRecordsDetailMenuDetailScreen(
      id: extra.id,
      dailyFoodRecord: extra.dailyFoodRecord,
      // TODO: Unsafe casting
      foodType: extra.foodType!,
    );
  }
}

class FoodRecordRouteExtraData extends Equatable {
  const FoodRecordRouteExtraData({
    required this.id,
    required this.dailyFoodRecord,
    this.foodType,
  });

  final String id;
  final DailyFoodRecord dailyFoodRecord;
  final FoodType? foodType;

  @override
  List<Object?> get props => [id, dailyFoodRecord, foodType];
}

class MyRecordsFoodRecordsDetailMenuDetailScreen extends StatefulWidget {
  const MyRecordsFoodRecordsDetailMenuDetailScreen({
    super.key,
    required this.id,
    required this.dailyFoodRecord,
    required this.foodType,
  });

  final String id;
  final DailyFoodRecord dailyFoodRecord;
  final FoodType foodType;

  @override
  State<MyRecordsFoodRecordsDetailMenuDetailScreen> createState() =>
      _MyRecordsFoodRecordsDetailMenuDetailScreenState();
}

class _MyRecordsFoodRecordsDetailMenuDetailScreenState
    extends State<MyRecordsFoodRecordsDetailMenuDetailScreen> {
  final Map<FoodQuestionText, TextEditingController> _textEditingControllersMap = {};

  Map<FoodQuestionText, String> get _answers => {
        for (final entry in _textEditingControllersMap.entries) entry.key: entry.value.text,
      };

  final _tickedFeels = <FoodQuestionFeel>{};
  final _tickedProblems = <FoodQuestionProblem>{};

  DailyFoodRecordAnswer get _foodTypeAnswer =>
      widget.dailyFoodRecord.getFoodRecordAnswerFromFoodType(widget.foodType);

  MyRecordsFoodRecordDao get _myRecordsFoodRecordDao => registry.get<MyRecordsFoodRecordDao>();

  @override
  void initState() {
    super.initState();
    for (final question in FoodQuestionText.values) {
      _textEditingControllersMap[question] = TextEditingController();
    }
    _setInitialTextsFromFoodRecord();
    _setInitialTickedCheckboxes();
  }

  void _setInitialTextsFromFoodRecord() {
    final foodTypeTextAnswers = _foodTypeAnswer.questionTextAnswers;
    for (final answer in foodTypeTextAnswers) {
      final controller = _textEditingControllersMap[answer.foodQuestionText];
      if (controller != null) {
        controller
          ..text = answer.answer
          ..selection = TextSelection.fromPosition(TextPosition(offset: answer.answer.length));
        _answers[answer.foodQuestionText] = answer.answer;
      }
    }
  }

  void _setInitialTickedCheckboxes() {
    _tickedFeels.addAll(_foodTypeAnswer.tickedQuestionFeels);
    _tickedProblems.addAll(_foodTypeAnswer.tickedQuestionProblems);
  }

  @override
  void dispose() {
    for (final controller in _textEditingControllersMap.values) {
      controller.dispose();
    }
    _textEditingControllersMap.clear();
    super.dispose();
  }

  DailyFoodRecordAnswer _constructFoodTypeAnswer() {
    final updatedFoodTypeAnswer = _foodTypeAnswer.copyWith(
      questionTextAnswers: _answers.entries
          .map((entry) => FoodQuestionTextAnswer(foodQuestionText: entry.key, answer: entry.value))
          .toList(),
      tickedQuestionFeels: _tickedFeels.toList(),
      tickedQuestionProblems: _tickedProblems.toList(),
    );
    return updatedFoodTypeAnswer;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => FocusScope.of(context).unfocus(),
      child: NepanikarScreenWrapper(
        appBarTitle: widget.foodType.getLabel(context),
        appBarDescription: '',
        isModuleList: false,
        isCardStackLayout: true,
        children: [
          _generateFields(),
          const SizedBox(height: 16),
          _generateCheckboxes<FoodQuestionFeel>(
            allValues: FoodQuestionFeel.values.toList(),
            activeValues: _tickedFeels.toList(),
            title: context.l10n.food_record_feel,
            getItemLabel: (item) => item.getLabel(context),
            onItemChanged: (state, item) {
              setState(() {
                if (state) {
                  _tickedFeels.add(item);
                } else {
                  _tickedFeels.remove(item);
                }
              });
            },
          ),
          const SizedBox(height: 16),
          _generateCheckboxes<FoodQuestionProblem>(
            allValues: FoodQuestionProblem.values.toList(),
            activeValues: _tickedProblems.toList(),
            title: context.l10n.food_record_problems,
            getItemLabel: (item) => item.getLabel(context),
            onItemChanged: (state, item) {
              setState(() {
                if (state) {
                  _tickedProblems.add(item);
                } else {
                  _tickedProblems.remove(item);
                }
              });
            },
          ),
          const SizedBox(height: 16),
          NepanikarButton(
            // TODO: l10n
            text: 'Uložit',
            expandToContentWidth: true,
            onTap: () async {
              final goRouter = GoRouter.of(context);
              final updatedFoodTypeAnswer = _constructFoodTypeAnswer();
              await _myRecordsFoodRecordDao.updateFoodTypeAnswer(
                widget.id,
                widget.dailyFoodRecord,
                updatedFoodTypeAnswer,
              );
              goRouter.pop();
            },
          ),
        ],
      ),
    );
  }

  Widget _generateFields() {
    final labelTextStyle = NepanikarFonts.bodySmallHeavy.copyWith(fontWeight: FontWeight.w700);
    return Form(
      child: Column(
        children: [
          for (final questionText in FoodQuestionText.values)
            Column(
              children: [
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    questionText.getLabel(context),
                    style: labelTextStyle,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _textEditingControllersMap[questionText],
                  textInputAction: TextInputAction.next,
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _generateCheckboxes<T>({
    required List<T> allValues,
    required List<T> activeValues,
    required String title,
    required String Function(T value) getItemLabel,
    required void Function(bool value, T item) onItemChanged,
  }) {
    final labelTextStyle = NepanikarFonts.bodySmallHeavy.copyWith(fontWeight: FontWeight.w700);
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(title, style: labelTextStyle),
        ),
        GridView.count(
          shrinkWrap: true,
          primary: false,
          crossAxisCount: 2,
          childAspectRatio: 4,
          children: allValues
              .map(
                (item) => Row(
                  children: [
                    Checkbox(
                      value: activeValues.contains(item),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      onChanged: (value) => onItemChanged(value ?? false, item),
                    ),
                    Flexible(child: Text(getItemLabel(item), style: NepanikarFonts.bodyRoman)),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
