import 'package:flutter/material.dart';

class SessionListDivider extends StatelessWidget {
  final Color color;

  const SessionListDivider({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      // color: Colors.red,
      padding: const EdgeInsets.only(left: 60),
      alignment: Alignment.centerLeft,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 20,
            width: 1,
            color: color,
          ),
          Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.5),
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
