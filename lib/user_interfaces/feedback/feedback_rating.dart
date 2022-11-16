import '../../utils/utils.dart';
import 'package:flutter/material.dart';

import '../../styles/colors/colors.dart';

class FeedbackRating extends StatefulWidget {
  const FeedbackRating({
    super.key,
    this.initialValue,
    required this.onValueChanged,
  });

  final int? initialValue;
  final ValueChanged<int?> onValueChanged;

  @override
  State<FeedbackRating> createState() => _FeedbackRatingState();
}

class _FeedbackRatingState extends State<FeedbackRating> {
  int? value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: {1: '😔', 3: '😐', 5: '😊'}
            .entries
            .map(
              (entry) => InkWell(
                onTap: () {
                  setState(() => value = entry.key);
                  widget.onValueChanged.call(value);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.greyDarkThemeBackground
                        : const Color(0xFFF5F5F5),
                    border: entry.key == value
                        ? Border.fromBorderSide(BorderSide(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.tealColor
                                    : AppColors.blueColor))
                        : null,
                  ),
                  height: 67,
                  width: 67,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(entry.value, style: const TextStyle(fontSize: 35)),
                      Text(entry.key.toString().toCapitalized()),
                    ],
                  ),
                ),
              ),
            )
            .toList());
  }
}
