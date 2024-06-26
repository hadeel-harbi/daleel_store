import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TextSubtitle extends StatelessWidget {
  const TextSubtitle(
    this.text, {
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700),
      ),
    );
  }
}
