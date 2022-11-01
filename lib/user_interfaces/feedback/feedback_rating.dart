import 'package:flutter/material.dart';

class FeedbackRating extends StatefulWidget {
  const FeedbackRating(
      {Key? key, this.initialValue, required this.onValueChanged})
      : super(key: key);

  final String? initialValue;
  final ValueChanged<String?> onValueChanged;

  @override
  State<FeedbackRating> createState() => _FeedbackRatingState();
}

class _FeedbackRatingState extends State<FeedbackRating> {
  String? value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: {'bad': '😔', 'okay': '😐', 'great': '😊'}
            .entries
            .map(
              (entry) => InkWell(
            onTap: () {
              setState(() => value = entry.key);
              widget.onValueChanged.call(value);
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                border: entry.key == value
                    ? const Border.fromBorderSide(
                    BorderSide(color: Colors.black))
                    : null,
              ),
              height: 67,
              width: 67,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(entry.value, style: const TextStyle(fontSize: 35)),
                  Text(entry.key.toCapitalized()),
                ],
              ),
            ),
          ),
        )
            .toList());
  }
}

// TODO: Put in utils?
extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}