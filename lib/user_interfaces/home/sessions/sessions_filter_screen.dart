import 'package:droidcon_app/providers/sessions_filter/sessions_filter_provider.dart';
import 'package:droidcon_app/providers/sessions_filter/state/sessions_filter_state.dart';
import 'package:droidcon_app/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/afrikon_icon.dart';

class SessionsFilterScreen extends ConsumerWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();

  SessionsFilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Material(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
            child: Theme(
              data: ThemeData(primaryColor: AppColors.blackColor),
              child: Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * .9,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: SafeArea(
                  child: FormBuilder(
                    key: _formKey,
                    initialValue: ref
                        .watch(sessionsFilterProvider)
                        .maybeWhen(custom: (data) => data, orElse: () => {}),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const AfrikonIcon(
                                  'filter-outline',
                                  color: AppColors.blueColor,
                                  height: 16,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Filter',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: AppColors.blueColor,
                                      ),
                                ),
                              ],
                            ),
                            TextButton(
                              child: Text(
                                'CANCEL',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                        Text(
                          'Level',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const CustomSegmentedControlField(
                            name: 'level',
                            options: ['Beginner', 'Intermediate', 'Expert']),
                        const SizedBox(height: 32),
                        Text(
                          'Topic',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const CustomSegmentedControlField(
                            name: 'topic',
                            options: ['UI/UI Design', 'Backend', 'APIs']),
                        const SizedBox(height: 32),
                        Text(
                          'Rooms',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const CustomSegmentedControlField(
                            name: 'rooms',
                            options: ['Room 1', 'Room 2', 'Room 3']),
                        const SizedBox(height: 32),
                        Text(
                          'Session Type',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const CustomSegmentedControlField(
                          name: 'format',
                          options: [
                            'Keynote',
                            'Codelab',
                            'Session',
                            'Lightning Talk',
                            'Panel Discussion'
                          ],
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.saveAndValidate()) {
                                ref
                                    .read(sessionsFilterProvider.notifier)
                                    .change(SessionsFilterState.custom(
                                        _formKey.currentState!.value));
                                Navigator.of(context).pop();
                              }
                            },
                            child: const Text('FILTER'),
                          ),
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: OutlinedButton(
                            onPressed: () {
                              ref
                                  .read(sessionsFilterProvider.notifier)
                                  .change(SessionsFilterState.none());
                              Navigator.of(context).pop();
                            },
                            child: const Text('CLEAR FILTER'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSegmentedControlField extends StatelessWidget {
  const CustomSegmentedControlField({
    Key? key,
    required this.options,
    required this.name,
  }) : super(key: key);
  final List<String> options;
  final String name;

  @override
  Widget build(BuildContext context) {
    return FormBuilderSegmentedControl<String>(
      name: name,
      decoration: const InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        filled: false,
      ),
      selectedColor: AppColors.tealColor,
      pressedColor: AppColors.tealColor.withOpacity(.1),
      options: options
          .map(
            (v) => FormBuilderFieldOption(
              value: v,
              child: Text(
                v,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          )
          .toList(),
      // spacing: 10,
      // selectedColor: Palette.purple[200],
    );
  }
}
