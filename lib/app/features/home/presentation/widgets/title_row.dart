import 'package:daleel_store/app/features/home/presentation/widgets/text_headline.dart';
import 'package:daleel_store/app/features/home/presentation/widgets/text_subtitle.dart';
import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({
    super.key,
    required this.headline,
    this.subtitle,
  });
  final String headline;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextHeadline(headline),
          subtitle != null ? TextSubtitle(subtitle!) : const SizedBox(),
        ],
      ),
    );
  }
}
