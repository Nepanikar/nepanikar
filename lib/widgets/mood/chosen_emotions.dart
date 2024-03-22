import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChosenEmotionsWidget extends StatefulWidget {
  const ChosenEmotionsWidget({
    super.key,
    required this.initialEmotions,
    this.onEmotionsUpdated,
    this.deleteEmotionEnabled = true,
  });

  final List<String> initialEmotions;
  final Function(List<String>)? onEmotionsUpdated;
  final bool deleteEmotionEnabled;

  @override
  _ChosenEmotionsWidgetState createState() => _ChosenEmotionsWidgetState();
}

class _ChosenEmotionsWidgetState extends State<ChosenEmotionsWidget> {
  late List<String> selectedEmotions;

  @override
  void initState() {
    super.initState();
    selectedEmotions = widget.initialEmotions;
  }

  @override
  void didUpdateWidget(covariant ChosenEmotionsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialEmotions != widget.initialEmotions) {
      setState(() {
        selectedEmotions = List<String>.from(widget.initialEmotions);
      });
    }
  }

  void _removeEmotion(String emotion) {
    setState(() {
      selectedEmotions.remove(emotion);
    });
    widget.onEmotionsUpdated?.call(selectedEmotions);
  }

  @override
  Widget build(BuildContext context) {
    if(widget.deleteEmotionEnabled){
      return Wrap(
        spacing: 8.0,
        children:
        selectedEmotions
            .map(
              (emotion) => Chip(
            label: Text(emotion),
            deleteIcon: const Icon(Icons.cancel),
            onDeleted: () => _removeEmotion(emotion),
            backgroundColor: Colors.purple,
            // Customize as needed
            deleteIconColor: Colors.white,
            // Customize as needed
            labelStyle:
            const TextStyle(color: Colors.white), // Customize as needed
          ),
        )
            .toList(),
      );
    }
    else {
      return Wrap(
        spacing: 8.0,
        children:
        selectedEmotions
            .map(
              (emotion) => Chip(
            label: Text(emotion),
            backgroundColor: Colors.purple,
            // Customize as needed
            deleteIconColor: Colors.white,
            // Customize as needed
            labelStyle:
            const TextStyle(color: Colors.white), // Customize as needed
          ),
        )
            .toList(),
      );
    }
  }
}
