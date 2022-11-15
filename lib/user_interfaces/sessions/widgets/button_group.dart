import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../styles/colors/colors.dart';

class ButtonGroup extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<DateTime>? onSelectedIndexChanged;
  final List<DateTime> options;

  const ButtonGroup({
    Key? key,
    this.selectedIndex = 0,
    this.onSelectedIndexChanged,
    required this.options,
  }) : super(key: key);

  @override
  State<ButtonGroup> createState() => _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void updateSelectedIndex(index) {
    setState(() {
      _selectedIndex = index;
      if (widget.onSelectedIndexChanged != null) {
        widget.onSelectedIndexChanged?.call(widget.options[index]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ...widget.options.asMap().entries.map(
              (e) => ButtonGroupButton(
                date: DateFormat('d').format(e.value),
                day: 'Day ${e.key + 1}',
                active: _selectedIndex == e.key,
                onTap: () {
                  updateSelectedIndex(e.key);
                },
              ),
            ),
      ],
    );
  }
}

class ButtonGroupButton extends StatelessWidget {
  final String date;
  final String day;
  final bool active;
  final VoidCallback? onTap;

  const ButtonGroupButton(
      {Key? key,
      this.active = false,
      this.onTap,
      required this.date,
      required this.day})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        // height: 60,
        // width: 50,
        decoration: BoxDecoration(
          color: active
              ? AppColors.orangeColor
              : AppColors.tealColor.withOpacity(.11),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              date,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: active
                        ? Colors.white
                        : Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                  ),
            ),
            const SizedBox(height: 3),
            Text(
              day,
              style: Theme.of(context).textTheme.overline?.copyWith(
                    color: active
                        ? Colors.white
                        : Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
