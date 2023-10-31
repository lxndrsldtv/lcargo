import 'package:flutter/material.dart';

import '../ui_kit.dart';

class LCTextFut16 extends StatelessWidget {
  const LCTextFut16(
    this.data, {
    super.key,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: LCAppTheme.lcOrdinaryTextStyle,
      overflow: TextOverflow.ellipsis,
    );
  }
}
