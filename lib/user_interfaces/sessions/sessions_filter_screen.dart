import 'package:droidcon_app/models/session_filter/session_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/sessions_filter/sessions_filter_provider.dart';
import '../../providers/sessions_filter/state/sessions_filter_state.dart';
import '../../styles/colors/colors.dart';
import '../widgets/afrikon_icon.dart';

class SessionsFilterScreen extends ConsumerWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();

  SessionsFilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsFilter = ref.watch(sessionsFilterProvider);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Material(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
            child: Theme(
              data: Theme.of(context)
                  .copyWith(primaryColor: AppColors.blackColor),
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
                    initialValue: ref.watch(sessionsFilterProvider).maybeWhen(
                        custom: (data) => data.toJson(), orElse: () => {}),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        CustomSegmentedControlField(
                          name: 'level',
                          options: const ['Beginner', 'Intermediate', 'Expert'],
                          validator: (val) {
                            if (val == null &&
                                _formKey.currentState!.fields['room']!.value ==
                                    null &&
                                _formKey.currentState!.fields['format']!
                                        .value ==
                                    null) {
                              return 'Select at least one filter';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 32),
                        /*Text(
                          'Topic',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const CustomSegmentedControlField(
                          name: 'topic',
                          options: ['UI/UI Design', 'Backend', 'APIs'],
                        ),
                        const SizedBox(height: 32),*/
                        Text(
                          'Rooms',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        CustomSegmentedControlField(
                          name: 'room',
                          options: const ['Room A', 'Room B', 'Room C'],
                          validator: (val) {
                            if (val == null &&
                                _formKey.currentState!.fields['level']!.value ==
                                    null &&
                                _formKey.currentState!.fields['format']!
                                        .value ==
                                    null) {
                              return 'Select at least one filter';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'Session Type',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        CustomSegmentedControlField(
                          name: 'format',
                          options: const [
                            'Keynote',
                            'Codelab',
                            'Session',
                            'Lightning\ntalk',
                            'Workshop',
                            'Panel'
                          ],
                          validator: (val) {
                            if (val == null &&
                                _formKey.currentState!.fields['level']!.value ==
                                    null &&
                                _formKey.currentState!.fields['room']!.value ==
                                    null) {
                              return 'Select at least one filter';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.saveAndValidate()) {
                                ref
                                    .read(sessionsFilterProvider.notifier)
                                    .change(SessionsFilterState.custom(
                                        SessionFilter.fromJson(
                                            _formKey.currentState!.value)));
                                Navigator.of(context).pop();
                              }
                            },
                            child: const Text('FILTER'),
                          ),
                        ),
                        sessionsFilter.maybeWhen(
                          orElse: () => const SizedBox(),
                          custom: (_) => SizedBox(
                            width: double.maxFinite,
                            child: OutlinedButton(
                              onPressed: () {
                                _formKey.currentState!.reset();
                                ref
                                    .read(sessionsFilterProvider.notifier)
                                    .change(SessionsFilterState.none());
                                Navigator.of(context).pop();
                              },
                              child: const Text('CLEAR FILTER'),
                            ),
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
    this.validator,
  }) : super(key: key);
  final List<String> options;
  final String name;
  final FormFieldValidator? validator;

  @override
  Widget build(BuildContext context) {
    return FormBuilderSegmentedControl<String>(
      name: name,
      validator: validator,
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
