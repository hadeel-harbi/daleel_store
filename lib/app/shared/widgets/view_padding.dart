import 'package:flutter/material.dart';

class ViewPadding extends StatelessWidget {
  const ViewPadding(
    this.widgets, {
    super.key,
  });
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: widgets,
      ),
    );
  }
}
