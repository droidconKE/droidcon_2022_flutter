import 'package:droidcon_app/models/models.dart';
import 'package:droidcon_app/styles/colors/colors.dart';
import 'package:droidcon_app/user_interfaces/home/sessions/widgets/session_list_item.dart';
import 'package:flutter/material.dart';

import 'session_list_divider.dart';

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
