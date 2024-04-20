import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.hint,
  });
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppColors.dark.withOpacity(0.3)),
            filled: true,
            fillColor: AppColors.ternaryGrey,
            prefixIcon: prefixIcon,
            suffixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(end: 20),
                child: suffixIcon),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(25)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(25))),
        onTapOutside: (event) =>
            FocusScope.of(context).requestFocus(FocusNode()),
      ),
    );
  }
}
