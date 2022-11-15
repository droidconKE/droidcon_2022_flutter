import 'package:flutter/material.dart';

import '../../../styles/colors/colors.dart';

class DroidconSwitch extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool value;

  const DroidconSwitch({
    Key? key,
    required this.onChanged,
    this.value = false,
  }) : super(key: key);

  @override
  State<DroidconSwitch> createState() => _DroidconSwitchState();
}

class _DroidconSwitchState extends State<DroidconSwitch> {
  bool _value = false;
  final _animationDuration = const Duration(milliseconds: 300);
  final _animationCurve = Curves.easeIn;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChanged.call(_value);
        });
      },
      child: Stack(
        children: <Widget>[
          Container(
            height: 25,
            width: 55,
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: _animationDuration,
              curve: _animationCurve,
              width: 35,
              height: 15,
              decoration: BoxDecoration(
                color: _value
                    ? AppColors.orangeColor
                    : Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : AppColors.blackColor,
                borderRadius: BorderRadius.circular(7.5),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: _animationDuration,
            curve: _animationCurve,
            right: _value ? 0 : 35,
            left: _value ? 35 : 0,
            top: 2.5,
            child: Material(
              elevation: 8,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.star,
                  size: 15,
                  color: _value ? AppColors.orangeColor : AppColors.blackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
