import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../styles/colors/colors.dart';
import 'session_list_divider.dart';
import 'session_list_item.dart';

class SessionList extends StatelessWidget {
  final List<Session> list;

  const SessionList({Key? key, this.list = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: list
          .map(
            (s) => Column(
              children: <Widget>[
                SessionListItem(session: s),
                if (s != list.last)
                  const SessionListDivider(color: AppColors.orangeColor)
              ],
            ),
          )
          .toList(growable: false),
    );
  }
}
