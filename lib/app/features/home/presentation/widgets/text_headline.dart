import 'package:flutter/material.dart';

class TextHeadline extends StatelessWidget {
  const TextHeadline(
    this.text, {
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(text, style: Theme.of(context).textTheme.headlineMedium),
    );
  }
}
