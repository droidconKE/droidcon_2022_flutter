import 'package:droidcon_app/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class ButtonGroup extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int>? onSelectedIndexChanged;

  const ButtonGroup({
    Key? key,
    this.selectedIndex = 0,
    this.onSelectedIndexChanged,
  }) : super(key: key);

  @override
  State<ButtonGroup> createState() => _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    super.initState();
  }

  void updateSelectedIndex(index) {
    setState(() {
      _selectedIndex = index;
      if (widget.onSelectedIndexChanged != null) {
        widget.onSelectedIndexChanged?.call(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ButtonGroupButton(
          date: '16th',
          day: 'Day 1',
          active: _selectedIndex == 0,
          onTap: () {
            updateSelectedIndex(0);
          },
        ),
        ButtonGroupButton(
          date: '17th',
          day: 'Day 2',
          active: _selectedIndex == 1,
          onTap: () {
            updateSelectedIndex(1);
          },
        ),
        ButtonGroupButton(
          date: '18th',
          day: 'Day 3',
          active: _selectedIndex == 2,
          onTap: () {
            updateSelectedIndex(2);
          },
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
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              date,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: active ? Colors.white : Colors.black,
                  ),
            ),
            const SizedBox(height: 3),
            Text(
              day,
              style: Theme.of(context).textTheme.overline?.copyWith(
                    color: active ? Colors.white : Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
