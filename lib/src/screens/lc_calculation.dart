import 'package:flutter/material.dart';
import 'package:lcargo/src/widgets/lc_page.dart';

class LCCalculation extends StatelessWidget {
  const LCCalculation({super.key});

  @override
  Widget build(BuildContext context) {
    return const LCPage(
      title: 'Рассчитать',
      body: Center(
        child: Text('Calculation'),
      ),
    );
  }
}
