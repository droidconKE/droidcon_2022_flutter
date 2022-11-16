import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../providers/feedback/event_feedback_provider.dart';
import '../../styles/colors/colors.dart';
import '../authentication/widgets/signup_image_background.dart';
import '../widgets/app_back_button.dart';
import '../widgets/primary_button.dart';
import 'feedback_rating.dart';

class FeedbackScreen extends ConsumerWidget {
  static String routeName = 'feedback';

  FeedbackScreen({super.key});

  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: AppBackButton(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.white,
            ),
            title: Text('Feedback',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.white,
                    )),
            expandedHeight: 180.0,
            backgroundColor: AppColors.blueColor,
            flexibleSpace: const FlexibleSpaceBar(
              background: SignUpSVGBackground(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FormBuilder(
                    key: formKey,
                    child: Column(children: [
                      const SizedBox(height: 30),
                      Text(
                        'Your feedback helps us improve',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? AppColors.tealColor
                                    : AppColors.blueColor,
                                fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      Card(
                        elevation: 1,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.black
                            : Colors.white,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            children: [
                              const SizedBox(height: 17),
                              Text(
                                'How is / was the event',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 30),
                              FormBuilderField<int?>(
                                builder: (field) {
                                  return InputDecorator(
                                    decoration: InputDecoration(
                                      errorText: field.errorText,
                                      fillColor: Colors.transparent,
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                    ),
                                    child: FeedbackRating(
                                      onValueChanged: (value) =>
                                          field.didChange(value),
                                    ),
                                  );
                                },
                                name: 'rating',
                                validator: FormBuilderValidators.required(
                                    errorText:
                                        'Please select how you feed about the event.'),
                              ),
                              const SizedBox(height: 27),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      FormBuilderTextField(
                        name: 'feedback',
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.tealColor
                              : AppColors.blueDroidconColor,
                        ),
                        decoration: InputDecoration(
                            hintText: 'Type message here',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? AppColors.tealColor
                                  : AppColors.blueDroidconColor,
                            )),
                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.black38
                                    : Colors.white),
                        maxLines: 4,
                        validator: FormBuilderValidators.required(
                            errorText: 'Any more info?'),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.maxFinite,
                        child: PrimaryButton(
                          onPressed: () async {
                            if (formKey.currentState!.saveAndValidate()) {
                              await ref
                                  .read(feedbackRepositoryProvider)
                                  .postEventFeedback(
                                      formKey.currentState!.value);
                              await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  contentPadding: const EdgeInsets.only(
                                      top: 50, left: 75, right: 75),
                                  buttonPadding: const EdgeInsets.only(
                                      bottom: 40, left: 70, right: 70),
                                  content: SizedBox(
                                    height: 250,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/1103-confetti-flat.gif',
                                          // height: 166,
                                        ),
                                        Text(
                                          'Thank you for your feedback',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    SizedBox(
                                      width: double.maxFinite,
                                      child: PrimaryButton(
                                        label: 'OKAY',
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                              context.pop();
                            }
                          },
                          label: 'Submit Feedback'.toUpperCase(),
                        ),
                      ),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
