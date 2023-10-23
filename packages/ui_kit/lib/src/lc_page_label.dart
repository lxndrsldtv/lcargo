import 'package:flutter/material.dart';

import '../ui_kit.dart';

class LCPageLabel extends StatelessWidget {
  const LCPageLabel({super.key, required this.labelText});

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
      labelText,
      style: const TextStyle(
        color: LCAppTheme.pageLabelTextColor,
        fontSize: 30,
        fontWeight: FontWeight.w700,
        fontFamily: 'Unbounded',
      ),
    ),);
  }
}
