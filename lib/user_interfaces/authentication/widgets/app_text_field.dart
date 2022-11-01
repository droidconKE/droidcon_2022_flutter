import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../styles/colors/colors.dart';

class AppTextField extends StatelessWidget {
  final String name;
  final String hint;
  const AppTextField({Key? key, required this.name, required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          enabledBorder: Theme.of(context).brightness == Brightness.dark
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(color: Colors.white, width: 0.5))
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                      color: AppColors.lightGrayBackgroundColor)),
          hintStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : AppColors.lightGreyTextColor),
          border: Theme.of(context).brightness == Brightness.dark
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(color: Colors.white, width: 0.5))
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                      color: AppColors.lightGrayBackgroundColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.orangeDroidconColor
                      : AppColors.blueDroidconColor)),
          fillColor: AppColors.lightGrayBackgroundColor,
          filled: Theme.of(context).brightness != Brightness.dark),
    );
  }
}
